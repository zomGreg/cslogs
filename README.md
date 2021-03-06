cslogs
======

My CloudStack logs statistics thingy

# How to use this

awk -f stats.awk api-server.log.2012-10-27

where api-server.log.2012-10-27 is the api logs from a cloudstack server.

## Dependencies

* awk


## Sample output:

```
CloudStack API Summary for 2012-10-27
=====================================

List Volumes:              107399  19.18 %
List Zones:                177763  31.75 %
List SecurityGroups:       54376    9.71 %
List Templates:            42775    7.64 %
List Snapshots:            25057    4.48 %
List Disk Offering:        0        0.00 %
List Virtual Machines:     152439  27.23 %
List Network Offerings:    0        0.00 %
List Accounts:             0        0.00 %


Total list calls:          559809 100.00 %
------------------------------------------

Create Volume:             0        0.00 %
Create Template:           0        0.00 %
Create Snapshot:           0        0.00 %
Deploy Virtual Machine:    1        0.00 %
Start Virtual Machine:     0        0.00 %


Total create calls:        1        0.00 %
------------------------------------------

Destroy Virtual Machine:   0        0.00 %
Delete Volume:             0        0.00 %
Delete Template:           0        0.00 %


Total delete calls:        0        0.00 %
------------------------------------------

Total calls:               559810
```

# Stats by API key (keyStats.awk)

## How to call:

awk -f keyStats.awk -v key=0Dc-EfRxmi_4YbtK-XZf api-server.log.2012-10-27

where api-server.log.2012-10-27 is the api logs from a cloudstack server.

and 0Dc-EfRxmi_4YbtK-XZf is a part, or all, of an API key. For best results, should be unique.

## Sample output:

```
CloudStack API Summary for 0Dc-EfRxmi_4YbtK-XZf
==========================================

List Volumes:              1960    19.91 %
List Zones:                3221    32.72 %
List SecurityGroups:       1251    12.71 %
List Templates:            418      4.25 %
List Snapshots:            39       0.40 %
List Disk Offering:        0        0.00 %
List Virtual Machines:     2955    30.02 %
List Network Offerings:    0        0.00 %
List Accounts:             0        0.00 %


Total list calls:          9844   100.00 %
------------------------------------------

Create Volume:             0        0.00 %
Create Template:           0        0.00 %
Create Snapshot:           0        0.00 %
Deploy Virtual Machine:    0        0.00 %
Start Virtual Machine:     0        0.00 %


Total create calls:        0        0.00 %
------------------------------------------

Destroy Virtual Machine:   0        0.00 %
Delete Volume:             0        0.00 %
Delete Template:           0        0.00 %


Total delete calls:        0        0.00 %
==========================================

Total calls:               9844
```
