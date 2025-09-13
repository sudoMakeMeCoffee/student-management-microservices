-- init.sql

-- Enable UUID generation
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Create Student table
CREATE TABLE IF NOT EXISTS student (
                                       id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone_number VARCHAR(20),
    date_of_birth DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );

-- Auto-update updated_at field on update
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
RETURN NEW;
END;
$$ language 'plpgsql';

DROP TRIGGER IF EXISTS set_timestamp ON student;

CREATE TRIGGER set_timestamp
    BEFORE UPDATE ON student
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

-- Insert 100 dummy students
INSERT INTO student (name, email, phone_number, date_of_birth)
VALUES
    ('John Doe', 'john.doe@example.com', '+94710000001', '2000-05-15'),
    ('Jane Smith', 'jane.smith@example.com', '+94710000002', '1999-09-22'),
    ('Michael Perera', 'michael.perera@example.com', '+94710000003', '2001-03-10'),
    ('Ayesha Fernando', 'ayesha.fernando@example.com', '+94710000004', '2002-12-01'),
    ('Kavindu Silva', 'kavindu.silva@example.com', '+94710000005', '2000-07-30'),
    ('Sithija Kavee', 'sithija.kavee@example.com', '+94710000006', '2001-01-18'),
    ('Pasindu Jayasuriya', 'pasindu.j@example.com', '+94710000007', '2001-05-09'),
    ('Dinithi Senanayake', 'dinithi.s@example.com', '+94710000008', '1999-03-27'),
    ('Ravindu Wickrama', 'ravindu.w@example.com', '+94710000009', '2000-11-02'),
    ('Lakshi Weerasinghe', 'lakshi.w@example.com', '+94710000010', '2002-06-21'),
    ('Ishara Fernando', 'ishara.f@example.com', '+94710000011', '2001-04-05'),
    ('Kasun Perera', 'kasun.p@example.com', '+94710000012', '2000-12-14'),
    ('Tharushi de Silva', 'tharushi.d@example.com', '+94710000013', '1999-07-28'),
    ('Madushan Rathnayake', 'madushan.r@example.com', '+94710000014', '2001-02-18'),
    ('Charuni Wickramasinghe', 'charuni.w@example.com', '+94710000015', '2002-09-11'),
    ('Shenal Samarasinghe', 'shenal.s@example.com', '+94710000016', '2000-01-09'),
    ('Nadeesha Priyadarshani', 'nadeesha.p@example.com', '+94710000017', '2001-11-24'),
    ('Sahan Ekanayake', 'sahan.e@example.com', '+94710000018', '2002-08-16'),
    ('Yasiru Abeysekara', 'yasiru.a@example.com', '+94710000019', '2000-10-03'),
    ('Manudi Ranasinghe', 'manudi.r@example.com', '+94710000020', '1999-04-08'),
    ('Pasan Herath', 'pasan.h@example.com', '+94710000021', '2000-02-14'),
    ('Bimsara de Silva', 'bimsara.d@example.com', '+94710000022', '2001-07-19'),
    ('Chathuni Perera', 'chathuni.p@example.com', '+94710000023', '2000-12-23'),
    ('Rashmika Lakshan', 'rashmika.l@example.com', '+94710000024', '2002-01-31'),
    ('Gayani Udayanga', 'gayani.u@example.com', '+94710000025', '1999-08-12'),
    ('Thilina Madushan', 'thilina.m@example.com', '+94710000026', '2001-06-20'),
    ('Dilini Fernando', 'dilini.f@example.com', '+94710000027', '2000-05-25'),
    ('Ruwan Pradeep', 'ruwan.p@example.com', '+94710000028', '2002-03-09'),
    ('Amasha Sewwandi', 'amasha.s@example.com', '+94710000029', '2001-09-30'),
    ('Chathura Bandara', 'chathura.b@example.com', '+94710000030', '2000-10-10'),
    ('Ishani Madushika', 'ishani.m@example.com', '+94710000031', '2002-06-02'),
    ('Dinura Abeywardena', 'dinura.a@example.com', '+94710000032', '1999-11-18'),
    ('Pavithra Ekanayaka', 'pavithra.e@example.com', '+94710000033', '2001-04-28'),
    ('Samitha Jayawardena', 'samitha.j@example.com', '+94710000034', '2000-07-14'),
    ('Heshani Wickrama', 'heshani.w@example.com', '+94710000035', '2002-08-08'),
    ('Nipun Fernando', 'nipun.f@example.com', '+94710000036', '1999-09-09'),
    ('Sachini Perera', 'sachini.p@example.com', '+94710000037', '2001-01-03'),
    ('Chathurya Senanayake', 'chathurya.s@example.com', '+94710000038', '2000-02-11'),
    ('Lakshan Gamage', 'lakshan.g@example.com', '+94710000039', '2001-12-12'),
    ('Thisal Gunasekara', 'thisal.g@example.com', '+94710000040', '2002-05-15'),
    ('Janith Abeykoon', 'janith.a@example.com', '+94710000041', '2000-03-07'),
    ('Deshika Sewwandi', 'deshika.s@example.com', '+94710000042', '2001-09-21'),
    ('Rasika Dissanayake', 'rasika.d@example.com', '+94710000043', '2000-08-01'),
    ('Naduni Kariyawasam', 'naduni.k@example.com', '+94710000044', '2001-07-07'),
    ('Vimukthi Jayasena', 'vimukthi.j@example.com', '+94710000045', '2002-04-04'),
    ('Shashini Weerasekara', 'shashini.w@example.com', '+94710000046', '1999-02-02'),
    ('Dulaj Herath', 'dulaj.h@example.com', '+94710000047', '2000-11-11'),
    ('Sithum Fernando', 'sithum.f@example.com', '+94710000048', '2001-06-15'),
    ('Senuri Liyanage', 'senuri.l@example.com', '+94710000049', '2002-03-22'),
    ('Nadun Weerakoon', 'nadun.w@example.com', '+94710000050', '2001-01-29'),
    ('Ishini Rathnayake', 'ishini.r@example.com', '+94710000051', '2000-04-16'),
    ('Chamath Jayawardena', 'chamath.j@example.com', '+94710000052', '1999-12-19'),
    ('Lahiru de Silva', 'lahiru.d@example.com', '+94710000053', '2002-08-28'),
    ('Sanduni Perera', 'sanduni.p@example.com', '+94710000054', '2000-05-11'),
    ('Randika Fernando', 'randika.f@example.com', '+94710000055', '2001-03-15'),
    ('Sajani Wickramasinghe', 'sajani.w@example.com', '+94710000056', '1999-09-13'),
    ('Tharindu Ekanayake', 'tharindu.e@example.com', '+94710000057', '2000-10-21'),
    ('Chathura Priyankara', 'chathura.p@example.com', '+94710000058', '2002-07-17'),
    ('Isuri Abeykoon', 'isuri.a@example.com', '+94710000059', '2001-02-08'),
    ('Kalpa Perera', 'kalpa.p@example.com', '+94710000060', '2000-01-14'),
    ('Sanuri Jayasinghe', 'sanuri.j@example.com', '+94710000061', '2002-12-25'),
    ('Dulmini Rathnayake', 'dulmini.r@example.com', '+94710000062', '1999-11-05'),
    ('Dasun Madushanka', 'dasun.m@example.com', '+94710000063', '2000-09-01'),
    ('Shenali Wickrama', 'shenali.w@example.com', '+94710000064', '2001-05-30'),
    ('Pasan Abeysekara', 'pasan.a@example.com', '+94710000065', '2002-02-19'),
    ('Chameera Senanayake', 'chameera.s@example.com', '+94710000066', '1999-08-09'),
    ('Thivanka Jayawardena', 'thivanka.j@example.com', '+94710000067', '2001-03-12'),
    ('Ishara Perera', 'ishara.p@example.com', '+94710000068', '2000-07-05'),
    ('Maneesha Gamage', 'maneesha.g@example.com', '+94710000069', '2002-11-27'),
    ('Chathuranga Kumara', 'chathuranga.k@example.com', '+94710000070', '2001-10-18'),
    ('Ravisha Weerasinghe', 'ravisha.w@example.com', '+94710000071', '2000-06-06'),
    ('Sanidu Madushan', 'sanidu.m@example.com', '+94710000072', '2001-04-01'),
    ('Sadeepa Ekanayake', 'sadeepa.e@example.com', '+94710000073', '2000-03-28'),
    ('Hansani Silva', 'hansani.s@example.com', '+94710000074', '1999-12-03'),
    ('Kavisha Perera', 'kavisha.p@example.com', '+94710000075', '2002-09-09'),
    ('Shenal Rathnayake', 'shenal.r@example.com', '+94710000076', '2001-01-16'),
    ('Uthpala Jayasuriya', 'uthpala.j@example.com', '+94710000077', '2000-11-07'),
    ('Oshada Weerakoon', 'oshada.w@example.com', '+94710000078', '2002-05-02'),
    ('Chamodi Abeywickrama', 'chamodi.a@example.com', '+94710000079', '2001-08-19'),
    ('Shehan Maduranga', 'shehan.m@example.com', '+94710000080', '2000-10-29'),
    ('Thamali Perera', 'thamali.p@example.com', '+94710000081', '2001-06-25'),
    ('Yohan Wickramasinghe', 'yohan.w@example.com', '+94710000082', '2002-03-13'),
    ('Nethmi Rathnayake', 'nethmi.r@example.com', '+94710000083', '1999-04-20'),
    ('Mihiran Jayasinghe', 'mihiran.j@example.com', '+94710000084', '2001-12-01'),
    ('Sadev Gunarathna', 'sadev.g@example.com', '+94710000085', '2002-01-22'),
    ('Tharindu Weerasekara', 'tharindu.w@example.com', '+94710000086', '2000-08-17'),
    ('Dilini Senarath', 'dilini.s@example.com', '+94710000087', '2001-11-09'),
    ('Chavini Perera', 'chavini.p@example.com', '+94710000088', '2002-02-14'),
    ('Lakshan Perera', 'lakshan.p@example.com', '+94710000089', '2000-01-27'),
    ('Anjalee Wijesinghe', 'anjalee.w@example.com', '+94710000090', '2001-05-06'),
    ('Rashmi Madushani', 'rashmi.m@example.com', '+94710000091', '2000-09-19'),
    ('Chathura Wickramasinghe', 'chathura.w@example.com', '+94710000092', '2002-06-14'),
    ('Dilshan Perera', 'dilshan.p@example.com', '+94710000093', '2001-07-02'),
    ('Oshini Silva', 'oshini.s@example.com', '+94710000094', '2000-03-16'),
    ('Hashini Gunarathna', 'hashini.g@example.com', '+94710000095', '2002-10-28'),
    ('Supun Ranasinghe', 'supun.r@example.com', '+94710000096', '2001-09-24'),
    ('Dumindu Jayawardena', 'dumindu.j@example.com', '+94710000097', '2000-12-08'),
    ('Maleesha Perera', 'maleesha.p@example.com', '+94710000098', '2002-07-20'),
    ('Sadeepa Perera', 'sadeepa.p@example.com', '+94710000099', '2001-02-25'),
    ('Nadeesha Liyanage', 'nadeesha.l@example.com', '+94710000100', '2000-06-18');
