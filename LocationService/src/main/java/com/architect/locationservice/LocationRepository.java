package com.architect.locationservice;

import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface LocationRepository extends CrudRepository<Location, Long> {
    List<Location> findByLatitudeBetweenAndLongitudeBetween(Double minLat, Double maxLat, Double minLong, Double maxLong);
}
