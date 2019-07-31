CREATE TABLE Customer
(
	cust_id CHAR(5),
	cust_fname VARCHAR(255),
	cust_lname VARCHAR(255),
	cust_phone CHAR(12),
	cust_address VARCHAR(255),
	PRIMARY KEY (cust_id)
)

CREATE TABLE Car
(
	vin CHAR(17),
	make VARCHAR(255),
	model VARCHAR(255),
	car_year INTEGER,
    cust_id CHAR(10),
	PRIMARY KEY(vin),
    CONSTRAINT fk_CarCustomer
    FOREIGN KEY (cust_id) REFERENCES Customer(cust_id)
)

CREATE TABLE Closed
(
	wid CHAR(5),
	closed_date date,
	comment VARCHAR(512),
	bill INTEGER,
	PRIMARY KEY(wid),
    CONSTRAINT fk_ClosedService
    FOREIGN KEY (rid) REFERENCES Service(rid)
)

CREATE TABLE Mechanic
(
	mechanic_id CHAR(5),
	mechanic_fname VARCHAR(255),
	mechanic_lname VARCHAR(255),
	mechanic_experience VARCHAR(300),
	PRIMARY KEY(mechanic_id)
)

CREATE TABLE Service
(
	rid CHAR(5),
	service_date date,
	odometer INTEGER,
	complain VARCHAR(512),
    vin CHAR(17),
	PRIMARY KEY(rid),
    CONSTRAINT fk_ServiceCar
    FOREIGN KEY (vin) REFERENCES Car(vin),
    CONSTRAINT fk_ServiceMechanic
    FOREIGN KEY (mechanic_id) REFERENCES Mechanic(mechanic_id)
)
