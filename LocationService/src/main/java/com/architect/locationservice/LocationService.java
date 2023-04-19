package com.architect.locationservice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *  Contains the business logic for querying the database
 */
@Service
public class LocationService {

    private final JdbcTemplate jdbcTemplate;
    private final LocationRepository locationRepository;

    public LocationService(LocationRepository locationRepository, JdbcTemplate jdbcTemplate) {
        this.locationRepository = locationRepository;
        this.jdbcTemplate = jdbcTemplate;
    }

    public Iterable<Location> getNearbyLocations(Double latitude, Double longitude, Double radius) {
        Double earthRadius = 6371.01; // in km
        Double latRadius = Math.toRadians(latitude);
        Double longRadius = Math.toRadians(longitude);

        Double minLat = Math.toDegrees(latRadius - radius / earthRadius);
        Double maxLat = Math.toDegrees(latRadius + radius / earthRadius);
        Double minLong = Math.toDegrees(longRadius - radius / earthRadius / Math.cos(latRadius));
        Double maxLong = Math.toDegrees(longRadius + radius / earthRadius / Math.cos(latRadius));

        String sql = "SELECT * FROM locations WHERE latitude BETWEEN ? AND ? AND longitude BETWEEN ? AND ?";
        return jdbcTemplate.query(sql, new Object[]{minLat, maxLat, minLong, maxLong}, new LocationRowMapper());
    }
    public static final double EARTH_RADIUS = 6371; // in kilometers
    public static double findDistance(double lat1, double lon1, double lat2, double lon2) {
        double dLat = Math.toRadians(lat2 - lat1);
        double dLon = Math.toRadians(lon2 - lon1);

        double a = Math.sin(dLat / 2) * Math.sin(dLat / 2) +
                Math.cos(Math.toRadians(lat1)) * Math.cos(Math.toRadians(lat2)) *
                        Math.sin(dLon / 2) * Math.sin(dLon / 2);
        double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));

        double distance = EARTH_RADIUS * c;
        return distance;
    }
}
