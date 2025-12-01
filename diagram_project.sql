CREATE TABLE Customers (
    [Customer ID] NVARCHAR(50),
    [Customer Name] NVARCHAR(50),
    Segment NVARCHAR(50),
    CONSTRAINT cust_pk PRIMARY KEY ([Customer ID])
)
CREATE TABLE Orders (
    [Order ID] NVARCHAR(50),
    [Order Date] DATE,
    [Ship Date] DATE,
    [Ship Mode] NVARCHAR(50),
    [Customer ID] NVARCHAR(50),
	[STATE] NVARCHAR(50),
	[CITY] NVARCHAR(50),
	[Region] NVARCHAR(50),
    CONSTRAINT ord_pk PRIMARY KEY ([Order ID]),
    CONSTRAINT ord_fk FOREIGN KEY ([Customer ID])
        REFERENCES Customers([Customer ID])
)


CREATE TABLE Products (
    [Product ID] NVARCHAR(50),
    [Category] NVARCHAR(50),
    [Sub Category] NVARCHAR(50),
    [Product Name] NVARCHAR(50),
    CONSTRAINT pro_pk PRIMARY KEY ([Product ID])
)
CREATE TABLE [Order Details] (
    [Order ID] NVARCHAR(50),
    [Product ID] NVARCHAR(50),
    Sales float,
    CONSTRAINT det_pk PRIMARY KEY ([Product ID],[Order ID]),
	CONSTRAINT detor_fk FOREIGN KEY ([order ID])
        REFERENCES orders([order ID]),
	CONSTRAINT detpro_fk FOREIGN KEY ([product ID])
        REFERENCES products([product ID])
)





