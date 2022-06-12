UPDATE `Capacitors - Ceramic - 0201` 
SET `Footprint Path` = NULL, 
    `Footprint Path 2` = NULL, 
    `Footprint Path 3` = NULL, 
    `Footprint Ref` = 'C0201N,C0201L,C0201M', 
    `Footprint Ref 2` = NULL, 
    `Footprint Ref 3` = NULL 
WHERE (`Footprint Ref` IS NOT NULL);

UPDATE `Capacitors - Ceramic - 0402` 
SET `Footprint Path` = NULL, 
    `Footprint Path 2` = NULL, 
    `Footprint Path 3` = NULL, 
    `Footprint Ref` = 'C0402N,C0402L,C0402M', 
    `Footprint Ref 2` = NULL, 
    `Footprint Ref 3` = NULL 
WHERE (`Footprint Ref` IS NOT NULL);

UPDATE `Capacitors - Ceramic - 0603` 
SET `Footprint Path` = NULL, 
    `Footprint Path 2` = NULL, 
    `Footprint Path 3` = NULL, 
    `Footprint Ref` = 'C0603N,C0603L,C0603M', 
    `Footprint Ref 2` = NULL, 
    `Footprint Ref 3` = NULL 
WHERE (`Footprint Ref` IS NOT NULL);

UPDATE `Capacitors - Ceramic - 0805` 
SET `Footprint Path` = NULL, 
    `Footprint Path 2` = NULL, 
    `Footprint Path 3` = NULL, 
    `Footprint Ref` = 'C0805N,C0805L,C0805M', 
    `Footprint Ref 2` = NULL, 
    `Footprint Ref 3` = NULL 
WHERE (`Footprint Ref` IS NOT NULL);

UPDATE `Capacitors - Ceramic - 1206` 
SET `Footprint Path` = NULL, 
    `Footprint Path 2` = NULL, 
    `Footprint Path 3` = NULL, 
    `Footprint Ref` = 'C1206N,C1206L,C1206M', 
    `Footprint Ref 2` = NULL, 
    `Footprint Ref 3` = NULL 
WHERE (`Footprint Ref` IS NOT NULL);

UPDATE `Capacitors - Ceramic - 1210` 
SET `Footprint Path` = NULL, 
    `Footprint Path 2` = NULL, 
    `Footprint Path 3` = NULL, 
    `Footprint Ref` = 'C1210N,C1210L,C1210M', 
    `Footprint Ref 2` = NULL, 
    `Footprint Ref 3` = NULL 
WHERE (`Footprint Ref` IS NOT NULL);

UPDATE `Capacitors - Ceramic - 1812` 
SET `Footprint Path` = NULL, 
    `Footprint Path 2` = NULL, 
    `Footprint Path 3` = NULL, 
    `Footprint Ref` = 'C1812N,C1812L,C1812M', 
    `Footprint Ref 2` = NULL, 
    `Footprint Ref 3` = NULL 
WHERE (`Footprint Ref` IS NOT NULL);

UPDATE `Capacitors - Ceramic - 2220` 
SET `Footprint Path` = NULL, 
    `Footprint Path 2` = NULL, 
    `Footprint Path 3` = NULL, 
    `Footprint Ref` = 'C2220N,C2220L,C2220M', 
    `Footprint Ref 2` = NULL, 
    `Footprint Ref 3` = NULL 
WHERE (`Footprint Ref` IS NOT NULL);

update `Capacitors - Ceramic - RF`
set `Footprint Path` = null,
    `Footprint Path 2` = null,
    `Footprint Path 3` = null,
    `Footprint Ref` = 'C0402_RF-N,C0402_RF-L,C0402_RF-M',
    `Footprint Ref 2` = null,
    `Footprint Ref 3"`= null
where (`Footprint Ref` is not null) AND (`Footprint Ref` = 'CAP 0402_1005 RF');

update `Capacitors - Ceramic - RF`
set `Footprint Path` = null,
    `Footprint Path 2` = null,
    `Footprint Path 3` = null,
    `Footprint Ref` = 'C0603_RF-N,C0603_RF-L,C0603_RF-M',
    `Footprint Ref 2` = null,
    `Footprint Ref 3` = null
where (`Footprint Ref` is not null) AND (`Footprint Ref` = 'CAP 0603_1608 RF');

update `Capacitors - Ceramic - RF`
set `Footprint Path` = null,
    `Footprint Path 2` = null,
    `Footprint Path 3` = null,
    `Footprint Ref` = 'C0805_RF-N,C0805_RF-L,C0805_RF-M',
    `Footprint Ref 2` = null,
    `Footprint Ref 3` = null
where (`Footprint Ref` is not null) AND (`Footprint Ref` = 'CAP 0805_2012 RF');

