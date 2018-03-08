package com.awesome.zx.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.awesome.zx.persistence.model.Product;
import com.awesome.zx.persistence.repository.ProductRepository;

@RestController
public class ProductController {
    
    @Autowired
    private ProductRepository repository;

    @RequestMapping(value = "/products/",
            method = RequestMethod.GET,
            consumes = MediaType.APPLICATION_JSON_UTF8_VALUE,
            produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public List<Product> getProducts() {
        return repository.findAll();
    }

}
