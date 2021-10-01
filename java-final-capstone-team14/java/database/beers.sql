BEGIN TRANSACTION;

-- ('name', 'desc', (SELECT beer_type_id FROM beer_type WHERE beer_type_name = 'type'), 5.2, 18, 'img')
INSERT INTO beers (beer_name, beer_description, beer_type_id, abv, ibu, beer_photo)
VALUES  ('32 Coupe American Cream Ale', 'A rebuild of an American classic: Lemondrop, Mandarina Bavaria & Sabro hops lend a hint of citrus flavors to a light and palatable beer brewed with copious amounts of flaked corn.', (SELECT beer_type_id FROM beer_type WHERE beer_type_name = 'Cream Ale'), 5.2, 18, 'https://6and40brewery.com/wp-content/uploads/2020/09/Crowler_Clean_Narrow-180x300.png'),
        ('Three on the Tree West Coast IPA', 'Intense grapefruit, mango, and slightly piney aroma, crisp and dry with a resinous finish. Made with Simcoe, Centennial, and Azacca hops.', (SELECT beer_type_id FROM beer_type WHERE beer_type_name = 'India Pale Ale'), 7.1, 75, 'https://6and40brewery.com/wp-content/uploads/2020/09/Crowler_Clean_Narrow-180x300.png'),
        ('Direct Diesel Injection Hazy IPA', 'Bursting with citrus & tropical fruit aroma, restrained bitterness with a thick, mineral mouthfeel. Sure to please any hop head featuring Citra LupoMax, Mosaic, and Idaho Gem hops', (SELECT beer_type_id FROM beer_type WHERE beer_type_name = 'India Pale Ale'), 6.2, 35, 'https://6and40brewery.com/wp-content/uploads/2020/09/Crowler_Clean_Narrow-180x300.png'),
        ('Christine Fury Red Ale', 'A tribute to early craft beers, our red ale is refreshingly malty with lightly grassy hop flavors and a smooth finish. Hints of caramel, straw, and toasted biscuits.', (SELECT beer_type_id FROM beer_type WHERE beer_type_name = 'Red Ale'), 4.7, 15, 'https://6and40brewery.com/wp-content/uploads/2020/09/Crowler_Clean_Narrow-180x300.png'),
        ('Juniper-Lime Gimlet', 'Lime & Juniper', (SELECT beer_type_id FROM beer_type WHERE beer_type_name = 'Sour Ale'), 4.7, 15, 'https://6and40brewery.com/wp-content/uploads/2020/09/Crowler_Clean_Narrow-180x300.png');
            
INSERT INTO beers (beer_name, beer_description, beer_type_id, abv, ibu, beer_photo)
VALUES  ('Apocalypse IPA', 'Apocalypse was one of the first beers we developed here at 10 Barrel. Over time we have refinded the recipe to make it a balanced IPA you will keep coming back to.', (SELECT beer_type_id FROM beer_type WHERE beer_type_name = 'India Pale Ale'), 6.8, 70, 'https://10barrel.com/wp-content/uploads/2019/01/Apocalypse-IPA-6pack-800x640.png'),
        ('Nature Calls', 'Mountain IPA? It is a merger of two priminent IPA styles: a West Coast IPA an East Coast Hazy IPA.', (SELECT beer_type_id FROM beer_type WHERE beer_type_name = 'India Pale Ale'), 6.5, 55, 'https://10barrel.com/wp-content/uploads/2020/09/Nature-Calls-Mountain-IPA-6pack-800x640.png'),
        ('Profuse Juice', 'Perfect Post-Sesh', (SELECT beer_type_id FROM beer_type WHERE beer_type_name = 'India Pale Ale'), 6.5, 45, 'https://10barrel.com/wp-content/uploads/2019/08/Profuse-Juice-Hazy-IPA-6pack-800x640.png'),
        ('Pilsner', 'This is a classic German-Style Pilsner brewed the traditional way to enhance complexity', (SELECT beer_type_id FROM beer_type WHERE beer_type_name = 'Pilsner'), 5.0, 38, 'https://10barrel.com/wp-content/uploads/2021/06/Pilsner-6pack-1.png'),
        ('Hazy Trail', 'Built For the Trail #DRINKHAZYTRAIL', (SELECT beer_type_id FROM beer_type WHERE beer_type_name = 'India Pale Ale'), 6.2, 60, 'https://10barrel.com/wp-content/uploads/2019/08/19_HazyTrail_6pk_Can_Box-800x642.png');

INSERT INTO beers (beer_name, beer_description, beer_type_id, abv, ibu, beer_photo)
VALUES  ('Blue Corn Maiden Cream Ale', 'Deliciously clean, light and drinkable, this cream ale is brewed with corn for a refreshing finish.', (SELECT beer_type_id FROM beer_type WHERE beer_type_name = 'Cream Ale'), 4.5, 20, 'https://static.wixstatic.com/media/5749c3_214a35b4b2c044a39be714169dc4e468~mv2_d_3508_5262_s_4_2.jpg/v1/fill/w_464,h_464,usm_1.20_1.00_0.01/file.webp'),
        ('Walking On Sunshine Pale Ale', 'Dry-hopped with Citra, Cascade and Northern Brewer for citrusy aroma & bright flavor.', (SELECT beer_type_id FROM beer_type WHERE beer_type_name = 'Pale Ale'), 5.8, 35, 'https://static.wixstatic.com/media/5749c3_a14238c513684b43aa6f2fcbd96efa97~mv2_d_3364_5046_s_4_2.jpg/v1/fill/w_464,h_464,usm_1.20_1.00_0.01/file.webp'),
        ('Oktoberfest Marzen Lager', 'Lager yeast and Vienna malt give this Oktoberfest-style beer a clean aroma and mild malty flavor. Smooth, easy drinking.', (SELECT beer_type_id FROM beer_type WHERE beer_type_name = 'Lager'), 4.0, 25, 'https://static.wixstatic.com/media/5749c3_a14238c513684b43aa6f2fcbd96efa97~mv2_d_3364_5046_s_4_2.jpg/v1/fill/w_464,h_464,usm_1.20_1.00_0.01/file.webp'),
        ('Old Burlington Stout', 'Flavors of coffee, dark chocolate, well-balanced.', (SELECT beer_type_id FROM beer_type WHERE beer_type_name = 'Stout'), 5.6, 39, 'https://static.wixstatic.com/media/5749c3_48540ffd9a3846c5866bca68dadc78b7~mv2_d_3265_4897_s_4_2.jpg/v1/fill/w_464,h_464,usm_1.20_1.00_0.01/file.webp');


INSERT INTO beers (beer_name, beer_description, beer_type_id, abv, ibu, beer_photo)
    VALUES ('Perfect Drift', 'Crisp and refreshing German-style Pilsner, with a brightness derived from Mittelfruh hops', (SELECT beer_type_id FROM beer_type WHERE beer_type_name = 'Pilsner'), 4.5, 0, 'https://static.wixstatic.com/media/5749c3_f307f289fb2a40c1b49cc09502e23e72~mv2_d_3400_5100_s_4_2.jpg/v1/fill/w_464,h_464,usm_1.20_1.00_0.01/file.webp'),
    ('Pump Action', 'GABF and World Beer Cup gold medal winner, made to be like everything you like about a pumpkin pie', (SELECT beer_type_id FROM beer_type WHERE beer_type_name = 'Pumpkin Ale'), 7.7, 0, 'https://static.wixstatic.com/media/5749c3_63a8a45ac7e14ea2ab8d825545d6a592~mv2_d_3413_5119_s_4_2.jpg/v1/fill/w_464,h_464,usm_1.20_1.00_0.01/file.webp'),
    ('Flatiron Fog', 'A hazy and juicy IPA brewed with Citra and Centennial hops, smelling of fresh citrus and bright tropical fruit', (SELECT beer_type_id FROM beer_type WHERE beer_type_name = 'India Pale Ale'), 6.5, 0, 'https://static.wixstatic.com/media/5749c3_0c3c24887bc044a7b14bec56cede705c~mv2_d_3430_5145_s_4_2.jpg/v1/fill/w_464,h_464,usm_1.20_1.00_0.01/file.webp'),
    ('Favorite Blonde', 'This blonde ale has a subtle hop forward character and mellow malt flavor.', (SELECT beer_type_id FROM beer_type WHERE beer_type_name = 'Blonde Ale'), 5.0, 20, 'https://untappd.akamaized.net/photos/2021_09_05/9b95ed09b60053f8e01dbde074066242_640x640.jpg'),
    ('Fat Randys IPA', 'Complex floral and citrus hop notes, with a smooth, malty finish', (SELECT beer_type_id FROM beer_type WHERE beer_type_name = 'India Pale Ale'), 7.0, 65, 'https://untappd.akamaized.net/photos/2021_09_14/8d010542ef72d07074eac5833bb66807_raw.jpg'),
    ('Patio Amber Pale Ale', 'A very drinkable beer with lots of caramel and hop flavors and aroma.', (SELECT beer_type_id FROM beer_type WHERE beer_type_name = 'Red Ale'), 5.3, 32, 'https://untappd.akamaized.net/photos/2021_09_13/471a88980936b39fbc5e489b5fd581a4_raw.jpg'),
    ('Independence Pass Ale', 'Independence Pass Ale is our super-hopped high altitude rendition of the classic India Pale Ale style.', (SELECT beer_type_id FROM beer_type WHERE beer_type_name = 'India Pale Ale'), 7.0, 62, 'http://aspenbrewingcompany.com/wp-content/uploads/2013/09/independence_pass_ale.jpg'),
    ('Brown Bearale', 'This sweet and chocolaty brew looks intimidating like the bears around Aspen, but finishes light enough to keep you thirsty for another. ', (SELECT beer_type_id FROM beer_type WHERE beer_type_name = 'Brown Ale'), 5.0, 40, 'http://aspenbrewingcompany.com/wp-content/uploads/2013/09/brown_bearale.jpg'),
    ('Conundrum Red Ale', 'Conundrum walks the line between a malt-centric sweet ale and a hop-centric bitter ale so well, it’s tough to describe.', (SELECT beer_type_id FROM beer_type WHERE beer_type_name = 'Red Ale'), 6.5, 55, 'http://aspenbrewingcompany.com/wp-content/uploads/2013/09/conundrum_red_ale.jpg'),
    ('Pyramid Peak Porter', 'Brewed with roasted, chocolate, and black malts, balanced with a heavy dose of delicious and earthy Kent Golding hops, this porter is just what the not-afraid-of-the-dark (beer drinking) person is looking for.', (SELECT beer_type_id FROM beer_type WHERE beer_type_name = 'Porter'), 5.0, 45, 'http://aspenbrewingcompany.com/wp-content/uploads/2013/09/pyramid_peak_porter.jpg'),
    ('E-Legal', 'Floral notes on the nose. A medium-bodied IPA. Hop forward at the beginning of the mouth feel and rounded out smoothly by the rye for a dry crisp finish', (SELECT beer_type_id FROM beer_type WHERE beer_type_name = 'India Pale Ale'), 7.6, 0, 'https://static.wixstatic.com/media/5749c3_0c3c24887bc044a7b14bec56cede705c~mv2_d_3430_5145_s_4_2.jpg/v1/fill/w_464,h_464,usm_1.20_1.00_0.01/file.webp'),
    ('Maria Bonita', 'Fruity notes on the nose. A perfect balance of pilsner malts, noble hops and Guava in taste with a clean light-bodied finish', (SELECT beer_type_id FROM beer_type WHERE beer_type_name = 'Pilsner'), 5.5, 0, 'https://static.wixstatic.com/media/5749c3_0086004f8e8f435a9b536a3c4fb66735~mv2_d_3387_5080_s_4_2.jpg/v1/fill/w_464,h_464,usm_1.20_1.00_0.01/file.webp'),
    ('El Dorado', 'Brewed with Lemongrass & Lime - Bright, herbal and citrusy on the nose. A well balanced, light-bodied Kolsh with notes of fresh lime and lemongrass in the taste', (SELECT beer_type_id FROM beer_type WHERE beer_type_name = 'Kolsch'), 5.7, 0, 'https://static.wixstatic.com/media/5749c3_f307f289fb2a40c1b49cc09502e23e72~mv2_d_3400_5100_s_4_2.jpg/v1/fill/w_464,h_464,usm_1.20_1.00_0.01/file.webp'),
    ('White Rascal', 'An authentic Belgian-style white ale, this Rascal is unfiltered and cleverly spiced with coriander and Curacao orange peel producing a refreshingly zesty classic ale.', (SELECT beer_type_id FROM beer_type WHERE beer_type_name = 'White Ale'), 5.6, 18, 'https://d1h6bqmdexfe1t.cloudfront.net/uploads/beer/bottle_image/11/desktop2x_1525984916_WEB_WhiteRascal_Cans_and_Glass.png'),
    ('Avery IPA', 'Avery IPA radiates with the crisp, floral, and resinous hoppiness of six different hop varieties, supported by a malty backbone and a dry finish.', (SELECT beer_type_id FROM beer_type WHERE beer_type_name = 'India Pale Ale'), 6.5, 40, 'https://d1h6bqmdexfe1t.cloudfront.net/uploads/beer/bottle_image/10/desktop2x_1530887206_WEB_AveryIPA_Can_and_Glass.png'),
    ('Ellies Brown Ale', 'This beautiful, deep russet brew is dominated by a chocolate and brown sugar maltiness with hints of vanilla and nuts, producing a very smooth, well-balanced, and quaffable brown ale.', (SELECT beer_type_id FROM beer_type WHERE beer_type_name = 'Brown Ale'), 5.5, 10, 'https://d1h6bqmdexfe1t.cloudfront.net/uploads/beer/bottle_image/12/desktop2x_1531343169_Ellies_Can_and_Glass.png'),
    ('Avery Lager', 'Avery Lager is clean and refreshing, with a smooth finish. We use pure Rocky Mountain water with two row and pilsner malts to create this quintessential lager.', (SELECT beer_type_id FROM beer_type WHERE beer_type_name = 'Lager'), 5.0, 12, 'https://d1h6bqmdexfe1t.cloudfront.net/uploads/beer/bottle_image/160/desktop2x_1538691596_WEB_AveryLager_Can_and_Glass.png');


-- ((SELECT beer_id FROM beers WHERE beer_name = ''), (SELECT brewery_id FROM breweries WHERE brewery_name = ''))
INSERT INTO beers_breweries (beer_id, brewery_id) 
VALUES  ((SELECT beer_id FROM beers WHERE beer_name = '32 Coupe American Cream Ale'), (SELECT brewery_id FROM breweries WHERE brewery_name = '6 & 40 Brewery')),
        ((SELECT beer_id FROM beers WHERE beer_name = 'Three on the Tree West Coast IPA'), (SELECT brewery_id FROM breweries WHERE brewery_name = '6 & 40 Brewery')),
        ((SELECT beer_id FROM beers WHERE beer_name = 'Direct Diesel Injection Hazy IPA'), (SELECT brewery_id FROM breweries WHERE brewery_name = '6 & 40 Brewery')),
        ((SELECT beer_id FROM beers WHERE beer_name = 'Christine Fury Red Ale'), (SELECT brewery_id FROM breweries WHERE brewery_name = '6 & 40 Brewery')),
        ((SELECT beer_id FROM beers WHERE beer_name = 'Juniper-Lime Gimlet'), (SELECT brewery_id FROM breweries WHERE brewery_name = '6 & 40 Brewery'));

INSERT INTO beers_breweries (beer_id, brewery_id)
VALUES  ((SELECT beer_id FROM beers WHERE beer_name = 'Apocalypse IPA'), (SELECT brewery_id FROM breweries WHERE brewery_name = '10 Barrel Brewing Company')),
        ((SELECT beer_id FROM beers WHERE beer_name = 'Nature Calls'), (SELECT brewery_id FROM breweries WHERE brewery_name = '10 Barrel Brewing Company')),
        ((SELECT beer_id FROM beers WHERE beer_name = 'Profuse Juice'), (SELECT brewery_id FROM breweries WHERE brewery_name = '10 Barrel Brewing Company')),
        ((SELECT beer_id FROM beers WHERE beer_name = 'Pilsner'), (SELECT brewery_id FROM breweries WHERE brewery_name = '10 Barrel Brewing Company')),
        ((SELECT beer_id FROM beers WHERE beer_name = 'Hazy Trail'), (SELECT brewery_id FROM breweries WHERE brewery_name = '10 Barrel Brewing Company'));


INSERT INTO beers_breweries (beer_id, brewery_id)
VALUES  ((SELECT beer_id FROM beers WHERE beer_name = 'Blue Corn Maiden Cream Ale'), (SELECT brewery_id FROM breweries WHERE brewery_name = '300 Suns Brewing')),
        ((SELECT beer_id FROM beers WHERE beer_name = 'Walking On Sunshine Pale Ale'), (SELECT brewery_id FROM breweries WHERE brewery_name = '300 Suns Brewing')),
        ((SELECT beer_id FROM beers WHERE beer_name = 'Oktoberfest Marzen Lager'), (SELECT brewery_id FROM breweries WHERE brewery_name = '300 Suns Brewing')),
        ((SELECT beer_id FROM beers WHERE beer_name = 'Old Burlington Stout'), (SELECT brewery_id FROM breweries WHERE brewery_name = '300 Suns Brewing'));
   
INSERT INTO beers_breweries (beer_id, brewery_id) 
    VALUES ((SELECT beer_id FROM beers WHERE beer_name = 'Perfect Drift'), (SELECT brewery_id FROM breweries WHERE brewery_name = '4 Noses Brewing Company')),
    ((SELECT beer_id FROM beers WHERE beer_name = 'Pump Action'), (SELECT brewery_id FROM breweries WHERE brewery_name = '4 Noses Brewing Company')),
    ((SELECT beer_id FROM beers WHERE beer_name = 'Flatiron Fog'), (SELECT brewery_id FROM breweries WHERE brewery_name = '4 Noses Brewing Company')),
    ((SELECT beer_id FROM beers WHERE beer_name = 'Favorite Blonde'), (SELECT brewery_id FROM breweries WHERE brewery_name = 'Altitude Brewing & Supply')),
    ((SELECT beer_id FROM beers WHERE beer_name = 'Fat Randys IPA'), (SELECT brewery_id FROM breweries WHERE brewery_name = 'Altitude Brewing & Supply')),
    ((SELECT beer_id FROM beers WHERE beer_name = 'Patio Amber Pale Ale'), (SELECT brewery_id FROM breweries WHERE brewery_name = 'Altitude Brewing & Supply')),
    ((SELECT beer_id FROM beers WHERE beer_name = 'Independence Pass Ale'), (SELECT brewery_id FROM breweries WHERE brewery_name = 'Aspen Brewing Company Tap Room')),
    ((SELECT beer_id FROM beers WHERE beer_name = 'Brown Bearale'), (SELECT brewery_id FROM breweries WHERE brewery_name = 'Aspen Brewing Company Tap Room')),
    ((SELECT beer_id FROM beers WHERE beer_name = 'Conundrum Red Ale'), (SELECT brewery_id FROM breweries WHERE brewery_name = 'Aspen Brewing Company Tap Room')),
    ((SELECT beer_id FROM beers WHERE beer_name = 'Pyramid Peak Porter'), (SELECT brewery_id FROM breweries WHERE brewery_name = 'Aspen Brewing Company Tap Room')),
    ((SELECT beer_id FROM beers WHERE beer_name = 'E-Legal'), (SELECT brewery_id FROM breweries WHERE brewery_name = 'Atrevida Beer Company')),
    ((SELECT beer_id FROM beers WHERE beer_name = 'Maria Bonita'), (SELECT brewery_id FROM breweries WHERE brewery_name = 'Atrevida Beer Company')),
    ((SELECT beer_id FROM beers WHERE beer_name = 'El Dorado'), (SELECT brewery_id FROM breweries WHERE brewery_name = 'Atrevida Beer Company')),
    ((SELECT beer_id FROM beers WHERE beer_name = 'White Rascal'), (SELECT brewery_id FROM breweries WHERE brewery_name = 'Avery Brewing Company')),
    ((SELECT beer_id FROM beers WHERE beer_name = 'Avery IPA'), (SELECT brewery_id FROM breweries WHERE brewery_name = 'Avery Brewing Company')),
    ((SELECT beer_id FROM beers WHERE beer_name = 'Ellies Brown Ale'), (SELECT brewery_id FROM breweries WHERE brewery_name = 'Avery Brewing Company')),
    ((SELECT beer_id FROM beers WHERE beer_name = 'Avery Lager'), (SELECT brewery_id FROM breweries WHERE brewery_name = 'Avery Brewing Company'));   
    
COMMIT;