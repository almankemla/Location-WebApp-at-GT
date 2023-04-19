package com.architect.locationservice;

import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class LocationRowMapper implements RowMapper<Location> {

    @Override
    public Location mapRow(ResultSet resultSet, int i) throws SQLException {
        Location location = new Location();
        location.setId(resultSet.getLong("id"));
        location.setName(resultSet.getString("name"));
        location.setDescription(resultSet.getString("description"));
        location.setLatitude(resultSet.getDouble("latitude"));
        location.setLongitude(resultSet.getDouble("longitude"));
        location.setType(resultSet.getString("type"));
        return location;
    }
}