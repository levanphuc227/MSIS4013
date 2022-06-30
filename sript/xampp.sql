create DATABASE augmented;
use augmented;
create table method_processing(
    id_method int PRIMARY KEY AUTO_INCREMENT,
    name_method varchar(30) 
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- INSERT INTO  method_processing (name_method) VALUES (name_method)



create table original_image(
    id_original_image int PRIMARY KEY AUTO_INCREMENT,
    image LONGBLOB NOT NULL,
    label_img varchar(20) not null
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
 
    
-- INSERT INTO  original_image (image,label_img) VALUES (image,label_img)
    
    
create table image_processing(
    id_original_image int ,
    id_method int,
    image LONGBLOB NOT NULL,
    primary key (id_original_image, id_method),
    FOREIGN KEY (id_original_image) REFERENCES original_image(id_original_image),
    FOREIGN KEY (id_method) REFERENCES method_processing(id_method)

) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;