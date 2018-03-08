package com.awesome.zx.persistence.config;

import java.net.InetSocketAddress;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.cassandra.config.CassandraSessionFactoryBean;
import org.springframework.data.cassandra.config.SchemaAction;
import org.springframework.data.cassandra.core.CassandraOperations;
import org.springframework.data.cassandra.core.CassandraTemplate;
import org.springframework.data.cassandra.core.convert.CassandraConverter;
import org.springframework.data.cassandra.core.convert.MappingCassandraConverter;
import org.springframework.data.cassandra.core.mapping.CassandraMappingContext;
import org.springframework.data.cassandra.repository.config.EnableCassandraRepositories;

import com.datastax.driver.core.Cluster;

@Configuration
@EnableConfigurationProperties(CassandraClusterProperties.class)
@EnableCassandraRepositories(basePackages = {"com.awesome.zx.persistence"})
public class DatasourceConfig {

    @Autowired
    private CassandraClusterProperties cassandraClusterProperties;
    
    @Bean
    public Cluster cluster() {
        Cluster.Builder clusterBuilder = Cluster.builder();
        cassandraClusterProperties.getContactPoints().forEach(cp -> {
            clusterBuilder.addContactPointsWithPorts(new InetSocketAddress(cp.getHostname(), cp.getPort()));
        });
        return clusterBuilder.build();
    }
    @Bean
    public CassandraMappingContext mappingContext() {
        return new CassandraMappingContext();
    }
    @Bean
    public CassandraConverter converter() {
        return new MappingCassandraConverter(mappingContext());
    }
    @Bean
    public CassandraSessionFactoryBean session() throws Exception {
        CassandraSessionFactoryBean session = new CassandraSessionFactoryBean();
        session.setCluster(cluster());
        session.setKeyspaceName("awesome");
        session.setConverter(converter());
        session.setSchemaAction(SchemaAction.NONE);
        return session;
    }
    @Bean
    public CassandraOperations cassandraTemplate() throws Exception {
        return new CassandraTemplate(session().getObject());
    }
}
