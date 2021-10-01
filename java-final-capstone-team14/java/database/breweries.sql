BEGIN TRANSACTION;

INSERT INTO breweries (brewery_name, address, city, state_name, zip_code, brewery_description, brewer_id, website, phone_number, brewery_photo)
VALUES  ('10 Barrel Brewing Company', '2620 Walnut St.', 'Denver', 'CO', '80205', 'Featuring a 20 barrel brewing system, 22 freshly brewed beers on tap, and fermenting from a sunken deck in the middle of the action. Throw in a rooftop patio, made from scratch pub grub, an open space layout with views into the brew area and kitchen and youâ€™ve got your new favorite hangout! Come knock back a pint with us.', 1001, '10barrel.com', '720-573-8992', 'https://www.coloradobrewerylist.com/wp-content/uploads/2016/01/10-barrel-300x300.jpg');

INSERT INTO operations (day, time_open, time_closed, brewery_id)
VALUES  (7, '11:00:00', '22:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = '10 Barrel Brewing Company')),
        (1, '11:00:00', '22:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = '10 Barrel Brewing Company')),
        (2, '11:00:00', '22:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = '10 Barrel Brewing Company')),
        (3, '11:00:00', '22:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = '10 Barrel Brewing Company')),
        (4, '11:00:00', '23:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = '10 Barrel Brewing Company')),
        (5, '11:00:00', '00:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = '10 Barrel Brewing Company')),
        (6, '11:00:00', '00:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = '10 Barrel Brewing Company'));
        
INSERT INTO breweries (brewery_name, address, city, state_name, zip_code, brewery_description, brewer_id, website, phone_number, brewery_photo)
VALUES ('105 West Brewing Company', '1043 Park St.', 'Castle Rock', 'CO', '80109', '105 West Brewing Company is a small brewery in Castle Rock, Colorado. We focus on a high quality brews of all styles.', 1001, '105westbrewing.com', '303-325-7321', 'https://www.coloradobrewerylist.com/wp-content/uploads/2015/05/105-west-brewing-196x300.jpg');
 
INSERT INTO operations (day, time_open, time_closed, brewery_id)
VALUES  (7, '11:00:00', '20:30:00', (SELECT brewery_id FROM breweries WHERE brewery_name = '105 West Brewing Company')),
        (1, '12:00:00', '22:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = '105 West Brewing Company')),
        (2, '12:00:00', '22:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = '105 West Brewing Company')),
        (3, '12:00:00', '22:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = '105 West Brewing Company')),
        (4, '12:00:00', '22:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = '105 West Brewing Company')),
        (5, '12:00:00', '22:30:00', (SELECT brewery_id FROM breweries WHERE brewery_name = '105 West Brewing Company')),
        (6, '11:30:00', '22:30:00', (SELECT brewery_id FROM breweries WHERE brewery_name = '105 West Brewing Company'));
         
INSERT INTO breweries (brewery_name, address, city, state_name, zip_code, brewery_description, brewer_id, website, phone_number, brewery_photo)
VALUES  ('12Degree Brewing', '820 Main St.', 'Louisville', 'CO', '80027','12Degree Brewing is an artisanal, Belgian-inspired brewery located in the heart of Old Town Louisville, Colorado.', 1001, 'www.12degree.com', '720-638-1623', 'https://www.coloradobrewerylist.com/wp-content/uploads/2014/02/12-degree-brewing-300x300.jpg');

INSERT INTO operations (day, time_open, time_closed, brewery_id)
VALUES  (7, '12:00:00', '21:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = '12Degree Brewing')),
        (1, '16:00:00', '21:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = '12Degree Brewing')),
        (2, '16:00:00', '21:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = '12Degree Brewing')),
        (3, '16:00:00', '21:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = '12Degree Brewing')),
        (4, '16:00:00', '21:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = '12Degree Brewing')),
        (5, '16:00:00', '22:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = '12Degree Brewing')),
        (6, '12:00:00', '21:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = '12Degree Brewing'));
         
INSERT INTO breweries (brewery_name, address, city, state_name, zip_code, brewery_description, brewer_id, website, phone_number, brewery_photo)
VALUES  ('14er Brewing & Beer Garden', '3120 Blake St. Unit C', 'Denver', 'CO', '80205', 'Providing Uniquely Crushable craft beers to pair with Coloradoâ€™s never ending adventure! Beer garden and production brewery in the heart of RiNo. The home of 14erâ€™s flagship and one off experimental beers. Housed in a industrial warehouse space and with a massive beer garden facing Blake Street.', 1001, 'www.14erbrewing.com/', '720-773-1437', 'https://www.coloradobrewerylist.com/wp-content/uploads/2016/10/14er.jpg');

INSERT INTO operations (day, time_open, time_closed, brewery_id)
VALUES  (7, '12:00:00', '21:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = '14er Brewing & Beer Garden')),
        (1, '14:00:00', '22:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = '14er Brewing & Beer Garden')),
        (2, '14:00:00', '22:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = '14er Brewing & Beer Garden')),
        (3, '14:00:00', '22:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = '14er Brewing & Beer Garden')),
        (4, '12:00:00', '22:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = '14er Brewing & Beer Garden')),
        (5, '12:00:00', '00:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = '14er Brewing & Beer Garden')),
        (6, '11:00:00', '00:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = '14er Brewing & Beer Garden'));
     
INSERT INTO breweries (brewery_name, address, city, state_name, zip_code, brewery_description, brewer_id, website, phone_number, brewery_photo)
VALUES  ('3 Freaks Brewery', '7140 E Country Line Rd.', 'Highlands Ranch', 'CO', '80126', 'The mission of 3 Freaks brewery is to offer small batch hand crafted beer that is truly flavorful. This will be provided to our craft beer family in a laid back atmosphere where we love to talk beer. And yes, you are part of the family. We are a humble brewery and donâ€™t have all the answers but we still love to talk beer.', 1001, '3freaksbrewery.com', '720-299-0994', 'https://www.coloradobrewerylist.com/wp-content/uploads/2014/03/3-freaks1-204x300.jpg');

INSERT INTO operations (day, time_open, time_closed, brewery_id)
VALUES  (7, '13:00:00', '20:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = '3 Freaks Brewery')),
        (2, '15:00:00', '21:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = '3 Freaks Brewery')),
        (3, '15:00:00', '21:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = '3 Freaks Brewery')),
        (4, '15:00:00', '21:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = '3 Freaks Brewery')),
        (5, '13:00:00', '22:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = '3 Freaks Brewery')),
        (6, '13:00:00', '22:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = '3 Freaks Brewery'));
        
INSERT INTO breweries (brewery_name, address, city, state_name, zip_code, brewery_description, brewer_id, website, phone_number, brewery_photo) 
    VALUES ('300 Suns Brewing', '335 1st Ave. Unit C', 'Longmont', 'CO', '80501', 'We are head over heels in love with Longmont, Colorado and the average of 300 days of sun we get to enjoy each year. Nothing pairs better with a beautiful sunny day than a fun, relaxing place to hang out and enjoy a craft beer.', 1001, 'www.300sunsbrewing.com', '720-442-8292', 'https://www.coloradobrewerylist.com/wp-content/uploads/2014/05/300-suns.jpg');

INSERT INTO operations (day, time_open, time_closed, brewery_id)
    VALUES (7, '11:00:00', '20:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = '300 Suns Brewing')),
            (2, '11:00:00', '21:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = '300 Suns Brewing')),
            (3, '11:00:00', '21:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = '300 Suns Brewing')),
            (4, '11:00:00', '21:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = '300 Suns Brewing')),
            (5, '11:00:00', '22:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = '300 Suns Brewing')),
            (6, '11:00:00', '22:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = '300 Suns Brewing'));
                       
INSERT INTO breweries (brewery_name, address, city, state_name, zip_code, brewery_description, brewer_id, website, phone_number, brewery_photo) 
    VALUES ('4 Noses Brewing Company', '8855 W 116th Circle Suite 4', 'Broomfield', 'CO', '80021', 'The 4 Noses Brewery is a family owned and operated craft brewery and tasting room. 4 Noses has a passion for creatively brewing our unique interpretation of classic styles. Using ingredients from around the world, 4 Noses combines traditional styles with nontraditional flavor profiles to give the beers our own distinct personality.', 1001, 'www.4nosesbrewing.com', '720-460-2797', 'https://www.coloradobrewerylist.com/wp-content/uploads/2014/02/4-noses1-300x298.jpg');

INSERT INTO operations (day, time_open, time_closed, brewery_id)
    VALUES (7, '11:00:00', '22:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = '4 Noses Brewing Company')),
            (1, '15:00:00', '22:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = '4 Noses Brewing Company')),
            (2, '15:00:00', '22:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = '4 Noses Brewing Company')),
            (3, '15:00:00', '22:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = '4 Noses Brewing Company')),
            (4, '15:00:00', '22:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = '4 Noses Brewing Company')),
            (5, '12:00:00', '23:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = '4 Noses Brewing Company')),
            (6, '11:00:00', '23:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = '4 Noses Brewing Company'));    
            

INSERT INTO breweries (brewery_name, address, city, state_name, zip_code, brewery_description, brewer_id, website, phone_number, brewery_photo) 
    VALUES ('6 & 40 Brewery', '883 Parfet St. Unit J', 'Lakewood', 'CO', '80215', '6 and 40 Brewery is your Colorado craft beer filling station, serving a selection of handcrafted ales for when your engine is running a pint low.', 1001, '6and40brewery.com', '303-238-3272', 'https://www.coloradobrewerylist.com/wp-content/uploads/2016/09/6and40Brewery_Logo-1.png');

INSERT INTO operations (day, time_open, time_closed, brewery_id)
    VALUES (7, '12:00:00', '19:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = '6 & 40 Brewery')),
            (1, '14:00:00', '20:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = '6 & 40 Brewery')),
            (2, '14:00:00', '20:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = '6 & 40 Brewery')),
            (3, '14:00:00', '20:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = '6 & 40 Brewery')),
            (4, '14:00:00', '20:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = '6 & 40 Brewery')),
            (5, '12:00:00', '21:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = '6 & 40 Brewery')),
            (6, '12:00:00', '21:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = '6 & 40 Brewery'));     
            
            
INSERT INTO breweries (brewery_name, address, city, state_name, zip_code, brewery_description, brewer_id, website, phone_number, brewery_photo) 
    VALUES ('7 Hermits Brewing Company', '1020 Capitol St.', 'Eagle', 'CO', '81631', 'We carry wine, spirits, guest beer, and of course our own. Beer styles range from easy drinking summer pils, to outrageous hop bombs. There’s a style for everyone here.', 1001, '7hermitsbrewing.com', '970-328-6220', 'https://www.coloradobrewerylist.com/wp-content/uploads/2014/02/7-hermits.jpg');

INSERT INTO operations (day, time_open, time_closed, brewery_id)
    VALUES (7, '10:00:00', '22:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = '7 Hermits Brewing Company')),
            (1, '16:00:00', '22:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = '7 Hermits Brewing Company')),
            (2, '16:00:00', '22:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = '7 Hermits Brewing Company')),
            (3, '16:00:00', '22:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = '7 Hermits Brewing Company')),
            (4, '16:00:00', '22:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = '7 Hermits Brewing Company')),
            (5, '16:00:00', '22:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = '7 Hermits Brewing Company')),
            (6, '12:00:00', '23:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = '7 Hermits Brewing Company'));           


INSERT INTO breweries (brewery_name, address, city, state_name, zip_code, brewery_description, brewer_id, website, phone_number, brewery_photo) 
    VALUES ('Altitude Brewing & Supply', '2801 Walnut St. Unit C', 'Denver', 'CO', '80205', 'Altitude Brewing & Supply is not only a homebrew store but is now a brewery. You can sample beers made at the store on homebrewing equipment and ask questions on how you can make the same or similar beers yourself. We offer classes, general advice, and even a recipe or two to anyone who’s looking to learn.', 1001, 'www.altitudebrew.com', '303-292-2739', 'https://www.coloradobrewerylist.com/wp-content/uploads/2019/03/Altitude-300x300.jpg');

INSERT INTO operations (day, time_open, time_closed, brewery_id)
    VALUES (7, '11:00:00', '16:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Altitude Brewing & Supply')),
            (1, '10:00:00', '18:30:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Altitude Brewing & Supply')),
            (2, '10:00:00', '18:30:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Altitude Brewing & Supply')),
            (3, '10:00:00', '18:30:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Altitude Brewing & Supply')),
            (4, '10:00:00', '18:30:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Altitude Brewing & Supply')),
            (5, '10:00:00', '22:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Altitude Brewing & Supply')),
            (6, '10:00:00', '22:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Altitude Brewing & Supply')); 
            
INSERT INTO breweries (brewery_name, address, city, state_name, zip_code, brewery_description, brewer_id, website, phone_number, brewery_photo) 
    VALUES ('Anarchy Brewing Company', '225 E 8th Ave. C', 'Durango', 'CO', '81301', 'A neighborhood nano brewery in Durango, Colorado. In a world of chaos, at least we have good beer!', 1001, 'www.anarchybrewingco.com', NULL, 'https://www.coloradobrewerylist.com/wp-content/uploads/2021/03/Anarchy-2.png');

INSERT INTO operations (day, time_open, time_closed, brewery_id)
    VALUES (7, '14:00:00', '21:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Anarchy Brewing Company')),
            (4, '14:00:00', '21:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Anarchy Brewing Company')),
            (5, '14:00:00', '21:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Anarchy Brewing Company')),
            (6, '14:00:00', '21:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Anarchy Brewing Company'));        
            
INSERT INTO breweries (brewery_name, address, city, state_name, zip_code, brewery_description, brewer_id, website, phone_number, brewery_photo) 
    VALUES ('New Belgium Brewing Company','500 Linden St.','Fort Collins', 'CO', '80524', 'New Belgium Brewing Company, makers of Fat Tire Amber Ale and other Belgian-inspired beers, began operations in a tiny Fort Collins basement in 1991. Today, the third largest craft brewer in the U.S., New Belgium produces seven year-round beers; Fat Tire Amber Ale, Sunshine Wheat, Blue Paddle Pilsner, 1554 Black Ale, Abbey, Mothership Wit and Trippel, as well as a host of seasonal releases. In addition to producing world-class beers, New Belgium takes pride in being a responsible corporate role model with progressive programs such as employee ownership, open book management and a commitment to environmental stewardship', 1001, 'www.newbelgium.com', '970-221-0524', 'https://www.coloradobrewerylist.com/wp-content/uploads/2014/02/new-belgium-300x300.jpg');

INSERT INTO operations (day, time_open, time_closed, brewery_id)
    VALUES (7, '12:00:00', '20:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'New Belgium Brewing Company')),
            (4, '12:00:00', '20:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'New Belgium Brewing Company')),
            (5, '12:00:00', '20:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'New Belgium Brewing Company')),
            (6, '12:00:00', '20:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'New Belgium Brewing Company')); 
            
INSERT INTO breweries (brewery_name, address, city, state_name, zip_code, brewery_description, brewer_id, website, phone_number, brewery_photo) 
    VALUES ('Aspen Brewing Company Tap Room', '121 S Galena St.', 'Aspen', 'CO', '81611', 'Aspen''s Brewery. Brewing your favorite beers inspired by the outdoor lifestyle! Tap Room serving pints, sample flights, tasters, growlers and apparel. Aspen Tap is the new downtown taproom.  The actual brewery is at the Aspen Airport Business Center.', 1001, 'aspenbrewingcompany.com', '970-920-2739', 'https://www.coloradobrewerylist.com/wp-content/uploads/2014/02/Aspen-300x300.png');

INSERT INTO operations (day, time_open, time_closed, brewery_id)
    VALUES (7, '12:00:00', '22:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Aspen Brewing Company Tap Room')),
            (1, '12:00:00', '22:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Aspen Brewing Company Tap Room')),
            (2, '12:00:00', '22:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Aspen Brewing Company Tap Room')),
            (3, '12:00:00', '22:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Aspen Brewing Company Tap Room')),
            (4, '12:00:00', '22:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Aspen Brewing Company Tap Room')),
            (5, '12:00:00', '22:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Aspen Brewing Company Tap Room')),
            (6, '11:00:00', '22:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Aspen Brewing Company Tap Room'));  

INSERT INTO breweries (brewery_name, address, city, state_name, zip_code, brewery_description, brewer_id, website, phone_number, brewery_photo) 
    VALUES ('Atrevida Beer Company', '204 Mount View Lane Unit 3', 'Colorado Springs', 'CO', '80907', 'We are a female forward Latin inspired brewery bringing new flavors to the market. We invite our customers to experience new flavors and exciting new ideas of what beer can be. We want to introduce craft beer to a wide array of customers and appeal to palate''s of all varieties.', 1001, 'www.atrevidabeerco.com', '719-266-4200', 'https://www.coloradobrewerylist.com/wp-content/uploads/2018/01/Atrevida-300x300.png');

INSERT INTO operations (day, time_open, time_closed, brewery_id)
    VALUES (7, '13:00:00', '20:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Atrevida Beer Company')),
            (1, '14:00:00', '19:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Atrevida Beer Company')),
            (2, '14:00:00', '19:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Atrevida Beer Company')),
            (3, '14:00:00', '19:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Atrevida Beer Company')),
            (4, '14:00:00', '19:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Atrevida Beer Company')),
            (5, '14:00:00', '21:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Atrevida Beer Company')),
            (6, '13:00:00', '21:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Atrevida Beer Company')); 

INSERT INTO breweries (brewery_name, address, city, state_name, zip_code, brewery_description, brewer_id, website, phone_number, brewery_photo) 
    VALUES ('Avery Brewing Company', '4910 Nautilus Court', 'Boulder', 'CO', '80301', 'We are dedicated to making beer from the inside out: we brew what we like to drink with utter disregard for what the market demands and search out fans with equally eccentric palates. Since 1993 our brewery has been committed to producing eccentric ales and lagers that defy styles or categories. Our products are thoroughly American at heart: blending Old World tradition and expertise with ingenuity, creativity and boldness.', 1001, 'www.averybrewing.com', '303-440-4324', 'https://www.coloradobrewerylist.com/wp-content/uploads/2014/02/avery-272x300.jpg');

INSERT INTO operations (day, time_open, time_closed, brewery_id)
    VALUES (7, '11:30:00', '21:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Avery Brewing Company')),
            (3, '15:00:00', '21:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Avery Brewing Company')),
            (4, '15:00:00', '21:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Avery Brewing Company')),
            (5, '11:30:00', '21:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Avery Brewing Company')),
            (6, '11:30:00', '21:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Avery Brewing Company'));  

INSERT INTO breweries (brewery_name, address, city, state_name, zip_code, brewery_description, brewer_id, website, phone_number, brewery_photo) 
    VALUES ('Baere Brewing Company', '320 Broadway Unit E', 'Denver', 'CO', '80203', 'We are a small 2.5 Barrel Brewhouse proudly residing in a strip mall in the Baker District of Denver, Colorado. Our love for all styles of beer is reflected in our taplist. Stay tuned as we continue to expand in our fermentation capacity and barrel program.', 1001, 'www.baerebrewing.com', '303-733-3354', 'https://www.coloradobrewerylist.com/wp-content/uploads/2014/02/baere.jpg');

INSERT INTO operations (day, time_open, time_closed, brewery_id)
    VALUES (7, '12:00:00', '21:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Baere Brewing Company')),
            (1, '15:00:00', '22:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Baere Brewing Company')),
            (2, '15:00:00', '22:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Baere Brewing Company')),
            (3, '15:00:00', '22:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Baere Brewing Company')),
            (4, '12:00:00', '22:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Baere Brewing Company')),
            (5, '12:00:00', '23:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Baere Brewing Company')),
            (6, '12:00:00', '23:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Baere Brewing Company')); 

INSERT INTO breweries (brewery_name, address, city, state_name, zip_code, brewery_description, brewer_id, website, phone_number, brewery_photo) 
    VALUES ('Bonfire Brewing', '127 W Second St.', 'Eagle', 'CO', '81631', 'Kickass microbrewery that keeps the beer flowing in Eagle, CO, and throughout the state. Enjoy Bonfire beer at our taproom or wherever adventure may take you.', 1001, 'bonfirebrewing.com', '970-306-7113', 'https://www.coloradobrewerylist.com/wp-content/uploads/2014/02/bonfire-300x300.jpg');

INSERT INTO operations (day, time_open, time_closed, brewery_id)
    VALUES (7, '12:00:00', '22:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Bonfire Brewing')),
            (2, '16:00:00', '22:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Bonfire Brewing')),
            (3, '12:00:00', '22:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Bonfire Brewing')),
            (4, '12:00:00', '22:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Bonfire Brewing')),
            (5, '12:00:00', '22:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Bonfire Brewing')),
            (6, '12:00:00', '22:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Bonfire Brewing'));    
          
INSERT INTO breweries (brewery_name, address, city, state_name, zip_code, brewery_description, brewer_id, website, phone_number, brewery_photo) 
    VALUES ('Bootstrap Brewing Company', '142 Pratt St.', 'Longmont', 'CO', '80501', 'Bootstrap Brewing is a kick @$$, independent craft brewery in Longmont Colorado. where you’ll find us diligently brewing our award winning, fresh, delicious, craft beer which we supply to the best restaurants and liquor stores in Colorado. Our goal is simple – we want to make really great beer and have a lot of fun. We also love to rock out and our beer enjoys the best classic rock 24 hours a day which is why it''s so happy and delicious!  Did you notice that we have music pairings with our beer?', 1001, 'www.bootstrapbrewing.com', '303-652-4186', 'https://www.coloradobrewerylist.com/wp-content/uploads/2014/02/bootstrap-300x300.jpg');

INSERT INTO operations (day, time_open, time_closed, brewery_id)
    VALUES (7, '12:00:00', '18:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Bootstrap Brewing Company')),
            (1, '15:00:00', '21:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Bootstrap Brewing Company')),
            (2, '15:00:00', '21:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Bootstrap Brewing Company')),
            (3, '15:00:00', '21:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Bootstrap Brewing Company')),
            (4, '15:00:00', '21:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Bootstrap Brewing Company')),
            (5, '12:00:00', '21:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Bootstrap Brewing Company')),
            (6, '12:00:00', '21:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Bootstrap Brewing Company'));    
   
INSERT INTO breweries (brewery_name, address, city, state_name, zip_code, brewery_description, brewer_id, website, phone_number, brewery_photo) 
    VALUES ('Brass Brewing Company', '318 E Colorado Ave.', 'Colorado Springs', 'CO', '80903', 'Brass Brewing Co. is a veteran-owned and operated craft brewery in downtown Colorado Springs. Owners Wayne (Woody) and Kellee Briggs, Ohio State and West Point graduates respectively, served in the U.S. Army.', 1001, 'www.brassbrewing.com', '719-308-2161', 'https://www.coloradobrewerylist.com/wp-content/uploads/2016/09/Brass-300x300.png');

INSERT INTO operations (day, time_open, time_closed, brewery_id)
    VALUES (7, '12:00:00', '21:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Brass Brewing Company')),
            (1, '16:00:00', '21:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Brass Brewing Company')),
            (2, '16:00:00', '22:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Brass Brewing Company')),
            (3, '16:00:00', '22:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Brass Brewing Company')),
            (4, '16:00:00', '21:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Brass Brewing Company')),
            (5, '14:00:00', '23:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Brass Brewing Company')),
            (6, '12:00:00', '23:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Brass Brewing Company'));           

INSERT INTO breweries (brewery_name, address, city, state_name, zip_code, brewery_description, brewer_id, website, phone_number, brewery_photo) 
    VALUES ('Colorado Mountain Brewery', '1110 Interquest Pkwy.', 'Colorado Springs', 'CO', '80921', 'Come enjoy a true Colorado sunset as you watch the Front Range turn from day to evening. This beautiful setting is directly across I-25 from the US Air Force Academy. Four large patios complement the spacious and original interior. Come on out and try one of our famous original beers brewed fresh in our brewery. After you enjoy the treat of Colorado Mountain Brewery, you will know that we are The True Taste Of Colorado!', 1001, 'www.cmbrew.com/', '719-434-5750', 'https://www.coloradobrewerylist.com/wp-content/uploads/2014/02/colorado-mountain-300x300.png');

INSERT INTO operations (day, time_open, time_closed, brewery_id)
    VALUES (7, '11:00:00', '22:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Colorado Mountain Brewery')),
            (1, '11:00:00', '21:30:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Colorado Mountain Brewery')),
            (2, '11:00:00', '21:30:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Colorado Mountain Brewery')),
            (3, '11:00:00', '21:30:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Colorado Mountain Brewery')),
            (4, '11:00:00', '21:30:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Colorado Mountain Brewery')),
            (5, '11:00:00', '22:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Colorado Mountain Brewery')),
            (6, '11:00:00', '22:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Colorado Mountain Brewery'));   

INSERT INTO breweries (brewery_name, address, city, state_name, zip_code, brewery_description, brewer_id, website, phone_number, brewery_photo) 
    VALUES ('Copper Kettle Brewing Company', '1338 S Valentia St. Unit 100', 'Denver', 'CO', '80247', 'Copper Kettle Brewing Company is a locally owned mom and pop brewery with a tasting room established in Denver in 2011, surrounded by local neighborhoods. CKBC strives to create what America seems to have lost, a local neighborhood bar in which we strive to know your name and your story.', 1001, 'www.copperkettledenver.com/', '720-443-2522', 'https://www.coloradobrewerylist.com/wp-content/uploads/2014/02/copper-kettle-300x300.png');

INSERT INTO operations (day, time_open, time_closed, brewery_id)
    VALUES (7, '12:00:00', '21:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Copper Kettle Brewing Company')),
            (1, '14:00:00', '21:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Copper Kettle Brewing Company')),
            (2, '14:00:00', '21:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Copper Kettle Brewing Company')),
            (3, '14:00:00', '21:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Copper Kettle Brewing Company')),
            (4, '14:00:00', '21:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Copper Kettle Brewing Company')),
            (5, '12:00:00', '22:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Copper Kettle Brewing Company')),
            (6, '12:00:00', '22:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Copper Kettle Brewing Company'));    
          
INSERT INTO breweries (brewery_name, address, city, state_name, zip_code, brewery_description, brewer_id, website, phone_number, brewery_photo) 
    VALUES ('Denver Beer Company', '1695 Platte St.', 'Denver', 'CO', '80202', 'The idea behind Denver Beer Co is simple. Good beer is best enjoyed with friends, fresh air, and a bit of adventurous spirit to sharpen the palate. Our craft brewery specializes in artisan and seasonal varieties of premium ales and lagers made from the best ingredients around. Brewed with traditional methods and innovative spirit, our beer is always fresh and flavorful. Our beer is serious fun.', 1001, 'denverbeerco.com', '303-433-2739', 'https://www.coloradobrewerylist.com/wp-content/uploads/2014/03/denver-beer-company-300x300.jpg');

INSERT INTO operations (day, time_open, time_closed, brewery_id)
    VALUES (7, '11:00:00', '21:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Denver Beer Company')),
            (1, '11:00:00', '22:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Denver Beer Company')),
            (2, '11:00:00', '22:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Denver Beer Company')),
            (3, '11:00:00', '22:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Denver Beer Company')),
            (4, '11:00:00', '22:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Denver Beer Company')),
            (5, '11:00:00', '23:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Denver Beer Company')),
            (6, '11:00:00', '23:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Denver Beer Company')); 

INSERT INTO breweries (brewery_name, address, city, state_name, zip_code, brewery_description, brewer_id, website, phone_number, brewery_photo)
VALUES  ('Zwei Brewing', '4612 S Mason St. Suite 120', 'Fort Collins', 'CO', '80525', 'Passionately brewing Bavarian-Style Lagers and Weissbier, with forays into American and Belgian styles.', 1001, 'zweibrewing.com', '970-223-2482', 'https://www.coloradobrewerylist.com/wp-content/uploads/2014/03/zwei.jpg');

INSERT INTO operations (day, time_open, time_closed, brewery_id)
VALUES  (7, '11:00:00', '19:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Zwei Brewing')),
        (1, '11:00:00', '21:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Zwei Brewing')),
        (2, '11:00:00', '21:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Zwei Brewing')),
        (3, '11:00:00', '21:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Zwei Brewing')),
        (4, '11:00:00', '21:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Zwei Brewing')),
        (5, '11:00:00', '21:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Zwei Brewing')),
        (6, '11:00:00', '21:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Zwei Brewing'));
        
INSERT INTO breweries (brewery_name, address, city, state_name, zip_code, brewery_description, brewer_id, website, phone_number, brewery_photo)
VALUES  ('Zuni Street Brewing Company', '2355 W 29th Ave.', 'Denver', 'CO', '80211', 'Zuni Street Brewing Co produces fine craft beer in LoHi, Denver. We’re passionate about sharing the brewing experience and our love for the great outdoors.', 1001, 'zunistreetbrewing.com', '303-862-6525', 'https://www.coloradobrewerylist.com/wp-content/uploads/2016/06/Zuni.png');

INSERT INTO operations (day, time_open, time_closed, brewery_id)
VALUES  (7, '12:00:00', '20:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Zuni Street Brewing Company')),
        (1, '15:00:00', '20:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Zuni Street Brewing Company')),
        (2, '15:00:00', '20:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Zuni Street Brewing Company')),
        (3, '15:00:00', '20:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Zuni Street Brewing Company')),
        (4, '15:00:00', '20:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Zuni Street Brewing Company')),
        (5, '12:00:00', '20:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Zuni Street Brewing Company')),
        (6, '12:00:00', '20:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Zuni Street Brewing Company'));
        
INSERT INTO breweries (brewery_name, address, city, state_name, zip_code, brewery_description, brewer_id, website, phone_number, brewery_photo)
VALUES  ('Yampa Valley Brewing Company', '200 N Walnut St', 'Hayden', 'CO', '81639', 'Yampa Valley Brewing Company is located in Hayden CO directly behind A1 liquor. We offer a family friendly environment where you can bring your own food and board games while sampling our flavorful beer. Our beer is brewed and produced with the passion that only a local brewery can offer. We offer many styles of beer from blonde to a stout. Support your local brewery and your local economy.', 1001, 'www.yampavalleybrew.com', '970-276-8014', 'https://www.coloradobrewerylist.com/wp-content/uploads/2015/05/yampa-valley-300x300.jpg');

INSERT INTO operations (day, time_open, time_closed, brewery_id)
VALUES  (7, '11:00:00', '18:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Yampa Valley Brewing Company')),
        (1, '15:00:00', '21:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Yampa Valley Brewing Company')),
        (2, '15:00:00', '21:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Yampa Valley Brewing Company')),
        (3, '15:00:00', '21:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Yampa Valley Brewing Company')),
        (4, '15:00:00', '21:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Yampa Valley Brewing Company')),
        (5, '15:00:00', '22:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Yampa Valley Brewing Company')),
        (6, '12:00:00', '22:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Yampa Valley Brewing Company'));
        
INSERT INTO breweries (brewery_name, address, city, state_name, zip_code, brewery_description, brewer_id, website, phone_number, brewery_photo)
VALUES  ('Wynkoop Brewing Company', '1634 18th St.', 'Denver', 'CO', '80202', 'Welcome to the place where LoDo began. In 1988, a band of urban pioneers, notably among them Colorado Governor, John Hickenlooper, took a shine to an unlikely building at the corner of 18th and Wynkoop. They wanted to brew beer and foster community. The small-batch beers and the hearty fare replicated an authentic public house. Today, we are honored to be known as a legend. We work equally hard to respect our heritage and to remain relevant in our beautiful Denver home.', 1001, 'www.wynkoop.com', '303-297-2700', 'https://www.coloradobrewerylist.com/wp-content/uploads/2014/02/wynkoop-300x279.jpg');

INSERT INTO operations (day, time_open, time_closed, brewery_id)
VALUES  (7, '11:00:00', '24:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Wynkoop Brewing Company')),
        (1, '11:00:00', '24:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Wynkoop Brewing Company')),
        (2, '11:00:00', '24:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Wynkoop Brewing Company')),
        (3, '11:00:00', '24:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Wynkoop Brewing Company')),
        (4, '11:00:00', '24:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Wynkoop Brewing Company')),
        (5, '11:00:00', '01:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Wynkoop Brewing Company')),
        (6, '11:00:00', '01:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Wynkoop Brewing Company'));
        
INSERT INTO breweries (brewery_name, address, city, state_name, zip_code, brewery_description, brewer_id, website, phone_number, brewery_photo)
VALUES  ('Woods Boss Brewing', '2200 California St', 'Denver', 'CO', '80205', 'Woods Boss Brewing has transformed an early 1900’s brick building into a place for community, good music, sharing adventures and delicious brews. The Woods Boss is at home where the mountains embrace the rivers. Kick it with a much deserved brew and gear up to get back on the trail.', 1001, 'woodsbossbrewing.com', '702-556-8784', 'https://www.coloradobrewerylist.com/wp-content/uploads/2015/10/woods-boss-149x300.png');

INSERT INTO operations (day, time_open, time_closed, brewery_id)
VALUES  (7, '12:00:00', '20:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Woods Boss Brewing')),
        (1, '14:00:00', '21:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Woods Boss Brewing')),
        (2, '14:00:00', '22:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Woods Boss Brewing')),
        (3, '14:00:00', '23:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Woods Boss Brewing')),
        (4, '14:00:00', '23:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Woods Boss Brewing')),
        (5, '12:00:00', '23:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Woods Boss Brewing')),
        (6, '12:00:00', '23:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Woods Boss Brewing'));

INSERT INTO breweries (brewery_name, address, city, state_name, zip_code, brewery_description, brewer_id, website, phone_number, brewery_photo) 
    VALUES ('Lady Justice Brewing', '9735 E Colfax Ave', 'Aurora', 'CO', '80907', 'Our mission is simple: we’re brewing great beer to make the world a better place.', 1001, 'www.ladyjusticebrewing.com', '303-856-3809', 'https://www.coloradobrewerylist.com/wp-content/uploads/2015/09/LadyJustice_Banner.jpg');

INSERT INTO operations (day, time_open, time_closed, brewery_id)
    VALUES (7, '12:00:00', '20:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Lady Justice Brewing')),
            (3, '15:00:00', '20:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Lady Justice Brewing')),
            (4, '15:00:00', '20:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Lady Justice Brewing')),
            (5, '15:00:00', '20:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Lady Justice Brewing')),
            (6, '12:00:00', '20:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Lady Justice Brewing'));
             
INSERT INTO breweries (brewery_name, address, city, state_name, zip_code, brewery_description, brewer_id, website, phone_number, brewery_photo) 
    VALUES ('Lake City Brewing Company', '130A Bluff St.', 'Lake City', 'CO', '81235', 'Lake City’s first new brewery in over 130 years', 1001, 'www.lcbrewco.com', '970-944-5222', 'https://img1.wsimg.com/isteam/ip/a0e2e8ec-3ffe-492e-8706-e5e127999325/c2eef6ac-ed0d-40e2-b91a-b190efc5caac.jpg/:/rs=h:1000,cg:true,m');

INSERT INTO operations (day, time_open, time_closed, brewery_id)
    VALUES (7, '13:00:00', '18:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Lake City Brewing Company')),
            (2, '16:00:00', '21:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Lake City Brewing Company')),
            (3, '16:00:00', '21:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Lake City Brewing Company')),
            (4, '13:00:00', '21:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Lake City Brewing Company')),
            (5, '13:00:00', '21:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Lake City Brewing Company')),
            (6, '13:00:00', '21:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Lake City Brewing Company'));
             
INSERT INTO breweries (brewery_name, address, city, state_name, zip_code, brewery_description, brewer_id, website, phone_number, brewery_photo) 
    VALUES ('LandLocked Ales', '3225 S Wadsworth Blvd', 'Lakewood', 'CO', '80227', 'LandLocked Ales is dedicated to brewing quality, low-gravity ales for the adventurous palate while promoting neighborly camaraderie and supporting community integration. Often over-looked by coastal beer geeks, we want to show the world that landlocked states are just as capable of big flavor, but we’re doing it our own way.', 1001, 'www.landlockedales.com/', '303-284-8748', 'https://www.coloradobrewerylist.com/wp-content/uploads/2014/03/landlocked-300x251.jpg');

INSERT INTO operations (day, time_open, time_closed, brewery_id)
    VALUES (1, '14:00:00', '20:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'LandLocked Ales')),
            (2, '14:00:00', '21:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'LandLocked Ales')),
            (3, '12:00:00', '22:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'LandLocked Ales')),
            (4, '12:00:00', '22:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'LandLocked Ales')),
            (5, '12:00:00', '22:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'LandLocked Ales')),
            (6, '12:00:00', '22:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'LandLocked Ales')),
            (7, '12:00:00', '20:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'LandLocked Ales'));

INSERT INTO breweries (brewery_name, address, city, state_name, zip_code, brewery_description, brewer_id, website, phone_number, brewery_photo) 
    VALUES ('Lairat Lodge Brewing', '27618 Firewood Dr.', 'Evergreen', 'CO', '80439', 'Lariat Lodge Brewing Company, just 2 minutes east of historic Downtown Evergreen overlooking Bear Creek, is the town’s first brewery/restaurant, with classic house-brewed beers, upscale comfort food, and a friendly neighborhood vibe. Come see what makes us an experience you won’t find anywhere else.', 1001, 'www.lariatlodgebrewing.com/', '303-674-1842', 'https://www.coloradobrewerylist.com/wp-content/uploads/2015/04/lariat-lodge-300x300.jpg');

INSERT INTO operations (day, time_open, time_closed, brewery_id)
    VALUES (7, '11:00:00', '21:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Lairat Lodge Brewing')),
            (1, '11:00:00', '21:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Lairat Lodge Brewing')),
            (2, '11:00:00', '21:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Lairat Lodge Brewing')),
            (3, '11:00:00', '21:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Lairat Lodge Brewing')),
            (4, '11:00:00', '21:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Lairat Lodge Brewing')),
            (5, '11:00:00', '21:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Lairat Lodge Brewing')),
            (6, '11:00:00', '21:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Lairat Lodge Brewing'));
            
INSERT INTO breweries (brewery_name, address, city, state_name, zip_code, brewery_description, brewer_id, website, phone_number, brewery_photo) 
    VALUES ('Launch Pad Brewery', '884 S Buckley Rd.', 'Aurora', 'CO', '80017', 'Launch Pad is a nano brewery producing unique hand crafted ales with the highest quality ingredients.', 1001, 'www.launchpadbrewery.com/', '303-745-4599', 'https://www.coloradobrewerylist.com/wp-content/uploads/2014/06/launch-pad-271x300.png');

INSERT INTO operations (day, time_open, time_closed, brewery_id)
    VALUES (7, '11:00:00', '20:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Launch Pad Brewery')),
            (1, '11:00:00', '21:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Launch Pad Brewery')),
            (2, '11:00:00', '21:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Launch Pad Brewery')),
            (3, '11:00:00', '21:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Launch Pad Brewery')),
            (4, '11:00:00', '21:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Launch Pad Brewery')),
            (5, '11:00:00', '22:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Launch Pad Brewery')),
            (6, '11:00:00', '22:00:00', (SELECT brewery_id FROM breweries WHERE brewery_name = 'Launch Pad Brewery'));                       
COMMIT;                  