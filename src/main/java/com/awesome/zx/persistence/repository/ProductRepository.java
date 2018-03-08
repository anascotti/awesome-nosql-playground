package com.awesome.zx.persistence.repository;

import org.springframework.data.cassandra.repository.MapIdCassandraRepository;

import com.awesome.zx.persistence.model.Product;

public interface ProductRepository extends MapIdCassandraRepository<Product>{

}
