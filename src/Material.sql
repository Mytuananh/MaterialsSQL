create database Materials;
use Materials;

create table materials(
    mID int auto_increment primary key,
    materialCode varchar(10),
    materialName varchar(20),
    materialUnit varchar(10),
    materialPrice int
);
create table inventory(
    iID int auto_increment primary key,
    mID int,
    startNumber int,
    totalIn int,
    totalOut int,
    foreign key (mID) references materials (mID)
);
create table provider(
    pID int auto_increment primary key,
    providerCode varchar(10),
    providerName varchar(20),
    providerAddress varchar(30),
    providerPhone varchar(12)
);
create table theOrder(
    tID int auto_increment primary key,
    orderCode varchar(10),
    orderDate date,
    pID int,
    foreign key (pID) references provider (pID)
);
create table receipt(
    rID int auto_increment primary key,
    receiptCode varchar(10),
    receiptDate date,
    tID int,
    foreign key (tID) references theOrder (tID)
);
create table deliveryBill(
    dID int auto_increment primary key,
    deliveryCode varchar(10),
    deliveryDate date,
    customerName varchar(20)
);
create table orderDetail(
    odID int auto_increment primary key,
    tID int,
    mID int,
    orderNumber int,
    foreign key (tID) references theOrder (tID),
    foreign key (mID) references materials (mID)
);
create table receiptDetail(
    rdID int auto_increment primary key,
    rID int,
    mID int,
    receiptNumber int,
    receiptUnitPrice varchar(10),
    receiptNote varchar(30),
    foreign key (rID) references receipt (rID),
    foreign key (mID) references materials (mID)
);
create table deliveryDetail(
    ddID int auto_increment primary key,
    dID int,
    mID int,
    deliveryNumber int,
    deliveryUnitPrice varchar(10),
    deliveryNote varchar(30),
    foreign key (dID) references deliveryBill (dID),
    foreign key (mID) references materials (mID)
);
