
create table method_processing(
    id_method number(10) PRIMARY KEY,
    name_method varchar(30) 
);

CREATE SEQUENCE method_SEQ;


-- create tigger using the sequence
CREATE OR REPLACE TRIGGER method_TRG 
BEFORE INSERT ON method_processing 
FOR EACH ROW
WHEN (new.id_method IS NULL)
BEGIN
  SELECT method_SEQ.NEXTVAL
  INTO   :new.id_method
  FROM   dual;
END;



--INSERT INTO method_processing (name_method) VALUES ('a');


commit;

    
  
create table original_image(
    id_original_image number(10) PRIMARY KEY ,
    image bfile NOT NULL
);

CREATE SEQUENCE original_image_SEQ;


-- create tigger using the sequence
CREATE OR REPLACE TRIGGER original_image_TRG 
BEFORE INSERT ON original_image 
FOR EACH ROW
WHEN (new.id_original_image IS NULL)
BEGIN
  SELECT original_image_SEQ.NEXTVAL
  INTO   :new.id_original_image
  FROM   dual;
END;



create table imageprocessing(
    id_original_image number(10) ,
    id_method number(10),
    image bfile NOT NULL,
    primary key (id_original_image, id_method),
    FOREIGN KEY (id_original_image) REFERENCES original_image(id_original_image),
    FOREIGN KEY (id_method) REFERENCES method_processing(id_method)

);

INSERT INTO print_media (product_id, ad_id, ad_graphic)
   VALUES (3000, 31001, 
      BFILENAME('MEDIA_DIR', 'modem_comp_ad.gif'));