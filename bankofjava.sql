PGDMP     !        
            s        
   bankofjava    9.4.1    9.4.1 *    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           1262    16384 
   bankofjava    DATABASE     |   CREATE DATABASE bankofjava WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
    DROP DATABASE bankofjava;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    5                        0    0    public    ACL     �   REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;
                  postgres    false    5            �            3079    11861    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false                       0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    180            �            1259    16385    account    TABLE     �   CREATE TABLE account (
    email character varying,
    balance numeric,
    created timestamp with time zone,
    id integer NOT NULL
);
    DROP TABLE public.account;
       public         postgres    false    5            �            1259    16391    account_id_seq    SEQUENCE     p   CREATE SEQUENCE account_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.account_id_seq;
       public       postgres    false    5    172                       0    0    account_id_seq    SEQUENCE OWNED BY     3   ALTER SEQUENCE account_id_seq OWNED BY account.id;
            public       postgres    false    173            �            1259    16393    stock    TABLE     �   CREATE TABLE stock (
    id integer NOT NULL,
    name character varying,
    currentvalue numeric,
    lastchange numeric,
    lastchangedate timestamp with time zone,
    fullname character varying
);
    DROP TABLE public.stock;
       public         postgres    false    5            �            1259    16399    stock_id_seq    SEQUENCE     n   CREATE SEQUENCE stock_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.stock_id_seq;
       public       postgres    false    5    174                       0    0    stock_id_seq    SEQUENCE OWNED BY     /   ALTER SEQUENCE stock_id_seq OWNED BY stock.id;
            public       postgres    false    175            �            1259    16401 	   stockdata    TABLE     �   CREATE TABLE stockdata (
    id integer NOT NULL,
    stockid integer,
    date timestamp with time zone,
    value numeric,
    change numeric
);
    DROP TABLE public.stockdata;
       public         postgres    false    5            �            1259    16407    stockdata_id_seq    SEQUENCE     r   CREATE SEQUENCE stockdata_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.stockdata_id_seq;
       public       postgres    false    5    176                       0    0    stockdata_id_seq    SEQUENCE OWNED BY     7   ALTER SEQUENCE stockdata_id_seq OWNED BY stockdata.id;
            public       postgres    false    177            �            1259    16426    transaction    TABLE     �   CREATE TABLE transaction (
    id integer NOT NULL,
    accountid integer,
    type integer,
    stockid integer,
    count integer,
    price numeric,
    date timestamp with time zone
);
    DROP TABLE public.transaction;
       public         postgres    false    5            �            1259    16424    transaction_id_seq    SEQUENCE     t   CREATE SEQUENCE transaction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.transaction_id_seq;
       public       postgres    false    179    5                       0    0    transaction_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE transaction_id_seq OWNED BY transaction.id;
            public       postgres    false    178            s           2604    16409    id    DEFAULT     Z   ALTER TABLE ONLY account ALTER COLUMN id SET DEFAULT nextval('account_id_seq'::regclass);
 9   ALTER TABLE public.account ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    173    172            t           2604    16410    id    DEFAULT     V   ALTER TABLE ONLY stock ALTER COLUMN id SET DEFAULT nextval('stock_id_seq'::regclass);
 7   ALTER TABLE public.stock ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    175    174            u           2604    16411    id    DEFAULT     ^   ALTER TABLE ONLY stockdata ALTER COLUMN id SET DEFAULT nextval('stockdata_id_seq'::regclass);
 ;   ALTER TABLE public.stockdata ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    177    176            v           2604    16429    id    DEFAULT     b   ALTER TABLE ONLY transaction ALTER COLUMN id SET DEFAULT nextval('transaction_id_seq'::regclass);
 =   ALTER TABLE public.transaction ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    178    179    179            �          0    16385    account 
   TABLE DATA               7   COPY account (email, balance, created, id) FROM stdin;
    public       postgres    false    172   �)                  0    0    account_id_seq    SEQUENCE SET     6   SELECT pg_catalog.setval('account_id_seq', 10, true);
            public       postgres    false    173            �          0    16393    stock 
   TABLE DATA               V   COPY stock (id, name, currentvalue, lastchange, lastchangedate, fullname) FROM stdin;
    public       postgres    false    174   u*                  0    0    stock_id_seq    SEQUENCE SET     4   SELECT pg_catalog.setval('stock_id_seq', 26, true);
            public       postgres    false    175            �          0    16401 	   stockdata 
   TABLE DATA               >   COPY stockdata (id, stockid, date, value, change) FROM stdin;
    public       postgres    false    176   X+                  0    0    stockdata_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('stockdata_id_seq', 31, true);
            public       postgres    false    177            �          0    16426    transaction 
   TABLE DATA               P   COPY transaction (id, accountid, type, stockid, count, price, date) FROM stdin;
    public       postgres    false    179   u+       	           0    0    transaction_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('transaction_id_seq', 2, true);
            public       postgres    false    178                       2606    16440    fk_transaction 
   CONSTRAINT     Q   ALTER TABLE ONLY transaction
    ADD CONSTRAINT fk_transaction PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.transaction DROP CONSTRAINT fk_transaction;
       public         postgres    false    179    179            x           2606    16413 
   pk_account 
   CONSTRAINT     I   ALTER TABLE ONLY account
    ADD CONSTRAINT pk_account PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.account DROP CONSTRAINT pk_account;
       public         postgres    false    172    172            z           2606    16415    pk_stock 
   CONSTRAINT     E   ALTER TABLE ONLY stock
    ADD CONSTRAINT pk_stock PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.stock DROP CONSTRAINT pk_stock;
       public         postgres    false    174    174            }           2606    16417    pk_stockdata 
   CONSTRAINT     M   ALTER TABLE ONLY stockdata
    ADD CONSTRAINT pk_stockdata PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.stockdata DROP CONSTRAINT pk_stockdata;
       public         postgres    false    176    176            {           1259    16418    fki_stockdata_stock    INDEX     E   CREATE INDEX fki_stockdata_stock ON stockdata USING btree (stockid);
 '   DROP INDEX public.fki_stockdata_stock;
       public         postgres    false    176            �           1259    16446    fki_transaction_account    INDEX     M   CREATE INDEX fki_transaction_account ON transaction USING btree (accountid);
 +   DROP INDEX public.fki_transaction_account;
       public         postgres    false    179            �           1259    16452    fki_transaction_stock    INDEX     I   CREATE INDEX fki_transaction_stock ON transaction USING btree (stockid);
 )   DROP INDEX public.fki_transaction_stock;
       public         postgres    false    179            �           2606    16419    fk_stockdata_stock    FK CONSTRAINT     m   ALTER TABLE ONLY stockdata
    ADD CONSTRAINT fk_stockdata_stock FOREIGN KEY (stockid) REFERENCES stock(id);
 F   ALTER TABLE ONLY public.stockdata DROP CONSTRAINT fk_stockdata_stock;
       public       postgres    false    176    174    1914            �           2606    16441    fk_transaction_account    FK CONSTRAINT     w   ALTER TABLE ONLY transaction
    ADD CONSTRAINT fk_transaction_account FOREIGN KEY (accountid) REFERENCES account(id);
 L   ALTER TABLE ONLY public.transaction DROP CONSTRAINT fk_transaction_account;
       public       postgres    false    179    172    1912            �           2606    16447    fk_transaction_stock    FK CONSTRAINT     q   ALTER TABLE ONLY transaction
    ADD CONSTRAINT fk_transaction_stock FOREIGN KEY (stockid) REFERENCES stock(id);
 J   ALTER TABLE ONLY public.transaction DROP CONSTRAINT fk_transaction_stock;
       public       postgres    false    179    174    1914            �   �   x���1�0��~E>�����Uy]�!�b�� �H��F[lN[NKޛ����	XG����ѱ/&�J�?h��a�ci8�Z���ҳN)*X,�8RE_�5�\Hx.|:�bP¬��_|����C���7�޿st_      �   �   x�}��n�0�s�y*�M��--��V�6�\�,Hղ���V@ �����e�J4�8#U��$����h��#�'i~}�F�7�D�/)~%;�0��as>�b�ɱ�}�Anµ|�T�����Ku�Kq���R��s����6�"�v��urG�������Rk��TQV�k�VK����V����|�:cK�f��� � � g�      �      x������ � �      �      x�3�44�4�42�4�8c��b���� +��     