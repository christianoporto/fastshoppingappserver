SET
    SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";

SET
    AUTOCOMMIT = 0;

START TRANSACTION;

SET
    time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */
;

/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */
;

/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */
;

/*!40101 SET NAMES utf8mb4 */
;

--
-- Base de datos: `storeapptest`
--
-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `categories`
--
CREATE TABLE `categories` (
    `id` varchar(45) NOT NULL,
    `name` varchar(45) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = latin1;

--
-- Volcado de datos para la tabla `categories`
--
INSERT INTO
    `categories` (`id`, `name`)
VALUES
    (
        '295b1ca3-426c-4c9d-9992-d3c629962933',
        'Classics'
    ),
    (
        '7ae22f59-d1b7-45c5-90c6-cd56fb72fb78',
        'Ballet shoe'
    );

-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `customers`
--
CREATE TABLE `customers` (
    `id` varchar(45) NOT NULL,
    `fullName` varchar(250) NOT NULL,
    `idNumber` varchar(45) DEFAULT NULL,
    `address` varchar(250) DEFAULT NULL,
    `phoneNumber` varchar(45) DEFAULT NULL,
    `email` varchar(250) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = latin1;

--
-- Volcado de datos para la tabla `customers`
--
INSERT INTO
    `customers` (
        `id`,
        `fullName`,
        `idNumber`,
        `address`,
        `phoneNumber`,
        `email`
    )
VALUES
    (
        '64d4d1cc-108b-4caa-85fa-4d3d5a81a34f',
        'Christian Oporto',
        '234234df',
        'Envigado',
        '30120234234',
        'christian@wahio.com'
    ),
    (
        '6d665551-29bc-4675-971b-e1a3eef9205b',
        'jose jose',
        '123123',
        'asfas dfasf asdf',
        '3103525522',
        'hola@gmail.com'
    ),
    (
        'a0467df3-631c-4407-8f02-71f13efa9d95',
        'oscar camilo',
        '234234234',
        'tran 2 a Cr 20 17',
        '+5731035255',
        'nuevo@email.com'
    );

-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `orderitems`
--
CREATE TABLE `orderitems` (
    `id` varchar(45) NOT NULL,
    `orderId` varchar(45) NOT NULL,
    `productId` varchar(45) NOT NULL,
    `quantity` int(11) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = latin1;

--
-- Volcado de datos para la tabla `orderitems`
--
INSERT INTO
    `orderitems` (`id`, `orderId`, `productId`, `quantity`)
VALUES
    (
        '3b21581b-f558-4e82-8bab-cd1c91aa04b4',
        'c6f35b25-c41a-42c6-85d4-7121d9494c11',
        '0cb8d831-7d4f-42cb-a0f5-e91685c5ac3d',
        1
    ),
    (
        '4e078999-6415-476a-bfdf-4b69811346c3',
        'c6f35b25-c41a-42c6-85d4-7121d9494c11',
        '22a0bf01-1f7c-48ff-a4ca-c9c2f8df145a',
        2
    ),
    (
        '553ff29b-dc98-4e25-be29-d110460fbb95',
        'c6f35b25-c41a-42c6-85d4-7121d9494c11',
        '0930802b-1c80-4259-94dd-8f1ad13e765d',
        6
    ),
    (
        '66e7da22-2c3f-4d47-8d54-ca383e9cdc0d',
        'c6f35b25-c41a-42c6-85d4-7121d9494c11',
        '296d8f10-c15f-4bcb-a0ef-7be5b80ddda7',
        1
    ),
    (
        '89dc81b0-87ed-421b-9b8a-a6d732a786ee',
        'c6f35b25-c41a-42c6-85d4-7121d9494c11',
        '0aebe421-0882-410d-831c-960561466337',
        6
    ),
    (
        '94aaa5b7-2a9a-4a4f-a13e-7084a7ad2684',
        'c6f35b25-c41a-42c6-85d4-7121d9494c11',
        '48f7e9d2-614e-4e4d-a9d0-e01a7ce73a29',
        1
    ),
    (
        'a035f08d-e0bd-4b46-9391-17f6ffc88b13',
        'c6f35b25-c41a-42c6-85d4-7121d9494c11',
        '345cf678-b45b-445a-ba0a-275afb090be2',
        1
    ),
    (
        'd32f58cb-18f8-47b4-b029-eb3e64ce642e',
        'c6f35b25-c41a-42c6-85d4-7121d9494c11',
        '2b52f722-f959-4c9f-af56-962dae01c5f0',
        1
    ),
    (
        'ea263628-aa01-4697-b174-0676e34ef2c3',
        'c6f35b25-c41a-42c6-85d4-7121d9494c11',
        '19b403d1-889a-4297-be5c-b5ee3b48a109',
        2
    ),
    (
        'f73e3732-b1a3-4f59-ba8f-195303ff430c',
        'c6f35b25-c41a-42c6-85d4-7121d9494c11',
        '0e020d70-d0b5-4c82-b41f-7a0cce5eb94f',
        7
    );

-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `orders`
--
CREATE TABLE `orders` (
    `id` varchar(45) NOT NULL,
    `customerId` varchar(45) NOT NULL,
    `dateCreated` datetime NOT NULL,
    `totalAmount` double NOT NULL,
    `number` varchar(45) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = latin1;

--
-- Volcado de datos para la tabla `orders`
--
INSERT INTO
    `orders` (
        `id`,
        `customerId`,
        `dateCreated`,
        `totalAmount`,
        `number`
    )
VALUES
    (
        'c6f35b25-c41a-42c6-85d4-7121d9494c11',
        '1',
        '2020-06-10 02:56:32',
        12580,
        '186A0'
    );

-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `productcategories`
--
CREATE TABLE `productcategories` (
    `id` varchar(45) NOT NULL,
    `productId` varchar(45) NOT NULL,
    `categoryId` varchar(45) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = latin1;

--
-- Volcado de datos para la tabla `productcategories`
--
INSERT INTO
    `productcategories` (`id`, `productId`, `categoryId`)
VALUES
    (
        '09421937-c1b4-4933-bb1f-5a85530faf32',
        '788b6421-9223-4c1b-b841-5c102fa99478',
        '295b1ca3-426c-4c9d-9992-d3c629962933'
    ),
    (
        '0c80b6fe-3044-4921-9d11-959660da5854',
        'af1ec581-6c37-43f1-8c25-cd2df68f7f24',
        '295b1ca3-426c-4c9d-9992-d3c629962933'
    ),
    (
        '108cf6d8-d9e8-4c47-9164-62619c4524d4',
        'cfc1eeff-cb4c-4934-8dd1-8093d332134d',
        '295b1ca3-426c-4c9d-9992-d3c629962933'
    ),
    (
        '179fa2f5-48cc-46a0-97d6-c18321ab1455',
        '95d7b173-f00e-4edc-8731-3e241754999f',
        '295b1ca3-426c-4c9d-9992-d3c629962933'
    ),
    (
        '1a808d6f-896d-4f20-b708-e04a3005449d',
        '345cf678-b45b-445a-ba0a-275afb090be2',
        '295b1ca3-426c-4c9d-9992-d3c629962933'
    ),
    (
        '1ab5476b-61a3-4fa9-8d3c-d6e74cd29532',
        'ad2650ee-0341-4c88-9ac9-b72a72772425',
        '295b1ca3-426c-4c9d-9992-d3c629962933'
    ),
    (
        '20b9fd2f-ebe7-4ccc-bab7-29454b9a3fbc',
        '3fe39943-2eb8-4445-8088-82f5581abc1a',
        '295b1ca3-426c-4c9d-9992-d3c629962933'
    ),
    (
        '279766f5-4c96-4b01-96cd-55b9253daaac',
        'b0ee5286-de17-4d13-8418-c909d48e448f',
        '295b1ca3-426c-4c9d-9992-d3c629962933'
    ),
    (
        '2b3512ba-3358-44d9-80ab-b4ba124076f7',
        'c149b766-fb97-4f4f-ae83-ddd3d52ccdba',
        '295b1ca3-426c-4c9d-9992-d3c629962933'
    ),
    (
        '3ba1ab25-985f-4b8f-8108-866f88ee5e87',
        'cf6269d7-5217-4501-8c4d-d4110a462fb7',
        '295b1ca3-426c-4c9d-9992-d3c629962933'
    ),
    (
        '3cf7fc28-ef49-4ba4-b3c4-706c6f5c6fac',
        '2f6343ec-cf0f-4fb4-bf89-064cb2e70daf',
        '295b1ca3-426c-4c9d-9992-d3c629962933'
    ),
    (
        '3ea0766d-e0ef-4265-8993-7f30d1ba9f9f',
        '95348ae1-748d-4ab6-ab5d-4b0660d6ef3f',
        '295b1ca3-426c-4c9d-9992-d3c629962933'
    ),
    (
        '4535a1bf-d074-48a4-bfe6-e9cb819bc727',
        'a5c3ee0c-20bb-4b6b-a7e3-dfdb5711a971',
        '295b1ca3-426c-4c9d-9992-d3c629962933'
    ),
    (
        '45c0fe1c-f5fd-4082-a21e-80c4b18baa55',
        '95b4d543-e5f4-4c11-8995-c29fb38e4bc6',
        '295b1ca3-426c-4c9d-9992-d3c629962933'
    ),
    (
        '47c31f19-dced-46b2-963c-c02e94a2ea75',
        'f1a5ea54-e047-4064-9b7b-b9eadcda8e91',
        '295b1ca3-426c-4c9d-9992-d3c629962933'
    ),
    (
        '4c8b34d6-dc6e-4ced-84c3-767c5a865c7f',
        '647c98a0-d674-41a2-b5ca-22252ab65df3',
        '295b1ca3-426c-4c9d-9992-d3c629962933'
    ),
    (
        '4d42a1d9-aba2-4e86-aadc-d8259763e13d',
        '9364ac89-cf91-4ade-9304-0f9d145a2924',
        '295b1ca3-426c-4c9d-9992-d3c629962933'
    ),
    (
        '4df56fe6-125f-4409-96a9-e4e3029ebd20',
        '5077b5ba-734d-4c17-972a-10ae6560fed5',
        '295b1ca3-426c-4c9d-9992-d3c629962933'
    ),
    (
        '4ea02528-5a3f-4c7d-9181-2baaf2c70e39',
        '20a6b6ac-164d-4349-ac54-a6942a9e76fa',
        '295b1ca3-426c-4c9d-9992-d3c629962933'
    ),
    (
        '51cbeb65-2a73-44d7-b593-7936ee646358',
        '94a58fa6-589c-4ac8-93de-b9bf6ec2bea1',
        '295b1ca3-426c-4c9d-9992-d3c629962933'
    ),
    (
        '596504aa-448a-4511-b256-c838850b3a85',
        '296d8f10-c15f-4bcb-a0ef-7be5b80ddda7',
        '295b1ca3-426c-4c9d-9992-d3c629962933'
    ),
    (
        '5e28b399-10d4-459b-889b-57615268539d',
        'fac331d0-0492-4b23-979f-61b3a8e90abc',
        '295b1ca3-426c-4c9d-9992-d3c629962933'
    ),
    (
        '63188a53-0aff-46cc-90b9-23ebdfc193f6',
        'f3db188b-62e7-4221-a90c-71df0901ace7',
        '295b1ca3-426c-4c9d-9992-d3c629962933'
    ),
    (
        '6a68271c-9d36-4214-9865-f65664f99b1b',
        '0e020d70-d0b5-4c82-b41f-7a0cce5eb94f',
        '295b1ca3-426c-4c9d-9992-d3c629962933'
    ),
    (
        '6aed53bf-2500-4843-95f0-0fb3fb3204bb',
        '2b52f722-f959-4c9f-af56-962dae01c5f0',
        '295b1ca3-426c-4c9d-9992-d3c629962933'
    ),
    (
        '6b204578-4d43-4be3-9c37-f67afe7da474',
        'cbb6d50f-0eea-4bd5-94c4-c70fe291d3e2',
        '295b1ca3-426c-4c9d-9992-d3c629962933'
    ),
    (
        '706c42c2-6cfd-49a6-a7c8-2a4a0b1ae16a',
        '4bc4ca41-0be5-46bf-a446-17652f21cab0',
        '295b1ca3-426c-4c9d-9992-d3c629962933'
    ),
    (
        '72ddd320-9a44-41ed-880a-4c5eee749423',
        'e7719125-f532-4d11-8389-bca8bce58a76',
        '295b1ca3-426c-4c9d-9992-d3c629962933'
    ),
    (
        '7bdf6843-b331-4e55-ad54-4f9bba2984c0',
        'dc671ca5-7d9f-40e9-9a0c-0f0de5d7611f',
        '295b1ca3-426c-4c9d-9992-d3c629962933'
    ),
    (
        '8821a102-3ded-4553-87eb-bcdf5dbfe722',
        '95034226-6ce9-4035-812e-f3bf3232f65c',
        '295b1ca3-426c-4c9d-9992-d3c629962933'
    ),
    (
        '899f126c-a0b9-442c-aa64-6cfe5f448c90',
        '3d3c6172-212f-4987-94b8-949b107c42f5',
        '295b1ca3-426c-4c9d-9992-d3c629962933'
    ),
    (
        '8eca97b8-66e0-467a-ae9f-128a6440ecb4',
        'ea82e04f-aa21-4e8b-81bc-59825f4908e9',
        '295b1ca3-426c-4c9d-9992-d3c629962933'
    ),
    (
        '93a31f5b-664b-471c-9895-d2c30df8a3a4',
        '22a0bf01-1f7c-48ff-a4ca-c9c2f8df145a',
        '295b1ca3-426c-4c9d-9992-d3c629962933'
    ),
    (
        '9666b1d5-9c3f-4d39-9d4f-d3de225b7a69',
        'f6c911d7-f449-4c7b-944a-b37c869b9691',
        '295b1ca3-426c-4c9d-9992-d3c629962933'
    ),
    (
        '96c13f3c-d0c3-4352-a376-19928c19df02',
        '794bf80f-653d-43b6-9537-3be74580985f',
        '295b1ca3-426c-4c9d-9992-d3c629962933'
    ),
    (
        '9a6f9adb-8d78-4afb-8f61-93dc4401799f',
        'bf4f8e22-aab7-4883-9b7f-e5a49384f84c',
        '295b1ca3-426c-4c9d-9992-d3c629962933'
    ),
    (
        '9eb9f073-c62a-4709-850a-5a801fa1cf50',
        'ea540951-a80e-4f12-afd9-7d1e2695e43d',
        '295b1ca3-426c-4c9d-9992-d3c629962933'
    ),
    (
        'a58316f3-b753-478b-99ab-f3bd907da9ff',
        '48f7e9d2-614e-4e4d-a9d0-e01a7ce73a29',
        '295b1ca3-426c-4c9d-9992-d3c629962933'
    ),
    (
        'a7e91f27-4a77-45ee-83bf-4889691a3f02',
        '7bfa488c-31cd-4049-9d3a-6c97a14ed5a7',
        '295b1ca3-426c-4c9d-9992-d3c629962933'
    ),
    (
        'aae0243f-56b6-4f61-b74d-e3aa12a36279',
        '666b8768-c824-4b27-8bf9-33b22c07cb64',
        '295b1ca3-426c-4c9d-9992-d3c629962933'
    ),
    (
        'ab530d72-0394-4857-bc5f-d59cc3281f3c',
        '7d6105fc-ee4e-47df-b55c-95433efa1057',
        '295b1ca3-426c-4c9d-9992-d3c629962933'
    ),
    (
        'ad0706f7-847a-4ccd-8064-a131d6678764',
        '292c1908-6e93-43e5-a040-5b7e9466475e',
        '295b1ca3-426c-4c9d-9992-d3c629962933'
    ),
    (
        'b3656a73-2390-4e7d-a793-afc129573a89',
        '0aebe421-0882-410d-831c-960561466337',
        '295b1ca3-426c-4c9d-9992-d3c629962933'
    ),
    (
        'b5c9835d-d3bb-4732-af9a-a18df49284ea',
        '0cb8d831-7d4f-42cb-a0f5-e91685c5ac3d',
        '295b1ca3-426c-4c9d-9992-d3c629962933'
    ),
    (
        'b824e8fa-76f6-4da4-a0a1-ff4a204e8035',
        'cca15f58-414c-4946-a18b-baab7342a6b3',
        '295b1ca3-426c-4c9d-9992-d3c629962933'
    ),
    (
        'be6f2e6e-a8c4-4a89-ba52-33d5fc874da9',
        '42e65965-1888-405b-a467-03394de6bf6c',
        '295b1ca3-426c-4c9d-9992-d3c629962933'
    ),
    (
        'bea2433f-cf30-4a36-9685-4a2ab1ed0055',
        'b58ba6f9-9ce3-41d0-baac-f66adf89d562',
        '295b1ca3-426c-4c9d-9992-d3c629962933'
    ),
    (
        'c44f5888-4e86-446b-98e7-965079fd9ca7',
        '6d333da1-6543-4b66-93be-63cff0da90a8',
        '295b1ca3-426c-4c9d-9992-d3c629962933'
    ),
    (
        'c7a99335-7b09-48dd-91cc-cfb1693ea790',
        '19b403d1-889a-4297-be5c-b5ee3b48a109',
        '295b1ca3-426c-4c9d-9992-d3c629962933'
    ),
    (
        'c8ab61f9-8cf9-4d7b-b6de-31364c0f489f',
        '87274359-2c21-4fb9-a19e-7bd8c24789c6',
        '295b1ca3-426c-4c9d-9992-d3c629962933'
    ),
    (
        'cb797e9a-54f5-412a-b47b-aa282f4eff46',
        '7fa2518b-cd05-4f0a-b8df-343ae698cbdd',
        '295b1ca3-426c-4c9d-9992-d3c629962933'
    ),
    (
        'd050c02e-31ec-49e4-ab78-fe5caec73e3f',
        'b13c2363-395d-4709-bdd3-b96c7eca0e96',
        '295b1ca3-426c-4c9d-9992-d3c629962933'
    ),
    (
        'd312e624-aad2-47e1-9b2f-81153106d396',
        '4cf9e4b7-75dc-4942-89ec-b29ee4095b3a',
        '295b1ca3-426c-4c9d-9992-d3c629962933'
    ),
    (
        'd8ddffe3-0793-4ef4-ab18-d89b7a54e560',
        '6377f6ef-2b71-4ab2-a35e-6a320cb9f5d3',
        '295b1ca3-426c-4c9d-9992-d3c629962933'
    ),
    (
        'e342d872-eaad-48e0-98d8-c38a48197387',
        'b8b609df-ba7f-42a0-9ced-76cd0f4db07f',
        '295b1ca3-426c-4c9d-9992-d3c629962933'
    ),
    (
        'e657f10d-ac74-488c-ab1c-9d02a0307c26',
        '0930802b-1c80-4259-94dd-8f1ad13e765d',
        '295b1ca3-426c-4c9d-9992-d3c629962933'
    ),
    (
        'f22077b7-378f-4488-95dd-c1e91a02d907',
        'f33681aa-a02d-45fe-aa88-a0f88cfde2fb',
        '295b1ca3-426c-4c9d-9992-d3c629962933'
    ),
    (
        'fa46ce04-e680-4e3e-bdf8-1b3c2b3bc5f3',
        '940ccc3f-1223-4d4c-aa27-d86aad1cd912',
        '295b1ca3-426c-4c9d-9992-d3c629962933'
    ),
    (
        'fe695c2e-4436-4b24-93c8-9aa1c750206a',
        '56427ae3-d10f-4f56-8b0f-a263dfd55924',
        '295b1ca3-426c-4c9d-9992-d3c629962933'
    );

-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `products`
--
CREATE TABLE `products` (
    `id` varchar(45) NOT NULL,
    `name` varchar(45) DEFAULT NULL,
    `description` varchar(1250) DEFAULT NULL,
    `price` double DEFAULT NULL,
    `image` varchar(250) DEFAULT NULL,
    `dateCreated` datetime DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = latin1;

--
-- Volcado de datos para la tabla `products`
--
INSERT INTO
    `products` (
        `id`,
        `name`,
        `description`,
        `price`,
        `image`,
        `dateCreated`
    )
VALUES
    (
        '0930802b-1c80-4259-94dd-8f1ad13e765d',
        'Oxford shoe',
        'A desert boot is a chukka boot with crepe rubber soles and, typically, suede uppers. Desert boots were popularized in the 1950s by UK shoe company C. & J. Clark. Desert boots were officially introduced to the world with the debut of the Clarks\' Desert Boot at the 1949 Chicago Shoe Fair. After feature coverage in Esquire magazine, their popularity took off. According to Clarks, inspiration came from the crepe-soled, rough suede boots made in Cairo\'s Khan el-Khalili bazaar for British Eighth Army officers.',
        300,
        'https://fastshopping.blob.core.windows.net/images/21.png',
        '2020-06-10 02:36:58'
    ),
    (
        '0aebe421-0882-410d-831c-960561466337',
        'Wedge',
        'A desert boot is a chukka boot with crepe rubber soles and, typically, suede uppers. Desert boots were popularized in the 1950s by UK shoe company C. & J. Clark. Desert boots were officially introduced to the world with the debut of the Clarks\' Desert Boot at the 1949 Chicago Shoe Fair. After feature coverage in Esquire magazine, their popularity took off. According to Clarks, inspiration came from the crepe-soled, rough suede boots made in Cairo\'s Khan el-Khalili bazaar for British Eighth Army officers.',
        610,
        'https://fastshopping.blob.core.windows.net/images/53.png',
        '2020-06-10 02:36:58'
    ),
    (
        '0cb8d831-7d4f-42cb-a0f5-e91685c5ac3d',
        'Tsarouhi',
        'A desert boot is a chukka boot with crepe rubber soles and, typically, suede uppers. Desert boots were popularized in the 1950s by UK shoe company C. & J. Clark. Desert boots were officially introduced to the world with the debut of the Clarks\' Desert Boot at the 1949 Chicago Shoe Fair. After feature coverage in Esquire magazine, their popularity took off. According to Clarks, inspiration came from the crepe-soled, rough suede boots made in Cairo\'s Khan el-Khalili bazaar for British Eighth Army officers.',
        580,
        'https://fastshopping.blob.core.windows.net/images/50.png',
        '2020-06-10 02:36:58'
    ),
    (
        '0e020d70-d0b5-4c82-b41f-7a0cce5eb94f',
        'Stiletto heel',
        'A desert boot is a chukka boot with crepe rubber soles and, typically, suede uppers. Desert boots were popularized in the 1950s by UK shoe company C. & J. Clark. Desert boots were officially introduced to the world with the debut of the Clarks\' Desert Boot at the 1949 Chicago Shoe Fair. After feature coverage in Esquire magazine, their popularity took off. According to Clarks, inspiration came from the crepe-soled, rough suede boots made in Cairo\'s Khan el-Khalili bazaar for British Eighth Army officers.',
        540,
        'https://fastshopping.blob.core.windows.net/images/46.png',
        '2020-06-10 02:36:58'
    ),
    (
        '19b403d1-889a-4297-be5c-b5ee3b48a109',
        'Pampootie',
        'A desert boot is a chukka boot with crepe rubber soles and, typically, suede uppers. Desert boots were popularized in the 1950s by UK shoe company C. & J. Clark. Desert boots were officially introduced to the world with the debut of the Clarks\' Desert Boot at the 1949 Chicago Shoe Fair. After feature coverage in Esquire magazine, their popularity took off. According to Clarks, inspiration came from the crepe-soled, rough suede boots made in Cairo\'s Khan el-Khalili bazaar for British Eighth Army officers.',
        140,
        'https://fastshopping.blob.core.windows.net/images/5.png',
        '2020-06-10 02:36:58'
    ),
    (
        '20a6b6ac-164d-4349-ac54-a6942a9e76fa',
        'Lotus shoes',
        'A desert boot is a chukka boot with crepe rubber soles and, typically, suede uppers. Desert boots were popularized in the 1950s by UK shoe company C. & J. Clark. Desert boots were officially introduced to the world with the debut of the Clarks\' Desert Boot at the 1949 Chicago Shoe Fair. After feature coverage in Esquire magazine, their popularity took off. According to Clarks, inspiration came from the crepe-soled, rough suede boots made in Cairo\'s Khan el-Khalili bazaar for British Eighth Army officers.',
        190,
        'https://fastshopping.blob.core.windows.net/images/11.png',
        '2020-06-10 02:36:58'
    ),
    (
        '22a0bf01-1f7c-48ff-a4ca-c9c2f8df145a',
        'Pointed shoe',
        'A desert boot is a chukka boot with crepe rubber soles and, typically, suede uppers. Desert boots were popularized in the 1950s by UK shoe company C. & J. Clark. Desert boots were officially introduced to the world with the debut of the Clarks\' Desert Boot at the 1949 Chicago Shoe Fair. After feature coverage in Esquire magazine, their popularity took off. According to Clarks, inspiration came from the crepe-soled, rough suede boots made in Cairo\'s Khan el-Khalili bazaar for British Eighth Army officers.',
        350,
        'https://fastshopping.blob.core.windows.net/images/27.png',
        '2020-06-10 02:36:58'
    ),
    (
        '292c1908-6e93-43e5-a040-5b7e9466475e',
        'Silver Shoes',
        'A desert boot is a chukka boot with crepe rubber soles and, typically, suede uppers. Desert boots were popularized in the 1950s by UK shoe company C. & J. Clark. Desert boots were officially introduced to the world with the debut of the Clarks\' Desert Boot at the 1949 Chicago Shoe Fair. After feature coverage in Esquire magazine, their popularity took off. According to Clarks, inspiration came from the crepe-soled, rough suede boots made in Cairo\'s Khan el-Khalili bazaar for British Eighth Army officers.',
        450,
        'https://fastshopping.blob.core.windows.net/images/37.png',
        '2020-06-10 02:36:58'
    ),
    (
        '296d8f10-c15f-4bcb-a0ef-7be5b80ddda7',
        'Pointinini',
        'A desert boot is a chukka boot with crepe rubber soles and, typically, suede uppers. Desert boots were popularized in the 1950s by UK shoe company C. & J. Clark. Desert boots were officially introduced to the world with the debut of the Clarks\' Desert Boot at the 1949 Chicago Shoe Fair. After feature coverage in Esquire magazine, their popularity took off. According to Clarks, inspiration came from the crepe-soled, rough suede boots made in Cairo\'s Khan el-Khalili bazaar for British Eighth Army officers.',
        360,
        'https://fastshopping.blob.core.windows.net/images/28.png',
        '2020-06-10 02:36:58'
    ),
    (
        '2b52f722-f959-4c9f-af56-962dae01c5f0',
        'Spectator shoe',
        'A desert boot is a chukka boot with crepe rubber soles and, typically, suede uppers. Desert boots were popularized in the 1950s by UK shoe company C. & J. Clark. Desert boots were officially introduced to the world with the debut of the Clarks\' Desert Boot at the 1949 Chicago Shoe Fair. After feature coverage in Esquire magazine, their popularity took off. According to Clarks, inspiration came from the crepe-soled, rough suede boots made in Cairo\'s Khan el-Khalili bazaar for British Eighth Army officers.',
        510,
        'https://fastshopping.blob.core.windows.net/images/43.png',
        '2020-06-10 02:36:58'
    ),
    (
        '2f6343ec-cf0f-4fb4-bf89-064cb2e70daf',
        'Loafers',
        'A desert boot is a chukka boot with crepe rubber soles and, typically, suede uppers. Desert boots were popularized in the 1950s by UK shoe company C. & J. Clark. Desert boots were officially introduced to the world with the debut of the Clarks\' Desert Boot at the 1949 Chicago Shoe Fair. After feature coverage in Esquire magazine, their popularity took off. According to Clarks, inspiration came from the crepe-soled, rough suede boots made in Cairo\'s Khan el-Khalili bazaar for British Eighth Army officers.',
        180,
        'https://fastshopping.blob.core.windows.net/images/10.png',
        '2020-06-10 02:36:58'
    ),
    (
        '345cf678-b45b-445a-ba0a-275afb090be2',
        'Peranakan beaded slippers',
        'A desert boot is a chukka boot with crepe rubber soles and, typically, suede uppers. Desert boots were popularized in the 1950s by UK shoe company C. & J. Clark. Desert boots were officially introduced to the world with the debut of the Clarks\' Desert Boot at the 1949 Chicago Shoe Fair. After feature coverage in Esquire magazine, their popularity took off. According to Clarks, inspiration came from the crepe-soled, rough suede boots made in Cairo\'s Khan el-Khalili bazaar for British Eighth Army officers.',
        320,
        'https://fastshopping.blob.core.windows.net/images/24.png',
        '2020-06-10 02:36:58'
    ),
    (
        '3d3c6172-212f-4987-94b8-949b107c42f5',
        'Toe shoe',
        'A desert boot is a chukka boot with crepe rubber soles and, typically, suede uppers. Desert boots were popularized in the 1950s by UK shoe company C. & J. Clark. Desert boots were officially introduced to the world with the debut of the Clarks\' Desert Boot at the 1949 Chicago Shoe Fair. After feature coverage in Esquire magazine, their popularity took off. According to Clarks, inspiration came from the crepe-soled, rough suede boots made in Cairo\'s Khan el-Khalili bazaar for British Eighth Army officers.',
        570,
        'https://fastshopping.blob.core.windows.net/images/49.png',
        '2020-06-10 02:36:58'
    ),
    (
        '3fe39943-2eb8-4445-8088-82f5581abc1a',
        'Slip-on shoe',
        'A desert boot is a chukka boot with crepe rubber soles and, typically, suede uppers. Desert boots were popularized in the 1950s by UK shoe company C. & J. Clark. Desert boots were officially introduced to the world with the debut of the Clarks\' Desert Boot at the 1949 Chicago Shoe Fair. After feature coverage in Esquire magazine, their popularity took off. According to Clarks, inspiration came from the crepe-soled, rough suede boots made in Cairo\'s Khan el-Khalili bazaar for British Eighth Army officers.',
        470,
        'https://fastshopping.blob.core.windows.net/images/39.png',
        '2020-06-10 02:36:58'
    ),
    (
        '42e65965-1888-405b-a467-03394de6bf6c',
        'Kitten heel',
        'A desert boot is a chukka boot with crepe rubber soles and, typically, suede uppers. Desert boots were popularized in the 1950s by UK shoe company C. & J. Clark. Desert boots were officially introduced to the world with the debut of the Clarks\' Desert Boot at the 1949 Chicago Shoe Fair. After feature coverage in Esquire magazine, their popularity took off. According to Clarks, inspiration came from the crepe-soled, rough suede boots made in Cairo\'s Khan el-Khalili bazaar for British Eighth Army officers.',
        150,
        'https://fastshopping.blob.core.windows.net/images/6.png',
        '2020-06-10 02:36:58'
    ),
    (
        '48f7e9d2-614e-4e4d-a9d0-e01a7ce73a29',
        'Turnshoe',
        'A desert boot is a chukka boot with crepe rubber soles and, typically, suede uppers. Desert boots were popularized in the 1950s by UK shoe company C. & J. Clark. Desert boots were officially introduced to the world with the debut of the Clarks\' Desert Boot at the 1949 Chicago Shoe Fair. After feature coverage in Esquire magazine, their popularity took off. According to Clarks, inspiration came from the crepe-soled, rough suede boots made in Cairo\'s Khan el-Khalili bazaar for British Eighth Army officers.',
        590,
        'https://fastshopping.blob.core.windows.net/images/51.png',
        '2020-06-10 02:36:58'
    ),
    (
        '4bc4ca41-0be5-46bf-a446-17652f21cab0',
        'Monk shoe',
        'A desert boot is a chukka boot with crepe rubber soles and, typically, suede uppers. Desert boots were popularized in the 1950s by UK shoe company C. & J. Clark. Desert boots were officially introduced to the world with the debut of the Clarks\' Desert Boot at the 1949 Chicago Shoe Fair. After feature coverage in Esquire magazine, their popularity took off. According to Clarks, inspiration came from the crepe-soled, rough suede boots made in Cairo\'s Khan el-Khalili bazaar for British Eighth Army officers.',
        230,
        'https://fastshopping.blob.core.windows.net/images/15.png',
        '2020-06-10 02:36:58'
    ),
    (
        '4cf9e4b7-75dc-4942-89ec-b29ee4095b3a',
        'Jazz shoe',
        'A desert boot is a chukka boot with crepe rubber soles and, typically, suede uppers. Desert boots were popularized in the 1950s by UK shoe company C. & J. Clark. Desert boots were officially introduced to the world with the debut of the Clarks\' Desert Boot at the 1949 Chicago Shoe Fair. After feature coverage in Esquire magazine, their popularity took off. According to Clarks, inspiration came from the crepe-soled, rough suede boots made in Cairo\'s Khan el-Khalili bazaar for British Eighth Army officers.',
        660,
        'https://fastshopping.blob.core.windows.net/images/58.png',
        '2020-06-10 02:36:58'
    ),
    (
        '5077b5ba-734d-4c17-972a-10ae6560fed5',
        'Venetian-style shoe',
        'A desert boot is a chukka boot with crepe rubber soles and, typically, suede uppers. Desert boots were popularized in the 1950s by UK shoe company C. & J. Clark. Desert boots were officially introduced to the world with the debut of the Clarks\' Desert Boot at the 1949 Chicago Shoe Fair. After feature coverage in Esquire magazine, their popularity took off. According to Clarks, inspiration came from the crepe-soled, rough suede boots made in Cairo\'s Khan el-Khalili bazaar for British Eighth Army officers.',
        600,
        'https://fastshopping.blob.core.windows.net/images/52.png',
        '2020-06-10 02:36:58'
    ),
    (
        '56427ae3-d10f-4f56-8b0f-a263dfd55924',
        'Winklepicker',
        'A desert boot is a chukka boot with crepe rubber soles and, typically, suede uppers. Desert boots were popularized in the 1950s by UK shoe company C. & J. Clark. Desert boots were officially introduced to the world with the debut of the Clarks\' Desert Boot at the 1949 Chicago Shoe Fair. After feature coverage in Esquire magazine, their popularity took off. According to Clarks, inspiration came from the crepe-soled, rough suede boots made in Cairo\'s Khan el-Khalili bazaar for British Eighth Army officers.',
        630,
        'https://fastshopping.blob.core.windows.net/images/55.png',
        '2020-06-10 02:36:58'
    ),
    (
        '6377f6ef-2b71-4ab2-a35e-6a320cb9f5d3',
        'Toe Shoe',
        'A desert boot is a chukka boot with crepe rubber soles and, typically, suede uppers. Desert boots were popularized in the 1950s by UK shoe company C. & J. Clark. Desert boots were officially introduced to the world with the debut of the Clarks\' Desert Boot at the 1949 Chicago Shoe Fair. After feature coverage in Esquire magazine, their popularity took off. According to Clarks, inspiration came from the crepe-soled, rough suede boots made in Cairo\'s Khan el-Khalili bazaar for British Eighth Army officers.',
        440,
        'https://fastshopping.blob.core.windows.net/images/36.png',
        '2020-06-10 02:36:58'
    ),
    (
        '647c98a0-d674-41a2-b5ca-22252ab65df3',
        'Jutti',
        'A desert boot is a chukka boot with crepe rubber soles and, typically, suede uppers. Desert boots were popularized in the 1950s by UK shoe company C. & J. Clark. Desert boots were officially introduced to the world with the debut of the Clarks\' Desert Boot at the 1949 Chicago Shoe Fair. After feature coverage in Esquire magazine, their popularity took off. According to Clarks, inspiration came from the crepe-soled, rough suede boots made in Cairo\'s Khan el-Khalili bazaar for British Eighth Army officers.',
        130,
        'https://fastshopping.blob.core.windows.net/images/4.png',
        '2020-06-10 02:36:58'
    ),
    (
        '666b8768-c824-4b27-8bf9-33b22c07cb64',
        'Sandal',
        'A desert boot is a chukka boot with crepe rubber soles and, typically, suede uppers. Desert boots were popularized in the 1950s by UK shoe company C. & J. Clark. Desert boots were officially introduced to the world with the debut of the Clarks\' Desert Boot at the 1949 Chicago Shoe Fair. After feature coverage in Esquire magazine, their popularity took off. According to Clarks, inspiration came from the crepe-soled, rough suede boots made in Cairo\'s Khan el-Khalili bazaar for British Eighth Army officers.',
        430,
        'https://fastshopping.blob.core.windows.net/images/35.png',
        '2020-06-10 02:36:58'
    ),
    (
        '6d333da1-6543-4b66-93be-63cff0da90a8',
        'Tiger-head shoes',
        'A desert boot is a chukka boot with crepe rubber soles and, typically, suede uppers. Desert boots were popularized in the 1950s by UK shoe company C. & J. Clark. Desert boots were officially introduced to the world with the debut of the Clarks\' Desert Boot at the 1949 Chicago Shoe Fair. After feature coverage in Esquire magazine, their popularity took off. According to Clarks, inspiration came from the crepe-soled, rough suede boots made in Cairo\'s Khan el-Khalili bazaar for British Eighth Army officers.',
        560,
        'https://fastshopping.blob.core.windows.net/images/48.png',
        '2020-06-10 02:36:58'
    ),
    (
        '788b6421-9223-4c1b-b841-5c102fa99478',
        'Saddle shoe',
        'A desert boot is a chukka boot with crepe rubber soles and, typically, suede uppers. Desert boots were popularized in the 1950s by UK shoe company C. & J. Clark. Desert boots were officially introduced to the world with the debut of the Clarks\' Desert Boot at the 1949 Chicago Shoe Fair. After feature coverage in Esquire magazine, their popularity took off. According to Clarks, inspiration came from the crepe-soled, rough suede boots made in Cairo\'s Khan el-Khalili bazaar for British Eighth Army officers.',
        410,
        'https://fastshopping.blob.core.windows.net/images/33.png',
        '2020-06-10 02:36:58'
    ),
    (
        '794bf80f-653d-43b6-9537-3be74580985f',
        'Mojari',
        'A desert boot is a chukka boot with crepe rubber soles and, typically, suede uppers. Desert boots were popularized in the 1950s by UK shoe company C. & J. Clark. Desert boots were officially introduced to the world with the debut of the Clarks\' Desert Boot at the 1949 Chicago Shoe Fair. After feature coverage in Esquire magazine, their popularity took off. According to Clarks, inspiration came from the crepe-soled, rough suede boots made in Cairo\'s Khan el-Khalili bazaar for British Eighth Army officers.',
        210,
        'https://fastshopping.blob.core.windows.net/images/13.png',
        '2020-06-10 02:36:58'
    ),
    (
        '7bfa488c-31cd-4049-9d3a-6c97a14ed5a7',
        'Spool heel',
        'A desert boot is a chukka boot with crepe rubber soles and, typically, suede uppers. Desert boots were popularized in the 1950s by UK shoe company C. & J. Clark. Desert boots were officially introduced to the world with the debut of the Clarks\' Desert Boot at the 1949 Chicago Shoe Fair. After feature coverage in Esquire magazine, their popularity took off. According to Clarks, inspiration came from the crepe-soled, rough suede boots made in Cairo\'s Khan el-Khalili bazaar for British Eighth Army officers.',
        520,
        'https://fastshopping.blob.core.windows.net/images/44.png',
        '2020-06-10 02:36:58'
    ),
    (
        '7d6105fc-ee4e-47df-b55c-95433efa1057',
        'Wörishofer',
        'A desert boot is a chukka boot with crepe rubber soles and, typically, suede uppers. Desert boots were popularized in the 1950s by UK shoe company C. & J. Clark. Desert boots were officially introduced to the world with the debut of the Clarks\' Desert Boot at the 1949 Chicago Shoe Fair. After feature coverage in Esquire magazine, their popularity took off. According to Clarks, inspiration came from the crepe-soled, rough suede boots made in Cairo\'s Khan el-Khalili bazaar for British Eighth Army officers.',
        640,
        'https://fastshopping.blob.core.windows.net/images/56.png',
        '2020-06-10 02:36:58'
    ),
    (
        '7fa2518b-cd05-4f0a-b8df-343ae698cbdd',
        'Sneakers',
        'A desert boot is a chukka boot with crepe rubber soles and, typically, suede uppers. Desert boots were popularized in the 1950s by UK shoe company C. & J. Clark. Desert boots were officially introduced to the world with the debut of the Clarks\' Desert Boot at the 1949 Chicago Shoe Fair. After feature coverage in Esquire magazine, their popularity took off. According to Clarks, inspiration came from the crepe-soled, rough suede boots made in Cairo\'s Khan el-Khalili bazaar for British Eighth Army officers.',
        490,
        'https://fastshopping.blob.core.windows.net/images/41.png',
        '2020-06-10 02:36:58'
    ),
    (
        '87274359-2c21-4fb9-a19e-7bd8c24789c6',
        'Jelly shoes',
        'A desert boot is a chukka boot with crepe rubber soles and, typically, suede uppers. Desert boots were popularized in the 1950s by UK shoe company C. & J. Clark. Desert boots were officially introduced to the world with the debut of the Clarks\' Desert Boot at the 1949 Chicago Shoe Fair. After feature coverage in Esquire magazine, their popularity took off. According to Clarks, inspiration came from the crepe-soled, rough suede boots made in Cairo\'s Khan el-Khalili bazaar for British Eighth Army officers.',
        670,
        'https://fastshopping.blob.core.windows.net/images/59.png',
        '2020-06-10 02:36:58'
    ),
    (
        '9364ac89-cf91-4ade-9304-0f9d145a2924',
        'Opanak',
        'A desert boot is a chukka boot with crepe rubber soles and, typically, suede uppers. Desert boots were popularized in the 1950s by UK shoe company C. & J. Clark. Desert boots were officially introduced to the world with the debut of the Clarks\' Desert Boot at the 1949 Chicago Shoe Fair. After feature coverage in Esquire magazine, their popularity took off. According to Clarks, inspiration came from the crepe-soled, rough suede boots made in Cairo\'s Khan el-Khalili bazaar for British Eighth Army officers.',
        250,
        'https://fastshopping.blob.core.windows.net/images/17.png',
        '2020-06-10 02:36:58'
    ),
    (
        '940ccc3f-1223-4d4c-aa27-d86aad1cd912',
        'Peep-toe shoe',
        'A desert boot is a chukka boot with crepe rubber soles and, typically, suede uppers. Desert boots were popularized in the 1950s by UK shoe company C. & J. Clark. Desert boots were officially introduced to the world with the debut of the Clarks\' Desert Boot at the 1949 Chicago Shoe Fair. After feature coverage in Esquire magazine, their popularity took off. According to Clarks, inspiration came from the crepe-soled, rough suede boots made in Cairo\'s Khan el-Khalili bazaar for British Eighth Army officers.',
        310,
        'https://fastshopping.blob.core.windows.net/images/23.png',
        '2020-06-10 02:36:58'
    ),
    (
        '94a58fa6-589c-4ac8-93de-b9bf6ec2bea1',
        'Peshawari chappal',
        'A desert boot is a chukka boot with crepe rubber soles and, typically, suede uppers. Desert boots were popularized in the 1950s by UK shoe company C. & J. Clark. Desert boots were officially introduced to the world with the debut of the Clarks\' Desert Boot at the 1949 Chicago Shoe Fair. After feature coverage in Esquire magazine, their popularity took off. According to Clarks, inspiration came from the crepe-soled, rough suede boots made in Cairo\'s Khan el-Khalili bazaar for British Eighth Army officers.',
        330,
        'https://fastshopping.blob.core.windows.net/images/25.png',
        '2020-06-10 02:36:58'
    ),
    (
        '95034226-6ce9-4035-812e-f3bf3232f65c',
        'Organ shoes',
        'A desert boot is a chukka boot with crepe rubber soles and, typically, suede uppers. Desert boots were popularized in the 1950s by UK shoe company C. & J. Clark. Desert boots were officially introduced to the world with the debut of the Clarks\' Desert Boot at the 1949 Chicago Shoe Fair. After feature coverage in Esquire magazine, their popularity took off. According to Clarks, inspiration came from the crepe-soled, rough suede boots made in Cairo\'s Khan el-Khalili bazaar for British Eighth Army officers.',
        270,
        'https://fastshopping.blob.core.windows.net/images/19.png',
        '2020-06-10 02:36:58'
    ),
    (
        '95348ae1-748d-4ab6-ab5d-4b0660d6ef3f',
        'Jutti',
        'A desert boot is a chukka boot with crepe rubber soles and, typically, suede uppers. Desert boots were popularized in the 1950s by UK shoe company C. & J. Clark. Desert boots were officially introduced to the world with the debut of the Clarks\' Desert Boot at the 1949 Chicago Shoe Fair. After feature coverage in Esquire magazine, their popularity took off. According to Clarks, inspiration came from the crepe-soled, rough suede boots made in Cairo\'s Khan el-Khalili bazaar for British Eighth Army officers.',
        680,
        'https://fastshopping.blob.core.windows.net/images/60.png',
        '2020-06-10 02:36:58'
    ),
    (
        '95b4d543-e5f4-4c11-8995-c29fb38e4bc6',
        'Rocker bottom shoe',
        'A desert boot is a chukka boot with crepe rubber soles and, typically, suede uppers. Desert boots were popularized in the 1950s by UK shoe company C. & J. Clark. Desert boots were officially introduced to the world with the debut of the Clarks\' Desert Boot at the 1949 Chicago Shoe Fair. After feature coverage in Esquire magazine, their popularity took off. According to Clarks, inspiration came from the crepe-soled, rough suede boots made in Cairo\'s Khan el-Khalili bazaar for British Eighth Army officers.',
        380,
        'https://fastshopping.blob.core.windows.net/images/30.png',
        '2020-06-10 02:36:58'
    ),
    (
        '95d7b173-f00e-4edc-8731-3e241754999f',
        'Wellington boot',
        'A desert boot is a chukka boot with crepe rubber soles and, typically, suede uppers. Desert boots were popularized in the 1950s by UK shoe company C. & J. Clark. Desert boots were officially introduced to the world with the debut of the Clarks\' Desert Boot at the 1949 Chicago Shoe Fair. After feature coverage in Esquire magazine, their popularity took off. According to Clarks, inspiration came from the crepe-soled, rough suede boots made in Cairo\'s Khan el-Khalili bazaar for British Eighth Army officers.',
        620,
        'https://fastshopping.blob.core.windows.net/images/54.png',
        '2020-06-10 02:36:58'
    ),
    (
        'a5c3ee0c-20bb-4b6b-a7e3-dfdb5711a971',
        'Jelly shoes',
        'A desert boot is a chukka boot with crepe rubber soles and, typically, suede uppers. Desert boots were popularized in the 1950s by UK shoe company C. & J. Clark. Desert boots were officially introduced to the world with the debut of the Clarks\' Desert Boot at the 1949 Chicago Shoe Fair. After feature coverage in Esquire magazine, their popularity took off. According to Clarks, inspiration came from the crepe-soled, rough suede boots made in Cairo\'s Khan el-Khalili bazaar for British Eighth Army officers.',
        120,
        'https://fastshopping.blob.core.windows.net/images/3.png',
        '2020-06-10 02:36:58'
    ),
    (
        'ad2650ee-0341-4c88-9ac9-b72a72772425',
        'Moccasin',
        'A desert boot is a chukka boot with crepe rubber soles and, typically, suede uppers. Desert boots were popularized in the 1950s by UK shoe company C. & J. Clark. Desert boots were officially introduced to the world with the debut of the Clarks\' Desert Boot at the 1949 Chicago Shoe Fair. After feature coverage in Esquire magazine, their popularity took off. According to Clarks, inspiration came from the crepe-soled, rough suede boots made in Cairo\'s Khan el-Khalili bazaar for British Eighth Army officers.',
        220,
        'https://fastshopping.blob.core.windows.net/images/14.png',
        '2020-06-10 02:36:58'
    ),
    (
        'af1ec581-6c37-43f1-8c25-cd2df68f7f24',
        'Kolhapuri Chappal',
        'A desert boot is a chukka boot with crepe rubber soles and, typically, suede uppers. Desert boots were popularized in the 1950s by UK shoe company C. & J. Clark. Desert boots were officially introduced to the world with the debut of the Clarks\' Desert Boot at the 1949 Chicago Shoe Fair. After feature coverage in Esquire magazine, their popularity took off. According to Clarks, inspiration came from the crepe-soled, rough suede boots made in Cairo\'s Khan el-Khalili bazaar for British Eighth Army officers.',
        160,
        'https://fastshopping.blob.core.windows.net/images/7.png',
        '2020-06-10 02:36:58'
    ),
    (
        'b0ee5286-de17-4d13-8418-c909d48e448f',
        'Slipper',
        'A desert boot is a chukka boot with crepe rubber soles and, typically, suede uppers. Desert boots were popularized in the 1950s by UK shoe company C. & J. Clark. Desert boots were officially introduced to the world with the debut of the Clarks\' Desert Boot at the 1949 Chicago Shoe Fair. After feature coverage in Esquire magazine, their popularity took off. According to Clarks, inspiration came from the crepe-soled, rough suede boots made in Cairo\'s Khan el-Khalili bazaar for British Eighth Army officers.',
        480,
        'https://fastshopping.blob.core.windows.net/images/40.png',
        '2020-06-10 02:36:58'
    ),
    (
        'b13c2363-395d-4709-bdd3-b96c7eca0e96',
        'Sailing boots',
        'A desert boot is a chukka boot with crepe rubber soles and, typically, suede uppers. Desert boots were popularized in the 1950s by UK shoe company C. & J. Clark. Desert boots were officially introduced to the world with the debut of the Clarks\' Desert Boot at the 1949 Chicago Shoe Fair. After feature coverage in Esquire magazine, their popularity took off. According to Clarks, inspiration came from the crepe-soled, rough suede boots made in Cairo\'s Khan el-Khalili bazaar for British Eighth Army officers.',
        420,
        'https://fastshopping.blob.core.windows.net/images/34.png',
        '2020-06-10 02:36:58'
    ),
    (
        'b58ba6f9-9ce3-41d0-baac-f66adf89d562',
        'T-bar sandal',
        'A desert boot is a chukka boot with crepe rubber soles and, typically, suede uppers. Desert boots were popularized in the 1950s by UK shoe company C. & J. Clark. Desert boots were officially introduced to the world with the debut of the Clarks\' Desert Boot at the 1949 Chicago Shoe Fair. After feature coverage in Esquire magazine, their popularity took off. According to Clarks, inspiration came from the crepe-soled, rough suede boots made in Cairo\'s Khan el-Khalili bazaar for British Eighth Army officers.',
        550,
        'https://fastshopping.blob.core.windows.net/images/47.png',
        '2020-06-10 02:36:58'
    ),
    (
        'b8b609df-ba7f-42a0-9ced-76cd0f4db07f',
        'Opinga',
        'A desert boot is a chukka boot with crepe rubber soles and, typically, suede uppers. Desert boots were popularized in the 1950s by UK shoe company C. & J. Clark. Desert boots were officially introduced to the world with the debut of the Clarks\' Desert Boot at the 1949 Chicago Shoe Fair. After feature coverage in Esquire magazine, their popularity took off. According to Clarks, inspiration came from the crepe-soled, rough suede boots made in Cairo\'s Khan el-Khalili bazaar for British Eighth Army officers.',
        260,
        'https://fastshopping.blob.core.windows.net/images/18.png',
        '2020-06-10 02:36:58'
    ),
    (
        'bf4f8e22-aab7-4883-9b7f-e5a49384f84c',
        'Mule',
        'A desert boot is a chukka boot with crepe rubber soles and, typically, suede uppers. Desert boots were popularized in the 1950s by UK shoe company C. & J. Clark. Desert boots were officially introduced to the world with the debut of the Clarks\' Desert Boot at the 1949 Chicago Shoe Fair. After feature coverage in Esquire magazine, their popularity took off. According to Clarks, inspiration came from the crepe-soled, rough suede boots made in Cairo\'s Khan el-Khalili bazaar for British Eighth Army officers.',
        240,
        'https://fastshopping.blob.core.windows.net/images/16.png',
        '2020-06-10 02:36:58'
    ),
    (
        'c149b766-fb97-4f4f-ae83-ddd3d52ccdba',
        'Jazz shoe',
        'A desert boot is a chukka boot with crepe rubber soles and, typically, suede uppers. Desert boots were popularized in the 1950s by UK shoe company C. & J. Clark. Desert boots were officially introduced to the world with the debut of the Clarks\' Desert Boot at the 1949 Chicago Shoe Fair. After feature coverage in Esquire magazine, their popularity took off. According to Clarks, inspiration came from the crepe-soled, rough suede boots made in Cairo\'s Khan el-Khalili bazaar for British Eighth Army officers.',
        110,
        'https://fastshopping.blob.core.windows.net/images/2.png',
        '2020-06-10 02:36:58'
    ),
    (
        'cbb6d50f-0eea-4bd5-94c4-c70fe291d3e2',
        'Riding boots',
        'A desert boot is a chukka boot with crepe rubber soles and, typically, suede uppers. Desert boots were popularized in the 1950s by UK shoe company C. & J. Clark. Desert boots were officially introduced to the world with the debut of the Clarks\' Desert Boot at the 1949 Chicago Shoe Fair. After feature coverage in Esquire magazine, their popularity took off. According to Clarks, inspiration came from the crepe-soled, rough suede boots made in Cairo\'s Khan el-Khalili bazaar for British Eighth Army officers.',
        370,
        'https://fastshopping.blob.core.windows.net/images/29.png',
        '2020-06-10 02:36:58'
    ),
    (
        'cca15f58-414c-4946-a18b-baab7342a6b3',
        'Ruby slippers',
        'A desert boot is a chukka boot with crepe rubber soles and, typically, suede uppers. Desert boots were popularized in the 1950s by UK shoe company C. & J. Clark. Desert boots were officially introduced to the world with the debut of the Clarks\' Desert Boot at the 1949 Chicago Shoe Fair. After feature coverage in Esquire magazine, their popularity took off. According to Clarks, inspiration came from the crepe-soled, rough suede boots made in Cairo\'s Khan el-Khalili bazaar for British Eighth Army officers.',
        390,
        'https://fastshopping.blob.core.windows.net/images/31.png',
        '2020-06-10 02:36:58'
    ),
    (
        'cf6269d7-5217-4501-8c4d-d4110a462fb7',
        'Mary Jane',
        'A desert boot is a chukka boot with crepe rubber soles and, typically, suede uppers. Desert boots were popularized in the 1950s by UK shoe company C. & J. Clark. Desert boots were officially introduced to the world with the debut of the Clarks\' Desert Boot at the 1949 Chicago Shoe Fair. After feature coverage in Esquire magazine, their popularity took off. According to Clarks, inspiration came from the crepe-soled, rough suede boots made in Cairo\'s Khan el-Khalili bazaar for British Eighth Army officers.',
        200,
        'https://fastshopping.blob.core.windows.net/images/12.png',
        '2020-06-10 02:36:58'
    ),
    (
        'cfc1eeff-cb4c-4934-8dd1-8093d332134d',
        'Platform shoe',
        'A desert boot is a chukka boot with crepe rubber soles and, typically, suede uppers. Desert boots were popularized in the 1950s by UK shoe company C. & J. Clark. Desert boots were officially introduced to the world with the debut of the Clarks\' Desert Boot at the 1949 Chicago Shoe Fair. After feature coverage in Esquire magazine, their popularity took off. According to Clarks, inspiration came from the crepe-soled, rough suede boots made in Cairo\'s Khan el-Khalili bazaar for British Eighth Army officers.',
        340,
        'https://fastshopping.blob.core.windows.net/images/26.png',
        '2020-06-10 02:36:58'
    ),
    (
        'dc671ca5-7d9f-40e9-9a0c-0f0de5d7611f',
        'Over-the-knee boot',
        'A desert boot is a chukka boot with crepe rubber soles and, typically, suede uppers. Desert boots were popularized in the 1950s by UK shoe company C. & J. Clark. Desert boots were officially introduced to the world with the debut of the Clarks\' Desert Boot at the 1949 Chicago Shoe Fair. After feature coverage in Esquire magazine, their popularity took off. According to Clarks, inspiration came from the crepe-soled, rough suede boots made in Cairo\'s Khan el-Khalili bazaar for British Eighth Army officers.',
        290,
        'https://fastshopping.blob.core.windows.net/images/21.png',
        '2020-06-10 02:36:58'
    ),
    (
        'e7719125-f532-4d11-8389-bca8bce58a76',
        'Huarache',
        'Product con imagen orja',
        100,
        'https://fastshopping.blob.core.windows.net/images/1.png',
        '2020-06-10 02:36:58'
    ),
    (
        'ea540951-a80e-4f12-afd9-7d1e2695e43d',
        'Russian boot',
        'A desert boot is a chukka boot with crepe rubber soles and, typically, suede uppers. Desert boots were popularized in the 1950s by UK shoe company C. & J. Clark. Desert boots were officially introduced to the world with the debut of the Clarks\' Desert Boot at the 1949 Chicago Shoe Fair. After feature coverage in Esquire magazine, their popularity took off. According to Clarks, inspiration came from the crepe-soled, rough suede boots made in Cairo\'s Khan el-Khalili bazaar for British Eighth Army officers.',
        400,
        'https://fastshopping.blob.core.windows.net/images/32.png',
        '2020-06-10 02:36:58'
    ),
    (
        'ea82e04f-aa21-4e8b-81bc-59825f4908e9',
        'Orthopaedic footwear',
        'A desert boot is a chukka boot with crepe rubber soles and, typically, suede uppers. Desert boots were popularized in the 1950s by UK shoe company C. & J. Clark. Desert boots were officially introduced to the world with the debut of the Clarks\' Desert Boot at the 1949 Chicago Shoe Fair. After feature coverage in Esquire magazine, their popularity took off. According to Clarks, inspiration came from the crepe-soled, rough suede boots made in Cairo\'s Khan el-Khalili bazaar for British Eighth Army officers.',
        280,
        'https://fastshopping.blob.core.windows.net/images/20.png',
        '2020-06-10 02:36:58'
    ),
    (
        'f1a5ea54-e047-4064-9b7b-b9eadcda8e91',
        'Huarache',
        'Product con imagen orja',
        650,
        'https://fastshopping.blob.core.windows.net/images/57.png',
        '2020-06-10 02:36:58'
    ),
    (
        'f33681aa-a02d-45fe-aa88-a0f88cfde2fb',
        'Snow boot',
        'A desert boot is a chukka boot with crepe rubber soles and, typically, suede uppers. Desert boots were popularized in the 1950s by UK shoe company C. & J. Clark. Desert boots were officially introduced to the world with the debut of the Clarks\' Desert Boot at the 1949 Chicago Shoe Fair. After feature coverage in Esquire magazine, their popularity took off. According to Clarks, inspiration came from the crepe-soled, rough suede boots made in Cairo\'s Khan el-Khalili bazaar for British Eighth Army officers.',
        500,
        'https://fastshopping.blob.core.windows.net/images/42.png',
        '2020-06-10 02:36:58'
    ),
    (
        'f3db188b-62e7-4221-a90c-71df0901ace7',
        'Steel-toe boot',
        'A desert boot is a chukka boot with crepe rubber soles and, typically, suede uppers. Desert boots were popularized in the 1950s by UK shoe company C. & J. Clark. Desert boots were officially introduced to the world with the debut of the Clarks\' Desert Boot at the 1949 Chicago Shoe Fair. After feature coverage in Esquire magazine, their popularity took off. According to Clarks, inspiration came from the crepe-soled, rough suede boots made in Cairo\'s Khan el-Khalili bazaar for British Eighth Army officers.',
        530,
        'https://fastshopping.blob.core.windows.net/images/45.png',
        '2020-06-10 02:36:58'
    ),
    (
        'f6c911d7-f449-4c7b-944a-b37c869b9691',
        'Slingback',
        'A desert boot is a chukka boot with crepe rubber soles and, typically, suede uppers. Desert boots were popularized in the 1950s by UK shoe company C. & J. Clark. Desert boots were officially introduced to the world with the debut of the Clarks\' Desert Boot at the 1949 Chicago Shoe Fair. After feature coverage in Esquire magazine, their popularity took off. According to Clarks, inspiration came from the crepe-soled, rough suede boots made in Cairo\'s Khan el-Khalili bazaar for British Eighth Army officers.',
        460,
        'https://fastshopping.blob.core.windows.net/images/38.png',
        '2020-06-10 02:36:58'
    ),
    (
        'fac331d0-0492-4b23-979f-61b3a8e90abc',
        'Kung fu shoe',
        'A desert boot is a chukka boot with crepe rubber soles and, typically, suede uppers. Desert boots were popularized in the 1950s by UK shoe company C. & J. Clark. Desert boots were officially introduced to the world with the debut of the Clarks\' Desert Boot at the 1949 Chicago Shoe Fair. After feature coverage in Esquire magazine, their popularity took off. According to Clarks, inspiration came from the crepe-soled, rough suede boots made in Cairo\'s Khan el-Khalili bazaar for British Eighth Army officers.',
        170,
        'https://fastshopping.blob.core.windows.net/images/9.png',
        '2020-06-10 02:36:58'
    );

--
-- Índices para tablas volcadas
--
--
-- Indices de la tabla `categories`
--
ALTER TABLE
    `categories`
ADD
    PRIMARY KEY (`id`);

--
-- Indices de la tabla `customers`
--
ALTER TABLE
    `customers`
ADD
    PRIMARY KEY (`id`);

--
-- Indices de la tabla `orderitems`
--
ALTER TABLE
    `orderitems`
ADD
    PRIMARY KEY (`id`),
ADD
    KEY `orderId` (`orderId`),
ADD
    KEY `productId` (`productId`);

--
-- Indices de la tabla `orders`
--
ALTER TABLE
    `orders`
ADD
    PRIMARY KEY (`id`),
ADD
    KEY `customerId` (`customerId`);

--
-- Indices de la tabla `productcategories`
--
ALTER TABLE
    `productcategories`
ADD
    PRIMARY KEY (`id`),
ADD
    KEY `productId` (`productId`),
ADD
    KEY `categoryId` (`categoryId`);

--
-- Indices de la tabla `products`
--
ALTER TABLE
    `products`
ADD
    PRIMARY KEY (`id`);

--
-- Restricciones para tablas volcadas
--
--
-- Filtros para la tabla `orderitems`
--
ALTER TABLE
    `orderitems`
ADD
    CONSTRAINT `orderitems_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`),
ADD
    CONSTRAINT `orderitems_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `products` (`id`);

--
-- Filtros para la tabla `orders`
--
ALTER TABLE
    `orders`
ADD
    CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customerId`) REFERENCES `customers` (`id`);

--
-- Filtros para la tabla `productcategories`
--
ALTER TABLE
    `productcategories`
ADD
    CONSTRAINT `productcategories_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `products` (`id`),
ADD
    CONSTRAINT `productcategories_ibfk_2` FOREIGN KEY (`categoryId`) REFERENCES `categories` (`id`);

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */
;

/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */
;

/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */
;