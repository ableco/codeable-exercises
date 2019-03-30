#!/bin/bash

echo "drop database"
dropdb tours
echo "create database"
createdb tours
echo "load tables in database"
psql tours < db.sql
echo "seed agencies"
psql tours < seeds/agencies.sql 
echo "seed customers"
psql tours < seeds/customers.sql 
echo "seed tours"
psql tours < seeds/tours.sql 
echo "seed sales"
psql tours < seeds/sales.sql 
