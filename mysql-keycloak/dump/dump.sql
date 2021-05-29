-- MySQL dump 10.13  Distrib 8.0.23, for Linux (x86_64)
--
-- Host: localhost    Database: keycloak
-- ------------------------------------------------------
-- Server version	8.0.24

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ADMIN_EVENT_ENTITY`
--

DROP TABLE IF EXISTS `ADMIN_EVENT_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ADMIN_EVENT_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `ADMIN_EVENT_TIME` bigint DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `OPERATION_TYPE` varchar(255) DEFAULT NULL,
  `AUTH_REALM_ID` varchar(255) DEFAULT NULL,
  `AUTH_CLIENT_ID` varchar(255) DEFAULT NULL,
  `AUTH_USER_ID` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `RESOURCE_PATH` text,
  `REPRESENTATION` text,
  `ERROR` varchar(255) DEFAULT NULL,
  `RESOURCE_TYPE` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ADMIN_EVENT_ENTITY`
--

LOCK TABLES `ADMIN_EVENT_ENTITY` WRITE;
/*!40000 ALTER TABLE `ADMIN_EVENT_ENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `ADMIN_EVENT_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ASSOCIATED_POLICY`
--

DROP TABLE IF EXISTS `ASSOCIATED_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ASSOCIATED_POLICY` (
  `POLICY_ID` varchar(36) NOT NULL,
  `ASSOCIATED_POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`POLICY_ID`,`ASSOCIATED_POLICY_ID`),
  KEY `IDX_ASSOC_POL_ASSOC_POL_ID` (`ASSOCIATED_POLICY_ID`),
  CONSTRAINT `FK_FRSR5S213XCX4WNKOG82SSRFY` FOREIGN KEY (`ASSOCIATED_POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`),
  CONSTRAINT `FK_FRSRPAS14XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ASSOCIATED_POLICY`
--

LOCK TABLES `ASSOCIATED_POLICY` WRITE;
/*!40000 ALTER TABLE `ASSOCIATED_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `ASSOCIATED_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATION_EXECUTION`
--

DROP TABLE IF EXISTS `AUTHENTICATION_EXECUTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATION_EXECUTION` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `AUTHENTICATOR` varchar(36) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `FLOW_ID` varchar(36) DEFAULT NULL,
  `REQUIREMENT` int DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  `AUTHENTICATOR_FLOW` bit(1) NOT NULL DEFAULT b'0',
  `AUTH_FLOW_ID` varchar(36) DEFAULT NULL,
  `AUTH_CONFIG` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_EXEC_REALM_FLOW` (`REALM_ID`,`FLOW_ID`),
  KEY `IDX_AUTH_EXEC_FLOW` (`FLOW_ID`),
  CONSTRAINT `FK_AUTH_EXEC_FLOW` FOREIGN KEY (`FLOW_ID`) REFERENCES `AUTHENTICATION_FLOW` (`ID`),
  CONSTRAINT `FK_AUTH_EXEC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATION_EXECUTION`
--

LOCK TABLES `AUTHENTICATION_EXECUTION` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATION_EXECUTION` DISABLE KEYS */;
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('0162f875-c1de-447d-a932-93bcb0eef737',NULL,'direct-grant-validate-otp','stock-manager','dc6c48d2-b589-435e-bc11-c02d9e0e5847',0,20,_binary '\0',NULL,NULL),('01d53b05-9a2b-443d-8cb8-691981931f58',NULL,'auth-spnego','stock-manager','9c41cf1f-a378-4635-a5d8-6a624ed7b264',3,20,_binary '\0',NULL,NULL),('01fe9b1a-7fcd-4d91-87d7-e36df492e3a4',NULL,'direct-grant-validate-username','master','c86cadac-9a9f-4b7b-94c0-5a3d5272b4d3',0,10,_binary '\0',NULL,NULL),('047642ff-e11a-4f97-a0f6-bb342c110162',NULL,'registration-recaptcha-action','stock-manager','0e41bf0f-224b-4183-b265-c24115e85fbf',3,60,_binary '\0',NULL,NULL),('04b68d66-d71e-4466-928f-b905ea00c663',NULL,'direct-grant-validate-username','stock-manager','6a3e874f-3aed-4bf4-8a76-f545b5db5d05',0,10,_binary '\0',NULL,NULL),('0753bf7b-3427-4a10-8225-ad05681a7e71',NULL,NULL,'master','1e5c432f-dce7-46e9-9c4d-76ae7fd1035a',0,20,_binary '','b722a80b-0dc4-4b0e-a9ee-f83c0b4269ba',NULL),('07831d2f-c8b1-4bb9-85e6-2f20dc4602be',NULL,'client-jwt','stock-manager','c5502fe0-abeb-4c7d-87d2-fd23ed8fbc8f',2,20,_binary '\0',NULL,NULL),('09a0268b-5ad1-4455-a362-f3dff6e46067',NULL,'reset-credential-email','master','9e50e918-567c-469b-af89-538c2aac803c',0,20,_binary '\0',NULL,NULL),('0e9d0621-fce0-431b-9ad4-662f7c8e92e1',NULL,'identity-provider-redirector','stock-manager','9c41cf1f-a378-4635-a5d8-6a624ed7b264',2,25,_binary '\0',NULL,NULL),('0ee78716-5ed2-4363-9f8c-c40f5d7b0fd2',NULL,'idp-review-profile','master','a5ab7710-7ccf-43da-a6a3-dfbc4ee94a46',0,10,_binary '\0',NULL,'5ab942c1-9298-403e-a8fe-2651fe0b4427'),('118256ef-3461-479c-bad3-8f3952f17363',NULL,'auth-spnego','master','7bc2da45-c3be-4a0b-ad7e-b7b3732ee4a8',3,30,_binary '\0',NULL,NULL),('119872c4-56c6-4573-8e58-5def18ac6c92',NULL,'auth-cookie','stock-manager','9c41cf1f-a378-4635-a5d8-6a624ed7b264',2,10,_binary '\0',NULL,NULL),('168f9e40-16be-4f76-8b22-265d37be4481',NULL,NULL,'stock-manager','69fcabe1-2a21-4df6-bab3-ba9ba56d3814',1,40,_binary '','8629322b-76af-4c59-879c-922242b7e9f4',NULL),('18951eca-da64-4b83-8962-819cb9ac7016',NULL,'auth-spnego','master','b750296a-e3bc-4261-8c42-8b64771ea0b2',3,20,_binary '\0',NULL,NULL),('195dfe02-3a46-4cdf-9ef5-0fc0a99d27c4',NULL,'direct-grant-validate-password','stock-manager','6a3e874f-3aed-4bf4-8a76-f545b5db5d05',0,20,_binary '\0',NULL,NULL),('19e5e18c-2789-4373-bb62-29622d70b2be',NULL,'registration-page-form','master','ca0e5d16-5f14-4ba7-a780-6249f5ee09cc',0,10,_binary '','a2d7db71-27c0-4d88-ad71-75851207cbaf',NULL),('1f183cdc-2eea-4b65-8230-d7f632e96420',NULL,'reset-password','master','9e50e918-567c-469b-af89-538c2aac803c',0,30,_binary '\0',NULL,NULL),('1ff28f58-d993-44b1-9a14-1950930d77e0',NULL,'client-secret','master','d80506ae-1207-4b9a-b8f3-4b79d78d20fd',2,10,_binary '\0',NULL,NULL),('29406840-ed0d-467d-9a1d-7ae771ef5394',NULL,'idp-create-user-if-unique','master','df67b000-7395-431e-888e-ed2646e65f23',2,10,_binary '\0',NULL,'6a55217c-2785-4cb8-ad9c-05196b53791f'),('2bec29b9-b93b-4202-9274-10dfe79c4927',NULL,'auth-otp-form','stock-manager','99857b8c-e84b-4284-bcb2-0c423b858e2c',0,20,_binary '\0',NULL,NULL),('2fb5a77a-556d-4819-9f42-9015676548cf',NULL,NULL,'master','9e50e918-567c-469b-af89-538c2aac803c',1,40,_binary '','dea7b846-864a-43cc-953f-9b68f655a05d',NULL),('35ea6e0c-0371-41b5-b6d3-8ba72ddb7d4c',NULL,'conditional-user-configured','stock-manager','8629322b-76af-4c59-879c-922242b7e9f4',0,10,_binary '\0',NULL,NULL),('3985c30e-6531-4e1a-b037-03d90c7fc963',NULL,NULL,'stock-manager','f7bce4b6-9801-4e01-8584-ea9f489988f6',0,20,_binary '','b070195e-1183-46ce-93eb-95385c94ea04',NULL),('39e49ace-7eab-489d-acad-7ee6a40d05d4',NULL,'client-x509','master','d80506ae-1207-4b9a-b8f3-4b79d78d20fd',2,40,_binary '\0',NULL,NULL),('3ee8432b-90ba-4f91-9265-ac100ae591a8',NULL,NULL,'master','b750296a-e3bc-4261-8c42-8b64771ea0b2',2,30,_binary '','dbaa2b95-a8b2-49f3-b250-ae155812df6b',NULL),('3f55eac2-b404-4406-99b6-e2c6a1b327fc',NULL,NULL,'stock-manager','e76a285e-934c-4dfa-a7c6-a0b162834a22',1,20,_binary '','1b8f12ff-bf5d-46eb-950b-415c8675a035',NULL),('437e6c93-a4a2-45f6-a8bf-236e07b41889',NULL,'reset-credential-email','stock-manager','69fcabe1-2a21-4df6-bab3-ba9ba56d3814',0,20,_binary '\0',NULL,NULL),('4a7973d9-7068-4ee0-aab1-f9bb8763b72b',NULL,'no-cookie-redirect','master','d6d6998c-e9a8-4478-9cb9-0b9989166d84',0,10,_binary '\0',NULL,NULL),('4a8349b3-fec9-463d-bf0b-b24ef421429d',NULL,'reset-otp','master','dea7b846-864a-43cc-953f-9b68f655a05d',0,20,_binary '\0',NULL,NULL),('4d3c2b8c-3900-4eea-942c-c88c2ae6585d',NULL,'client-secret-jwt','stock-manager','c5502fe0-abeb-4c7d-87d2-fd23ed8fbc8f',2,30,_binary '\0',NULL,NULL),('4ee0eafb-3915-4e0b-8f6a-173089d769b6',NULL,NULL,'master','46e5dfc3-9450-46d8-b6d3-43d11682317b',1,20,_binary '','14682ea7-ab25-45c5-9ce5-64f64192ff4b',NULL),('54bbb813-6925-4a83-845e-16073206d576',NULL,'auth-username-password-form','stock-manager','e76a285e-934c-4dfa-a7c6-a0b162834a22',0,10,_binary '\0',NULL,NULL),('56007429-5134-4157-b1df-3dea33986b34',NULL,'auth-otp-form','stock-manager','1b8f12ff-bf5d-46eb-950b-415c8675a035',0,20,_binary '\0',NULL,NULL),('59111997-9b6d-4c6f-94a6-2d17c9cc3c40',NULL,NULL,'stock-manager','23641444-a93a-43d6-b931-b0f3f78b7fe9',0,20,_binary '','0fb39888-7ca3-4590-8b8b-56eb4019b724',NULL),('59c7a3b9-4ed2-438b-8d20-630313969fba',NULL,'idp-username-password-form','master','46e5dfc3-9450-46d8-b6d3-43d11682317b',0,10,_binary '\0',NULL,NULL),('5e59e9c2-53dd-4b6c-b9d7-d95a20bca426',NULL,NULL,'master','c86cadac-9a9f-4b7b-94c0-5a3d5272b4d3',1,30,_binary '','066cb322-b8e3-495e-8431-d6b19d9bc822',NULL),('61896f51-9452-4ea7-ab08-2cb8839d5438',NULL,'reset-credentials-choose-user','master','9e50e918-567c-469b-af89-538c2aac803c',0,10,_binary '\0',NULL,NULL),('6c86ded0-1d8a-40d4-abd1-83c734ca1a3c',NULL,'conditional-user-configured','master','14682ea7-ab25-45c5-9ce5-64f64192ff4b',0,10,_binary '\0',NULL,NULL),('70769127-8ee3-4945-bebd-68d288778c7b',NULL,'conditional-user-configured','master','dea7b846-864a-43cc-953f-9b68f655a05d',0,10,_binary '\0',NULL,NULL),('71807621-a64c-454d-9151-a679031b718f',NULL,'registration-password-action','stock-manager','0e41bf0f-224b-4183-b265-c24115e85fbf',0,50,_binary '\0',NULL,NULL),('72b2c923-0065-441a-959a-06499d0d7d65',NULL,NULL,'master','d6d6998c-e9a8-4478-9cb9-0b9989166d84',0,20,_binary '','7bc2da45-c3be-4a0b-ad7e-b7b3732ee4a8',NULL),('7526dd90-daa8-49ec-8971-07db8c6fbb19',NULL,'conditional-user-configured','stock-manager','1b8f12ff-bf5d-46eb-950b-415c8675a035',0,10,_binary '\0',NULL,NULL),('79f838a7-4efc-4531-b1b8-d98a03e08d7a',NULL,NULL,'master','b722a80b-0dc4-4b0e-a9ee-f83c0b4269ba',2,20,_binary '','46e5dfc3-9450-46d8-b6d3-43d11682317b',NULL),('7a04011d-aa8f-4ae6-a9b3-ac238caf4c67',NULL,'conditional-user-configured','stock-manager','99857b8c-e84b-4284-bcb2-0c423b858e2c',0,10,_binary '\0',NULL,NULL),('7bf862d8-5581-4c77-9674-3b22d982e614',NULL,'registration-profile-action','stock-manager','0e41bf0f-224b-4183-b265-c24115e85fbf',0,40,_binary '\0',NULL,NULL),('7cbccdd2-a58d-4625-a6cb-7e6e960cfe95',NULL,'conditional-user-configured','master','066cb322-b8e3-495e-8431-d6b19d9bc822',0,10,_binary '\0',NULL,NULL),('7e806b70-5bfe-425d-a1b8-a9d75405cd09',NULL,'reset-password','stock-manager','69fcabe1-2a21-4df6-bab3-ba9ba56d3814',0,30,_binary '\0',NULL,NULL),('80181775-545e-4c2b-871f-b947a5258872',NULL,NULL,'stock-manager','7408bb8a-8cd4-48ff-b4d3-4cf302017c4f',2,20,_binary '','f7bce4b6-9801-4e01-8584-ea9f489988f6',NULL),('81dfb204-0cd4-4d82-83d7-74a15af34594',NULL,'reset-otp','stock-manager','8629322b-76af-4c59-879c-922242b7e9f4',0,20,_binary '\0',NULL,NULL),('82d4a8b3-7795-418f-ba4f-b72d390bd2d8',NULL,'registration-recaptcha-action','master','a2d7db71-27c0-4d88-ad71-75851207cbaf',3,60,_binary '\0',NULL,NULL),('8817278f-8e53-423f-9228-eab4bc59cebe',NULL,NULL,'master','a5ab7710-7ccf-43da-a6a3-dfbc4ee94a46',0,20,_binary '','df67b000-7395-431e-888e-ed2646e65f23',NULL),('8925117d-f9df-49bc-a7ee-9d7950ed5ee5',NULL,NULL,'master','dbaa2b95-a8b2-49f3-b250-ae155812df6b',1,20,_binary '','ab6a2607-0b02-42a7-b6f6-2d1db3106620',NULL),('8dea5243-d476-488e-bc5f-9ee89ab0730a',NULL,'http-basic-authenticator','master','12212bb1-7543-46bd-a88f-c3471ebaf9cc',0,10,_binary '\0',NULL,NULL),('927da8ce-bb71-431b-9f28-c26f0cc04b3f',NULL,'conditional-user-configured','stock-manager','dc6c48d2-b589-435e-bc11-c02d9e0e5847',0,10,_binary '\0',NULL,NULL),('970b20e2-073d-4948-927e-8c2e185a5753',NULL,'direct-grant-validate-otp','master','066cb322-b8e3-495e-8431-d6b19d9bc822',0,20,_binary '\0',NULL,NULL),('9798b99d-55e1-44f3-9c11-f842951c5f95',NULL,'registration-user-creation','stock-manager','0e41bf0f-224b-4183-b265-c24115e85fbf',0,20,_binary '\0',NULL,NULL),('982d5d13-94a2-41c7-a0d5-c39bb3b89c81',NULL,'basic-auth','stock-manager','0fb39888-7ca3-4590-8b8b-56eb4019b724',0,10,_binary '\0',NULL,NULL),('98dd1047-4c8b-4aa0-a542-751457e0f5d3',NULL,'idp-create-user-if-unique','stock-manager','7408bb8a-8cd4-48ff-b4d3-4cf302017c4f',2,10,_binary '\0',NULL,'f6b026fd-6fb9-4fa7-b8c5-163641dc3db7'),('99e2b100-4ecc-4d75-86f4-f5075b661e70',NULL,'client-x509','stock-manager','c5502fe0-abeb-4c7d-87d2-fd23ed8fbc8f',2,40,_binary '\0',NULL,NULL),('9dc660d3-ac0c-417e-90cd-1513a1626a11',NULL,'idp-confirm-link','master','1e5c432f-dce7-46e9-9c4d-76ae7fd1035a',0,10,_binary '\0',NULL,NULL),('a271e1ba-84a2-4f74-ab6b-2bf7ee053dc2',NULL,'registration-profile-action','master','a2d7db71-27c0-4d88-ad71-75851207cbaf',0,40,_binary '\0',NULL,NULL),('a586e21e-378a-4119-ab90-db1f59014723',NULL,NULL,'stock-manager','6a3e874f-3aed-4bf4-8a76-f545b5db5d05',1,30,_binary '','dc6c48d2-b589-435e-bc11-c02d9e0e5847',NULL),('a615b263-a0b2-4836-b240-9c32bc995ab5',NULL,'basic-auth','master','7bc2da45-c3be-4a0b-ad7e-b7b3732ee4a8',0,10,_binary '\0',NULL,NULL),('a6b00a8e-692e-45a1-adb6-8db0993552a0',NULL,NULL,'master','df67b000-7395-431e-888e-ed2646e65f23',2,20,_binary '','1e5c432f-dce7-46e9-9c4d-76ae7fd1035a',NULL),('a71ed625-b247-48a2-a251-c6e49a93454e',NULL,'idp-email-verification','stock-manager','b070195e-1183-46ce-93eb-95385c94ea04',2,10,_binary '\0',NULL,NULL),('a84c5f19-cdb5-4cd7-b98b-346b2c095591',NULL,'idp-confirm-link','stock-manager','f7bce4b6-9801-4e01-8584-ea9f489988f6',0,10,_binary '\0',NULL,NULL),('a90a1af9-3313-4f7e-9f4e-ea0d6dd345ee',NULL,'auth-spnego','stock-manager','0fb39888-7ca3-4590-8b8b-56eb4019b724',3,30,_binary '\0',NULL,NULL),('b249fd10-547e-4382-9719-bc50758a730c',NULL,'conditional-user-configured','master','ab6a2607-0b02-42a7-b6f6-2d1db3106620',0,10,_binary '\0',NULL,NULL),('be2210f0-2e73-4412-951b-fcc7a2fc977e',NULL,'idp-username-password-form','stock-manager','e1365747-d78e-4c69-a686-027d3b48ace4',0,10,_binary '\0',NULL,NULL),('bf79778e-37f8-46d7-ac39-0a89345f18b6',NULL,'client-secret','stock-manager','c5502fe0-abeb-4c7d-87d2-fd23ed8fbc8f',2,10,_binary '\0',NULL,NULL),('c042b984-7380-498a-8f6e-032e845c7527',NULL,'client-jwt','master','d80506ae-1207-4b9a-b8f3-4b79d78d20fd',2,20,_binary '\0',NULL,NULL),('c0cdbdcf-ebcb-4d91-ac3e-27614228734f',NULL,NULL,'stock-manager','b070195e-1183-46ce-93eb-95385c94ea04',2,20,_binary '','e1365747-d78e-4c69-a686-027d3b48ace4',NULL),('c13dd0fb-7fae-4a74-b349-e0c3755cd001',NULL,'auth-otp-form','master','ab6a2607-0b02-42a7-b6f6-2d1db3106620',0,20,_binary '\0',NULL,NULL),('d0a1ee81-fd1b-4880-85d7-3518cd0bf744',NULL,'registration-user-creation','master','a2d7db71-27c0-4d88-ad71-75851207cbaf',0,20,_binary '\0',NULL,NULL),('d2472794-7fd3-4130-83ed-6b2f6e78cf73',NULL,'registration-page-form','stock-manager','fdfe2bef-fa11-4b10-b653-c6b0af2c5f50',0,10,_binary '','0e41bf0f-224b-4183-b265-c24115e85fbf',NULL),('d484badb-52a3-4907-9f7a-6babb8aec0b1',NULL,'reset-credentials-choose-user','stock-manager','69fcabe1-2a21-4df6-bab3-ba9ba56d3814',0,10,_binary '\0',NULL,NULL),('d4fca5ef-2ed9-4480-b53a-afc1adb1c098',NULL,'docker-http-basic-authenticator','stock-manager','e7b89727-3e5f-4753-99ec-a1f530802ec5',0,10,_binary '\0',NULL,NULL),('de721fd3-950e-4bba-a076-5c74d459bce9',NULL,'identity-provider-redirector','master','b750296a-e3bc-4261-8c42-8b64771ea0b2',2,25,_binary '\0',NULL,NULL),('df1a3ce5-db63-468a-895c-e10e68d7a5a1',NULL,NULL,'stock-manager','9c41cf1f-a378-4635-a5d8-6a624ed7b264',2,30,_binary '','e76a285e-934c-4dfa-a7c6-a0b162834a22',NULL),('df9a142b-37f3-4fd1-84d1-9a9d8c675be0',NULL,NULL,'stock-manager','e1365747-d78e-4c69-a686-027d3b48ace4',1,20,_binary '','99857b8c-e84b-4284-bcb2-0c423b858e2c',NULL),('e06e3f7e-9b79-48bb-8048-765375496f79',NULL,'auth-cookie','master','b750296a-e3bc-4261-8c42-8b64771ea0b2',2,10,_binary '\0',NULL,NULL),('e2c5d437-5cf0-4ac6-8be5-4eeb62d4742a',NULL,'docker-http-basic-authenticator','master','c0491f14-4557-4be1-973c-681889a9ada5',0,10,_binary '\0',NULL,NULL),('e5dbadf2-f02e-4211-b4a2-b5e8fbcdc2f0',NULL,NULL,'stock-manager','13bcf71f-18f1-42bd-860a-5908a83e1287',0,20,_binary '','7408bb8a-8cd4-48ff-b4d3-4cf302017c4f',NULL),('e8dab33c-9a2b-44fc-b2db-83d518af0b43',NULL,'client-secret-jwt','master','d80506ae-1207-4b9a-b8f3-4b79d78d20fd',2,30,_binary '\0',NULL,NULL),('ebc648c2-e194-46a2-b488-09e9f3ce22ac',NULL,'auth-otp-form','master','14682ea7-ab25-45c5-9ce5-64f64192ff4b',0,20,_binary '\0',NULL,NULL),('f07267f3-4934-4584-81c8-eaeb226625b7',NULL,'idp-review-profile','stock-manager','13bcf71f-18f1-42bd-860a-5908a83e1287',0,10,_binary '\0',NULL,'c3b2c9b9-a138-474f-a648-2a1517a5e3a7'),('f1794085-d582-4ee9-b2e0-ca55b170af94',NULL,'registration-password-action','master','a2d7db71-27c0-4d88-ad71-75851207cbaf',0,50,_binary '\0',NULL,NULL),('f18c0ef7-d9da-4390-be7b-4fc6151d01cc',NULL,'basic-auth-otp','master','7bc2da45-c3be-4a0b-ad7e-b7b3732ee4a8',3,20,_binary '\0',NULL,NULL),('f597d118-4587-4b11-b1c7-3ed759fbf425',NULL,'basic-auth-otp','stock-manager','0fb39888-7ca3-4590-8b8b-56eb4019b724',3,20,_binary '\0',NULL,NULL),('f8d3e080-47a0-4208-bc8a-97bf43ecb860',NULL,'no-cookie-redirect','stock-manager','23641444-a93a-43d6-b931-b0f3f78b7fe9',0,10,_binary '\0',NULL,NULL),('f94a65b5-2637-4ffd-9db4-96bd41716341',NULL,'idp-email-verification','master','b722a80b-0dc4-4b0e-a9ee-f83c0b4269ba',2,10,_binary '\0',NULL,NULL),('fde8d919-10ab-4291-9a38-1d5ae1af7bc2',NULL,'direct-grant-validate-password','master','c86cadac-9a9f-4b7b-94c0-5a3d5272b4d3',0,20,_binary '\0',NULL,NULL),('ff86ed37-c034-46d7-a734-327ec9579307',NULL,'auth-username-password-form','master','dbaa2b95-a8b2-49f3-b250-ae155812df6b',0,10,_binary '\0',NULL,NULL),('ffe74c98-0024-46c1-8a8d-6a64a1c15508',NULL,'http-basic-authenticator','stock-manager','de6a3d39-9e7f-4108-9982-144b8e7b539e',0,10,_binary '\0',NULL,NULL);
/*!40000 ALTER TABLE `AUTHENTICATION_EXECUTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATION_FLOW`
--

DROP TABLE IF EXISTS `AUTHENTICATION_FLOW`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATION_FLOW` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_ID` varchar(36) NOT NULL DEFAULT 'basic-flow',
  `TOP_LEVEL` bit(1) NOT NULL DEFAULT b'0',
  `BUILT_IN` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_FLOW_REALM` (`REALM_ID`),
  CONSTRAINT `FK_AUTH_FLOW_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATION_FLOW`
--

LOCK TABLES `AUTHENTICATION_FLOW` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATION_FLOW` DISABLE KEYS */;
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('066cb322-b8e3-495e-8431-d6b19d9bc822','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','master','basic-flow',_binary '\0',_binary ''),('0e41bf0f-224b-4183-b265-c24115e85fbf','registration form','registration form','stock-manager','form-flow',_binary '\0',_binary ''),('0fb39888-7ca3-4590-8b8b-56eb4019b724','Authentication Options','Authentication options.','stock-manager','basic-flow',_binary '\0',_binary ''),('12212bb1-7543-46bd-a88f-c3471ebaf9cc','saml ecp','SAML ECP Profile Authentication Flow','master','basic-flow',_binary '',_binary ''),('13bcf71f-18f1-42bd-860a-5908a83e1287','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','stock-manager','basic-flow',_binary '',_binary ''),('14682ea7-ab25-45c5-9ce5-64f64192ff4b','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','master','basic-flow',_binary '\0',_binary ''),('1b8f12ff-bf5d-46eb-950b-415c8675a035','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','stock-manager','basic-flow',_binary '\0',_binary ''),('1e5c432f-dce7-46e9-9c4d-76ae7fd1035a','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','master','basic-flow',_binary '\0',_binary ''),('23641444-a93a-43d6-b931-b0f3f78b7fe9','http challenge','An authentication flow based on challenge-response HTTP Authentication Schemes','stock-manager','basic-flow',_binary '',_binary ''),('46e5dfc3-9450-46d8-b6d3-43d11682317b','Verify Existing Account by Re-authentication','Reauthentication of existing account','master','basic-flow',_binary '\0',_binary ''),('69fcabe1-2a21-4df6-bab3-ba9ba56d3814','reset credentials','Reset credentials for a user if they forgot their password or something','stock-manager','basic-flow',_binary '',_binary ''),('6a3e874f-3aed-4bf4-8a76-f545b5db5d05','direct grant','OpenID Connect Resource Owner Grant','stock-manager','basic-flow',_binary '',_binary ''),('7408bb8a-8cd4-48ff-b4d3-4cf302017c4f','User creation or linking','Flow for the existing/non-existing user alternatives','stock-manager','basic-flow',_binary '\0',_binary ''),('7bc2da45-c3be-4a0b-ad7e-b7b3732ee4a8','Authentication Options','Authentication options.','master','basic-flow',_binary '\0',_binary ''),('8629322b-76af-4c59-879c-922242b7e9f4','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','stock-manager','basic-flow',_binary '\0',_binary ''),('99857b8c-e84b-4284-bcb2-0c423b858e2c','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','stock-manager','basic-flow',_binary '\0',_binary ''),('9c41cf1f-a378-4635-a5d8-6a624ed7b264','browser','browser based authentication','stock-manager','basic-flow',_binary '',_binary ''),('9e50e918-567c-469b-af89-538c2aac803c','reset credentials','Reset credentials for a user if they forgot their password or something','master','basic-flow',_binary '',_binary ''),('a2d7db71-27c0-4d88-ad71-75851207cbaf','registration form','registration form','master','form-flow',_binary '\0',_binary ''),('a5ab7710-7ccf-43da-a6a3-dfbc4ee94a46','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','master','basic-flow',_binary '',_binary ''),('ab6a2607-0b02-42a7-b6f6-2d1db3106620','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','master','basic-flow',_binary '\0',_binary ''),('b070195e-1183-46ce-93eb-95385c94ea04','Account verification options','Method with which to verity the existing account','stock-manager','basic-flow',_binary '\0',_binary ''),('b722a80b-0dc4-4b0e-a9ee-f83c0b4269ba','Account verification options','Method with which to verity the existing account','master','basic-flow',_binary '\0',_binary ''),('b750296a-e3bc-4261-8c42-8b64771ea0b2','browser','browser based authentication','master','basic-flow',_binary '',_binary ''),('c0491f14-4557-4be1-973c-681889a9ada5','docker auth','Used by Docker clients to authenticate against the IDP','master','basic-flow',_binary '',_binary ''),('c5502fe0-abeb-4c7d-87d2-fd23ed8fbc8f','clients','Base authentication for clients','stock-manager','client-flow',_binary '',_binary ''),('c86cadac-9a9f-4b7b-94c0-5a3d5272b4d3','direct grant','OpenID Connect Resource Owner Grant','master','basic-flow',_binary '',_binary ''),('ca0e5d16-5f14-4ba7-a780-6249f5ee09cc','registration','registration flow','master','basic-flow',_binary '',_binary ''),('d6d6998c-e9a8-4478-9cb9-0b9989166d84','http challenge','An authentication flow based on challenge-response HTTP Authentication Schemes','master','basic-flow',_binary '',_binary ''),('d80506ae-1207-4b9a-b8f3-4b79d78d20fd','clients','Base authentication for clients','master','client-flow',_binary '',_binary ''),('dbaa2b95-a8b2-49f3-b250-ae155812df6b','forms','Username, password, otp and other auth forms.','master','basic-flow',_binary '\0',_binary ''),('dc6c48d2-b589-435e-bc11-c02d9e0e5847','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','stock-manager','basic-flow',_binary '\0',_binary ''),('de6a3d39-9e7f-4108-9982-144b8e7b539e','saml ecp','SAML ECP Profile Authentication Flow','stock-manager','basic-flow',_binary '',_binary ''),('dea7b846-864a-43cc-953f-9b68f655a05d','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','master','basic-flow',_binary '\0',_binary ''),('df67b000-7395-431e-888e-ed2646e65f23','User creation or linking','Flow for the existing/non-existing user alternatives','master','basic-flow',_binary '\0',_binary ''),('e1365747-d78e-4c69-a686-027d3b48ace4','Verify Existing Account by Re-authentication','Reauthentication of existing account','stock-manager','basic-flow',_binary '\0',_binary ''),('e76a285e-934c-4dfa-a7c6-a0b162834a22','forms','Username, password, otp and other auth forms.','stock-manager','basic-flow',_binary '\0',_binary ''),('e7b89727-3e5f-4753-99ec-a1f530802ec5','docker auth','Used by Docker clients to authenticate against the IDP','stock-manager','basic-flow',_binary '',_binary ''),('f7bce4b6-9801-4e01-8584-ea9f489988f6','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','stock-manager','basic-flow',_binary '\0',_binary ''),('fdfe2bef-fa11-4b10-b653-c6b0af2c5f50','registration','registration flow','stock-manager','basic-flow',_binary '',_binary '');
/*!40000 ALTER TABLE `AUTHENTICATION_FLOW` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATOR_CONFIG`
--

DROP TABLE IF EXISTS `AUTHENTICATOR_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATOR_CONFIG` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_CONFIG_REALM` (`REALM_ID`),
  CONSTRAINT `FK_AUTH_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATOR_CONFIG`
--

LOCK TABLES `AUTHENTICATOR_CONFIG` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG` DISABLE KEYS */;
INSERT INTO `AUTHENTICATOR_CONFIG` VALUES ('5ab942c1-9298-403e-a8fe-2651fe0b4427','review profile config','master'),('6a55217c-2785-4cb8-ad9c-05196b53791f','create unique user config','master'),('c3b2c9b9-a138-474f-a648-2a1517a5e3a7','review profile config','stock-manager'),('f6b026fd-6fb9-4fa7-b8c5-163641dc3db7','create unique user config','stock-manager');
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATOR_CONFIG_ENTRY`
--

DROP TABLE IF EXISTS `AUTHENTICATOR_CONFIG_ENTRY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATOR_CONFIG_ENTRY` (
  `AUTHENTICATOR_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`AUTHENTICATOR_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATOR_CONFIG_ENTRY`
--

LOCK TABLES `AUTHENTICATOR_CONFIG_ENTRY` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG_ENTRY` DISABLE KEYS */;
INSERT INTO `AUTHENTICATOR_CONFIG_ENTRY` VALUES ('5ab942c1-9298-403e-a8fe-2651fe0b4427','missing','update.profile.on.first.login'),('6a55217c-2785-4cb8-ad9c-05196b53791f','false','require.password.update.after.registration'),('c3b2c9b9-a138-474f-a648-2a1517a5e3a7','missing','update.profile.on.first.login'),('f6b026fd-6fb9-4fa7-b8c5-163641dc3db7','false','require.password.update.after.registration');
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG_ENTRY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BROKER_LINK`
--

DROP TABLE IF EXISTS `BROKER_LINK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BROKER_LINK` (
  `IDENTITY_PROVIDER` varchar(255) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `BROKER_USER_ID` varchar(255) DEFAULT NULL,
  `BROKER_USERNAME` varchar(255) DEFAULT NULL,
  `TOKEN` text,
  `USER_ID` varchar(255) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BROKER_LINK`
--

LOCK TABLES `BROKER_LINK` WRITE;
/*!40000 ALTER TABLE `BROKER_LINK` DISABLE KEYS */;
/*!40000 ALTER TABLE `BROKER_LINK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT`
--

DROP TABLE IF EXISTS `CLIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT` (
  `ID` varchar(36) NOT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `FULL_SCOPE_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int DEFAULT NULL,
  `PUBLIC_CLIENT` bit(1) NOT NULL DEFAULT b'0',
  `SECRET` varchar(255) DEFAULT NULL,
  `BASE_URL` varchar(255) DEFAULT NULL,
  `BEARER_ONLY` bit(1) NOT NULL DEFAULT b'0',
  `MANAGEMENT_URL` varchar(255) DEFAULT NULL,
  `SURROGATE_AUTH_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) DEFAULT NULL,
  `PROTOCOL` varchar(255) DEFAULT NULL,
  `NODE_REREG_TIMEOUT` int DEFAULT '0',
  `FRONTCHANNEL_LOGOUT` bit(1) NOT NULL DEFAULT b'0',
  `CONSENT_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SERVICE_ACCOUNTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `CLIENT_AUTHENTICATOR_TYPE` varchar(255) DEFAULT NULL,
  `ROOT_URL` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REGISTRATION_TOKEN` varchar(255) DEFAULT NULL,
  `STANDARD_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'1',
  `IMPLICIT_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DIRECT_ACCESS_GRANTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `ALWAYS_DISPLAY_IN_CONSOLE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_B71CJLBENV945RB6GCON438AT` (`REALM_ID`,`CLIENT_ID`),
  KEY `IDX_CLIENT_ID` (`CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT`
--

LOCK TABLES `CLIENT` WRITE;
/*!40000 ALTER TABLE `CLIENT` DISABLE KEYS */;
INSERT INTO `CLIENT` VALUES ('03b3ea62-438d-4585-ae3d-863df7b15c22',_binary '',_binary '\0','admin-cli',0,_binary '',NULL,NULL,_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_admin-cli}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '\0',_binary '\0',_binary '',_binary '\0'),('0ca35df5-937d-42bb-851c-07b8f82426ae',_binary '',_binary '\0','realm-management',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','stock-manager','openid-connect',0,_binary '\0',_binary '\0','${client_realm-management}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('2d1d20d4-0323-458d-b978-cd2a286682b9',_binary '',_binary '\0','admin-cli',0,_binary '',NULL,NULL,_binary '\0',NULL,_binary '\0','stock-manager','openid-connect',0,_binary '\0',_binary '\0','${client_admin-cli}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '\0',_binary '\0',_binary '',_binary '\0'),('3538b8a7-c81d-4ec9-8741-202db96b1a2f',_binary '',_binary '\0','account-console',0,_binary '',NULL,'/realms/master/account/',_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_account-console}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('41b8abc2-876d-4760-83e9-d5718d861104',_binary '',_binary '\0','master-realm',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','master',NULL,0,_binary '\0',_binary '\0','master Realm',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('908aac02-ff05-4323-8868-ac055ff4fc49',_binary '',_binary '','stock-manager',0,_binary '',NULL,NULL,_binary '\0',NULL,_binary '\0','stock-manager','openid-connect',-1,_binary '\0',_binary '\0',NULL,_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '',_binary '',_binary '\0'),('95b34f61-3dc8-43ff-b304-b07690a45b6f',_binary '',_binary '\0','account',0,_binary '',NULL,'/realms/stock-manager/account/',_binary '\0',NULL,_binary '\0','stock-manager','openid-connect',0,_binary '\0',_binary '\0','${client_account}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('b45787d7-41bc-4fb7-98ed-e1e6bff85ef9',_binary '',_binary '\0','security-admin-console',0,_binary '',NULL,'/admin/stock-manager/console/',_binary '\0',NULL,_binary '\0','stock-manager','openid-connect',0,_binary '\0',_binary '\0','${client_security-admin-console}',_binary '\0','client-secret','${authAdminUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('bc214d49-b69e-4807-b223-65d603bbec90',_binary '',_binary '\0','broker',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_broker}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('c596116e-ebea-4ae9-8e42-0d6342fd47a3',_binary '',_binary '\0','stock-manager-realm',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','master',NULL,0,_binary '\0',_binary '\0','stock-manager Realm',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('e5918595-c567-4a69-bfd1-0ac9393a561c',_binary '',_binary '\0','account-console',0,_binary '',NULL,'/realms/stock-manager/account/',_binary '\0',NULL,_binary '\0','stock-manager','openid-connect',0,_binary '\0',_binary '\0','${client_account-console}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('e89cb647-9ac1-4636-8c3a-9e5523c27fda',_binary '',_binary '\0','account',0,_binary '',NULL,'/realms/master/account/',_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_account}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('ef50b7ea-73db-4f62-83fe-f8ab137c1714',_binary '',_binary '\0','security-admin-console',0,_binary '',NULL,'/admin/master/console/',_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_security-admin-console}',_binary '\0','client-secret','${authAdminUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('f2b2bdbb-ebc8-4057-a5d8-eb287e05765c',_binary '',_binary '\0','broker',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','stock-manager','openid-connect',0,_binary '\0',_binary '\0','${client_broker}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0');
/*!40000 ALTER TABLE `CLIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_ATTRIBUTES`
--

DROP TABLE IF EXISTS `CLIENT_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_ATTRIBUTES` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` text,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`NAME`),
  CONSTRAINT `FK3C47C64BEACCA966` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_ATTRIBUTES`
--

LOCK TABLES `CLIENT_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `CLIENT_ATTRIBUTES` DISABLE KEYS */;
INSERT INTO `CLIENT_ATTRIBUTES` VALUES ('3538b8a7-c81d-4ec9-8741-202db96b1a2f','S256','pkce.code.challenge.method'),('908aac02-ff05-4323-8868-ac055ff4fc49','false','backchannel.logout.revoke.offline.tokens'),('908aac02-ff05-4323-8868-ac055ff4fc49','true','backchannel.logout.session.required'),('908aac02-ff05-4323-8868-ac055ff4fc49','false','client_credentials.use_refresh_token'),('908aac02-ff05-4323-8868-ac055ff4fc49','false','display.on.consent.screen'),('908aac02-ff05-4323-8868-ac055ff4fc49','false','exclude.session.state.from.auth.response'),('908aac02-ff05-4323-8868-ac055ff4fc49','false','oauth2.device.authorization.grant.enabled'),('908aac02-ff05-4323-8868-ac055ff4fc49','false','oidc.ciba.grant.enabled'),('908aac02-ff05-4323-8868-ac055ff4fc49','false','saml_force_name_id_format'),('908aac02-ff05-4323-8868-ac055ff4fc49','false','saml.artifact.binding'),('908aac02-ff05-4323-8868-ac055ff4fc49','false','saml.assertion.signature'),('908aac02-ff05-4323-8868-ac055ff4fc49','false','saml.authnstatement'),('908aac02-ff05-4323-8868-ac055ff4fc49','false','saml.client.signature'),('908aac02-ff05-4323-8868-ac055ff4fc49','false','saml.encrypt'),('908aac02-ff05-4323-8868-ac055ff4fc49','false','saml.force.post.binding'),('908aac02-ff05-4323-8868-ac055ff4fc49','false','saml.multivalued.roles'),('908aac02-ff05-4323-8868-ac055ff4fc49','false','saml.onetimeuse.condition'),('908aac02-ff05-4323-8868-ac055ff4fc49','false','saml.server.signature'),('908aac02-ff05-4323-8868-ac055ff4fc49','false','saml.server.signature.keyinfo.ext'),('908aac02-ff05-4323-8868-ac055ff4fc49','false','tls.client.certificate.bound.access.tokens'),('908aac02-ff05-4323-8868-ac055ff4fc49','true','use.refresh.tokens'),('b45787d7-41bc-4fb7-98ed-e1e6bff85ef9','S256','pkce.code.challenge.method'),('e5918595-c567-4a69-bfd1-0ac9393a561c','S256','pkce.code.challenge.method'),('ef50b7ea-73db-4f62-83fe-f8ab137c1714','S256','pkce.code.challenge.method');
/*!40000 ALTER TABLE `CLIENT_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_AUTH_FLOW_BINDINGS`
--

DROP TABLE IF EXISTS `CLIENT_AUTH_FLOW_BINDINGS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_AUTH_FLOW_BINDINGS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `FLOW_ID` varchar(36) DEFAULT NULL,
  `BINDING_NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`BINDING_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_AUTH_FLOW_BINDINGS`
--

LOCK TABLES `CLIENT_AUTH_FLOW_BINDINGS` WRITE;
/*!40000 ALTER TABLE `CLIENT_AUTH_FLOW_BINDINGS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_AUTH_FLOW_BINDINGS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_INITIAL_ACCESS`
--

DROP TABLE IF EXISTS `CLIENT_INITIAL_ACCESS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_INITIAL_ACCESS` (
  `ID` varchar(36) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `TIMESTAMP` int DEFAULT NULL,
  `EXPIRATION` int DEFAULT NULL,
  `COUNT` int DEFAULT NULL,
  `REMAINING_COUNT` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_CLIENT_INIT_ACC_REALM` (`REALM_ID`),
  CONSTRAINT `FK_CLIENT_INIT_ACC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_INITIAL_ACCESS`
--

LOCK TABLES `CLIENT_INITIAL_ACCESS` WRITE;
/*!40000 ALTER TABLE `CLIENT_INITIAL_ACCESS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_INITIAL_ACCESS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_NODE_REGISTRATIONS`
--

DROP TABLE IF EXISTS `CLIENT_NODE_REGISTRATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_NODE_REGISTRATIONS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` int DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`NAME`),
  CONSTRAINT `FK4129723BA992F594` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_NODE_REGISTRATIONS`
--

LOCK TABLES `CLIENT_NODE_REGISTRATIONS` WRITE;
/*!40000 ALTER TABLE `CLIENT_NODE_REGISTRATIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_NODE_REGISTRATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROTOCOL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_CLI_SCOPE` (`REALM_ID`,`NAME`),
  KEY `IDX_REALM_CLSCOPE` (`REALM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE`
--

LOCK TABLES `CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE` VALUES ('3328b38d-66eb-40d9-b866-0e913f496d7c','offline_access','master','OpenID Connect built-in scope: offline_access','openid-connect'),('3bc320a7-f2a2-4a9b-8297-0d6f81e74336','role_list','stock-manager','SAML role list','saml'),('3fdb657c-92dc-4392-8783-b4c2b52d7bcf','offline_access','stock-manager','OpenID Connect built-in scope: offline_access','openid-connect'),('467711c6-a82f-4814-af06-c94a29fca704','email','stock-manager','OpenID Connect built-in scope: email','openid-connect'),('4c7fe22c-655f-4cab-ac4b-7dbe5c61039a','profile','master','OpenID Connect built-in scope: profile','openid-connect'),('5002ebff-add7-4a60-a6c3-4a2d6197a2c3','roles','master','OpenID Connect scope for add user roles to the access token','openid-connect'),('52ec758a-b9a4-41e7-8716-71f21f7fe7f0','address','master','OpenID Connect built-in scope: address','openid-connect'),('54115c90-c720-439f-9ae6-59085eef8d41','role_list','master','SAML role list','saml'),('5774fffd-6c96-4034-ae97-e0881669d722','email','master','OpenID Connect built-in scope: email','openid-connect'),('83f62477-ebcd-412b-bb61-d2464ecbf959','microprofile-jwt','master','Microprofile - JWT built-in scope','openid-connect'),('8d837e12-dca6-4763-a286-119a1b8a16f0','web-origins','master','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('94320587-e15d-44e5-b921-337e62255256','phone','stock-manager','OpenID Connect built-in scope: phone','openid-connect'),('a0c244a0-9390-4107-85e6-c2e5e853223b','phone','master','OpenID Connect built-in scope: phone','openid-connect'),('b4b8762f-50d4-4491-aea8-357f0737bf38','roles','stock-manager','OpenID Connect scope for add user roles to the access token','openid-connect'),('d788b693-45d3-4f4f-9b6b-3c59d8dacdab','address','stock-manager','OpenID Connect built-in scope: address','openid-connect'),('db09ffc3-6f35-43c2-a3b6-51ec55b9adc1','profile','stock-manager','OpenID Connect built-in scope: profile','openid-connect'),('ed0a66e8-1873-43b0-938b-94c093a000a9','web-origins','stock-manager','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('fd41383b-a59e-46a6-b5f6-829f58beede7','microprofile-jwt','stock-manager','Microprofile - JWT built-in scope','openid-connect');
/*!40000 ALTER TABLE `CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_ATTRIBUTES`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_ATTRIBUTES` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `VALUE` text,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`NAME`),
  KEY `IDX_CLSCOPE_ATTRS` (`SCOPE_ID`),
  CONSTRAINT `FK_CL_SCOPE_ATTR_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_ATTRIBUTES`
--

LOCK TABLES `CLIENT_SCOPE_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_ATTRIBUTES` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('3328b38d-66eb-40d9-b866-0e913f496d7c','${offlineAccessScopeConsentText}','consent.screen.text'),('3328b38d-66eb-40d9-b866-0e913f496d7c','true','display.on.consent.screen'),('3bc320a7-f2a2-4a9b-8297-0d6f81e74336','${samlRoleListScopeConsentText}','consent.screen.text'),('3bc320a7-f2a2-4a9b-8297-0d6f81e74336','true','display.on.consent.screen'),('3fdb657c-92dc-4392-8783-b4c2b52d7bcf','${offlineAccessScopeConsentText}','consent.screen.text'),('3fdb657c-92dc-4392-8783-b4c2b52d7bcf','true','display.on.consent.screen'),('467711c6-a82f-4814-af06-c94a29fca704','${emailScopeConsentText}','consent.screen.text'),('467711c6-a82f-4814-af06-c94a29fca704','true','display.on.consent.screen'),('467711c6-a82f-4814-af06-c94a29fca704','true','include.in.token.scope'),('4c7fe22c-655f-4cab-ac4b-7dbe5c61039a','${profileScopeConsentText}','consent.screen.text'),('4c7fe22c-655f-4cab-ac4b-7dbe5c61039a','true','display.on.consent.screen'),('4c7fe22c-655f-4cab-ac4b-7dbe5c61039a','true','include.in.token.scope'),('5002ebff-add7-4a60-a6c3-4a2d6197a2c3','${rolesScopeConsentText}','consent.screen.text'),('5002ebff-add7-4a60-a6c3-4a2d6197a2c3','true','display.on.consent.screen'),('5002ebff-add7-4a60-a6c3-4a2d6197a2c3','false','include.in.token.scope'),('52ec758a-b9a4-41e7-8716-71f21f7fe7f0','${addressScopeConsentText}','consent.screen.text'),('52ec758a-b9a4-41e7-8716-71f21f7fe7f0','true','display.on.consent.screen'),('52ec758a-b9a4-41e7-8716-71f21f7fe7f0','true','include.in.token.scope'),('54115c90-c720-439f-9ae6-59085eef8d41','${samlRoleListScopeConsentText}','consent.screen.text'),('54115c90-c720-439f-9ae6-59085eef8d41','true','display.on.consent.screen'),('5774fffd-6c96-4034-ae97-e0881669d722','${emailScopeConsentText}','consent.screen.text'),('5774fffd-6c96-4034-ae97-e0881669d722','true','display.on.consent.screen'),('5774fffd-6c96-4034-ae97-e0881669d722','true','include.in.token.scope'),('83f62477-ebcd-412b-bb61-d2464ecbf959','false','display.on.consent.screen'),('83f62477-ebcd-412b-bb61-d2464ecbf959','true','include.in.token.scope'),('8d837e12-dca6-4763-a286-119a1b8a16f0','','consent.screen.text'),('8d837e12-dca6-4763-a286-119a1b8a16f0','false','display.on.consent.screen'),('8d837e12-dca6-4763-a286-119a1b8a16f0','false','include.in.token.scope'),('94320587-e15d-44e5-b921-337e62255256','${phoneScopeConsentText}','consent.screen.text'),('94320587-e15d-44e5-b921-337e62255256','true','display.on.consent.screen'),('94320587-e15d-44e5-b921-337e62255256','true','include.in.token.scope'),('a0c244a0-9390-4107-85e6-c2e5e853223b','${phoneScopeConsentText}','consent.screen.text'),('a0c244a0-9390-4107-85e6-c2e5e853223b','true','display.on.consent.screen'),('a0c244a0-9390-4107-85e6-c2e5e853223b','true','include.in.token.scope'),('b4b8762f-50d4-4491-aea8-357f0737bf38','${rolesScopeConsentText}','consent.screen.text'),('b4b8762f-50d4-4491-aea8-357f0737bf38','true','display.on.consent.screen'),('b4b8762f-50d4-4491-aea8-357f0737bf38','false','include.in.token.scope'),('d788b693-45d3-4f4f-9b6b-3c59d8dacdab','${addressScopeConsentText}','consent.screen.text'),('d788b693-45d3-4f4f-9b6b-3c59d8dacdab','true','display.on.consent.screen'),('d788b693-45d3-4f4f-9b6b-3c59d8dacdab','true','include.in.token.scope'),('db09ffc3-6f35-43c2-a3b6-51ec55b9adc1','${profileScopeConsentText}','consent.screen.text'),('db09ffc3-6f35-43c2-a3b6-51ec55b9adc1','true','display.on.consent.screen'),('db09ffc3-6f35-43c2-a3b6-51ec55b9adc1','true','include.in.token.scope'),('ed0a66e8-1873-43b0-938b-94c093a000a9','','consent.screen.text'),('ed0a66e8-1873-43b0-938b-94c093a000a9','false','display.on.consent.screen'),('ed0a66e8-1873-43b0-938b-94c093a000a9','false','include.in.token.scope'),('fd41383b-a59e-46a6-b5f6-829f58beede7','false','display.on.consent.screen'),('fd41383b-a59e-46a6-b5f6-829f58beede7','true','include.in.token.scope');
/*!40000 ALTER TABLE `CLIENT_SCOPE_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_CLIENT`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_CLIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_CLIENT` (
  `CLIENT_ID` varchar(255) NOT NULL,
  `SCOPE_ID` varchar(255) NOT NULL,
  `DEFAULT_SCOPE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`CLIENT_ID`,`SCOPE_ID`),
  KEY `IDX_CLSCOPE_CL` (`CLIENT_ID`),
  KEY `IDX_CL_CLSCOPE` (`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_CLIENT`
--

LOCK TABLES `CLIENT_SCOPE_CLIENT` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_CLIENT` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('03b3ea62-438d-4585-ae3d-863df7b15c22','3328b38d-66eb-40d9-b866-0e913f496d7c',_binary '\0'),('03b3ea62-438d-4585-ae3d-863df7b15c22','4c7fe22c-655f-4cab-ac4b-7dbe5c61039a',_binary ''),('03b3ea62-438d-4585-ae3d-863df7b15c22','5002ebff-add7-4a60-a6c3-4a2d6197a2c3',_binary ''),('03b3ea62-438d-4585-ae3d-863df7b15c22','52ec758a-b9a4-41e7-8716-71f21f7fe7f0',_binary '\0'),('03b3ea62-438d-4585-ae3d-863df7b15c22','5774fffd-6c96-4034-ae97-e0881669d722',_binary ''),('03b3ea62-438d-4585-ae3d-863df7b15c22','83f62477-ebcd-412b-bb61-d2464ecbf959',_binary '\0'),('03b3ea62-438d-4585-ae3d-863df7b15c22','8d837e12-dca6-4763-a286-119a1b8a16f0',_binary ''),('03b3ea62-438d-4585-ae3d-863df7b15c22','a0c244a0-9390-4107-85e6-c2e5e853223b',_binary '\0'),('0ca35df5-937d-42bb-851c-07b8f82426ae','3fdb657c-92dc-4392-8783-b4c2b52d7bcf',_binary '\0'),('0ca35df5-937d-42bb-851c-07b8f82426ae','467711c6-a82f-4814-af06-c94a29fca704',_binary ''),('0ca35df5-937d-42bb-851c-07b8f82426ae','94320587-e15d-44e5-b921-337e62255256',_binary '\0'),('0ca35df5-937d-42bb-851c-07b8f82426ae','b4b8762f-50d4-4491-aea8-357f0737bf38',_binary ''),('0ca35df5-937d-42bb-851c-07b8f82426ae','d788b693-45d3-4f4f-9b6b-3c59d8dacdab',_binary '\0'),('0ca35df5-937d-42bb-851c-07b8f82426ae','db09ffc3-6f35-43c2-a3b6-51ec55b9adc1',_binary ''),('0ca35df5-937d-42bb-851c-07b8f82426ae','ed0a66e8-1873-43b0-938b-94c093a000a9',_binary ''),('0ca35df5-937d-42bb-851c-07b8f82426ae','fd41383b-a59e-46a6-b5f6-829f58beede7',_binary '\0'),('2d1d20d4-0323-458d-b978-cd2a286682b9','3fdb657c-92dc-4392-8783-b4c2b52d7bcf',_binary '\0'),('2d1d20d4-0323-458d-b978-cd2a286682b9','467711c6-a82f-4814-af06-c94a29fca704',_binary ''),('2d1d20d4-0323-458d-b978-cd2a286682b9','94320587-e15d-44e5-b921-337e62255256',_binary '\0'),('2d1d20d4-0323-458d-b978-cd2a286682b9','b4b8762f-50d4-4491-aea8-357f0737bf38',_binary ''),('2d1d20d4-0323-458d-b978-cd2a286682b9','d788b693-45d3-4f4f-9b6b-3c59d8dacdab',_binary '\0'),('2d1d20d4-0323-458d-b978-cd2a286682b9','db09ffc3-6f35-43c2-a3b6-51ec55b9adc1',_binary ''),('2d1d20d4-0323-458d-b978-cd2a286682b9','ed0a66e8-1873-43b0-938b-94c093a000a9',_binary ''),('2d1d20d4-0323-458d-b978-cd2a286682b9','fd41383b-a59e-46a6-b5f6-829f58beede7',_binary '\0'),('3538b8a7-c81d-4ec9-8741-202db96b1a2f','3328b38d-66eb-40d9-b866-0e913f496d7c',_binary '\0'),('3538b8a7-c81d-4ec9-8741-202db96b1a2f','4c7fe22c-655f-4cab-ac4b-7dbe5c61039a',_binary ''),('3538b8a7-c81d-4ec9-8741-202db96b1a2f','5002ebff-add7-4a60-a6c3-4a2d6197a2c3',_binary ''),('3538b8a7-c81d-4ec9-8741-202db96b1a2f','52ec758a-b9a4-41e7-8716-71f21f7fe7f0',_binary '\0'),('3538b8a7-c81d-4ec9-8741-202db96b1a2f','5774fffd-6c96-4034-ae97-e0881669d722',_binary ''),('3538b8a7-c81d-4ec9-8741-202db96b1a2f','83f62477-ebcd-412b-bb61-d2464ecbf959',_binary '\0'),('3538b8a7-c81d-4ec9-8741-202db96b1a2f','8d837e12-dca6-4763-a286-119a1b8a16f0',_binary ''),('3538b8a7-c81d-4ec9-8741-202db96b1a2f','a0c244a0-9390-4107-85e6-c2e5e853223b',_binary '\0'),('41b8abc2-876d-4760-83e9-d5718d861104','3328b38d-66eb-40d9-b866-0e913f496d7c',_binary '\0'),('41b8abc2-876d-4760-83e9-d5718d861104','4c7fe22c-655f-4cab-ac4b-7dbe5c61039a',_binary ''),('41b8abc2-876d-4760-83e9-d5718d861104','5002ebff-add7-4a60-a6c3-4a2d6197a2c3',_binary ''),('41b8abc2-876d-4760-83e9-d5718d861104','52ec758a-b9a4-41e7-8716-71f21f7fe7f0',_binary '\0'),('41b8abc2-876d-4760-83e9-d5718d861104','5774fffd-6c96-4034-ae97-e0881669d722',_binary ''),('41b8abc2-876d-4760-83e9-d5718d861104','83f62477-ebcd-412b-bb61-d2464ecbf959',_binary '\0'),('41b8abc2-876d-4760-83e9-d5718d861104','8d837e12-dca6-4763-a286-119a1b8a16f0',_binary ''),('41b8abc2-876d-4760-83e9-d5718d861104','a0c244a0-9390-4107-85e6-c2e5e853223b',_binary '\0'),('908aac02-ff05-4323-8868-ac055ff4fc49','3fdb657c-92dc-4392-8783-b4c2b52d7bcf',_binary '\0'),('908aac02-ff05-4323-8868-ac055ff4fc49','467711c6-a82f-4814-af06-c94a29fca704',_binary ''),('908aac02-ff05-4323-8868-ac055ff4fc49','94320587-e15d-44e5-b921-337e62255256',_binary '\0'),('908aac02-ff05-4323-8868-ac055ff4fc49','b4b8762f-50d4-4491-aea8-357f0737bf38',_binary ''),('908aac02-ff05-4323-8868-ac055ff4fc49','d788b693-45d3-4f4f-9b6b-3c59d8dacdab',_binary '\0'),('908aac02-ff05-4323-8868-ac055ff4fc49','db09ffc3-6f35-43c2-a3b6-51ec55b9adc1',_binary ''),('908aac02-ff05-4323-8868-ac055ff4fc49','ed0a66e8-1873-43b0-938b-94c093a000a9',_binary ''),('908aac02-ff05-4323-8868-ac055ff4fc49','fd41383b-a59e-46a6-b5f6-829f58beede7',_binary '\0'),('95b34f61-3dc8-43ff-b304-b07690a45b6f','3fdb657c-92dc-4392-8783-b4c2b52d7bcf',_binary '\0'),('95b34f61-3dc8-43ff-b304-b07690a45b6f','467711c6-a82f-4814-af06-c94a29fca704',_binary ''),('95b34f61-3dc8-43ff-b304-b07690a45b6f','94320587-e15d-44e5-b921-337e62255256',_binary '\0'),('95b34f61-3dc8-43ff-b304-b07690a45b6f','b4b8762f-50d4-4491-aea8-357f0737bf38',_binary ''),('95b34f61-3dc8-43ff-b304-b07690a45b6f','d788b693-45d3-4f4f-9b6b-3c59d8dacdab',_binary '\0'),('95b34f61-3dc8-43ff-b304-b07690a45b6f','db09ffc3-6f35-43c2-a3b6-51ec55b9adc1',_binary ''),('95b34f61-3dc8-43ff-b304-b07690a45b6f','ed0a66e8-1873-43b0-938b-94c093a000a9',_binary ''),('95b34f61-3dc8-43ff-b304-b07690a45b6f','fd41383b-a59e-46a6-b5f6-829f58beede7',_binary '\0'),('b45787d7-41bc-4fb7-98ed-e1e6bff85ef9','3fdb657c-92dc-4392-8783-b4c2b52d7bcf',_binary '\0'),('b45787d7-41bc-4fb7-98ed-e1e6bff85ef9','467711c6-a82f-4814-af06-c94a29fca704',_binary ''),('b45787d7-41bc-4fb7-98ed-e1e6bff85ef9','94320587-e15d-44e5-b921-337e62255256',_binary '\0'),('b45787d7-41bc-4fb7-98ed-e1e6bff85ef9','b4b8762f-50d4-4491-aea8-357f0737bf38',_binary ''),('b45787d7-41bc-4fb7-98ed-e1e6bff85ef9','d788b693-45d3-4f4f-9b6b-3c59d8dacdab',_binary '\0'),('b45787d7-41bc-4fb7-98ed-e1e6bff85ef9','db09ffc3-6f35-43c2-a3b6-51ec55b9adc1',_binary ''),('b45787d7-41bc-4fb7-98ed-e1e6bff85ef9','ed0a66e8-1873-43b0-938b-94c093a000a9',_binary ''),('b45787d7-41bc-4fb7-98ed-e1e6bff85ef9','fd41383b-a59e-46a6-b5f6-829f58beede7',_binary '\0'),('bc214d49-b69e-4807-b223-65d603bbec90','3328b38d-66eb-40d9-b866-0e913f496d7c',_binary '\0'),('bc214d49-b69e-4807-b223-65d603bbec90','4c7fe22c-655f-4cab-ac4b-7dbe5c61039a',_binary ''),('bc214d49-b69e-4807-b223-65d603bbec90','5002ebff-add7-4a60-a6c3-4a2d6197a2c3',_binary ''),('bc214d49-b69e-4807-b223-65d603bbec90','52ec758a-b9a4-41e7-8716-71f21f7fe7f0',_binary '\0'),('bc214d49-b69e-4807-b223-65d603bbec90','5774fffd-6c96-4034-ae97-e0881669d722',_binary ''),('bc214d49-b69e-4807-b223-65d603bbec90','83f62477-ebcd-412b-bb61-d2464ecbf959',_binary '\0'),('bc214d49-b69e-4807-b223-65d603bbec90','8d837e12-dca6-4763-a286-119a1b8a16f0',_binary ''),('bc214d49-b69e-4807-b223-65d603bbec90','a0c244a0-9390-4107-85e6-c2e5e853223b',_binary '\0'),('e5918595-c567-4a69-bfd1-0ac9393a561c','3fdb657c-92dc-4392-8783-b4c2b52d7bcf',_binary '\0'),('e5918595-c567-4a69-bfd1-0ac9393a561c','467711c6-a82f-4814-af06-c94a29fca704',_binary ''),('e5918595-c567-4a69-bfd1-0ac9393a561c','94320587-e15d-44e5-b921-337e62255256',_binary '\0'),('e5918595-c567-4a69-bfd1-0ac9393a561c','b4b8762f-50d4-4491-aea8-357f0737bf38',_binary ''),('e5918595-c567-4a69-bfd1-0ac9393a561c','d788b693-45d3-4f4f-9b6b-3c59d8dacdab',_binary '\0'),('e5918595-c567-4a69-bfd1-0ac9393a561c','db09ffc3-6f35-43c2-a3b6-51ec55b9adc1',_binary ''),('e5918595-c567-4a69-bfd1-0ac9393a561c','ed0a66e8-1873-43b0-938b-94c093a000a9',_binary ''),('e5918595-c567-4a69-bfd1-0ac9393a561c','fd41383b-a59e-46a6-b5f6-829f58beede7',_binary '\0'),('e89cb647-9ac1-4636-8c3a-9e5523c27fda','3328b38d-66eb-40d9-b866-0e913f496d7c',_binary '\0'),('e89cb647-9ac1-4636-8c3a-9e5523c27fda','4c7fe22c-655f-4cab-ac4b-7dbe5c61039a',_binary ''),('e89cb647-9ac1-4636-8c3a-9e5523c27fda','5002ebff-add7-4a60-a6c3-4a2d6197a2c3',_binary ''),('e89cb647-9ac1-4636-8c3a-9e5523c27fda','52ec758a-b9a4-41e7-8716-71f21f7fe7f0',_binary '\0'),('e89cb647-9ac1-4636-8c3a-9e5523c27fda','5774fffd-6c96-4034-ae97-e0881669d722',_binary ''),('e89cb647-9ac1-4636-8c3a-9e5523c27fda','83f62477-ebcd-412b-bb61-d2464ecbf959',_binary '\0'),('e89cb647-9ac1-4636-8c3a-9e5523c27fda','8d837e12-dca6-4763-a286-119a1b8a16f0',_binary ''),('e89cb647-9ac1-4636-8c3a-9e5523c27fda','a0c244a0-9390-4107-85e6-c2e5e853223b',_binary '\0'),('ef50b7ea-73db-4f62-83fe-f8ab137c1714','3328b38d-66eb-40d9-b866-0e913f496d7c',_binary '\0'),('ef50b7ea-73db-4f62-83fe-f8ab137c1714','4c7fe22c-655f-4cab-ac4b-7dbe5c61039a',_binary ''),('ef50b7ea-73db-4f62-83fe-f8ab137c1714','5002ebff-add7-4a60-a6c3-4a2d6197a2c3',_binary ''),('ef50b7ea-73db-4f62-83fe-f8ab137c1714','52ec758a-b9a4-41e7-8716-71f21f7fe7f0',_binary '\0'),('ef50b7ea-73db-4f62-83fe-f8ab137c1714','5774fffd-6c96-4034-ae97-e0881669d722',_binary ''),('ef50b7ea-73db-4f62-83fe-f8ab137c1714','83f62477-ebcd-412b-bb61-d2464ecbf959',_binary '\0'),('ef50b7ea-73db-4f62-83fe-f8ab137c1714','8d837e12-dca6-4763-a286-119a1b8a16f0',_binary ''),('ef50b7ea-73db-4f62-83fe-f8ab137c1714','a0c244a0-9390-4107-85e6-c2e5e853223b',_binary '\0'),('f2b2bdbb-ebc8-4057-a5d8-eb287e05765c','3fdb657c-92dc-4392-8783-b4c2b52d7bcf',_binary '\0'),('f2b2bdbb-ebc8-4057-a5d8-eb287e05765c','467711c6-a82f-4814-af06-c94a29fca704',_binary ''),('f2b2bdbb-ebc8-4057-a5d8-eb287e05765c','94320587-e15d-44e5-b921-337e62255256',_binary '\0'),('f2b2bdbb-ebc8-4057-a5d8-eb287e05765c','b4b8762f-50d4-4491-aea8-357f0737bf38',_binary ''),('f2b2bdbb-ebc8-4057-a5d8-eb287e05765c','d788b693-45d3-4f4f-9b6b-3c59d8dacdab',_binary '\0'),('f2b2bdbb-ebc8-4057-a5d8-eb287e05765c','db09ffc3-6f35-43c2-a3b6-51ec55b9adc1',_binary ''),('f2b2bdbb-ebc8-4057-a5d8-eb287e05765c','ed0a66e8-1873-43b0-938b-94c093a000a9',_binary ''),('f2b2bdbb-ebc8-4057-a5d8-eb287e05765c','fd41383b-a59e-46a6-b5f6-829f58beede7',_binary '\0');
/*!40000 ALTER TABLE `CLIENT_SCOPE_CLIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_ROLE_MAPPING` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`ROLE_ID`),
  KEY `IDX_CLSCOPE_ROLE` (`SCOPE_ID`),
  KEY `IDX_ROLE_CLSCOPE` (`ROLE_ID`),
  CONSTRAINT `FK_CL_SCOPE_RM_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_ROLE_MAPPING`
--

LOCK TABLES `CLIENT_SCOPE_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_ROLE_MAPPING` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_ROLE_MAPPING` VALUES ('3328b38d-66eb-40d9-b866-0e913f496d7c','1048fa41-d368-4678-95c5-9f7a3534fe01'),('3fdb657c-92dc-4392-8783-b4c2b52d7bcf','f0a7da7b-7ea2-4664-a5bb-8a450fa11d8f');
/*!40000 ALTER TABLE `CLIENT_SCOPE_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION`
--

DROP TABLE IF EXISTS `CLIENT_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  `REDIRECT_URI` varchar(255) DEFAULT NULL,
  `STATE` varchar(255) DEFAULT NULL,
  `TIMESTAMP` int DEFAULT NULL,
  `SESSION_ID` varchar(36) DEFAULT NULL,
  `AUTH_METHOD` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `AUTH_USER_ID` varchar(36) DEFAULT NULL,
  `CURRENT_ACTION` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_CLIENT_SESSION_SESSION` (`SESSION_ID`),
  CONSTRAINT `FK_B4AO2VCVAT6UKAU74WBWTFQO1` FOREIGN KEY (`SESSION_ID`) REFERENCES `USER_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION`
--

LOCK TABLES `CLIENT_SESSION` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_AUTH_STATUS`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_AUTH_STATUS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_AUTH_STATUS` (
  `AUTHENTICATOR` varchar(36) NOT NULL,
  `STATUS` int DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`AUTHENTICATOR`),
  CONSTRAINT `AUTH_STATUS_CONSTRAINT` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_AUTH_STATUS`
--

LOCK TABLES `CLIENT_SESSION_AUTH_STATUS` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_AUTH_STATUS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_AUTH_STATUS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_NOTE`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_NOTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`NAME`),
  CONSTRAINT `FK5EDFB00FF51C2736` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_NOTE`
--

LOCK TABLES `CLIENT_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_PROT_MAPPER`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_PROT_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_PROT_MAPPER` (
  `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`PROTOCOL_MAPPER_ID`),
  CONSTRAINT `FK_33A8SGQW18I532811V7O2DK89` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_PROT_MAPPER`
--

LOCK TABLES `CLIENT_SESSION_PROT_MAPPER` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_PROT_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_PROT_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_ROLE`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_ROLE` (
  `ROLE_ID` varchar(255) NOT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`ROLE_ID`),
  CONSTRAINT `FK_11B7SGQW18I532811V7O2DV76` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_ROLE`
--

LOCK TABLES `CLIENT_SESSION_ROLE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_ROLE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_USER_SESSION_NOTE`
--

DROP TABLE IF EXISTS `CLIENT_USER_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_USER_SESSION_NOTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` text,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`NAME`),
  CONSTRAINT `FK_CL_USR_SES_NOTE` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_USER_SESSION_NOTE`
--

LOCK TABLES `CLIENT_USER_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `CLIENT_USER_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_USER_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPONENT`
--

DROP TABLE IF EXISTS `COMPONENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPONENT` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_TYPE` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `SUB_TYPE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_COMPONENT_REALM` (`REALM_ID`),
  KEY `IDX_COMPONENT_PROVIDER_TYPE` (`PROVIDER_TYPE`),
  CONSTRAINT `FK_COMPONENT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPONENT`
--

LOCK TABLES `COMPONENT` WRITE;
/*!40000 ALTER TABLE `COMPONENT` DISABLE KEYS */;
INSERT INTO `COMPONENT` VALUES ('137005b3-84b4-4066-9a4c-4be2c705b2d6','Full Scope Disabled','master','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('16108041-b8d0-4c3f-a908-ef99a3648a08','Trusted Hosts','stock-manager','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','stock-manager','anonymous'),('1c4ff791-4a5e-433b-a2a1-2261349bfea7','Allowed Protocol Mapper Types','stock-manager','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','stock-manager','authenticated'),('29d3c5df-98f9-4d72-a021-0c2b6faeed83','rsa-generated','master','rsa-generated','org.keycloak.keys.KeyProvider','master',NULL),('2a8323ad-758f-4e4b-97e1-d1e91664bb03','rsa-generated','stock-manager','rsa-generated','org.keycloak.keys.KeyProvider','stock-manager',NULL),('2b2c3ff8-8ac0-4478-8e4a-116430cf3de8','Consent Required','stock-manager','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','stock-manager','anonymous'),('3a392992-377b-467d-acde-7784faaccfcb','Allowed Client Scopes','master','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('5798a461-c8be-413c-ac15-28ba69fb7323','Max Clients Limit','master','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('5a47e45a-01c6-4213-9b03-f1fedf8c03b6','hmac-generated','master','hmac-generated','org.keycloak.keys.KeyProvider','master',NULL),('9d2314ac-dc26-4eef-bdd0-bbc7d85d6e34','Allowed Client Scopes','stock-manager','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','stock-manager','authenticated'),('9da72920-b1e1-4239-a285-0f1d32631832','Allowed Protocol Mapper Types','master','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('9eabbc1b-4394-4608-b75b-fa8ae59d56d1','hmac-generated','stock-manager','hmac-generated','org.keycloak.keys.KeyProvider','stock-manager',NULL),('ad44da5d-f511-4742-9e27-8d82105c4731','Trusted Hosts','master','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('b091f265-9cc3-45ed-856f-1e6981c53902','aes-generated','stock-manager','aes-generated','org.keycloak.keys.KeyProvider','stock-manager',NULL),('c071c08d-52ed-4045-b9df-897c88e55604','Allowed Client Scopes','stock-manager','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','stock-manager','anonymous'),('c7015ac1-6bbf-4a7d-a621-55af07dbc54d','Consent Required','master','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('cbd7ba9c-ece9-4b6e-8cfd-733b939ffd2f','aes-generated','master','aes-generated','org.keycloak.keys.KeyProvider','master',NULL),('dbeeb777-8450-40e1-bb76-66027999bd58','Full Scope Disabled','stock-manager','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','stock-manager','anonymous'),('e54b6aa9-2279-47c7-8d85-9fb7345c4baf','Max Clients Limit','stock-manager','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','stock-manager','anonymous'),('ec93af6d-0555-4581-950b-234571e6ce03','Allowed Client Scopes','master','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','authenticated'),('f096cb0c-3026-4dfc-af34-9f4aef8553a6','Allowed Protocol Mapper Types','master','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','authenticated'),('f18d2b9e-ed8d-4b78-8439-b5108ced2b35','Allowed Protocol Mapper Types','stock-manager','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','stock-manager','anonymous');
/*!40000 ALTER TABLE `COMPONENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPONENT_CONFIG`
--

DROP TABLE IF EXISTS `COMPONENT_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPONENT_CONFIG` (
  `ID` varchar(36) NOT NULL,
  `COMPONENT_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_COMPO_CONFIG_COMPO` (`COMPONENT_ID`),
  CONSTRAINT `FK_COMPONENT_CONFIG` FOREIGN KEY (`COMPONENT_ID`) REFERENCES `COMPONENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPONENT_CONFIG`
--

LOCK TABLES `COMPONENT_CONFIG` WRITE;
/*!40000 ALTER TABLE `COMPONENT_CONFIG` DISABLE KEYS */;
INSERT INTO `COMPONENT_CONFIG` VALUES ('01e3e30c-a796-42ed-97c3-550173010916','f096cb0c-3026-4dfc-af34-9f4aef8553a6','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('07d358d8-3014-4bb2-917d-833da7fd7c66','f18d2b9e-ed8d-4b78-8439-b5108ced2b35','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('08888cad-be37-4405-9965-86c87454b796','cbd7ba9c-ece9-4b6e-8cfd-733b939ffd2f','kid','dced79d9-f39c-47ed-8661-b37106bc46c2'),('10cd1a16-0215-4211-8682-4ab0bea9b75c','1c4ff791-4a5e-433b-a2a1-2261349bfea7','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('179c620e-d4df-4fcc-b40b-54dd27351a2d','f096cb0c-3026-4dfc-af34-9f4aef8553a6','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('18e9a694-69ba-486c-85bb-37215e259b47','f18d2b9e-ed8d-4b78-8439-b5108ced2b35','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('2e82ff90-e90e-44ef-b09a-435e80515bf7','cbd7ba9c-ece9-4b6e-8cfd-733b939ffd2f','priority','100'),('33f9605f-f4c7-4824-97c2-c304eede9abc','2a8323ad-758f-4e4b-97e1-d1e91664bb03','certificate','MIICqTCCAZECBgF5qR/ofzANBgkqhkiG9w0BAQsFADAYMRYwFAYDVQQDDA1zdG9jay1tYW5hZ2VyMB4XDTIxMDUyNjE0NDAxMVoXDTMxMDUyNjE0NDE1MVowGDEWMBQGA1UEAwwNc3RvY2stbWFuYWdlcjCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBANgW6eIEsoi4T2VEFnl4fQIYz3WI8/9QQ7LMCQT4cDBUgOBvWoZNVP3cr3uNOa+P/v026IEFI+SVZx2CFvL5VQ0cCSMd2wJfxGFLZb3QvbC1WJwDuYAMZ/QEjffmAHhB10mwSRpqIBUicBHtVJSzNSPRbd+uFbPaVXRJBhoS8k5R/92IGyMZ8/I3SWStJN0Bcnq0uQSmz8UHaNnApSE1PiZNLzKwr8tqRRmRA1PRD/zTt1uboDvCSARUs1FW45iwdhRvSpGncoh8mfHzqZxWpT6IQVFVqhlxGehDvpyL9En7Czab0OTu00RnwCv0WPKwcEzrIFt3EeyrhEMI7UxNMXsCAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAReToqc7YcHtFZ7gARP/FOZcZAvun6lGL82CZf1W11uD2tbEfGiM4hJR5VM4dhI6tTE5951f9kauUjO+U2HgaB+uTsvEf47+U+/bfjaaGVE50jWfeW102DJposjFv9oY7x7aAoc7PbluFdzqiC1HSdsrltOfU+4GHVF3e5rWVvgMpgdUvRN3qFlFkQC7BVvGUyzQ91+JOOdKAOud4RRWInY/bBVxeVNWfIG/fG2nKRotnIbzG2Bcksd1UCQNOwrtNOIkFC4L/4Hc4mjnHmxvKsfMbFwpGy24zL+y8cGudf9MmL5iJD/aInvoXqvSZ8IqKFbE3Hz1xb2U/hnn+LgFKcw=='),('3d2380da-558b-4622-adf9-7f5401e655d0','3a392992-377b-467d-acde-7784faaccfcb','allow-default-scopes','true'),('3eb28d4f-304d-4bce-bffa-acb0299b1a2d','16108041-b8d0-4c3f-a908-ef99a3648a08','host-sending-registration-request-must-match','true'),('44292c2f-79a9-4e2c-ae93-85a44a4e5bd7','f096cb0c-3026-4dfc-af34-9f4aef8553a6','allowed-protocol-mapper-types','oidc-address-mapper'),('45a224a4-e4b4-4d64-bae8-3bb8c40e58fc','29d3c5df-98f9-4d72-a021-0c2b6faeed83','certificate','MIICmzCCAYMCBgF5qR/g6TANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjEwNTI2MTQ0MDA5WhcNMzEwNTI2MTQ0MTQ5WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCsnQZ2rwVO12Fl7SePwu3CN2bR3vcyPpmBV1inJJs4GRpc0TM6VC2mh7yPKI9qtiv3rGh3sI1ksBMDsBHu9jBMmoMFLYN1906jsBCt0IugDo/kcKFoFIhimGHCChQJf7AENjwhV+oMcYEhqCEn1fPTs41puVAZmq4AFk57as8OnraMVGrXaSr8Ci3youRqlka4w9jDnf+zYZ9K2Yr1+i3OcQBvRgwRGEZDQxlbbsDp36zkySgrGd/pUi8o8uIoFDbWScMTJYeWv3xOhZXElLOejLnNHZfT8K7VrtDxL38fbb/4jdzqCIz1FXOT+ICZqEGe22TcEDZ86MQpy0WT0WC3AgMBAAEwDQYJKoZIhvcNAQELBQADggEBAHk6PfRZNSqo9hQ3bUhIaIW6nwjCdO0SN2L4mfbjv0JM/jLO+GFNgxM+7mmpb60wpzgkRNeI7NoLx9TZBOUXrFQa6Rj7jROCoKyVvDIh3POBcRM7Zknv/kOwXL1KuUAELLpgn0twaFcbb/BGIHUHYFewICLoJbqBl66RxYWTduALdvlwZr6CTdrxNV4WQntfDf9FZ+Y+4tTkMeCl/TGoev39h6Mxvju5PNVlkZJrYAYBLSIisgF+chzpQhO+Hbyphcl5tUmNGsCKPmOoMi/BNZnfcBvHDZyGUnwbpAsENXzzR46Z7KIKrgjRpbW6XLjp3llOKCYj9xtbFPVLDsZ7ZS0='),('45c07537-4ee1-4af0-9f62-442959aee3e5','16108041-b8d0-4c3f-a908-ef99a3648a08','client-uris-must-match','true'),('48bf2030-56ea-444c-bba1-3bf920567095','f096cb0c-3026-4dfc-af34-9f4aef8553a6','allowed-protocol-mapper-types','saml-role-list-mapper'),('48c52ece-9d3e-4e2a-b5d1-4ebdb3bd4d48','9da72920-b1e1-4239-a285-0f1d32631832','allowed-protocol-mapper-types','oidc-address-mapper'),('50049eb7-82e1-48a3-b423-3df4d1d41700','e54b6aa9-2279-47c7-8d85-9fb7345c4baf','max-clients','200'),('508f393d-baef-4292-a448-b4f9a805b62d','f18d2b9e-ed8d-4b78-8439-b5108ced2b35','allowed-protocol-mapper-types','saml-user-property-mapper'),('53d7e572-8dcc-436c-887e-e37428c37a74','9da72920-b1e1-4239-a285-0f1d32631832','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('55bfa0fb-3efa-4315-af2f-25b73d48c51a','f18d2b9e-ed8d-4b78-8439-b5108ced2b35','allowed-protocol-mapper-types','oidc-address-mapper'),('5699afd7-f023-4c12-882f-75e0a763347d','1c4ff791-4a5e-433b-a2a1-2261349bfea7','allowed-protocol-mapper-types','oidc-address-mapper'),('59b3bf26-5b82-40a0-98db-7a624550f392','9da72920-b1e1-4239-a285-0f1d32631832','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('61304e09-a909-4cce-a295-041d236c0470','f096cb0c-3026-4dfc-af34-9f4aef8553a6','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('6481ec77-334d-4b03-a7a4-70b9275731ab','ec93af6d-0555-4581-950b-234571e6ce03','allow-default-scopes','true'),('64a99dd8-71ef-4954-8cc6-bc11983c2e94','9da72920-b1e1-4239-a285-0f1d32631832','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('66cd1ae0-11e4-4159-b190-b9a54d7d1c4f','9eabbc1b-4394-4608-b75b-fa8ae59d56d1','secret','PIL7Q-nqbD0edWB3el0rSdK8bAuKCOORjlnDSl9KCZkSLAJ3IvbYVehYi47qbn3QuS6F_PqV0GjOviGL_j4DqA'),('6b8249dd-c5cc-4910-8614-f55bfee15172','9eabbc1b-4394-4608-b75b-fa8ae59d56d1','priority','100'),('6cbac832-6521-460a-b574-d9f856e822eb','c071c08d-52ed-4045-b9df-897c88e55604','allow-default-scopes','true'),('6d250dec-8b02-46fd-b53e-a15cba0e5fb1','cbd7ba9c-ece9-4b6e-8cfd-733b939ffd2f','secret','jw2gtOqmOHOJifzmjAfYzg'),('70cdb9f5-b27f-4e8d-9039-6741f5052400','5798a461-c8be-413c-ac15-28ba69fb7323','max-clients','200'),('7387e6a4-0b12-4c7a-877e-4c7ab69effef','f096cb0c-3026-4dfc-af34-9f4aef8553a6','allowed-protocol-mapper-types','saml-user-property-mapper'),('751fe078-e5cf-4a48-9ecf-1593b5465ca8','b091f265-9cc3-45ed-856f-1e6981c53902','priority','100'),('7751e063-23d6-4799-ba91-2c269f4cf3f8','b091f265-9cc3-45ed-856f-1e6981c53902','kid','4eee62b4-152f-4077-bdd8-75e741a425b0'),('7ab1e425-c4c0-4019-a6c5-6a8fe79cd010','29d3c5df-98f9-4d72-a021-0c2b6faeed83','priority','100'),('7dddda6a-e6fa-4c0c-a0bc-d07030e2dacb','1c4ff791-4a5e-433b-a2a1-2261349bfea7','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('80c478c9-76d6-4fdf-b8e7-830c089b3f6c','f096cb0c-3026-4dfc-af34-9f4aef8553a6','allowed-protocol-mapper-types','oidc-full-name-mapper'),('868a18c9-e245-434c-9a9d-8a3c20221810','f18d2b9e-ed8d-4b78-8439-b5108ced2b35','allowed-protocol-mapper-types','oidc-full-name-mapper'),('8758b54c-3bb3-43b0-a9a1-af9b56f314aa','9eabbc1b-4394-4608-b75b-fa8ae59d56d1','kid','96261779-5095-402b-ba15-b3a16f441dbc'),('88f5153b-08d2-41a3-a67f-85ef13e2b831','1c4ff791-4a5e-433b-a2a1-2261349bfea7','allowed-protocol-mapper-types','oidc-full-name-mapper'),('8de02fe7-752a-4ccd-87d9-1e5634d1e4f1','1c4ff791-4a5e-433b-a2a1-2261349bfea7','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('91f88aea-9087-42c2-b276-efd99d2cfbe3','9da72920-b1e1-4239-a285-0f1d32631832','allowed-protocol-mapper-types','oidc-full-name-mapper'),('94c031fb-8d3d-4211-9a09-1dad16209d41','1c4ff791-4a5e-433b-a2a1-2261349bfea7','allowed-protocol-mapper-types','saml-role-list-mapper'),('97676cb9-7a9d-433d-8630-35a3852b831d','5a47e45a-01c6-4213-9b03-f1fedf8c03b6','kid','fec12993-2d88-47a1-b501-56ba84efd477'),('a3a7ae35-aaf9-4096-b94a-586367ba0437','f096cb0c-3026-4dfc-af34-9f4aef8553a6','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('aef76542-bb35-49f8-bc13-68500dff6c86','29d3c5df-98f9-4d72-a021-0c2b6faeed83','privateKey','MIIEowIBAAKCAQEArJ0Gdq8FTtdhZe0nj8Ltwjdm0d73Mj6ZgVdYpySbOBkaXNEzOlQtpoe8jyiParYr96xod7CNZLATA7AR7vYwTJqDBS2DdfdOo7AQrdCLoA6P5HChaBSIYphhwgoUCX+wBDY8IVfqDHGBIaghJ9Xz07ONablQGZquABZOe2rPDp62jFRq12kq/Aot8qLkapZGuMPYw53/s2GfStmK9fotznEAb0YMERhGQ0MZW27A6d+s5MkoKxnf6VIvKPLiKBQ21knDEyWHlr98ToWVxJSznoy5zR2X0/Cu1a7Q8S9/H22/+I3c6giM9RVzk/iAmahBnttk3BA2fOjEKctFk9FgtwIDAQABAoIBABUtDmXxAs2xTpmahof0egahlVOZ7umTFHHxrUaUDxbKvZk1cPtu6ErNzCwj5bRJtQslc4t7dV0s3KhPKWQPf81mBzzTYJVQSa17JBCuzPJN1wlHaAXEvxaZayTK57pil81seeP9TRFJu3XNkoO4k7kdBfQ6b8E0YLRSCD7L06sPSSr3g5ZQEpFltPZE928E8xr2Id1njSwECpQ0q7t6ECYz+spD+QO/UPDAr3HFf6Fx4VaTs5MFbWFGqw+i0t0T1DfIsH5tG9IM+jmBweKAqnGvpUoJ6tWdwaoqwuEuV4A3n9YrxXi5uhosxb2xKXzJcoA1xl9cHR348tvng1tHu8ECgYEA+gKNsQ12vk2at0GQFLL4m0p1zZYg2o7x4P7qwuCHHXALQKC6+NwIB3ksxMaWPXgoDRGvUm3Iq/jUD3zJwG56TaCuBwqZYUiMife98oZUBaiLt3RdPKQY19t30HrAP6PdHd6o91HYVqekY/gyBdqNgBs4g1Jb5YNEeEj9iacRkJMCgYEAsL/BrWBfrJIm6zrRrLFc5sjysqzOk1NEfA9U7cdRlE77fymFHKQdFkkk1/EnbxmIqoIxM4T9o846/hpFEnHPXL152Nh7AuzePclHqDO6R/7aUsldnzazsQaONlbPQhNo5OjfLUi9PZC5qSFJb1lgEG02KHFtGuggk45zlaB82c0CgYB/gW3iLouw4sNVUwq4g85m5MLP5xE6ZkzWAyyX1wsR6GLUwySYZx9xMEu0z9Mv5mgGwk44K+V8T5tXir0adz3I+XnH/Y/cHbQPaVpmpjuT5zHajm4+zzIcZMHmgbQqwNe0tCpYeFVtXHJqydo5Qg2ImFlqIEbd9uSktBUabyp2IQKBgGkgZM3+eGloNIXM4lFY3OzXsKLdbbDq4dz4MYeL+dXAdI3Z4DZ81mAe+S8HXHEUOtlPvnvqKgJ381aXwWWLE88RU5vKhr/iqv0M7vX4bl/MEYcUBf9gxdgREhz33SZr7QPaDoQcs5Ieto8GIWt9OUoL6x56+G38iwO4wr7ISfoxAoGBAOgCB0W1swR9aC8yOXcuDTX1SHBJRge18iLVB1W+Mk1jGD2HyQRP9GMpGsTE5Q9q1lm/VQhud0FZr9fp1FUL8EMtBjnME4IGddJDcAgXmlmd6i68mT2q/T1kD+HTYvdbxXmGNildlid4hZ0zCOvU7o+u/62zPI1KhjlxCh1Lfq77'),('b9f007a1-45dc-4e82-a6d3-72de03918d9d','5a47e45a-01c6-4213-9b03-f1fedf8c03b6','priority','100'),('ba4d564f-1c21-44f7-85da-a98d33d61d54','2a8323ad-758f-4e4b-97e1-d1e91664bb03','privateKey','MIIEpAIBAAKCAQEA2Bbp4gSyiLhPZUQWeXh9AhjPdYjz/1BDsswJBPhwMFSA4G9ahk1U/dyve405r4/+/TbogQUj5JVnHYIW8vlVDRwJIx3bAl/EYUtlvdC9sLVYnAO5gAxn9ASN9+YAeEHXSbBJGmogFSJwEe1UlLM1I9Ft364Vs9pVdEkGGhLyTlH/3YgbIxnz8jdJZK0k3QFyerS5BKbPxQdo2cClITU+Jk0vMrCvy2pFGZEDU9EP/NO3W5ugO8JIBFSzUVbjmLB2FG9KkadyiHyZ8fOpnFalPohBUVWqGXEZ6EO+nIv0SfsLNpvQ5O7TRGfAK/RY8rBwTOsgW3cR7KuEQwjtTE0xewIDAQABAoIBAEROGegj6/tjp1UvTJthBsLe7NUOUXJnAL9H16IGlg/w5jwLduX1E+SbGa1IWu+v6L5J2PzPjyT2RP4C3RY40jWuowTCrzP06bKHjsWNciilajkGxGBBi6qKtgWiYoug5FiarMD4wuNrW1mPV6kZbLbBwKVv9dRAM7rqSk97pbQzinyf24wkVbdd7q+Z0CQdbsfPkxLCwYtbeYSubOUY4s28r7OTRHCArGm+b5HIwcHkh4BQjP5+8StH+fVhlCFZXC8OROdQY6UCe22ECMFpKQbE2uFB96TxdEN1tVadl9aaWLjGu4xuGPJYFC3kRh7sfD6O6vxIVOqy8kBJ5Z+I1OECgYEA9rF45eMzLZixDRefB2HlD1kxQIYRZOFQeMD5GBcbkAnj6hWvdAclbVjLiKDPXMl/xPcOcTq41+ulWTmg2k2NhH3Oa6vBFuRDSo0nvhJtJmXVQFSYO4dfmM7Co8Q1xXV1row3OXn/W4i/8EfjxN1/4jYkb1Gbi6UtW/J8VB8d370CgYEA4D3f80858XTpw1Ns7QPqLfpV6N7NUc1cBkoDSvT4thYXJfgLKzXYoNr71iSLUeOE3Z8gOQzZ/SSusaqfuXoHC8gHSn0KwGmsCFy+/ZzFVO4tnsrarv3pc2VnsBJIQz4Tx37Z/BF+2Sel87QclwJTEVamivADjF8F+v8WCmdiLZcCgYBkYSSLjl5lwErSw/jOvTPCgg17btInFVN0PzlcZxKtEokt1/MTqFC/ZLE1ABJAdDFMSScURcuu+FDItJ1SFtptve8/epzQHsOO008HlWHajPcv/PwQxO3ONNuYXZ9voHLpOl7CQXT5nvRS5j20/lgqCNPcg/1h3i1Ny6ZxaFP0lQKBgQDTY+D7iGNSKOm5laqooLkhUM2t8mNRyysGTr1d6yOO27JEu9kjieZGdUlU7SxdLQNyvPBud5wEFJGOsQ9TlSKRS6b75Ha/Pp7LX0s435Hy53kgKZEPyBNMEns1s3Zl1V5mAUJTatbOtZ6u58rP3IQcYzgq3+ooaOfFXrUTZ7RYzwKBgQDc36ddgD7scQ/ujGMhpZt9bIslCpK0AgQqOsVFjHbnJR/YYHn2+dzEhnS9pL9mkEcERmMJ/e5VVKWFssrzM4Xk5GEwI6TR0F2PZxMcu/cqY6DjNjDC9MEPmbCFmq+gCVT/5avWdlNepeoNBvGsXLafq7zD5fo2dnUBoKcj+aUYTg=='),('bb59c908-ddd0-479d-851e-fc2ab64e1066','9eabbc1b-4394-4608-b75b-fa8ae59d56d1','algorithm','HS256'),('bf631cec-8e5e-431d-a06f-5a7e57ba6ead','b091f265-9cc3-45ed-856f-1e6981c53902','secret','Q-s8ryQKHU2N9mLY3KBfUw'),('c2e12033-f7a1-4bfc-b4d6-a19efabe4977','f18d2b9e-ed8d-4b78-8439-b5108ced2b35','allowed-protocol-mapper-types','saml-role-list-mapper'),('c6c776d7-a014-49eb-ac76-05464958bf56','9da72920-b1e1-4239-a285-0f1d32631832','allowed-protocol-mapper-types','saml-role-list-mapper'),('d24eebb3-18ab-48db-ac68-9337d3385eec','f18d2b9e-ed8d-4b78-8439-b5108ced2b35','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('d9177053-1a87-4d2f-9d3c-5f58453ebd89','ad44da5d-f511-4742-9e27-8d82105c4731','host-sending-registration-request-must-match','true'),('dd39ecb4-cf9e-4083-9b33-1597e6e8e947','9da72920-b1e1-4239-a285-0f1d32631832','allowed-protocol-mapper-types','saml-user-property-mapper'),('df2e3ccb-ce22-4ca0-b94c-4be020dd4180','ad44da5d-f511-4742-9e27-8d82105c4731','client-uris-must-match','true'),('e0135754-75f8-467a-ad0c-627cfeacbc3e','f18d2b9e-ed8d-4b78-8439-b5108ced2b35','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('ed1981d1-9e1f-4d8a-a30c-ab254007c879','1c4ff791-4a5e-433b-a2a1-2261349bfea7','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('ee849316-b06a-438d-bb0a-cd527cf72352','9da72920-b1e1-4239-a285-0f1d32631832','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('ef0f151f-6d93-47d7-91ac-1c0325c889b8','1c4ff791-4a5e-433b-a2a1-2261349bfea7','allowed-protocol-mapper-types','saml-user-property-mapper'),('f24693c3-b5eb-45fa-a6d5-125f79cd81c8','2a8323ad-758f-4e4b-97e1-d1e91664bb03','priority','100'),('f4b7ee9e-1784-493f-915c-950201dcdabc','9d2314ac-dc26-4eef-bdd0-bbc7d85d6e34','allow-default-scopes','true'),('fb3c30f0-b2e0-48a8-be0c-3b02ea74c9fd','5a47e45a-01c6-4213-9b03-f1fedf8c03b6','secret','kPpXgh22iePDJenFGAEBLUTgjol3YSrQ6neM_VFMlnsaoqFqpiimwMPXr0s08pQjaGV2XCoa6LLxIQnBpZEPjQ'),('fe44b107-9166-4780-9480-f9eea0fa533f','5a47e45a-01c6-4213-9b03-f1fedf8c03b6','algorithm','HS256');
/*!40000 ALTER TABLE `COMPONENT_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPOSITE_ROLE`
--

DROP TABLE IF EXISTS `COMPOSITE_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPOSITE_ROLE` (
  `COMPOSITE` varchar(36) NOT NULL,
  `CHILD_ROLE` varchar(36) NOT NULL,
  PRIMARY KEY (`COMPOSITE`,`CHILD_ROLE`),
  KEY `IDX_COMPOSITE` (`COMPOSITE`),
  KEY `IDX_COMPOSITE_CHILD` (`CHILD_ROLE`),
  CONSTRAINT `FK_A63WVEKFTU8JO1PNJ81E7MCE2` FOREIGN KEY (`COMPOSITE`) REFERENCES `KEYCLOAK_ROLE` (`ID`),
  CONSTRAINT `FK_GR7THLLB9LU8Q4VQA4524JJY8` FOREIGN KEY (`CHILD_ROLE`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPOSITE_ROLE`
--

LOCK TABLES `COMPOSITE_ROLE` WRITE;
/*!40000 ALTER TABLE `COMPOSITE_ROLE` DISABLE KEYS */;
INSERT INTO `COMPOSITE_ROLE` VALUES ('044ebe4c-c2d6-4c4b-a26d-d0c43b0300d3','1048fa41-d368-4678-95c5-9f7a3534fe01'),('044ebe4c-c2d6-4c4b-a26d-d0c43b0300d3','16532726-dfad-4a31-ae0e-6d7be93aa23c'),('044ebe4c-c2d6-4c4b-a26d-d0c43b0300d3','78dd6939-5476-4f56-93b1-bb0eb2285fb5'),('044ebe4c-c2d6-4c4b-a26d-d0c43b0300d3','9ce5309d-9f8f-4972-814f-a5ef07df0d43'),('05a69b8f-ae9d-479f-9d83-74e05b049810','2017a5b0-43db-4e93-8f7f-44f3db7c7c6c'),('05a69b8f-ae9d-479f-9d83-74e05b049810','40e02ecd-0b24-41ff-87c4-175223e3dc85'),('08a349ff-c7b6-4f1d-80f3-1324cc894d91','02aa7a7d-0e03-4965-99fc-03b35c5f2a80'),('3f66f5fc-764d-449d-8bf9-6b757b02bc31','08a349ff-c7b6-4f1d-80f3-1324cc894d91'),('3f66f5fc-764d-449d-8bf9-6b757b02bc31','a7d65768-b3ec-400b-989c-626e8ab470af'),('3f66f5fc-764d-449d-8bf9-6b757b02bc31','be71abc0-1b0e-4df4-ae2c-1c84452c1095'),('3f66f5fc-764d-449d-8bf9-6b757b02bc31','f0a7da7b-7ea2-4664-a5bb-8a450fa11d8f'),('589bd224-5b5b-4088-97c7-f3f53309d50c','3138f4f0-863d-4758-8abb-c68e8cf408c4'),('78dd6939-5476-4f56-93b1-bb0eb2285fb5','4c104c6b-870c-4d45-b2b6-4512c49cd4cf'),('84b9e84a-014a-4286-b5cb-1e2a2c86e415','501518f8-728c-4c25-948c-a3273e636d93'),('91de8ea7-705a-45c9-a44e-8153ed67a8f5','77be99e0-5eeb-4dbd-bc4c-235b97c9e9b9'),('9b9829ba-6862-4791-a582-314e5731fe48','b94aebad-bd67-4116-9ce4-bba11891a472'),('9fced1c4-8a54-4bbc-a588-d54b13ff6fde','6927e7d9-9753-47b4-9978-ff5759e6df8d'),('9fced1c4-8a54-4bbc-a588-d54b13ff6fde','b3441c69-e2ab-4b35-8353-ba07dae0f63e'),('a0ac0c88-ed70-4219-a780-04b4719d7f50','05a69b8f-ae9d-479f-9d83-74e05b049810'),('a0ac0c88-ed70-4219-a780-04b4719d7f50','100411f8-ffe1-424a-886c-9e601f3d905f'),('a0ac0c88-ed70-4219-a780-04b4719d7f50','2017a5b0-43db-4e93-8f7f-44f3db7c7c6c'),('a0ac0c88-ed70-4219-a780-04b4719d7f50','21a488a9-4a41-4b5e-9806-5ddf54e5cd15'),('a0ac0c88-ed70-4219-a780-04b4719d7f50','3cf99ec0-8fb1-4e76-8ef8-a9047287037a'),('a0ac0c88-ed70-4219-a780-04b4719d7f50','403f2da6-83be-454f-855c-3b8f6e5f01a7'),('a0ac0c88-ed70-4219-a780-04b4719d7f50','408583f2-8d4a-48d7-bf93-5da9cc8fdcf9'),('a0ac0c88-ed70-4219-a780-04b4719d7f50','40e02ecd-0b24-41ff-87c4-175223e3dc85'),('a0ac0c88-ed70-4219-a780-04b4719d7f50','5bd666c1-3aa8-415a-99f6-bb5c6cad86cb'),('a0ac0c88-ed70-4219-a780-04b4719d7f50','7eefe22d-f9e3-4f93-9946-ee3bf4b66e9c'),('a0ac0c88-ed70-4219-a780-04b4719d7f50','8d89d6e7-aac5-4b53-aac4-d36d20fd7c79'),('a0ac0c88-ed70-4219-a780-04b4719d7f50','8f7a4e95-b7ca-44f1-9b22-f7a198405495'),('a0ac0c88-ed70-4219-a780-04b4719d7f50','993727c8-5c4d-45dc-8985-7543f7626726'),('a0ac0c88-ed70-4219-a780-04b4719d7f50','9eaebe58-64f9-4fad-adb6-8af7def9c619'),('a0ac0c88-ed70-4219-a780-04b4719d7f50','9ff94732-0b79-4af3-b276-a9c8b599b509'),('a0ac0c88-ed70-4219-a780-04b4719d7f50','c0dc893c-d1a9-493c-b24c-8b0ef8d5c76f'),('a0ac0c88-ed70-4219-a780-04b4719d7f50','c7cde9ac-21a4-43ae-8ada-ee76551f46b4'),('a0ac0c88-ed70-4219-a780-04b4719d7f50','e71097f2-197f-47a8-98ba-685b13c3fba1'),('ab07426c-ff4d-40ff-b4ce-ab5aac3f0db2','00301d4f-2649-461d-8dc2-c3b2beb3fa7a'),('ab07426c-ff4d-40ff-b4ce-ab5aac3f0db2','151cf68e-1f6b-4596-9b9e-c6d0b8de8757'),('ab07426c-ff4d-40ff-b4ce-ab5aac3f0db2','16ed39a0-5a9d-425e-913c-8256bb376262'),('ab07426c-ff4d-40ff-b4ce-ab5aac3f0db2','1f6e9ba2-3c02-4ff0-bfdb-4f50e5a4a593'),('ab07426c-ff4d-40ff-b4ce-ab5aac3f0db2','20635ba4-7d94-47ae-acb2-a3f57f833c59'),('ab07426c-ff4d-40ff-b4ce-ab5aac3f0db2','290e282f-285d-48f6-a411-32222d0601e4'),('ab07426c-ff4d-40ff-b4ce-ab5aac3f0db2','2c0f711b-9d36-4c28-877a-61da68711752'),('ab07426c-ff4d-40ff-b4ce-ab5aac3f0db2','3138f4f0-863d-4758-8abb-c68e8cf408c4'),('ab07426c-ff4d-40ff-b4ce-ab5aac3f0db2','31a7d061-affa-4ed1-ac2f-b47e6534b0e5'),('ab07426c-ff4d-40ff-b4ce-ab5aac3f0db2','559f0606-fe64-4cb3-af96-435680c31295'),('ab07426c-ff4d-40ff-b4ce-ab5aac3f0db2','589bd224-5b5b-4088-97c7-f3f53309d50c'),('ab07426c-ff4d-40ff-b4ce-ab5aac3f0db2','63bc1b45-86c5-4816-a1fb-4ab2a7778497'),('ab07426c-ff4d-40ff-b4ce-ab5aac3f0db2','67bad96e-0990-4e00-ad9b-a6589c5f1153'),('ab07426c-ff4d-40ff-b4ce-ab5aac3f0db2','6927e7d9-9753-47b4-9978-ff5759e6df8d'),('ab07426c-ff4d-40ff-b4ce-ab5aac3f0db2','70fc2f99-3b1f-4918-bd53-4ad587c20247'),('ab07426c-ff4d-40ff-b4ce-ab5aac3f0db2','77be99e0-5eeb-4dbd-bc4c-235b97c9e9b9'),('ab07426c-ff4d-40ff-b4ce-ab5aac3f0db2','7b432b13-613c-4511-9443-af8280f9176b'),('ab07426c-ff4d-40ff-b4ce-ab5aac3f0db2','7f172102-6edb-4ca4-b418-d3e3c02db499'),('ab07426c-ff4d-40ff-b4ce-ab5aac3f0db2','7fb46486-5835-4d4e-8a52-a128f42c08b4'),('ab07426c-ff4d-40ff-b4ce-ab5aac3f0db2','8493008f-1275-4646-80c2-5a83148a0d9d'),('ab07426c-ff4d-40ff-b4ce-ab5aac3f0db2','84d9fa56-23e3-40f3-9231-dba04c680321'),('ab07426c-ff4d-40ff-b4ce-ab5aac3f0db2','91de8ea7-705a-45c9-a44e-8153ed67a8f5'),('ab07426c-ff4d-40ff-b4ce-ab5aac3f0db2','963092d6-f474-41cc-aa33-de4af1f38087'),('ab07426c-ff4d-40ff-b4ce-ab5aac3f0db2','9fced1c4-8a54-4bbc-a588-d54b13ff6fde'),('ab07426c-ff4d-40ff-b4ce-ab5aac3f0db2','a2e7547c-c4d6-4bc2-8ed9-0c928da956cf'),('ab07426c-ff4d-40ff-b4ce-ab5aac3f0db2','aae6fce9-b221-4ae8-85f8-df7e1edfa087'),('ab07426c-ff4d-40ff-b4ce-ab5aac3f0db2','acd4ec0c-fdd5-44ff-9c55-30529f299705'),('ab07426c-ff4d-40ff-b4ce-ab5aac3f0db2','b3441c69-e2ab-4b35-8353-ba07dae0f63e'),('ab07426c-ff4d-40ff-b4ce-ab5aac3f0db2','be346d6b-2f95-481f-9b31-5ed103111958'),('ab07426c-ff4d-40ff-b4ce-ab5aac3f0db2','c3703382-77a7-458b-b35f-d607f3fd4650'),('ab07426c-ff4d-40ff-b4ce-ab5aac3f0db2','cab86077-aa6b-481f-8b20-d7d4cbf87594'),('ab07426c-ff4d-40ff-b4ce-ab5aac3f0db2','cd0169bd-11a2-41d4-b60c-67ba02db50d6'),('ab07426c-ff4d-40ff-b4ce-ab5aac3f0db2','d2edd736-038b-4235-a2ff-150605d9cb39'),('ab07426c-ff4d-40ff-b4ce-ab5aac3f0db2','dc2f2423-491b-44c2-b8fe-c39f3b581be8'),('ab07426c-ff4d-40ff-b4ce-ab5aac3f0db2','e2b1011f-ea8f-49ec-b72a-f9514ef6e26e'),('ab07426c-ff4d-40ff-b4ce-ab5aac3f0db2','e53e9c33-4f67-4464-ae16-58f90bd19aaf'),('ab07426c-ff4d-40ff-b4ce-ab5aac3f0db2','fa36b881-56aa-4acf-93d4-31df0c09feaf'),('be346d6b-2f95-481f-9b31-5ed103111958','151cf68e-1f6b-4596-9b9e-c6d0b8de8757'),('be346d6b-2f95-481f-9b31-5ed103111958','7f172102-6edb-4ca4-b418-d3e3c02db499'),('e71097f2-197f-47a8-98ba-685b13c3fba1','993727c8-5c4d-45dc-8985-7543f7626726');
/*!40000 ALTER TABLE `COMPOSITE_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CREDENTIAL`
--

DROP TABLE IF EXISTS `CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CREDENTIAL` (
  `ID` varchar(36) NOT NULL,
  `SALT` tinyblob,
  `TYPE` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(36) DEFAULT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `USER_LABEL` varchar(255) DEFAULT NULL,
  `SECRET_DATA` longtext,
  `CREDENTIAL_DATA` longtext,
  `PRIORITY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USER_CREDENTIAL` (`USER_ID`),
  CONSTRAINT `FK_PFYR0GLASQYL0DEI3KL69R6V0` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CREDENTIAL`
--

LOCK TABLES `CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `CREDENTIAL` DISABLE KEYS */;
INSERT INTO `CREDENTIAL` VALUES ('2af6df74-611a-4921-a071-2b0f69f4593f',NULL,'password','59bf2b71-8c8b-409d-bc2d-5e4a8591eba1',1622040111476,NULL,'{\"value\":\"x5P2zRSoCLJr3mPiyILB1b4IND60a3GwiqMrqQx06EQXxqxauHv+etWMnTBybpSv/HP7kXVrb6eLqSRxU4e3Tg==\",\"salt\":\"4bZgsTHZEdaUc993V/zGtQ==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('a529763c-9da2-4e3d-a761-f224bd9202e1',NULL,'password','8c177eac-4f51-4153-a87b-3aa460ac8bb3',1622040362384,NULL,'{\"value\":\"LxIXaVfjrsredu8b2TWvml9NwxcDHU+XEZXf9IotNonXKk4kkJDifeQo7EAp9hFZ0CREQk5TAJUnYSTHRKXdAA==\",\"salt\":\"fSLESc8lrBaEaa27o9LDPQ==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10);
/*!40000 ALTER TABLE `CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOG`
--

DROP TABLE IF EXISTS `DATABASECHANGELOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DATABASECHANGELOG` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOG`
--

LOCK TABLES `DATABASECHANGELOG` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOG` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOG` VALUES ('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/jpa-changelog-1.0.0.Final.xml','2021-05-26 14:41:33',1,'EXECUTED','7:4e70412f24a3f382c82183742ec79317','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'3.5.4',NULL,NULL,'2040091092'),('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/db2-jpa-changelog-1.0.0.Final.xml','2021-05-26 14:41:33',2,'MARK_RAN','7:cb16724583e9675711801c6875114f28','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'3.5.4',NULL,NULL,'2040091092'),('1.1.0.Beta1','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Beta1.xml','2021-05-26 14:41:33',3,'EXECUTED','7:0310eb8ba07cec616460794d42ade0fa','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...','',NULL,'3.5.4',NULL,NULL,'2040091092'),('1.1.0.Final','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Final.xml','2021-05-26 14:41:33',4,'EXECUTED','7:5d25857e708c3233ef4439df1f93f012','renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY','',NULL,'3.5.4',NULL,NULL,'2040091092'),('1.2.0.Beta1','psilva@redhat.com','META-INF/jpa-changelog-1.2.0.Beta1.xml','2021-05-26 14:41:34',5,'EXECUTED','7:c7a54a1041d58eb3817a4a883b4d4e84','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'3.5.4',NULL,NULL,'2040091092'),('1.2.0.Beta1','psilva@redhat.com','META-INF/db2-jpa-changelog-1.2.0.Beta1.xml','2021-05-26 14:41:34',6,'MARK_RAN','7:2e01012df20974c1c2a605ef8afe25b7','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'3.5.4',NULL,NULL,'2040091092'),('1.2.0.RC1','bburke@redhat.com','META-INF/jpa-changelog-1.2.0.CR1.xml','2021-05-26 14:41:35',7,'EXECUTED','7:0f08df48468428e0f30ee59a8ec01a41','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'3.5.4',NULL,NULL,'2040091092'),('1.2.0.RC1','bburke@redhat.com','META-INF/db2-jpa-changelog-1.2.0.CR1.xml','2021-05-26 14:41:35',8,'MARK_RAN','7:a77ea2ad226b345e7d689d366f185c8c','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'3.5.4',NULL,NULL,'2040091092'),('1.2.0.Final','keycloak','META-INF/jpa-changelog-1.2.0.Final.xml','2021-05-26 14:41:35',9,'EXECUTED','7:a3377a2059aefbf3b90ebb4c4cc8e2ab','update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'2040091092'),('1.3.0','bburke@redhat.com','META-INF/jpa-changelog-1.3.0.xml','2021-05-26 14:41:35',10,'EXECUTED','7:04c1dbedc2aa3e9756d1a1668e003451','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...','',NULL,'3.5.4',NULL,NULL,'2040091092'),('1.4.0','bburke@redhat.com','META-INF/jpa-changelog-1.4.0.xml','2021-05-26 14:41:36',11,'EXECUTED','7:36ef39ed560ad07062d956db861042ba','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'3.5.4',NULL,NULL,'2040091092'),('1.4.0','bburke@redhat.com','META-INF/db2-jpa-changelog-1.4.0.xml','2021-05-26 14:41:36',12,'MARK_RAN','7:d909180b2530479a716d3f9c9eaea3d7','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'3.5.4',NULL,NULL,'2040091092'),('1.5.0','bburke@redhat.com','META-INF/jpa-changelog-1.5.0.xml','2021-05-26 14:41:36',13,'EXECUTED','7:cf12b04b79bea5152f165eb41f3955f6','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'3.5.4',NULL,NULL,'2040091092'),('1.6.1_from15','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2021-05-26 14:41:36',14,'EXECUTED','7:7e32c8f05c755e8675764e7d5f514509','addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...','',NULL,'3.5.4',NULL,NULL,'2040091092'),('1.6.1_from16-pre','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2021-05-26 14:41:36',15,'MARK_RAN','7:980ba23cc0ec39cab731ce903dd01291','delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'2040091092'),('1.6.1_from16','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2021-05-26 14:41:36',16,'MARK_RAN','7:2fa220758991285312eb84f3b4ff5336','dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...','',NULL,'3.5.4',NULL,NULL,'2040091092'),('1.6.1','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2021-05-26 14:41:36',17,'EXECUTED','7:d41d8cd98f00b204e9800998ecf8427e','empty','',NULL,'3.5.4',NULL,NULL,'2040091092'),('1.7.0','bburke@redhat.com','META-INF/jpa-changelog-1.7.0.xml','2021-05-26 14:41:37',18,'EXECUTED','7:91ace540896df890cc00a0490ee52bbc','createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...','',NULL,'3.5.4',NULL,NULL,'2040091092'),('1.8.0','mposolda@redhat.com','META-INF/jpa-changelog-1.8.0.xml','2021-05-26 14:41:37',19,'EXECUTED','7:c31d1646dfa2618a9335c00e07f89f24','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'3.5.4',NULL,NULL,'2040091092'),('1.8.0-2','keycloak','META-INF/jpa-changelog-1.8.0.xml','2021-05-26 14:41:37',20,'EXECUTED','7:df8bc21027a4f7cbbb01f6344e89ce07','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'2040091092'),('1.8.0','mposolda@redhat.com','META-INF/db2-jpa-changelog-1.8.0.xml','2021-05-26 14:41:37',21,'MARK_RAN','7:f987971fe6b37d963bc95fee2b27f8df','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'3.5.4',NULL,NULL,'2040091092'),('1.8.0-2','keycloak','META-INF/db2-jpa-changelog-1.8.0.xml','2021-05-26 14:41:37',22,'MARK_RAN','7:df8bc21027a4f7cbbb01f6344e89ce07','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'2040091092'),('1.9.0','mposolda@redhat.com','META-INF/jpa-changelog-1.9.0.xml','2021-05-26 14:41:37',23,'EXECUTED','7:ed2dc7f799d19ac452cbcda56c929e47','update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...','',NULL,'3.5.4',NULL,NULL,'2040091092'),('1.9.1','keycloak','META-INF/jpa-changelog-1.9.1.xml','2021-05-26 14:41:37',24,'EXECUTED','7:80b5db88a5dda36ece5f235be8757615','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'3.5.4',NULL,NULL,'2040091092'),('1.9.1','keycloak','META-INF/db2-jpa-changelog-1.9.1.xml','2021-05-26 14:41:37',25,'MARK_RAN','7:1437310ed1305a9b93f8848f301726ce','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'3.5.4',NULL,NULL,'2040091092'),('1.9.2','keycloak','META-INF/jpa-changelog-1.9.2.xml','2021-05-26 14:41:38',26,'EXECUTED','7:b82ffb34850fa0836be16deefc6a87c4','createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...','',NULL,'3.5.4',NULL,NULL,'2040091092'),('authz-2.0.0','psilva@redhat.com','META-INF/jpa-changelog-authz-2.0.0.xml','2021-05-26 14:41:38',27,'EXECUTED','7:9cc98082921330d8d9266decdd4bd658','createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...','',NULL,'3.5.4',NULL,NULL,'2040091092'),('authz-2.5.1','psilva@redhat.com','META-INF/jpa-changelog-authz-2.5.1.xml','2021-05-26 14:41:38',28,'EXECUTED','7:03d64aeed9cb52b969bd30a7ac0db57e','update tableName=RESOURCE_SERVER_POLICY','',NULL,'3.5.4',NULL,NULL,'2040091092'),('2.1.0-KEYCLOAK-5461','bburke@redhat.com','META-INF/jpa-changelog-2.1.0.xml','2021-05-26 14:41:39',29,'EXECUTED','7:f1f9fd8710399d725b780f463c6b21cd','createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...','',NULL,'3.5.4',NULL,NULL,'2040091092'),('2.2.0','bburke@redhat.com','META-INF/jpa-changelog-2.2.0.xml','2021-05-26 14:41:39',30,'EXECUTED','7:53188c3eb1107546e6f765835705b6c1','addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...','',NULL,'3.5.4',NULL,NULL,'2040091092'),('2.3.0','bburke@redhat.com','META-INF/jpa-changelog-2.3.0.xml','2021-05-26 14:41:39',31,'EXECUTED','7:d6e6f3bc57a0c5586737d1351725d4d4','createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...','',NULL,'3.5.4',NULL,NULL,'2040091092'),('2.4.0','bburke@redhat.com','META-INF/jpa-changelog-2.4.0.xml','2021-05-26 14:41:39',32,'EXECUTED','7:454d604fbd755d9df3fd9c6329043aa5','customChange','',NULL,'3.5.4',NULL,NULL,'2040091092'),('2.5.0','bburke@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2021-05-26 14:41:39',33,'EXECUTED','7:57e98a3077e29caf562f7dbf80c72600','customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'2040091092'),('2.5.0-unicode-oracle','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2021-05-26 14:41:39',34,'MARK_RAN','7:e4c7e8f2256210aee71ddc42f538b57a','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'3.5.4',NULL,NULL,'2040091092'),('2.5.0-unicode-other-dbs','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2021-05-26 14:41:40',35,'EXECUTED','7:09a43c97e49bc626460480aa1379b522','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'3.5.4',NULL,NULL,'2040091092'),('2.5.0-duplicate-email-support','slawomir@dabek.name','META-INF/jpa-changelog-2.5.0.xml','2021-05-26 14:41:40',36,'EXECUTED','7:26bfc7c74fefa9126f2ce702fb775553','addColumn tableName=REALM','',NULL,'3.5.4',NULL,NULL,'2040091092'),('2.5.0-unique-group-names','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2021-05-26 14:41:40',37,'EXECUTED','7:a161e2ae671a9020fff61e996a207377','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'2040091092'),('2.5.1','bburke@redhat.com','META-INF/jpa-changelog-2.5.1.xml','2021-05-26 14:41:40',38,'EXECUTED','7:37fc1781855ac5388c494f1442b3f717','addColumn tableName=FED_USER_CONSENT','',NULL,'3.5.4',NULL,NULL,'2040091092'),('3.0.0','bburke@redhat.com','META-INF/jpa-changelog-3.0.0.xml','2021-05-26 14:41:40',39,'EXECUTED','7:13a27db0dae6049541136adad7261d27','addColumn tableName=IDENTITY_PROVIDER','',NULL,'3.5.4',NULL,NULL,'2040091092'),('3.2.0-fix','keycloak','META-INF/jpa-changelog-3.2.0.xml','2021-05-26 14:41:40',40,'MARK_RAN','7:550300617e3b59e8af3a6294df8248a3','addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS','',NULL,'3.5.4',NULL,NULL,'2040091092'),('3.2.0-fix-with-keycloak-5416','keycloak','META-INF/jpa-changelog-3.2.0.xml','2021-05-26 14:41:40',41,'MARK_RAN','7:e3a9482b8931481dc2772a5c07c44f17','dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS','',NULL,'3.5.4',NULL,NULL,'2040091092'),('3.2.0-fix-offline-sessions','hmlnarik','META-INF/jpa-changelog-3.2.0.xml','2021-05-26 14:41:40',42,'EXECUTED','7:72b07d85a2677cb257edb02b408f332d','customChange','',NULL,'3.5.4',NULL,NULL,'2040091092'),('3.2.0-fixed','keycloak','META-INF/jpa-changelog-3.2.0.xml','2021-05-26 14:41:41',43,'EXECUTED','7:a72a7858967bd414835d19e04d880312','addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...','',NULL,'3.5.4',NULL,NULL,'2040091092'),('3.3.0','keycloak','META-INF/jpa-changelog-3.3.0.xml','2021-05-26 14:41:41',44,'EXECUTED','7:94edff7cf9ce179e7e85f0cd78a3cf2c','addColumn tableName=USER_ENTITY','',NULL,'3.5.4',NULL,NULL,'2040091092'),('authz-3.4.0.CR1-resource-server-pk-change-part1','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2021-05-26 14:41:41',45,'EXECUTED','7:6a48ce645a3525488a90fbf76adf3bb3','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE','',NULL,'3.5.4',NULL,NULL,'2040091092'),('authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2021-05-26 14:41:41',46,'EXECUTED','7:e64b5dcea7db06077c6e57d3b9e5ca14','customChange','',NULL,'3.5.4',NULL,NULL,'2040091092'),('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2021-05-26 14:41:41',47,'MARK_RAN','7:fd8cf02498f8b1e72496a20afc75178c','dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE','',NULL,'3.5.4',NULL,NULL,'2040091092'),('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2021-05-26 14:41:41',48,'EXECUTED','7:542794f25aa2b1fbabb7e577d6646319','addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...','',NULL,'3.5.4',NULL,NULL,'2040091092'),('authn-3.4.0.CR1-refresh-token-max-reuse','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2021-05-26 14:41:42',49,'EXECUTED','7:edad604c882df12f74941dac3cc6d650','addColumn tableName=REALM','',NULL,'3.5.4',NULL,NULL,'2040091092'),('3.4.0','keycloak','META-INF/jpa-changelog-3.4.0.xml','2021-05-26 14:41:42',50,'EXECUTED','7:0f88b78b7b46480eb92690cbf5e44900','addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...','',NULL,'3.5.4',NULL,NULL,'2040091092'),('3.4.0-KEYCLOAK-5230','hmlnarik@redhat.com','META-INF/jpa-changelog-3.4.0.xml','2021-05-26 14:41:42',51,'EXECUTED','7:d560e43982611d936457c327f872dd59','createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...','',NULL,'3.5.4',NULL,NULL,'2040091092'),('3.4.1','psilva@redhat.com','META-INF/jpa-changelog-3.4.1.xml','2021-05-26 14:41:42',52,'EXECUTED','7:c155566c42b4d14ef07059ec3b3bbd8e','modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'2040091092'),('3.4.2','keycloak','META-INF/jpa-changelog-3.4.2.xml','2021-05-26 14:41:42',53,'EXECUTED','7:b40376581f12d70f3c89ba8ddf5b7dea','update tableName=REALM','',NULL,'3.5.4',NULL,NULL,'2040091092'),('3.4.2-KEYCLOAK-5172','mkanis@redhat.com','META-INF/jpa-changelog-3.4.2.xml','2021-05-26 14:41:42',54,'EXECUTED','7:a1132cc395f7b95b3646146c2e38f168','update tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'2040091092'),('4.0.0-KEYCLOAK-6335','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2021-05-26 14:41:42',55,'EXECUTED','7:d8dc5d89c789105cfa7ca0e82cba60af','createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS','',NULL,'3.5.4',NULL,NULL,'2040091092'),('4.0.0-CLEANUP-UNUSED-TABLE','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2021-05-26 14:41:42',56,'EXECUTED','7:7822e0165097182e8f653c35517656a3','dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING','',NULL,'3.5.4',NULL,NULL,'2040091092'),('4.0.0-KEYCLOAK-6228','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2021-05-26 14:41:42',57,'EXECUTED','7:c6538c29b9c9a08f9e9ea2de5c2b6375','dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...','',NULL,'3.5.4',NULL,NULL,'2040091092'),('4.0.0-KEYCLOAK-5579-fixed','mposolda@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2021-05-26 14:41:44',58,'EXECUTED','7:6d4893e36de22369cf73bcb051ded875','dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...','',NULL,'3.5.4',NULL,NULL,'2040091092'),('authz-4.0.0.CR1','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.CR1.xml','2021-05-26 14:41:44',59,'EXECUTED','7:57960fc0b0f0dd0563ea6f8b2e4a1707','createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...','',NULL,'3.5.4',NULL,NULL,'2040091092'),('authz-4.0.0.Beta3','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.Beta3.xml','2021-05-26 14:41:44',60,'EXECUTED','7:2b4b8bff39944c7097977cc18dbceb3b','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY','',NULL,'3.5.4',NULL,NULL,'2040091092'),('authz-4.2.0.Final','mhajas@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2021-05-26 14:41:44',61,'EXECUTED','7:2aa42a964c59cd5b8ca9822340ba33a8','createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...','',NULL,'3.5.4',NULL,NULL,'2040091092'),('authz-4.2.0.Final-KEYCLOAK-9944','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2021-05-26 14:41:44',62,'EXECUTED','7:9ac9e58545479929ba23f4a3087a0346','addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS','',NULL,'3.5.4',NULL,NULL,'2040091092'),('4.2.0-KEYCLOAK-6313','wadahiro@gmail.com','META-INF/jpa-changelog-4.2.0.xml','2021-05-26 14:41:44',63,'EXECUTED','7:14d407c35bc4fe1976867756bcea0c36','addColumn tableName=REQUIRED_ACTION_PROVIDER','',NULL,'3.5.4',NULL,NULL,'2040091092'),('4.3.0-KEYCLOAK-7984','wadahiro@gmail.com','META-INF/jpa-changelog-4.3.0.xml','2021-05-26 14:41:44',64,'EXECUTED','7:241a8030c748c8548e346adee548fa93','update tableName=REQUIRED_ACTION_PROVIDER','',NULL,'3.5.4',NULL,NULL,'2040091092'),('4.6.0-KEYCLOAK-7950','psilva@redhat.com','META-INF/jpa-changelog-4.6.0.xml','2021-05-26 14:41:44',65,'EXECUTED','7:7d3182f65a34fcc61e8d23def037dc3f','update tableName=RESOURCE_SERVER_RESOURCE','',NULL,'3.5.4',NULL,NULL,'2040091092'),('4.6.0-KEYCLOAK-8377','keycloak','META-INF/jpa-changelog-4.6.0.xml','2021-05-26 14:41:44',66,'EXECUTED','7:b30039e00a0b9715d430d1b0636728fa','createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...','',NULL,'3.5.4',NULL,NULL,'2040091092'),('4.6.0-KEYCLOAK-8555','gideonray@gmail.com','META-INF/jpa-changelog-4.6.0.xml','2021-05-26 14:41:44',67,'EXECUTED','7:3797315ca61d531780f8e6f82f258159','createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT','',NULL,'3.5.4',NULL,NULL,'2040091092'),('4.7.0-KEYCLOAK-1267','sguilhen@redhat.com','META-INF/jpa-changelog-4.7.0.xml','2021-05-26 14:41:44',68,'EXECUTED','7:c7aa4c8d9573500c2d347c1941ff0301','addColumn tableName=REALM','',NULL,'3.5.4',NULL,NULL,'2040091092'),('4.7.0-KEYCLOAK-7275','keycloak','META-INF/jpa-changelog-4.7.0.xml','2021-05-26 14:41:44',69,'EXECUTED','7:b207faee394fc074a442ecd42185a5dd','renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...','',NULL,'3.5.4',NULL,NULL,'2040091092'),('4.8.0-KEYCLOAK-8835','sguilhen@redhat.com','META-INF/jpa-changelog-4.8.0.xml','2021-05-26 14:41:44',70,'EXECUTED','7:ab9a9762faaba4ddfa35514b212c4922','addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM','',NULL,'3.5.4',NULL,NULL,'2040091092'),('authz-7.0.0-KEYCLOAK-10443','psilva@redhat.com','META-INF/jpa-changelog-authz-7.0.0.xml','2021-05-26 14:41:44',71,'EXECUTED','7:b9710f74515a6ccb51b72dc0d19df8c4','addColumn tableName=RESOURCE_SERVER','',NULL,'3.5.4',NULL,NULL,'2040091092'),('8.0.0-adding-credential-columns','keycloak','META-INF/jpa-changelog-8.0.0.xml','2021-05-26 14:41:44',72,'EXECUTED','7:ec9707ae4d4f0b7452fee20128083879','addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'2040091092'),('8.0.0-updating-credential-data-not-oracle','keycloak','META-INF/jpa-changelog-8.0.0.xml','2021-05-26 14:41:45',73,'EXECUTED','7:03b3f4b264c3c68ba082250a80b74216','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'2040091092'),('8.0.0-updating-credential-data-oracle','keycloak','META-INF/jpa-changelog-8.0.0.xml','2021-05-26 14:41:45',74,'MARK_RAN','7:64c5728f5ca1f5aa4392217701c4fe23','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'2040091092'),('8.0.0-credential-cleanup-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2021-05-26 14:41:45',75,'EXECUTED','7:b48da8c11a3d83ddd6b7d0c8c2219345','dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...','',NULL,'3.5.4',NULL,NULL,'2040091092'),('8.0.0-resource-tag-support','keycloak','META-INF/jpa-changelog-8.0.0.xml','2021-05-26 14:41:45',76,'EXECUTED','7:a73379915c23bfad3e8f5c6d5c0aa4bd','addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL','',NULL,'3.5.4',NULL,NULL,'2040091092'),('9.0.0-always-display-client','keycloak','META-INF/jpa-changelog-9.0.0.xml','2021-05-26 14:41:45',77,'EXECUTED','7:39e0073779aba192646291aa2332493d','addColumn tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'2040091092'),('9.0.0-drop-constraints-for-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2021-05-26 14:41:45',78,'MARK_RAN','7:81f87368f00450799b4bf42ea0b3ec34','dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...','',NULL,'3.5.4',NULL,NULL,'2040091092'),('9.0.0-increase-column-size-federated-fk','keycloak','META-INF/jpa-changelog-9.0.0.xml','2021-05-26 14:41:45',79,'EXECUTED','7:20b37422abb9fb6571c618148f013a15','modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...','',NULL,'3.5.4',NULL,NULL,'2040091092'),('9.0.0-recreate-constraints-after-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2021-05-26 14:41:45',80,'MARK_RAN','7:1970bb6cfb5ee800736b95ad3fb3c78a','addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...','',NULL,'3.5.4',NULL,NULL,'2040091092'),('9.0.1-add-index-to-client.client_id','keycloak','META-INF/jpa-changelog-9.0.1.xml','2021-05-26 14:41:45',81,'EXECUTED','7:45d9b25fc3b455d522d8dcc10a0f4c80','createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'2040091092'),('9.0.1-KEYCLOAK-12579-drop-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2021-05-26 14:41:45',82,'MARK_RAN','7:890ae73712bc187a66c2813a724d037f','dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'2040091092'),('9.0.1-KEYCLOAK-12579-add-not-null-constraint','keycloak','META-INF/jpa-changelog-9.0.1.xml','2021-05-26 14:41:45',83,'EXECUTED','7:0a211980d27fafe3ff50d19a3a29b538','addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'2040091092'),('9.0.1-KEYCLOAK-12579-recreate-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2021-05-26 14:41:45',84,'MARK_RAN','7:a161e2ae671a9020fff61e996a207377','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'2040091092'),('9.0.1-add-index-to-events','keycloak','META-INF/jpa-changelog-9.0.1.xml','2021-05-26 14:41:45',85,'EXECUTED','7:01c49302201bdf815b0a18d1f98a55dc','createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY','',NULL,'3.5.4',NULL,NULL,'2040091092'),('map-remove-ri','keycloak','META-INF/jpa-changelog-11.0.0.xml','2021-05-26 14:41:45',86,'EXECUTED','7:3dace6b144c11f53f1ad2c0361279b86','dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9','',NULL,'3.5.4',NULL,NULL,'2040091092'),('map-remove-ri','keycloak','META-INF/jpa-changelog-12.0.0.xml','2021-05-26 14:41:46',87,'EXECUTED','7:578d0b92077eaf2ab95ad0ec087aa903','dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...','',NULL,'3.5.4',NULL,NULL,'2040091092'),('12.1.0-add-realm-localization-table','keycloak','META-INF/jpa-changelog-12.0.0.xml','2021-05-26 14:41:46',88,'EXECUTED','7:c95abe90d962c57a09ecaee57972835d','createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS','',NULL,'3.5.4',NULL,NULL,'2040091092'),('default-roles','keycloak','META-INF/jpa-changelog-13.0.0.xml','2021-05-26 14:41:46',89,'EXECUTED','7:f1313bcc2994a5c4dc1062ed6d8282d3','addColumn tableName=REALM; customChange','',NULL,'3.5.4',NULL,NULL,'2040091092'),('default-roles-cleanup','keycloak','META-INF/jpa-changelog-13.0.0.xml','2021-05-26 14:41:46',90,'EXECUTED','7:90d763b52eaffebefbcbde55f269508b','dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES','',NULL,'3.5.4',NULL,NULL,'2040091092'),('13.0.0-KEYCLOAK-16844','keycloak','META-INF/jpa-changelog-13.0.0.xml','2021-05-26 14:41:46',91,'EXECUTED','7:d554f0cb92b764470dccfa5e0014a7dd','createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'2040091092'),('map-remove-ri-13.0.0','keycloak','META-INF/jpa-changelog-13.0.0.xml','2021-05-26 14:41:46',92,'EXECUTED','7:73193e3ab3c35cf0f37ccea3bf783764','dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...','',NULL,'3.5.4',NULL,NULL,'2040091092'),('13.0.0-KEYCLOAK-17992-drop-constraints','keycloak','META-INF/jpa-changelog-13.0.0.xml','2021-05-26 14:41:46',93,'MARK_RAN','7:90a1e74f92e9cbaa0c5eab80b8a037f3','dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT','',NULL,'3.5.4',NULL,NULL,'2040091092'),('13.0.0-increase-column-size-federated','keycloak','META-INF/jpa-changelog-13.0.0.xml','2021-05-26 14:41:46',94,'EXECUTED','7:5b9248f29cd047c200083cc6d8388b16','modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT','',NULL,'3.5.4',NULL,NULL,'2040091092'),('13.0.0-KEYCLOAK-17992-recreate-constraints','keycloak','META-INF/jpa-changelog-13.0.0.xml','2021-05-26 14:41:46',95,'MARK_RAN','7:64db59e44c374f13955489e8990d17a1','addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...','',NULL,'3.5.4',NULL,NULL,'2040091092'),('json-string-accomodation-fixed','keycloak','META-INF/jpa-changelog-13.0.0.xml','2021-05-26 14:41:46',96,'EXECUTED','7:329a578cdb43262fff975f0a7f6cda60','addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE','',NULL,'3.5.4',NULL,NULL,'2040091092');
/*!40000 ALTER TABLE `DATABASECHANGELOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOGLOCK`
--

DROP TABLE IF EXISTS `DATABASECHANGELOGLOCK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DATABASECHANGELOGLOCK` (
  `ID` int NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOGLOCK`
--

LOCK TABLES `DATABASECHANGELOGLOCK` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOGLOCK` VALUES (1,_binary '\0',NULL,NULL),(1000,_binary '\0',NULL,NULL),(1001,_binary '\0',NULL,NULL);
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEFAULT_CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `DEFAULT_CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DEFAULT_CLIENT_SCOPE` (
  `REALM_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  `DEFAULT_SCOPE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`REALM_ID`,`SCOPE_ID`),
  KEY `IDX_DEFCLS_REALM` (`REALM_ID`),
  KEY `IDX_DEFCLS_SCOPE` (`SCOPE_ID`),
  CONSTRAINT `FK_R_DEF_CLI_SCOPE_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEFAULT_CLIENT_SCOPE`
--

LOCK TABLES `DEFAULT_CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `DEFAULT_CLIENT_SCOPE` DISABLE KEYS */;
INSERT INTO `DEFAULT_CLIENT_SCOPE` VALUES ('master','3328b38d-66eb-40d9-b866-0e913f496d7c',_binary '\0'),('master','4c7fe22c-655f-4cab-ac4b-7dbe5c61039a',_binary ''),('master','5002ebff-add7-4a60-a6c3-4a2d6197a2c3',_binary ''),('master','52ec758a-b9a4-41e7-8716-71f21f7fe7f0',_binary '\0'),('master','54115c90-c720-439f-9ae6-59085eef8d41',_binary ''),('master','5774fffd-6c96-4034-ae97-e0881669d722',_binary ''),('master','83f62477-ebcd-412b-bb61-d2464ecbf959',_binary '\0'),('master','8d837e12-dca6-4763-a286-119a1b8a16f0',_binary ''),('master','a0c244a0-9390-4107-85e6-c2e5e853223b',_binary '\0'),('stock-manager','3bc320a7-f2a2-4a9b-8297-0d6f81e74336',_binary ''),('stock-manager','3fdb657c-92dc-4392-8783-b4c2b52d7bcf',_binary '\0'),('stock-manager','467711c6-a82f-4814-af06-c94a29fca704',_binary ''),('stock-manager','94320587-e15d-44e5-b921-337e62255256',_binary '\0'),('stock-manager','b4b8762f-50d4-4491-aea8-357f0737bf38',_binary ''),('stock-manager','d788b693-45d3-4f4f-9b6b-3c59d8dacdab',_binary '\0'),('stock-manager','db09ffc3-6f35-43c2-a3b6-51ec55b9adc1',_binary ''),('stock-manager','ed0a66e8-1873-43b0-938b-94c093a000a9',_binary ''),('stock-manager','fd41383b-a59e-46a6-b5f6-829f58beede7',_binary '\0');
/*!40000 ALTER TABLE `DEFAULT_CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EVENT_ENTITY`
--

DROP TABLE IF EXISTS `EVENT_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EVENT_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `DETAILS_JSON` text,
  `ERROR` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `SESSION_ID` varchar(255) DEFAULT NULL,
  `EVENT_TIME` bigint DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_EVENT_TIME` (`REALM_ID`,`EVENT_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EVENT_ENTITY`
--

LOCK TABLES `EVENT_ENTITY` WRITE;
/*!40000 ALTER TABLE `EVENT_ENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `EVENT_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FEDERATED_IDENTITY`
--

DROP TABLE IF EXISTS `FEDERATED_IDENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FEDERATED_IDENTITY` (
  `IDENTITY_PROVIDER` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `FEDERATED_USER_ID` varchar(255) DEFAULT NULL,
  `FEDERATED_USERNAME` varchar(255) DEFAULT NULL,
  `TOKEN` text,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`),
  KEY `IDX_FEDIDENTITY_USER` (`USER_ID`),
  KEY `IDX_FEDIDENTITY_FEDUSER` (`FEDERATED_USER_ID`),
  CONSTRAINT `FK404288B92EF007A6` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FEDERATED_IDENTITY`
--

LOCK TABLES `FEDERATED_IDENTITY` WRITE;
/*!40000 ALTER TABLE `FEDERATED_IDENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `FEDERATED_IDENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FEDERATED_USER`
--

DROP TABLE IF EXISTS `FEDERATED_USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FEDERATED_USER` (
  `ID` varchar(255) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FEDERATED_USER`
--

LOCK TABLES `FEDERATED_USER` WRITE;
/*!40000 ALTER TABLE `FEDERATED_USER` DISABLE KEYS */;
/*!40000 ALTER TABLE `FEDERATED_USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_ATTRIBUTE`
--

DROP TABLE IF EXISTS `FED_USER_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `VALUE` text,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_ATTRIBUTE` (`USER_ID`,`REALM_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_ATTRIBUTE`
--

LOCK TABLES `FED_USER_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `FED_USER_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CONSENT`
--

DROP TABLE IF EXISTS `FED_USER_CONSENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_CONSENT` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) DEFAULT NULL,
  `EXTERNAL_CLIENT_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_CONSENT` (`USER_ID`,`CLIENT_ID`),
  KEY `IDX_FU_CONSENT_RU` (`REALM_ID`,`USER_ID`),
  KEY `IDX_FU_CNSNT_EXT` (`USER_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CONSENT`
--

LOCK TABLES `FED_USER_CONSENT` WRITE;
/*!40000 ALTER TABLE `FED_USER_CONSENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CONSENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CONSENT_CL_SCOPE`
--

DROP TABLE IF EXISTS `FED_USER_CONSENT_CL_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_CONSENT_CL_SCOPE` (
  `USER_CONSENT_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CONSENT_CL_SCOPE`
--

LOCK TABLES `FED_USER_CONSENT_CL_SCOPE` WRITE;
/*!40000 ALTER TABLE `FED_USER_CONSENT_CL_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CONSENT_CL_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CREDENTIAL`
--

DROP TABLE IF EXISTS `FED_USER_CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_CREDENTIAL` (
  `ID` varchar(36) NOT NULL,
  `SALT` tinyblob,
  `TYPE` varchar(255) DEFAULT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `USER_LABEL` varchar(255) DEFAULT NULL,
  `SECRET_DATA` longtext,
  `CREDENTIAL_DATA` longtext,
  `PRIORITY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_CREDENTIAL` (`USER_ID`,`TYPE`),
  KEY `IDX_FU_CREDENTIAL_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CREDENTIAL`
--

LOCK TABLES `FED_USER_CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `FED_USER_CREDENTIAL` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_GROUP_MEMBERSHIP`
--

DROP TABLE IF EXISTS `FED_USER_GROUP_MEMBERSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_GROUP_MEMBERSHIP` (
  `GROUP_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  KEY `IDX_FU_GROUP_MEMBERSHIP` (`USER_ID`,`GROUP_ID`),
  KEY `IDX_FU_GROUP_MEMBERSHIP_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_GROUP_MEMBERSHIP`
--

LOCK TABLES `FED_USER_GROUP_MEMBERSHIP` WRITE;
/*!40000 ALTER TABLE `FED_USER_GROUP_MEMBERSHIP` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_GROUP_MEMBERSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_REQUIRED_ACTION`
--

DROP TABLE IF EXISTS `FED_USER_REQUIRED_ACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_REQUIRED_ACTION` (
  `REQUIRED_ACTION` varchar(255) NOT NULL DEFAULT ' ',
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  KEY `IDX_FU_REQUIRED_ACTION` (`USER_ID`,`REQUIRED_ACTION`),
  KEY `IDX_FU_REQUIRED_ACTION_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_REQUIRED_ACTION`
--

LOCK TABLES `FED_USER_REQUIRED_ACTION` WRITE;
/*!40000 ALTER TABLE `FED_USER_REQUIRED_ACTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_REQUIRED_ACTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `FED_USER_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_ROLE_MAPPING` (
  `ROLE_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  KEY `IDX_FU_ROLE_MAPPING` (`USER_ID`,`ROLE_ID`),
  KEY `IDX_FU_ROLE_MAPPING_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_ROLE_MAPPING`
--

LOCK TABLES `FED_USER_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `FED_USER_ROLE_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_ATTRIBUTE`
--

DROP TABLE IF EXISTS `GROUP_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GROUP_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_GROUP_ATTR_GROUP` (`GROUP_ID`),
  CONSTRAINT `FK_GROUP_ATTRIBUTE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_ATTRIBUTE`
--

LOCK TABLES `GROUP_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `GROUP_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `GROUP_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `GROUP_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GROUP_ROLE_MAPPING` (
  `ROLE_ID` varchar(36) NOT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`GROUP_ID`),
  KEY `IDX_GROUP_ROLE_MAPP_GROUP` (`GROUP_ID`),
  CONSTRAINT `FK_GROUP_ROLE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_ROLE_MAPPING`
--

LOCK TABLES `GROUP_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `GROUP_ROLE_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `GROUP_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDENTITY_PROVIDER` (
  `INTERNAL_ID` varchar(36) NOT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `PROVIDER_ALIAS` varchar(255) DEFAULT NULL,
  `PROVIDER_ID` varchar(255) DEFAULT NULL,
  `STORE_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  `AUTHENTICATE_BY_DEFAULT` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) DEFAULT NULL,
  `ADD_TOKEN_ROLE` bit(1) NOT NULL DEFAULT b'1',
  `TRUST_EMAIL` bit(1) NOT NULL DEFAULT b'0',
  `FIRST_BROKER_LOGIN_FLOW_ID` varchar(36) DEFAULT NULL,
  `POST_BROKER_LOGIN_FLOW_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_DISPLAY_NAME` varchar(255) DEFAULT NULL,
  `LINK_ONLY` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`INTERNAL_ID`),
  UNIQUE KEY `UK_2DAELWNIBJI49AVXSRTUF6XJ33` (`PROVIDER_ALIAS`,`REALM_ID`),
  KEY `IDX_IDENT_PROV_REALM` (`REALM_ID`),
  CONSTRAINT `FK2B4EBC52AE5C3B34` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER`
--

LOCK TABLES `IDENTITY_PROVIDER` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER_CONFIG`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDENTITY_PROVIDER_CONFIG` (
  `IDENTITY_PROVIDER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER_ID`,`NAME`),
  CONSTRAINT `FKDC4897CF864C4E43` FOREIGN KEY (`IDENTITY_PROVIDER_ID`) REFERENCES `IDENTITY_PROVIDER` (`INTERNAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER_CONFIG`
--

LOCK TABLES `IDENTITY_PROVIDER_CONFIG` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER_MAPPER`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDENTITY_PROVIDER_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `IDP_ALIAS` varchar(255) NOT NULL,
  `IDP_MAPPER_NAME` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ID_PROV_MAPP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_IDPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER_MAPPER`
--

LOCK TABLES `IDENTITY_PROVIDER_MAPPER` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDP_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `IDP_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDP_MAPPER_CONFIG` (
  `IDP_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`IDP_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_IDPMCONFIG` FOREIGN KEY (`IDP_MAPPER_ID`) REFERENCES `IDENTITY_PROVIDER_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDP_MAPPER_CONFIG`
--

LOCK TABLES `IDP_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `IDP_MAPPER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDP_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KEYCLOAK_GROUP`
--

DROP TABLE IF EXISTS `KEYCLOAK_GROUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `KEYCLOAK_GROUP` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PARENT_GROUP` varchar(36) NOT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `SIBLING_NAMES` (`REALM_ID`,`PARENT_GROUP`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KEYCLOAK_GROUP`
--

LOCK TABLES `KEYCLOAK_GROUP` WRITE;
/*!40000 ALTER TABLE `KEYCLOAK_GROUP` DISABLE KEYS */;
/*!40000 ALTER TABLE `KEYCLOAK_GROUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KEYCLOAK_ROLE`
--

DROP TABLE IF EXISTS `KEYCLOAK_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `KEYCLOAK_ROLE` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_REALM_CONSTRAINT` varchar(255) DEFAULT NULL,
  `CLIENT_ROLE` bit(1) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `CLIENT` varchar(36) DEFAULT NULL,
  `REALM` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_J3RWUVD56ONTGSUHOGM184WW2-2` (`NAME`,`CLIENT_REALM_CONSTRAINT`),
  KEY `IDX_KEYCLOAK_ROLE_CLIENT` (`CLIENT`),
  KEY `IDX_KEYCLOAK_ROLE_REALM` (`REALM`),
  CONSTRAINT `FK_6VYQFE4CN4WLQ8R6KT5VDSJ5C` FOREIGN KEY (`REALM`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KEYCLOAK_ROLE`
--

LOCK TABLES `KEYCLOAK_ROLE` WRITE;
/*!40000 ALTER TABLE `KEYCLOAK_ROLE` DISABLE KEYS */;
INSERT INTO `KEYCLOAK_ROLE` VALUES ('00301d4f-2649-461d-8dc2-c3b2beb3fa7a','41b8abc2-876d-4760-83e9-d5718d861104',_binary '','${role_manage-clients}','manage-clients','master','41b8abc2-876d-4760-83e9-d5718d861104',NULL),('02aa7a7d-0e03-4965-99fc-03b35c5f2a80','95b34f61-3dc8-43ff-b304-b07690a45b6f',_binary '','${role_manage-account-links}','manage-account-links','stock-manager','95b34f61-3dc8-43ff-b304-b07690a45b6f',NULL),('044ebe4c-c2d6-4c4b-a26d-d0c43b0300d3','master',_binary '\0','${role_default-roles}','default-roles-master','master',NULL,NULL),('05a69b8f-ae9d-479f-9d83-74e05b049810','0ca35df5-937d-42bb-851c-07b8f82426ae',_binary '','${role_view-users}','view-users','stock-manager','0ca35df5-937d-42bb-851c-07b8f82426ae',NULL),('08a349ff-c7b6-4f1d-80f3-1324cc894d91','95b34f61-3dc8-43ff-b304-b07690a45b6f',_binary '','${role_manage-account}','manage-account','stock-manager','95b34f61-3dc8-43ff-b304-b07690a45b6f',NULL),('100411f8-ffe1-424a-886c-9e601f3d905f','0ca35df5-937d-42bb-851c-07b8f82426ae',_binary '','${role_create-client}','create-client','stock-manager','0ca35df5-937d-42bb-851c-07b8f82426ae',NULL),('1048fa41-d368-4678-95c5-9f7a3534fe01','master',_binary '\0','${role_offline-access}','offline_access','master',NULL,NULL),('151cf68e-1f6b-4596-9b9e-c6d0b8de8757','41b8abc2-876d-4760-83e9-d5718d861104',_binary '','${role_query-groups}','query-groups','master','41b8abc2-876d-4760-83e9-d5718d861104',NULL),('16532726-dfad-4a31-ae0e-6d7be93aa23c','master',_binary '\0','${role_uma_authorization}','uma_authorization','master',NULL,NULL),('16ed39a0-5a9d-425e-913c-8256bb376262','c596116e-ebea-4ae9-8e42-0d6342fd47a3',_binary '','${role_manage-authorization}','manage-authorization','master','c596116e-ebea-4ae9-8e42-0d6342fd47a3',NULL),('1ab3ccfb-fc6d-4f69-8b05-652b7b476956','95b34f61-3dc8-43ff-b304-b07690a45b6f',_binary '','${role_view-applications}','view-applications','stock-manager','95b34f61-3dc8-43ff-b304-b07690a45b6f',NULL),('1e86bcb4-072e-4abb-8f9d-a4cabbb01122','e89cb647-9ac1-4636-8c3a-9e5523c27fda',_binary '','${role_delete-account}','delete-account','master','e89cb647-9ac1-4636-8c3a-9e5523c27fda',NULL),('1f6e9ba2-3c02-4ff0-bfdb-4f50e5a4a593','41b8abc2-876d-4760-83e9-d5718d861104',_binary '','${role_view-events}','view-events','master','41b8abc2-876d-4760-83e9-d5718d861104',NULL),('2017a5b0-43db-4e93-8f7f-44f3db7c7c6c','0ca35df5-937d-42bb-851c-07b8f82426ae',_binary '','${role_query-users}','query-users','stock-manager','0ca35df5-937d-42bb-851c-07b8f82426ae',NULL),('20635ba4-7d94-47ae-acb2-a3f57f833c59','c596116e-ebea-4ae9-8e42-0d6342fd47a3',_binary '','${role_query-realms}','query-realms','master','c596116e-ebea-4ae9-8e42-0d6342fd47a3',NULL),('21a488a9-4a41-4b5e-9806-5ddf54e5cd15','0ca35df5-937d-42bb-851c-07b8f82426ae',_binary '','${role_query-realms}','query-realms','stock-manager','0ca35df5-937d-42bb-851c-07b8f82426ae',NULL),('290e282f-285d-48f6-a411-32222d0601e4','41b8abc2-876d-4760-83e9-d5718d861104',_binary '','${role_manage-users}','manage-users','master','41b8abc2-876d-4760-83e9-d5718d861104',NULL),('2c0f711b-9d36-4c28-877a-61da68711752','c596116e-ebea-4ae9-8e42-0d6342fd47a3',_binary '','${role_manage-clients}','manage-clients','master','c596116e-ebea-4ae9-8e42-0d6342fd47a3',NULL),('2ce5a4b9-7967-47da-a465-974fd3d89292','stock-manager',_binary '\0','Admin Role','admin','stock-manager',NULL,NULL),('3138f4f0-863d-4758-8abb-c68e8cf408c4','41b8abc2-876d-4760-83e9-d5718d861104',_binary '','${role_query-clients}','query-clients','master','41b8abc2-876d-4760-83e9-d5718d861104',NULL),('31a7d061-affa-4ed1-ac2f-b47e6534b0e5','41b8abc2-876d-4760-83e9-d5718d861104',_binary '','${role_manage-events}','manage-events','master','41b8abc2-876d-4760-83e9-d5718d861104',NULL),('3cf99ec0-8fb1-4e76-8ef8-a9047287037a','0ca35df5-937d-42bb-851c-07b8f82426ae',_binary '','${role_view-events}','view-events','stock-manager','0ca35df5-937d-42bb-851c-07b8f82426ae',NULL),('3f66f5fc-764d-449d-8bf9-6b757b02bc31','stock-manager',_binary '\0','${role_default-roles}','default-roles-stock-manager','stock-manager',NULL,NULL),('403f2da6-83be-454f-855c-3b8f6e5f01a7','0ca35df5-937d-42bb-851c-07b8f82426ae',_binary '','${role_view-realm}','view-realm','stock-manager','0ca35df5-937d-42bb-851c-07b8f82426ae',NULL),('408583f2-8d4a-48d7-bf93-5da9cc8fdcf9','0ca35df5-937d-42bb-851c-07b8f82426ae',_binary '','${role_manage-realm}','manage-realm','stock-manager','0ca35df5-937d-42bb-851c-07b8f82426ae',NULL),('40e02ecd-0b24-41ff-87c4-175223e3dc85','0ca35df5-937d-42bb-851c-07b8f82426ae',_binary '','${role_query-groups}','query-groups','stock-manager','0ca35df5-937d-42bb-851c-07b8f82426ae',NULL),('47dfd608-15f8-41b6-aa1a-8cd82417bc43','e89cb647-9ac1-4636-8c3a-9e5523c27fda',_binary '','${role_view-applications}','view-applications','master','e89cb647-9ac1-4636-8c3a-9e5523c27fda',NULL),('4c104c6b-870c-4d45-b2b6-4512c49cd4cf','e89cb647-9ac1-4636-8c3a-9e5523c27fda',_binary '','${role_manage-account-links}','manage-account-links','master','e89cb647-9ac1-4636-8c3a-9e5523c27fda',NULL),('501518f8-728c-4c25-948c-a3273e636d93','95b34f61-3dc8-43ff-b304-b07690a45b6f',_binary '','${role_view-consent}','view-consent','stock-manager','95b34f61-3dc8-43ff-b304-b07690a45b6f',NULL),('559f0606-fe64-4cb3-af96-435680c31295','c596116e-ebea-4ae9-8e42-0d6342fd47a3',_binary '','${role_manage-realm}','manage-realm','master','c596116e-ebea-4ae9-8e42-0d6342fd47a3',NULL),('589bd224-5b5b-4088-97c7-f3f53309d50c','41b8abc2-876d-4760-83e9-d5718d861104',_binary '','${role_view-clients}','view-clients','master','41b8abc2-876d-4760-83e9-d5718d861104',NULL),('5bd666c1-3aa8-415a-99f6-bb5c6cad86cb','0ca35df5-937d-42bb-851c-07b8f82426ae',_binary '','${role_manage-identity-providers}','manage-identity-providers','stock-manager','0ca35df5-937d-42bb-851c-07b8f82426ae',NULL),('63bc1b45-86c5-4816-a1fb-4ab2a7778497','41b8abc2-876d-4760-83e9-d5718d861104',_binary '','${role_manage-realm}','manage-realm','master','41b8abc2-876d-4760-83e9-d5718d861104',NULL),('67bad96e-0990-4e00-ad9b-a6589c5f1153','41b8abc2-876d-4760-83e9-d5718d861104',_binary '','${role_manage-authorization}','manage-authorization','master','41b8abc2-876d-4760-83e9-d5718d861104',NULL),('6927e7d9-9753-47b4-9978-ff5759e6df8d','c596116e-ebea-4ae9-8e42-0d6342fd47a3',_binary '','${role_query-users}','query-users','master','c596116e-ebea-4ae9-8e42-0d6342fd47a3',NULL),('70fc2f99-3b1f-4918-bd53-4ad587c20247','c596116e-ebea-4ae9-8e42-0d6342fd47a3',_binary '','${role_view-realm}','view-realm','master','c596116e-ebea-4ae9-8e42-0d6342fd47a3',NULL),('77be99e0-5eeb-4dbd-bc4c-235b97c9e9b9','c596116e-ebea-4ae9-8e42-0d6342fd47a3',_binary '','${role_query-clients}','query-clients','master','c596116e-ebea-4ae9-8e42-0d6342fd47a3',NULL),('78dd6939-5476-4f56-93b1-bb0eb2285fb5','e89cb647-9ac1-4636-8c3a-9e5523c27fda',_binary '','${role_manage-account}','manage-account','master','e89cb647-9ac1-4636-8c3a-9e5523c27fda',NULL),('7b432b13-613c-4511-9443-af8280f9176b','41b8abc2-876d-4760-83e9-d5718d861104',_binary '','${role_view-realm}','view-realm','master','41b8abc2-876d-4760-83e9-d5718d861104',NULL),('7eefe22d-f9e3-4f93-9946-ee3bf4b66e9c','0ca35df5-937d-42bb-851c-07b8f82426ae',_binary '','${role_manage-users}','manage-users','stock-manager','0ca35df5-937d-42bb-851c-07b8f82426ae',NULL),('7f172102-6edb-4ca4-b418-d3e3c02db499','41b8abc2-876d-4760-83e9-d5718d861104',_binary '','${role_query-users}','query-users','master','41b8abc2-876d-4760-83e9-d5718d861104',NULL),('7fb46486-5835-4d4e-8a52-a128f42c08b4','c596116e-ebea-4ae9-8e42-0d6342fd47a3',_binary '','${role_manage-events}','manage-events','master','c596116e-ebea-4ae9-8e42-0d6342fd47a3',NULL),('8493008f-1275-4646-80c2-5a83148a0d9d','41b8abc2-876d-4760-83e9-d5718d861104',_binary '','${role_query-realms}','query-realms','master','41b8abc2-876d-4760-83e9-d5718d861104',NULL),('84b9e84a-014a-4286-b5cb-1e2a2c86e415','95b34f61-3dc8-43ff-b304-b07690a45b6f',_binary '','${role_manage-consent}','manage-consent','stock-manager','95b34f61-3dc8-43ff-b304-b07690a45b6f',NULL),('84d9fa56-23e3-40f3-9231-dba04c680321','c596116e-ebea-4ae9-8e42-0d6342fd47a3',_binary '','${role_view-identity-providers}','view-identity-providers','master','c596116e-ebea-4ae9-8e42-0d6342fd47a3',NULL),('8d89d6e7-aac5-4b53-aac4-d36d20fd7c79','0ca35df5-937d-42bb-851c-07b8f82426ae',_binary '','${role_manage-clients}','manage-clients','stock-manager','0ca35df5-937d-42bb-851c-07b8f82426ae',NULL),('8f7a4e95-b7ca-44f1-9b22-f7a198405495','0ca35df5-937d-42bb-851c-07b8f82426ae',_binary '','${role_view-authorization}','view-authorization','stock-manager','0ca35df5-937d-42bb-851c-07b8f82426ae',NULL),('91de8ea7-705a-45c9-a44e-8153ed67a8f5','c596116e-ebea-4ae9-8e42-0d6342fd47a3',_binary '','${role_view-clients}','view-clients','master','c596116e-ebea-4ae9-8e42-0d6342fd47a3',NULL),('963092d6-f474-41cc-aa33-de4af1f38087','master',_binary '\0','${role_create-realm}','create-realm','master',NULL,NULL),('993727c8-5c4d-45dc-8985-7543f7626726','0ca35df5-937d-42bb-851c-07b8f82426ae',_binary '','${role_query-clients}','query-clients','stock-manager','0ca35df5-937d-42bb-851c-07b8f82426ae',NULL),('9b9829ba-6862-4791-a582-314e5731fe48','e89cb647-9ac1-4636-8c3a-9e5523c27fda',_binary '','${role_manage-consent}','manage-consent','master','e89cb647-9ac1-4636-8c3a-9e5523c27fda',NULL),('9ce5309d-9f8f-4972-814f-a5ef07df0d43','e89cb647-9ac1-4636-8c3a-9e5523c27fda',_binary '','${role_view-profile}','view-profile','master','e89cb647-9ac1-4636-8c3a-9e5523c27fda',NULL),('9eaebe58-64f9-4fad-adb6-8af7def9c619','0ca35df5-937d-42bb-851c-07b8f82426ae',_binary '','${role_impersonation}','impersonation','stock-manager','0ca35df5-937d-42bb-851c-07b8f82426ae',NULL),('9fced1c4-8a54-4bbc-a588-d54b13ff6fde','c596116e-ebea-4ae9-8e42-0d6342fd47a3',_binary '','${role_view-users}','view-users','master','c596116e-ebea-4ae9-8e42-0d6342fd47a3',NULL),('9ff94732-0b79-4af3-b276-a9c8b599b509','0ca35df5-937d-42bb-851c-07b8f82426ae',_binary '','${role_manage-authorization}','manage-authorization','stock-manager','0ca35df5-937d-42bb-851c-07b8f82426ae',NULL),('a0ac0c88-ed70-4219-a780-04b4719d7f50','0ca35df5-937d-42bb-851c-07b8f82426ae',_binary '','${role_realm-admin}','realm-admin','stock-manager','0ca35df5-937d-42bb-851c-07b8f82426ae',NULL),('a2e7547c-c4d6-4bc2-8ed9-0c928da956cf','41b8abc2-876d-4760-83e9-d5718d861104',_binary '','${role_view-authorization}','view-authorization','master','41b8abc2-876d-4760-83e9-d5718d861104',NULL),('a7d65768-b3ec-400b-989c-626e8ab470af','95b34f61-3dc8-43ff-b304-b07690a45b6f',_binary '','${role_view-profile}','view-profile','stock-manager','95b34f61-3dc8-43ff-b304-b07690a45b6f',NULL),('aa401c39-07f0-4fce-adbc-d14033596919','f2b2bdbb-ebc8-4057-a5d8-eb287e05765c',_binary '','${role_read-token}','read-token','stock-manager','f2b2bdbb-ebc8-4057-a5d8-eb287e05765c',NULL),('aae6fce9-b221-4ae8-85f8-df7e1edfa087','41b8abc2-876d-4760-83e9-d5718d861104',_binary '','${role_impersonation}','impersonation','master','41b8abc2-876d-4760-83e9-d5718d861104',NULL),('ab07426c-ff4d-40ff-b4ce-ab5aac3f0db2','master',_binary '\0','${role_admin}','admin','master',NULL,NULL),('acd4ec0c-fdd5-44ff-9c55-30529f299705','c596116e-ebea-4ae9-8e42-0d6342fd47a3',_binary '','${role_manage-identity-providers}','manage-identity-providers','master','c596116e-ebea-4ae9-8e42-0d6342fd47a3',NULL),('b3441c69-e2ab-4b35-8353-ba07dae0f63e','c596116e-ebea-4ae9-8e42-0d6342fd47a3',_binary '','${role_query-groups}','query-groups','master','c596116e-ebea-4ae9-8e42-0d6342fd47a3',NULL),('b8f1471c-9c21-48ed-bb5f-aca4906c00bb','bc214d49-b69e-4807-b223-65d603bbec90',_binary '','${role_read-token}','read-token','master','bc214d49-b69e-4807-b223-65d603bbec90',NULL),('b94aebad-bd67-4116-9ce4-bba11891a472','e89cb647-9ac1-4636-8c3a-9e5523c27fda',_binary '','${role_view-consent}','view-consent','master','e89cb647-9ac1-4636-8c3a-9e5523c27fda',NULL),('be346d6b-2f95-481f-9b31-5ed103111958','41b8abc2-876d-4760-83e9-d5718d861104',_binary '','${role_view-users}','view-users','master','41b8abc2-876d-4760-83e9-d5718d861104',NULL),('be71abc0-1b0e-4df4-ae2c-1c84452c1095','stock-manager',_binary '\0','${role_uma_authorization}','uma_authorization','stock-manager',NULL,NULL),('c0dc893c-d1a9-493c-b24c-8b0ef8d5c76f','0ca35df5-937d-42bb-851c-07b8f82426ae',_binary '','${role_manage-events}','manage-events','stock-manager','0ca35df5-937d-42bb-851c-07b8f82426ae',NULL),('c3703382-77a7-458b-b35f-d607f3fd4650','c596116e-ebea-4ae9-8e42-0d6342fd47a3',_binary '','${role_impersonation}','impersonation','master','c596116e-ebea-4ae9-8e42-0d6342fd47a3',NULL),('c7cde9ac-21a4-43ae-8ada-ee76551f46b4','0ca35df5-937d-42bb-851c-07b8f82426ae',_binary '','${role_view-identity-providers}','view-identity-providers','stock-manager','0ca35df5-937d-42bb-851c-07b8f82426ae',NULL),('cab86077-aa6b-481f-8b20-d7d4cbf87594','c596116e-ebea-4ae9-8e42-0d6342fd47a3',_binary '','${role_create-client}','create-client','master','c596116e-ebea-4ae9-8e42-0d6342fd47a3',NULL),('cd0169bd-11a2-41d4-b60c-67ba02db50d6','41b8abc2-876d-4760-83e9-d5718d861104',_binary '','${role_view-identity-providers}','view-identity-providers','master','41b8abc2-876d-4760-83e9-d5718d861104',NULL),('d2edd736-038b-4235-a2ff-150605d9cb39','c596116e-ebea-4ae9-8e42-0d6342fd47a3',_binary '','${role_manage-users}','manage-users','master','c596116e-ebea-4ae9-8e42-0d6342fd47a3',NULL),('dc2f2423-491b-44c2-b8fe-c39f3b581be8','41b8abc2-876d-4760-83e9-d5718d861104',_binary '','${role_manage-identity-providers}','manage-identity-providers','master','41b8abc2-876d-4760-83e9-d5718d861104',NULL),('e2b1011f-ea8f-49ec-b72a-f9514ef6e26e','c596116e-ebea-4ae9-8e42-0d6342fd47a3',_binary '','${role_view-authorization}','view-authorization','master','c596116e-ebea-4ae9-8e42-0d6342fd47a3',NULL),('e372e134-c537-4f75-8b62-83dc374277c9','95b34f61-3dc8-43ff-b304-b07690a45b6f',_binary '','${role_delete-account}','delete-account','stock-manager','95b34f61-3dc8-43ff-b304-b07690a45b6f',NULL),('e53e9c33-4f67-4464-ae16-58f90bd19aaf','41b8abc2-876d-4760-83e9-d5718d861104',_binary '','${role_create-client}','create-client','master','41b8abc2-876d-4760-83e9-d5718d861104',NULL),('e71097f2-197f-47a8-98ba-685b13c3fba1','0ca35df5-937d-42bb-851c-07b8f82426ae',_binary '','${role_view-clients}','view-clients','stock-manager','0ca35df5-937d-42bb-851c-07b8f82426ae',NULL),('f0a7da7b-7ea2-4664-a5bb-8a450fa11d8f','stock-manager',_binary '\0','${role_offline-access}','offline_access','stock-manager',NULL,NULL),('fa36b881-56aa-4acf-93d4-31df0c09feaf','c596116e-ebea-4ae9-8e42-0d6342fd47a3',_binary '','${role_view-events}','view-events','master','c596116e-ebea-4ae9-8e42-0d6342fd47a3',NULL);
/*!40000 ALTER TABLE `KEYCLOAK_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MIGRATION_MODEL`
--

DROP TABLE IF EXISTS `MIGRATION_MODEL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MIGRATION_MODEL` (
  `ID` varchar(36) NOT NULL,
  `VERSION` varchar(36) DEFAULT NULL,
  `UPDATE_TIME` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IDX_UPDATE_TIME` (`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MIGRATION_MODEL`
--

LOCK TABLES `MIGRATION_MODEL` WRITE;
/*!40000 ALTER TABLE `MIGRATION_MODEL` DISABLE KEYS */;
INSERT INTO `MIGRATION_MODEL` VALUES ('favwi','13.0.1',1622040108);
/*!40000 ALTER TABLE `MIGRATION_MODEL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OFFLINE_CLIENT_SESSION`
--

DROP TABLE IF EXISTS `OFFLINE_CLIENT_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OFFLINE_CLIENT_SESSION` (
  `USER_SESSION_ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) NOT NULL,
  `OFFLINE_FLAG` varchar(4) NOT NULL,
  `TIMESTAMP` int DEFAULT NULL,
  `DATA` longtext,
  `CLIENT_STORAGE_PROVIDER` varchar(36) NOT NULL DEFAULT 'local',
  `EXTERNAL_CLIENT_ID` varchar(255) NOT NULL DEFAULT 'local',
  PRIMARY KEY (`USER_SESSION_ID`,`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`OFFLINE_FLAG`),
  KEY `IDX_US_SESS_ID_ON_CL_SESS` (`USER_SESSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OFFLINE_CLIENT_SESSION`
--

LOCK TABLES `OFFLINE_CLIENT_SESSION` WRITE;
/*!40000 ALTER TABLE `OFFLINE_CLIENT_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `OFFLINE_CLIENT_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OFFLINE_USER_SESSION`
--

DROP TABLE IF EXISTS `OFFLINE_USER_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OFFLINE_USER_SESSION` (
  `USER_SESSION_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `CREATED_ON` int NOT NULL,
  `OFFLINE_FLAG` varchar(4) NOT NULL,
  `DATA` longtext,
  `LAST_SESSION_REFRESH` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`USER_SESSION_ID`,`OFFLINE_FLAG`),
  KEY `IDX_OFFLINE_USS_CREATEDON` (`CREATED_ON`),
  KEY `IDX_OFFLINE_USS_PRELOAD` (`OFFLINE_FLAG`,`CREATED_ON`,`USER_SESSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OFFLINE_USER_SESSION`
--

LOCK TABLES `OFFLINE_USER_SESSION` WRITE;
/*!40000 ALTER TABLE `OFFLINE_USER_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `OFFLINE_USER_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `POLICY_CONFIG`
--

DROP TABLE IF EXISTS `POLICY_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `POLICY_CONFIG` (
  `POLICY_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` longtext,
  PRIMARY KEY (`POLICY_ID`,`NAME`),
  CONSTRAINT `FKDC34197CF864C4E43` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POLICY_CONFIG`
--

LOCK TABLES `POLICY_CONFIG` WRITE;
/*!40000 ALTER TABLE `POLICY_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `POLICY_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROTOCOL_MAPPER`
--

DROP TABLE IF EXISTS `PROTOCOL_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROTOCOL_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `PROTOCOL` varchar(255) NOT NULL,
  `PROTOCOL_MAPPER_NAME` varchar(255) NOT NULL,
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  `CLIENT_SCOPE_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_PROTOCOL_MAPPER_CLIENT` (`CLIENT_ID`),
  KEY `IDX_CLSCOPE_PROTMAP` (`CLIENT_SCOPE_ID`),
  CONSTRAINT `FK_CLI_SCOPE_MAPPER` FOREIGN KEY (`CLIENT_SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`),
  CONSTRAINT `FK_PCM_REALM` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROTOCOL_MAPPER`
--

LOCK TABLES `PROTOCOL_MAPPER` WRITE;
/*!40000 ALTER TABLE `PROTOCOL_MAPPER` DISABLE KEYS */;
INSERT INTO `PROTOCOL_MAPPER` VALUES ('01fd3716-d4ab-41de-bcdb-b78db48f5c53','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'94320587-e15d-44e5-b921-337e62255256'),('0456613d-0abb-4dae-b51e-0638c98ae163','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'db09ffc3-6f35-43c2-a3b6-51ec55b9adc1'),('09e6c1e8-9c14-4462-9320-e8da1b5090a6','locale','openid-connect','oidc-usermodel-attribute-mapper','ef50b7ea-73db-4f62-83fe-f8ab137c1714',NULL),('0cb7688c-d210-4df8-86fe-6e3b3100260b','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'4c7fe22c-655f-4cab-ac4b-7dbe5c61039a'),('0d868329-945d-40d9-866c-4f3e1b36588c','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'db09ffc3-6f35-43c2-a3b6-51ec55b9adc1'),('102b6816-59f1-4cd7-857b-919ebc08c305','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'db09ffc3-6f35-43c2-a3b6-51ec55b9adc1'),('15cfa0d6-bdca-4fdc-8cb7-c187188b0df5','full name','openid-connect','oidc-full-name-mapper',NULL,'db09ffc3-6f35-43c2-a3b6-51ec55b9adc1'),('18ebaf81-3bd8-4381-99ec-7daddddcbbc2','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'4c7fe22c-655f-4cab-ac4b-7dbe5c61039a'),('2a40e00f-5f91-4bde-a06f-4377a0a5256a','upn','openid-connect','oidc-usermodel-property-mapper',NULL,'83f62477-ebcd-412b-bb61-d2464ecbf959'),('2d837108-8182-44c9-88af-89f5da62c59b','email','openid-connect','oidc-usermodel-property-mapper',NULL,'467711c6-a82f-4814-af06-c94a29fca704'),('2ee5b3ba-863c-4886-9f71-f45efb8792d4','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'db09ffc3-6f35-43c2-a3b6-51ec55b9adc1'),('30bea957-e005-44bf-85ac-657cded27674','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'db09ffc3-6f35-43c2-a3b6-51ec55b9adc1'),('3121f336-536c-49c1-bb18-21cad8b437b2','role list','saml','saml-role-list-mapper',NULL,'3bc320a7-f2a2-4a9b-8297-0d6f81e74336'),('3e1b6d80-871e-4fbe-9238-740fc777a090','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'b4b8762f-50d4-4491-aea8-357f0737bf38'),('492c5ca5-e92d-427e-a962-6e4172fe6c1e','username','openid-connect','oidc-usermodel-property-mapper',NULL,'db09ffc3-6f35-43c2-a3b6-51ec55b9adc1'),('49936678-71e9-4827-a5b3-cd7a6af35ea1','family name','openid-connect','oidc-usermodel-property-mapper',NULL,'db09ffc3-6f35-43c2-a3b6-51ec55b9adc1'),('4a403f8f-77a0-45bf-9646-1cfcbe7c3847','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'fd41383b-a59e-46a6-b5f6-829f58beede7'),('4c75244b-9dbc-47cd-ade9-e4071d584ea0','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'4c7fe22c-655f-4cab-ac4b-7dbe5c61039a'),('4dc34965-4239-4271-b042-3b6ca3417ad8','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'4c7fe22c-655f-4cab-ac4b-7dbe5c61039a'),('513f5a7b-9f93-4f12-890b-d212693610d4','address','openid-connect','oidc-address-mapper',NULL,'52ec758a-b9a4-41e7-8716-71f21f7fe7f0'),('5144daf1-31f6-473e-8c42-196135d0e8d5','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'5002ebff-add7-4a60-a6c3-4a2d6197a2c3'),('56cbbec4-fb0f-4ce0-bb39-3e8d34d7ae00','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'b4b8762f-50d4-4491-aea8-357f0737bf38'),('5a875412-7b91-444d-8a55-fe0fc1238542','family name','openid-connect','oidc-usermodel-property-mapper',NULL,'4c7fe22c-655f-4cab-ac4b-7dbe5c61039a'),('5b45b0c3-0ee2-4d39-9c43-f71e6f57b3d7','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'4c7fe22c-655f-4cab-ac4b-7dbe5c61039a'),('5f781e68-794b-4941-bd0c-5445f89ff620','audience resolve','openid-connect','oidc-audience-resolve-mapper','e5918595-c567-4a69-bfd1-0ac9393a561c',NULL),('735a37c7-3064-4534-bec4-aebdf3a4f270','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'4c7fe22c-655f-4cab-ac4b-7dbe5c61039a'),('737d09bd-c598-41bc-8d3a-19eff5dd9eee','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'83f62477-ebcd-412b-bb61-d2464ecbf959'),('73b69693-e2e7-44e1-99c8-e114f45c3fee','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'467711c6-a82f-4814-af06-c94a29fca704'),('7419c782-304d-4c43-8cb7-132f8f6e99be','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'8d837e12-dca6-4763-a286-119a1b8a16f0'),('7e6ae5cb-72f0-48c4-ba9f-417f21f874ec','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'4c7fe22c-655f-4cab-ac4b-7dbe5c61039a'),('80e4d1d5-898b-4d17-8434-ac0135c43c89','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'db09ffc3-6f35-43c2-a3b6-51ec55b9adc1'),('81290569-2720-4c25-ae25-d417b95fdf55','locale','openid-connect','oidc-usermodel-attribute-mapper','b45787d7-41bc-4fb7-98ed-e1e6bff85ef9',NULL),('84ddd838-6e54-447b-824c-2b6852afb855','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'ed0a66e8-1873-43b0-938b-94c093a000a9'),('923d55e0-5af5-4e87-b06a-4bafc6212194','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'4c7fe22c-655f-4cab-ac4b-7dbe5c61039a'),('96e213b0-dfa8-4432-aba0-3287484d5576','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'5002ebff-add7-4a60-a6c3-4a2d6197a2c3'),('970768a3-06b1-403b-9a98-3c3518c1387b','given name','openid-connect','oidc-usermodel-property-mapper',NULL,'4c7fe22c-655f-4cab-ac4b-7dbe5c61039a'),('988e74f6-3a10-4f25-9142-f6fd3503cd49','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'db09ffc3-6f35-43c2-a3b6-51ec55b9adc1'),('a02a2df5-21af-41e7-b1b0-87bdbbe65201','username','openid-connect','oidc-usermodel-property-mapper',NULL,'4c7fe22c-655f-4cab-ac4b-7dbe5c61039a'),('a1ce2e7c-2eea-45b7-819a-18473dd3facb','audience resolve','openid-connect','oidc-audience-resolve-mapper','3538b8a7-c81d-4ec9-8741-202db96b1a2f',NULL),('a8b2388a-5cbe-4c03-a751-7bb12c4e77c9','email','openid-connect','oidc-usermodel-property-mapper',NULL,'5774fffd-6c96-4034-ae97-e0881669d722'),('aa34fc02-70ac-43df-ac56-08142e7c8fcc','address','openid-connect','oidc-address-mapper',NULL,'d788b693-45d3-4f4f-9b6b-3c59d8dacdab'),('af7044bc-4c7d-4f8d-bfdb-b9d45146da42','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'b4b8762f-50d4-4491-aea8-357f0737bf38'),('b413ea7f-714f-420f-9484-ac003db3f85f','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'db09ffc3-6f35-43c2-a3b6-51ec55b9adc1'),('b8cd07bc-54c7-4881-8856-8aa3b5f1aed4','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'4c7fe22c-655f-4cab-ac4b-7dbe5c61039a'),('b91f506f-6864-4070-b7bf-53df0361205c','full name','openid-connect','oidc-full-name-mapper',NULL,'4c7fe22c-655f-4cab-ac4b-7dbe5c61039a'),('bd072f07-ce9f-40b1-b24f-c54bab9445a3','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'a0c244a0-9390-4107-85e6-c2e5e853223b'),('c2c7bca8-6d37-4e05-8a8e-d14b856135e6','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'5774fffd-6c96-4034-ae97-e0881669d722'),('cb45f7d9-218f-415b-b751-cf0dfab8edb2','upn','openid-connect','oidc-usermodel-property-mapper',NULL,'fd41383b-a59e-46a6-b5f6-829f58beede7'),('cb5294f8-802a-4d42-ba14-7629cefbaaba','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'db09ffc3-6f35-43c2-a3b6-51ec55b9adc1'),('d45ef9c6-7f77-41d5-b1d4-9ffafd2df84f','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'5002ebff-add7-4a60-a6c3-4a2d6197a2c3'),('dc21b950-120e-48a1-b87d-6f761953d5b4','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'4c7fe22c-655f-4cab-ac4b-7dbe5c61039a'),('e7d1f900-8800-4d2e-b372-90c7c21ff4f6','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'a0c244a0-9390-4107-85e6-c2e5e853223b'),('e97fd332-8f33-4766-9090-c1cbd9c7c66f','role list','saml','saml-role-list-mapper',NULL,'54115c90-c720-439f-9ae6-59085eef8d41'),('f3a80523-66e4-4247-9a49-eaa9d067dd2a','given name','openid-connect','oidc-usermodel-property-mapper',NULL,'db09ffc3-6f35-43c2-a3b6-51ec55b9adc1'),('fb2b90ec-ceda-4f60-9e5c-9dc20152a081','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'db09ffc3-6f35-43c2-a3b6-51ec55b9adc1'),('fdab36ee-553f-470c-b31e-74de8bc90d28','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'94320587-e15d-44e5-b921-337e62255256');
/*!40000 ALTER TABLE `PROTOCOL_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROTOCOL_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `PROTOCOL_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROTOCOL_MAPPER_CONFIG` (
  `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`PROTOCOL_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_PMCONFIG` FOREIGN KEY (`PROTOCOL_MAPPER_ID`) REFERENCES `PROTOCOL_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROTOCOL_MAPPER_CONFIG`
--

LOCK TABLES `PROTOCOL_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `PROTOCOL_MAPPER_CONFIG` DISABLE KEYS */;
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('01fd3716-d4ab-41de-bcdb-b78db48f5c53','true','access.token.claim'),('01fd3716-d4ab-41de-bcdb-b78db48f5c53','phone_number','claim.name'),('01fd3716-d4ab-41de-bcdb-b78db48f5c53','true','id.token.claim'),('01fd3716-d4ab-41de-bcdb-b78db48f5c53','String','jsonType.label'),('01fd3716-d4ab-41de-bcdb-b78db48f5c53','phoneNumber','user.attribute'),('01fd3716-d4ab-41de-bcdb-b78db48f5c53','true','userinfo.token.claim'),('0456613d-0abb-4dae-b51e-0638c98ae163','true','access.token.claim'),('0456613d-0abb-4dae-b51e-0638c98ae163','profile','claim.name'),('0456613d-0abb-4dae-b51e-0638c98ae163','true','id.token.claim'),('0456613d-0abb-4dae-b51e-0638c98ae163','String','jsonType.label'),('0456613d-0abb-4dae-b51e-0638c98ae163','profile','user.attribute'),('0456613d-0abb-4dae-b51e-0638c98ae163','true','userinfo.token.claim'),('09e6c1e8-9c14-4462-9320-e8da1b5090a6','true','access.token.claim'),('09e6c1e8-9c14-4462-9320-e8da1b5090a6','locale','claim.name'),('09e6c1e8-9c14-4462-9320-e8da1b5090a6','true','id.token.claim'),('09e6c1e8-9c14-4462-9320-e8da1b5090a6','String','jsonType.label'),('09e6c1e8-9c14-4462-9320-e8da1b5090a6','locale','user.attribute'),('09e6c1e8-9c14-4462-9320-e8da1b5090a6','true','userinfo.token.claim'),('0cb7688c-d210-4df8-86fe-6e3b3100260b','true','access.token.claim'),('0cb7688c-d210-4df8-86fe-6e3b3100260b','website','claim.name'),('0cb7688c-d210-4df8-86fe-6e3b3100260b','true','id.token.claim'),('0cb7688c-d210-4df8-86fe-6e3b3100260b','String','jsonType.label'),('0cb7688c-d210-4df8-86fe-6e3b3100260b','website','user.attribute'),('0cb7688c-d210-4df8-86fe-6e3b3100260b','true','userinfo.token.claim'),('0d868329-945d-40d9-866c-4f3e1b36588c','true','access.token.claim'),('0d868329-945d-40d9-866c-4f3e1b36588c','birthdate','claim.name'),('0d868329-945d-40d9-866c-4f3e1b36588c','true','id.token.claim'),('0d868329-945d-40d9-866c-4f3e1b36588c','String','jsonType.label'),('0d868329-945d-40d9-866c-4f3e1b36588c','birthdate','user.attribute'),('0d868329-945d-40d9-866c-4f3e1b36588c','true','userinfo.token.claim'),('102b6816-59f1-4cd7-857b-919ebc08c305','true','access.token.claim'),('102b6816-59f1-4cd7-857b-919ebc08c305','zoneinfo','claim.name'),('102b6816-59f1-4cd7-857b-919ebc08c305','true','id.token.claim'),('102b6816-59f1-4cd7-857b-919ebc08c305','String','jsonType.label'),('102b6816-59f1-4cd7-857b-919ebc08c305','zoneinfo','user.attribute'),('102b6816-59f1-4cd7-857b-919ebc08c305','true','userinfo.token.claim'),('15cfa0d6-bdca-4fdc-8cb7-c187188b0df5','true','access.token.claim'),('15cfa0d6-bdca-4fdc-8cb7-c187188b0df5','true','id.token.claim'),('15cfa0d6-bdca-4fdc-8cb7-c187188b0df5','true','userinfo.token.claim'),('18ebaf81-3bd8-4381-99ec-7daddddcbbc2','true','access.token.claim'),('18ebaf81-3bd8-4381-99ec-7daddddcbbc2','locale','claim.name'),('18ebaf81-3bd8-4381-99ec-7daddddcbbc2','true','id.token.claim'),('18ebaf81-3bd8-4381-99ec-7daddddcbbc2','String','jsonType.label'),('18ebaf81-3bd8-4381-99ec-7daddddcbbc2','locale','user.attribute'),('18ebaf81-3bd8-4381-99ec-7daddddcbbc2','true','userinfo.token.claim'),('2a40e00f-5f91-4bde-a06f-4377a0a5256a','true','access.token.claim'),('2a40e00f-5f91-4bde-a06f-4377a0a5256a','upn','claim.name'),('2a40e00f-5f91-4bde-a06f-4377a0a5256a','true','id.token.claim'),('2a40e00f-5f91-4bde-a06f-4377a0a5256a','String','jsonType.label'),('2a40e00f-5f91-4bde-a06f-4377a0a5256a','username','user.attribute'),('2a40e00f-5f91-4bde-a06f-4377a0a5256a','true','userinfo.token.claim'),('2d837108-8182-44c9-88af-89f5da62c59b','true','access.token.claim'),('2d837108-8182-44c9-88af-89f5da62c59b','email','claim.name'),('2d837108-8182-44c9-88af-89f5da62c59b','true','id.token.claim'),('2d837108-8182-44c9-88af-89f5da62c59b','String','jsonType.label'),('2d837108-8182-44c9-88af-89f5da62c59b','email','user.attribute'),('2d837108-8182-44c9-88af-89f5da62c59b','true','userinfo.token.claim'),('2ee5b3ba-863c-4886-9f71-f45efb8792d4','true','access.token.claim'),('2ee5b3ba-863c-4886-9f71-f45efb8792d4','locale','claim.name'),('2ee5b3ba-863c-4886-9f71-f45efb8792d4','true','id.token.claim'),('2ee5b3ba-863c-4886-9f71-f45efb8792d4','String','jsonType.label'),('2ee5b3ba-863c-4886-9f71-f45efb8792d4','locale','user.attribute'),('2ee5b3ba-863c-4886-9f71-f45efb8792d4','true','userinfo.token.claim'),('30bea957-e005-44bf-85ac-657cded27674','true','access.token.claim'),('30bea957-e005-44bf-85ac-657cded27674','middle_name','claim.name'),('30bea957-e005-44bf-85ac-657cded27674','true','id.token.claim'),('30bea957-e005-44bf-85ac-657cded27674','String','jsonType.label'),('30bea957-e005-44bf-85ac-657cded27674','middleName','user.attribute'),('30bea957-e005-44bf-85ac-657cded27674','true','userinfo.token.claim'),('3121f336-536c-49c1-bb18-21cad8b437b2','Role','attribute.name'),('3121f336-536c-49c1-bb18-21cad8b437b2','Basic','attribute.nameformat'),('3121f336-536c-49c1-bb18-21cad8b437b2','false','single'),('3e1b6d80-871e-4fbe-9238-740fc777a090','true','access.token.claim'),('3e1b6d80-871e-4fbe-9238-740fc777a090','resource_access.${client_id}.roles','claim.name'),('3e1b6d80-871e-4fbe-9238-740fc777a090','String','jsonType.label'),('3e1b6d80-871e-4fbe-9238-740fc777a090','true','multivalued'),('3e1b6d80-871e-4fbe-9238-740fc777a090','foo','user.attribute'),('492c5ca5-e92d-427e-a962-6e4172fe6c1e','true','access.token.claim'),('492c5ca5-e92d-427e-a962-6e4172fe6c1e','preferred_username','claim.name'),('492c5ca5-e92d-427e-a962-6e4172fe6c1e','true','id.token.claim'),('492c5ca5-e92d-427e-a962-6e4172fe6c1e','String','jsonType.label'),('492c5ca5-e92d-427e-a962-6e4172fe6c1e','username','user.attribute'),('492c5ca5-e92d-427e-a962-6e4172fe6c1e','true','userinfo.token.claim'),('49936678-71e9-4827-a5b3-cd7a6af35ea1','true','access.token.claim'),('49936678-71e9-4827-a5b3-cd7a6af35ea1','family_name','claim.name'),('49936678-71e9-4827-a5b3-cd7a6af35ea1','true','id.token.claim'),('49936678-71e9-4827-a5b3-cd7a6af35ea1','String','jsonType.label'),('49936678-71e9-4827-a5b3-cd7a6af35ea1','lastName','user.attribute'),('49936678-71e9-4827-a5b3-cd7a6af35ea1','true','userinfo.token.claim'),('4a403f8f-77a0-45bf-9646-1cfcbe7c3847','true','access.token.claim'),('4a403f8f-77a0-45bf-9646-1cfcbe7c3847','groups','claim.name'),('4a403f8f-77a0-45bf-9646-1cfcbe7c3847','true','id.token.claim'),('4a403f8f-77a0-45bf-9646-1cfcbe7c3847','String','jsonType.label'),('4a403f8f-77a0-45bf-9646-1cfcbe7c3847','true','multivalued'),('4a403f8f-77a0-45bf-9646-1cfcbe7c3847','foo','user.attribute'),('4a403f8f-77a0-45bf-9646-1cfcbe7c3847','true','userinfo.token.claim'),('4c75244b-9dbc-47cd-ade9-e4071d584ea0','true','access.token.claim'),('4c75244b-9dbc-47cd-ade9-e4071d584ea0','birthdate','claim.name'),('4c75244b-9dbc-47cd-ade9-e4071d584ea0','true','id.token.claim'),('4c75244b-9dbc-47cd-ade9-e4071d584ea0','String','jsonType.label'),('4c75244b-9dbc-47cd-ade9-e4071d584ea0','birthdate','user.attribute'),('4c75244b-9dbc-47cd-ade9-e4071d584ea0','true','userinfo.token.claim'),('4dc34965-4239-4271-b042-3b6ca3417ad8','true','access.token.claim'),('4dc34965-4239-4271-b042-3b6ca3417ad8','profile','claim.name'),('4dc34965-4239-4271-b042-3b6ca3417ad8','true','id.token.claim'),('4dc34965-4239-4271-b042-3b6ca3417ad8','String','jsonType.label'),('4dc34965-4239-4271-b042-3b6ca3417ad8','profile','user.attribute'),('4dc34965-4239-4271-b042-3b6ca3417ad8','true','userinfo.token.claim'),('513f5a7b-9f93-4f12-890b-d212693610d4','true','access.token.claim'),('513f5a7b-9f93-4f12-890b-d212693610d4','true','id.token.claim'),('513f5a7b-9f93-4f12-890b-d212693610d4','country','user.attribute.country'),('513f5a7b-9f93-4f12-890b-d212693610d4','formatted','user.attribute.formatted'),('513f5a7b-9f93-4f12-890b-d212693610d4','locality','user.attribute.locality'),('513f5a7b-9f93-4f12-890b-d212693610d4','postal_code','user.attribute.postal_code'),('513f5a7b-9f93-4f12-890b-d212693610d4','region','user.attribute.region'),('513f5a7b-9f93-4f12-890b-d212693610d4','street','user.attribute.street'),('513f5a7b-9f93-4f12-890b-d212693610d4','true','userinfo.token.claim'),('5144daf1-31f6-473e-8c42-196135d0e8d5','true','access.token.claim'),('5144daf1-31f6-473e-8c42-196135d0e8d5','resource_access.${client_id}.roles','claim.name'),('5144daf1-31f6-473e-8c42-196135d0e8d5','String','jsonType.label'),('5144daf1-31f6-473e-8c42-196135d0e8d5','true','multivalued'),('5144daf1-31f6-473e-8c42-196135d0e8d5','foo','user.attribute'),('56cbbec4-fb0f-4ce0-bb39-3e8d34d7ae00','true','access.token.claim'),('56cbbec4-fb0f-4ce0-bb39-3e8d34d7ae00','realm_access.roles','claim.name'),('56cbbec4-fb0f-4ce0-bb39-3e8d34d7ae00','String','jsonType.label'),('56cbbec4-fb0f-4ce0-bb39-3e8d34d7ae00','true','multivalued'),('56cbbec4-fb0f-4ce0-bb39-3e8d34d7ae00','foo','user.attribute'),('5a875412-7b91-444d-8a55-fe0fc1238542','true','access.token.claim'),('5a875412-7b91-444d-8a55-fe0fc1238542','family_name','claim.name'),('5a875412-7b91-444d-8a55-fe0fc1238542','true','id.token.claim'),('5a875412-7b91-444d-8a55-fe0fc1238542','String','jsonType.label'),('5a875412-7b91-444d-8a55-fe0fc1238542','lastName','user.attribute'),('5a875412-7b91-444d-8a55-fe0fc1238542','true','userinfo.token.claim'),('5b45b0c3-0ee2-4d39-9c43-f71e6f57b3d7','true','access.token.claim'),('5b45b0c3-0ee2-4d39-9c43-f71e6f57b3d7','gender','claim.name'),('5b45b0c3-0ee2-4d39-9c43-f71e6f57b3d7','true','id.token.claim'),('5b45b0c3-0ee2-4d39-9c43-f71e6f57b3d7','String','jsonType.label'),('5b45b0c3-0ee2-4d39-9c43-f71e6f57b3d7','gender','user.attribute'),('5b45b0c3-0ee2-4d39-9c43-f71e6f57b3d7','true','userinfo.token.claim'),('735a37c7-3064-4534-bec4-aebdf3a4f270','true','access.token.claim'),('735a37c7-3064-4534-bec4-aebdf3a4f270','middle_name','claim.name'),('735a37c7-3064-4534-bec4-aebdf3a4f270','true','id.token.claim'),('735a37c7-3064-4534-bec4-aebdf3a4f270','String','jsonType.label'),('735a37c7-3064-4534-bec4-aebdf3a4f270','middleName','user.attribute'),('735a37c7-3064-4534-bec4-aebdf3a4f270','true','userinfo.token.claim'),('737d09bd-c598-41bc-8d3a-19eff5dd9eee','true','access.token.claim'),('737d09bd-c598-41bc-8d3a-19eff5dd9eee','groups','claim.name'),('737d09bd-c598-41bc-8d3a-19eff5dd9eee','true','id.token.claim'),('737d09bd-c598-41bc-8d3a-19eff5dd9eee','String','jsonType.label'),('737d09bd-c598-41bc-8d3a-19eff5dd9eee','true','multivalued'),('737d09bd-c598-41bc-8d3a-19eff5dd9eee','foo','user.attribute'),('73b69693-e2e7-44e1-99c8-e114f45c3fee','true','access.token.claim'),('73b69693-e2e7-44e1-99c8-e114f45c3fee','email_verified','claim.name'),('73b69693-e2e7-44e1-99c8-e114f45c3fee','true','id.token.claim'),('73b69693-e2e7-44e1-99c8-e114f45c3fee','boolean','jsonType.label'),('73b69693-e2e7-44e1-99c8-e114f45c3fee','emailVerified','user.attribute'),('73b69693-e2e7-44e1-99c8-e114f45c3fee','true','userinfo.token.claim'),('7e6ae5cb-72f0-48c4-ba9f-417f21f874ec','true','access.token.claim'),('7e6ae5cb-72f0-48c4-ba9f-417f21f874ec','nickname','claim.name'),('7e6ae5cb-72f0-48c4-ba9f-417f21f874ec','true','id.token.claim'),('7e6ae5cb-72f0-48c4-ba9f-417f21f874ec','String','jsonType.label'),('7e6ae5cb-72f0-48c4-ba9f-417f21f874ec','nickname','user.attribute'),('7e6ae5cb-72f0-48c4-ba9f-417f21f874ec','true','userinfo.token.claim'),('80e4d1d5-898b-4d17-8434-ac0135c43c89','true','access.token.claim'),('80e4d1d5-898b-4d17-8434-ac0135c43c89','nickname','claim.name'),('80e4d1d5-898b-4d17-8434-ac0135c43c89','true','id.token.claim'),('80e4d1d5-898b-4d17-8434-ac0135c43c89','String','jsonType.label'),('80e4d1d5-898b-4d17-8434-ac0135c43c89','nickname','user.attribute'),('80e4d1d5-898b-4d17-8434-ac0135c43c89','true','userinfo.token.claim'),('81290569-2720-4c25-ae25-d417b95fdf55','true','access.token.claim'),('81290569-2720-4c25-ae25-d417b95fdf55','locale','claim.name'),('81290569-2720-4c25-ae25-d417b95fdf55','true','id.token.claim'),('81290569-2720-4c25-ae25-d417b95fdf55','String','jsonType.label'),('81290569-2720-4c25-ae25-d417b95fdf55','locale','user.attribute'),('81290569-2720-4c25-ae25-d417b95fdf55','true','userinfo.token.claim'),('923d55e0-5af5-4e87-b06a-4bafc6212194','true','access.token.claim'),('923d55e0-5af5-4e87-b06a-4bafc6212194','updated_at','claim.name'),('923d55e0-5af5-4e87-b06a-4bafc6212194','true','id.token.claim'),('923d55e0-5af5-4e87-b06a-4bafc6212194','String','jsonType.label'),('923d55e0-5af5-4e87-b06a-4bafc6212194','updatedAt','user.attribute'),('923d55e0-5af5-4e87-b06a-4bafc6212194','true','userinfo.token.claim'),('970768a3-06b1-403b-9a98-3c3518c1387b','true','access.token.claim'),('970768a3-06b1-403b-9a98-3c3518c1387b','given_name','claim.name'),('970768a3-06b1-403b-9a98-3c3518c1387b','true','id.token.claim'),('970768a3-06b1-403b-9a98-3c3518c1387b','String','jsonType.label'),('970768a3-06b1-403b-9a98-3c3518c1387b','firstName','user.attribute'),('970768a3-06b1-403b-9a98-3c3518c1387b','true','userinfo.token.claim'),('988e74f6-3a10-4f25-9142-f6fd3503cd49','true','access.token.claim'),('988e74f6-3a10-4f25-9142-f6fd3503cd49','picture','claim.name'),('988e74f6-3a10-4f25-9142-f6fd3503cd49','true','id.token.claim'),('988e74f6-3a10-4f25-9142-f6fd3503cd49','String','jsonType.label'),('988e74f6-3a10-4f25-9142-f6fd3503cd49','picture','user.attribute'),('988e74f6-3a10-4f25-9142-f6fd3503cd49','true','userinfo.token.claim'),('a02a2df5-21af-41e7-b1b0-87bdbbe65201','true','access.token.claim'),('a02a2df5-21af-41e7-b1b0-87bdbbe65201','preferred_username','claim.name'),('a02a2df5-21af-41e7-b1b0-87bdbbe65201','true','id.token.claim'),('a02a2df5-21af-41e7-b1b0-87bdbbe65201','String','jsonType.label'),('a02a2df5-21af-41e7-b1b0-87bdbbe65201','username','user.attribute'),('a02a2df5-21af-41e7-b1b0-87bdbbe65201','true','userinfo.token.claim'),('a8b2388a-5cbe-4c03-a751-7bb12c4e77c9','true','access.token.claim'),('a8b2388a-5cbe-4c03-a751-7bb12c4e77c9','email','claim.name'),('a8b2388a-5cbe-4c03-a751-7bb12c4e77c9','true','id.token.claim'),('a8b2388a-5cbe-4c03-a751-7bb12c4e77c9','String','jsonType.label'),('a8b2388a-5cbe-4c03-a751-7bb12c4e77c9','email','user.attribute'),('a8b2388a-5cbe-4c03-a751-7bb12c4e77c9','true','userinfo.token.claim'),('aa34fc02-70ac-43df-ac56-08142e7c8fcc','true','access.token.claim'),('aa34fc02-70ac-43df-ac56-08142e7c8fcc','true','id.token.claim'),('aa34fc02-70ac-43df-ac56-08142e7c8fcc','country','user.attribute.country'),('aa34fc02-70ac-43df-ac56-08142e7c8fcc','formatted','user.attribute.formatted'),('aa34fc02-70ac-43df-ac56-08142e7c8fcc','locality','user.attribute.locality'),('aa34fc02-70ac-43df-ac56-08142e7c8fcc','postal_code','user.attribute.postal_code'),('aa34fc02-70ac-43df-ac56-08142e7c8fcc','region','user.attribute.region'),('aa34fc02-70ac-43df-ac56-08142e7c8fcc','street','user.attribute.street'),('aa34fc02-70ac-43df-ac56-08142e7c8fcc','true','userinfo.token.claim'),('b413ea7f-714f-420f-9484-ac003db3f85f','true','access.token.claim'),('b413ea7f-714f-420f-9484-ac003db3f85f','updated_at','claim.name'),('b413ea7f-714f-420f-9484-ac003db3f85f','true','id.token.claim'),('b413ea7f-714f-420f-9484-ac003db3f85f','String','jsonType.label'),('b413ea7f-714f-420f-9484-ac003db3f85f','updatedAt','user.attribute'),('b413ea7f-714f-420f-9484-ac003db3f85f','true','userinfo.token.claim'),('b8cd07bc-54c7-4881-8856-8aa3b5f1aed4','true','access.token.claim'),('b8cd07bc-54c7-4881-8856-8aa3b5f1aed4','zoneinfo','claim.name'),('b8cd07bc-54c7-4881-8856-8aa3b5f1aed4','true','id.token.claim'),('b8cd07bc-54c7-4881-8856-8aa3b5f1aed4','String','jsonType.label'),('b8cd07bc-54c7-4881-8856-8aa3b5f1aed4','zoneinfo','user.attribute'),('b8cd07bc-54c7-4881-8856-8aa3b5f1aed4','true','userinfo.token.claim'),('b91f506f-6864-4070-b7bf-53df0361205c','true','access.token.claim'),('b91f506f-6864-4070-b7bf-53df0361205c','true','id.token.claim'),('b91f506f-6864-4070-b7bf-53df0361205c','true','userinfo.token.claim'),('bd072f07-ce9f-40b1-b24f-c54bab9445a3','true','access.token.claim'),('bd072f07-ce9f-40b1-b24f-c54bab9445a3','phone_number','claim.name'),('bd072f07-ce9f-40b1-b24f-c54bab9445a3','true','id.token.claim'),('bd072f07-ce9f-40b1-b24f-c54bab9445a3','String','jsonType.label'),('bd072f07-ce9f-40b1-b24f-c54bab9445a3','phoneNumber','user.attribute'),('bd072f07-ce9f-40b1-b24f-c54bab9445a3','true','userinfo.token.claim'),('c2c7bca8-6d37-4e05-8a8e-d14b856135e6','true','access.token.claim'),('c2c7bca8-6d37-4e05-8a8e-d14b856135e6','email_verified','claim.name'),('c2c7bca8-6d37-4e05-8a8e-d14b856135e6','true','id.token.claim'),('c2c7bca8-6d37-4e05-8a8e-d14b856135e6','boolean','jsonType.label'),('c2c7bca8-6d37-4e05-8a8e-d14b856135e6','emailVerified','user.attribute'),('c2c7bca8-6d37-4e05-8a8e-d14b856135e6','true','userinfo.token.claim'),('cb45f7d9-218f-415b-b751-cf0dfab8edb2','true','access.token.claim'),('cb45f7d9-218f-415b-b751-cf0dfab8edb2','upn','claim.name'),('cb45f7d9-218f-415b-b751-cf0dfab8edb2','true','id.token.claim'),('cb45f7d9-218f-415b-b751-cf0dfab8edb2','String','jsonType.label'),('cb45f7d9-218f-415b-b751-cf0dfab8edb2','username','user.attribute'),('cb45f7d9-218f-415b-b751-cf0dfab8edb2','true','userinfo.token.claim'),('cb5294f8-802a-4d42-ba14-7629cefbaaba','true','access.token.claim'),('cb5294f8-802a-4d42-ba14-7629cefbaaba','website','claim.name'),('cb5294f8-802a-4d42-ba14-7629cefbaaba','true','id.token.claim'),('cb5294f8-802a-4d42-ba14-7629cefbaaba','String','jsonType.label'),('cb5294f8-802a-4d42-ba14-7629cefbaaba','website','user.attribute'),('cb5294f8-802a-4d42-ba14-7629cefbaaba','true','userinfo.token.claim'),('d45ef9c6-7f77-41d5-b1d4-9ffafd2df84f','true','access.token.claim'),('d45ef9c6-7f77-41d5-b1d4-9ffafd2df84f','realm_access.roles','claim.name'),('d45ef9c6-7f77-41d5-b1d4-9ffafd2df84f','String','jsonType.label'),('d45ef9c6-7f77-41d5-b1d4-9ffafd2df84f','true','multivalued'),('d45ef9c6-7f77-41d5-b1d4-9ffafd2df84f','foo','user.attribute'),('dc21b950-120e-48a1-b87d-6f761953d5b4','true','access.token.claim'),('dc21b950-120e-48a1-b87d-6f761953d5b4','picture','claim.name'),('dc21b950-120e-48a1-b87d-6f761953d5b4','true','id.token.claim'),('dc21b950-120e-48a1-b87d-6f761953d5b4','String','jsonType.label'),('dc21b950-120e-48a1-b87d-6f761953d5b4','picture','user.attribute'),('dc21b950-120e-48a1-b87d-6f761953d5b4','true','userinfo.token.claim'),('e7d1f900-8800-4d2e-b372-90c7c21ff4f6','true','access.token.claim'),('e7d1f900-8800-4d2e-b372-90c7c21ff4f6','phone_number_verified','claim.name'),('e7d1f900-8800-4d2e-b372-90c7c21ff4f6','true','id.token.claim'),('e7d1f900-8800-4d2e-b372-90c7c21ff4f6','boolean','jsonType.label'),('e7d1f900-8800-4d2e-b372-90c7c21ff4f6','phoneNumberVerified','user.attribute'),('e7d1f900-8800-4d2e-b372-90c7c21ff4f6','true','userinfo.token.claim'),('e97fd332-8f33-4766-9090-c1cbd9c7c66f','Role','attribute.name'),('e97fd332-8f33-4766-9090-c1cbd9c7c66f','Basic','attribute.nameformat'),('e97fd332-8f33-4766-9090-c1cbd9c7c66f','false','single'),('f3a80523-66e4-4247-9a49-eaa9d067dd2a','true','access.token.claim'),('f3a80523-66e4-4247-9a49-eaa9d067dd2a','given_name','claim.name'),('f3a80523-66e4-4247-9a49-eaa9d067dd2a','true','id.token.claim'),('f3a80523-66e4-4247-9a49-eaa9d067dd2a','String','jsonType.label'),('f3a80523-66e4-4247-9a49-eaa9d067dd2a','firstName','user.attribute'),('f3a80523-66e4-4247-9a49-eaa9d067dd2a','true','userinfo.token.claim'),('fb2b90ec-ceda-4f60-9e5c-9dc20152a081','true','access.token.claim'),('fb2b90ec-ceda-4f60-9e5c-9dc20152a081','gender','claim.name'),('fb2b90ec-ceda-4f60-9e5c-9dc20152a081','true','id.token.claim'),('fb2b90ec-ceda-4f60-9e5c-9dc20152a081','String','jsonType.label'),('fb2b90ec-ceda-4f60-9e5c-9dc20152a081','gender','user.attribute'),('fb2b90ec-ceda-4f60-9e5c-9dc20152a081','true','userinfo.token.claim'),('fdab36ee-553f-470c-b31e-74de8bc90d28','true','access.token.claim'),('fdab36ee-553f-470c-b31e-74de8bc90d28','phone_number_verified','claim.name'),('fdab36ee-553f-470c-b31e-74de8bc90d28','true','id.token.claim'),('fdab36ee-553f-470c-b31e-74de8bc90d28','boolean','jsonType.label'),('fdab36ee-553f-470c-b31e-74de8bc90d28','phoneNumberVerified','user.attribute'),('fdab36ee-553f-470c-b31e-74de8bc90d28','true','userinfo.token.claim');
/*!40000 ALTER TABLE `PROTOCOL_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM`
--

DROP TABLE IF EXISTS `REALM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM` (
  `ID` varchar(36) NOT NULL,
  `ACCESS_CODE_LIFESPAN` int DEFAULT NULL,
  `USER_ACTION_LIFESPAN` int DEFAULT NULL,
  `ACCESS_TOKEN_LIFESPAN` int DEFAULT NULL,
  `ACCOUNT_THEME` varchar(255) DEFAULT NULL,
  `ADMIN_THEME` varchar(255) DEFAULT NULL,
  `EMAIL_THEME` varchar(255) DEFAULT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EVENTS_EXPIRATION` bigint DEFAULT NULL,
  `LOGIN_THEME` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int DEFAULT NULL,
  `PASSWORD_POLICY` text,
  `REGISTRATION_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `REMEMBER_ME` bit(1) NOT NULL DEFAULT b'0',
  `RESET_PASSWORD_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `SOCIAL` bit(1) NOT NULL DEFAULT b'0',
  `SSL_REQUIRED` varchar(255) DEFAULT NULL,
  `SSO_IDLE_TIMEOUT` int DEFAULT NULL,
  `SSO_MAX_LIFESPAN` int DEFAULT NULL,
  `UPDATE_PROFILE_ON_SOC_LOGIN` bit(1) NOT NULL DEFAULT b'0',
  `VERIFY_EMAIL` bit(1) NOT NULL DEFAULT b'0',
  `MASTER_ADMIN_CLIENT` varchar(36) DEFAULT NULL,
  `LOGIN_LIFESPAN` int DEFAULT NULL,
  `INTERNATIONALIZATION_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DEFAULT_LOCALE` varchar(255) DEFAULT NULL,
  `REG_EMAIL_AS_USERNAME` bit(1) NOT NULL DEFAULT b'0',
  `ADMIN_EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `ADMIN_EVENTS_DETAILS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EDIT_USERNAME_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `OTP_POLICY_COUNTER` int DEFAULT '0',
  `OTP_POLICY_WINDOW` int DEFAULT '1',
  `OTP_POLICY_PERIOD` int DEFAULT '30',
  `OTP_POLICY_DIGITS` int DEFAULT '6',
  `OTP_POLICY_ALG` varchar(36) DEFAULT 'HmacSHA1',
  `OTP_POLICY_TYPE` varchar(36) DEFAULT 'totp',
  `BROWSER_FLOW` varchar(36) DEFAULT NULL,
  `REGISTRATION_FLOW` varchar(36) DEFAULT NULL,
  `DIRECT_GRANT_FLOW` varchar(36) DEFAULT NULL,
  `RESET_CREDENTIALS_FLOW` varchar(36) DEFAULT NULL,
  `CLIENT_AUTH_FLOW` varchar(36) DEFAULT NULL,
  `OFFLINE_SESSION_IDLE_TIMEOUT` int DEFAULT '0',
  `REVOKE_REFRESH_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  `ACCESS_TOKEN_LIFE_IMPLICIT` int DEFAULT '0',
  `LOGIN_WITH_EMAIL_ALLOWED` bit(1) NOT NULL DEFAULT b'1',
  `DUPLICATE_EMAILS_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `DOCKER_AUTH_FLOW` varchar(36) DEFAULT NULL,
  `REFRESH_TOKEN_MAX_REUSE` int DEFAULT '0',
  `ALLOW_USER_MANAGED_ACCESS` bit(1) NOT NULL DEFAULT b'0',
  `SSO_MAX_LIFESPAN_REMEMBER_ME` int NOT NULL,
  `SSO_IDLE_TIMEOUT_REMEMBER_ME` int NOT NULL,
  `DEFAULT_ROLE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_ORVSDMLA56612EAEFIQ6WL5OI` (`NAME`),
  KEY `IDX_REALM_MASTER_ADM_CLI` (`MASTER_ADMIN_CLIENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM`
--

LOCK TABLES `REALM` WRITE;
/*!40000 ALTER TABLE `REALM` DISABLE KEYS */;
INSERT INTO `REALM` VALUES ('master',60,300,60,NULL,NULL,NULL,_binary '',_binary '\0',0,NULL,'master',0,NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0','EXTERNAL',1800,36000,_binary '\0',_binary '\0','41b8abc2-876d-4760-83e9-d5718d861104',1800,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',0,1,30,6,'HmacSHA1','totp','b750296a-e3bc-4261-8c42-8b64771ea0b2','ca0e5d16-5f14-4ba7-a780-6249f5ee09cc','c86cadac-9a9f-4b7b-94c0-5a3d5272b4d3','9e50e918-567c-469b-af89-538c2aac803c','d80506ae-1207-4b9a-b8f3-4b79d78d20fd',2592000,_binary '\0',900,_binary '',_binary '\0','c0491f14-4557-4be1-973c-681889a9ada5',0,_binary '\0',0,0,'044ebe4c-c2d6-4c4b-a26d-d0c43b0300d3'),('stock-manager',60,300,300,NULL,NULL,NULL,_binary '',_binary '\0',0,NULL,'stock-manager',0,NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0','EXTERNAL',1800,36000,_binary '\0',_binary '\0','c596116e-ebea-4ae9-8e42-0d6342fd47a3',1800,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',0,1,30,6,'HmacSHA1','totp','9c41cf1f-a378-4635-a5d8-6a624ed7b264','fdfe2bef-fa11-4b10-b653-c6b0af2c5f50','6a3e874f-3aed-4bf4-8a76-f545b5db5d05','69fcabe1-2a21-4df6-bab3-ba9ba56d3814','c5502fe0-abeb-4c7d-87d2-fd23ed8fbc8f',2592000,_binary '\0',900,_binary '',_binary '\0','e7b89727-3e5f-4753-99ec-a1f530802ec5',0,_binary '\0',0,0,'3f66f5fc-764d-449d-8bf9-6b757b02bc31');
/*!40000 ALTER TABLE `REALM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_ATTRIBUTE`
--

DROP TABLE IF EXISTS `REALM_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_ATTRIBUTE` (
  `NAME` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  PRIMARY KEY (`NAME`,`REALM_ID`),
  KEY `IDX_REALM_ATTR_REALM` (`REALM_ID`),
  CONSTRAINT `FK_8SHXD6L3E9ATQUKACXGPFFPTW` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_ATTRIBUTE`
--

LOCK TABLES `REALM_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `REALM_ATTRIBUTE` DISABLE KEYS */;
INSERT INTO `REALM_ATTRIBUTE` VALUES ('_browser_header.contentSecurityPolicy','master','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';'),('_browser_header.contentSecurityPolicy','stock-manager','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';'),('_browser_header.contentSecurityPolicyReportOnly','master',''),('_browser_header.contentSecurityPolicyReportOnly','stock-manager',''),('_browser_header.strictTransportSecurity','master','max-age=31536000; includeSubDomains'),('_browser_header.strictTransportSecurity','stock-manager','max-age=31536000; includeSubDomains'),('_browser_header.xContentTypeOptions','master','nosniff'),('_browser_header.xContentTypeOptions','stock-manager','nosniff'),('_browser_header.xFrameOptions','master','SAMEORIGIN'),('_browser_header.xFrameOptions','stock-manager','SAMEORIGIN'),('_browser_header.xRobotsTag','master','none'),('_browser_header.xRobotsTag','stock-manager','none'),('_browser_header.xXSSProtection','master','1; mode=block'),('_browser_header.xXSSProtection','stock-manager','1; mode=block'),('actionTokenGeneratedByAdminLifespan','stock-manager','43200'),('actionTokenGeneratedByUserLifespan','stock-manager','300'),('bruteForceProtected','master','false'),('bruteForceProtected','stock-manager','false'),('cibaAuthRequestedUserHint','stock-manager','login_hint'),('cibaBackchannelTokenDeliveryMode','stock-manager','poll'),('cibaExpiresIn','stock-manager','120'),('cibaInterval','stock-manager','5'),('client-policies.policies','master','{\"policies\":[{\"name\":\"builtin-default-policy\",\"description\":\"The built-in default policy applied to all clients.\",\"builtin\":true,\"enable\":false,\"conditions\":[{\"anyclient-condition\":{}}],\"profiles\":[\"builtin-default-profile\"]}]}'),('client-policies.policies','stock-manager','{\"policies\":[{\"name\":\"builtin-default-policy\",\"description\":\"The built-in default policy applied to all clients.\",\"builtin\":true,\"enable\":false,\"conditions\":[{\"anyclient-condition\":{}}],\"profiles\":[\"builtin-default-profile\"]}]}'),('client-policies.profiles','master','{\"profiles\":[{\"name\":\"builtin-default-profile\",\"description\":\"The built-in default profile for enforcing basic security level to clients.\",\"builtin\":true,\"executors\":[{\"secure-session-enforce-executor\":{}}]}]}'),('client-policies.profiles','stock-manager','{\"profiles\":[{\"name\":\"builtin-default-profile\",\"description\":\"The built-in default profile for enforcing basic security level to clients.\",\"builtin\":true,\"executors\":[{\"secure-session-enforce-executor\":{}}]}]}'),('clientOfflineSessionIdleTimeout','stock-manager','0'),('clientOfflineSessionMaxLifespan','stock-manager','0'),('clientSessionIdleTimeout','stock-manager','0'),('clientSessionMaxLifespan','stock-manager','0'),('defaultSignatureAlgorithm','master','RS256'),('defaultSignatureAlgorithm','stock-manager','RS256'),('displayName','master','Keycloak'),('displayName','stock-manager','Stock Manager'),('displayNameHtml','master','<div class=\"kc-logo-text\"><span>Keycloak</span></div>'),('failureFactor','master','30'),('failureFactor','stock-manager','30'),('maxDeltaTimeSeconds','master','43200'),('maxDeltaTimeSeconds','stock-manager','43200'),('maxFailureWaitSeconds','master','900'),('maxFailureWaitSeconds','stock-manager','900'),('minimumQuickLoginWaitSeconds','master','60'),('minimumQuickLoginWaitSeconds','stock-manager','60'),('oauth2DeviceCodeLifespan','stock-manager','600'),('oauth2DevicePollingInterval','stock-manager','5'),('offlineSessionMaxLifespan','master','5184000'),('offlineSessionMaxLifespan','stock-manager','5184000'),('offlineSessionMaxLifespanEnabled','master','false'),('offlineSessionMaxLifespanEnabled','stock-manager','false'),('permanentLockout','master','false'),('permanentLockout','stock-manager','false'),('quickLoginCheckMilliSeconds','master','1000'),('quickLoginCheckMilliSeconds','stock-manager','1000'),('waitIncrementSeconds','master','60'),('waitIncrementSeconds','stock-manager','60'),('webAuthnPolicyAttestationConveyancePreference','stock-manager','not specified'),('webAuthnPolicyAttestationConveyancePreferencePasswordless','stock-manager','not specified'),('webAuthnPolicyAuthenticatorAttachment','stock-manager','not specified'),('webAuthnPolicyAuthenticatorAttachmentPasswordless','stock-manager','not specified'),('webAuthnPolicyAvoidSameAuthenticatorRegister','stock-manager','false'),('webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless','stock-manager','false'),('webAuthnPolicyCreateTimeout','stock-manager','0'),('webAuthnPolicyCreateTimeoutPasswordless','stock-manager','0'),('webAuthnPolicyRequireResidentKey','stock-manager','not specified'),('webAuthnPolicyRequireResidentKeyPasswordless','stock-manager','not specified'),('webAuthnPolicyRpEntityName','stock-manager','keycloak'),('webAuthnPolicyRpEntityNamePasswordless','stock-manager','keycloak'),('webAuthnPolicyRpId','stock-manager',''),('webAuthnPolicyRpIdPasswordless','stock-manager',''),('webAuthnPolicySignatureAlgorithms','stock-manager','ES256'),('webAuthnPolicySignatureAlgorithmsPasswordless','stock-manager','ES256'),('webAuthnPolicyUserVerificationRequirement','stock-manager','not specified'),('webAuthnPolicyUserVerificationRequirementPasswordless','stock-manager','not specified');
/*!40000 ALTER TABLE `REALM_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_DEFAULT_GROUPS`
--

DROP TABLE IF EXISTS `REALM_DEFAULT_GROUPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_DEFAULT_GROUPS` (
  `REALM_ID` varchar(36) NOT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`GROUP_ID`),
  UNIQUE KEY `CON_GROUP_ID_DEF_GROUPS` (`GROUP_ID`),
  KEY `IDX_REALM_DEF_GRP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_DEF_GROUPS_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_DEFAULT_GROUPS`
--

LOCK TABLES `REALM_DEFAULT_GROUPS` WRITE;
/*!40000 ALTER TABLE `REALM_DEFAULT_GROUPS` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_DEFAULT_GROUPS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_ENABLED_EVENT_TYPES`
--

DROP TABLE IF EXISTS `REALM_ENABLED_EVENT_TYPES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_ENABLED_EVENT_TYPES` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_EVT_TYPES_REALM` (`REALM_ID`),
  CONSTRAINT `FK_H846O4H0W8EPX5NWEDRF5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_ENABLED_EVENT_TYPES`
--

LOCK TABLES `REALM_ENABLED_EVENT_TYPES` WRITE;
/*!40000 ALTER TABLE `REALM_ENABLED_EVENT_TYPES` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_ENABLED_EVENT_TYPES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_EVENTS_LISTENERS`
--

DROP TABLE IF EXISTS `REALM_EVENTS_LISTENERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_EVENTS_LISTENERS` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_EVT_LIST_REALM` (`REALM_ID`),
  CONSTRAINT `FK_H846O4H0W8EPX5NXEV9F5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_EVENTS_LISTENERS`
--

LOCK TABLES `REALM_EVENTS_LISTENERS` WRITE;
/*!40000 ALTER TABLE `REALM_EVENTS_LISTENERS` DISABLE KEYS */;
INSERT INTO `REALM_EVENTS_LISTENERS` VALUES ('master','jboss-logging'),('stock-manager','jboss-logging');
/*!40000 ALTER TABLE `REALM_EVENTS_LISTENERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_LOCALIZATIONS`
--

DROP TABLE IF EXISTS `REALM_LOCALIZATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_LOCALIZATIONS` (
  `REALM_ID` varchar(255) NOT NULL,
  `LOCALE` varchar(255) NOT NULL,
  `TEXTS` longtext NOT NULL,
  PRIMARY KEY (`REALM_ID`,`LOCALE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_LOCALIZATIONS`
--

LOCK TABLES `REALM_LOCALIZATIONS` WRITE;
/*!40000 ALTER TABLE `REALM_LOCALIZATIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_LOCALIZATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_REQUIRED_CREDENTIAL`
--

DROP TABLE IF EXISTS `REALM_REQUIRED_CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_REQUIRED_CREDENTIAL` (
  `TYPE` varchar(255) NOT NULL,
  `FORM_LABEL` varchar(255) DEFAULT NULL,
  `INPUT` bit(1) NOT NULL DEFAULT b'0',
  `SECRET` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`TYPE`),
  CONSTRAINT `FK_5HG65LYBEVAVKQFKI3KPONH9V` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_REQUIRED_CREDENTIAL`
--

LOCK TABLES `REALM_REQUIRED_CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `REALM_REQUIRED_CREDENTIAL` DISABLE KEYS */;
INSERT INTO `REALM_REQUIRED_CREDENTIAL` VALUES ('password','password',_binary '',_binary '','master'),('password','password',_binary '',_binary '','stock-manager');
/*!40000 ALTER TABLE `REALM_REQUIRED_CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_SMTP_CONFIG`
--

DROP TABLE IF EXISTS `REALM_SMTP_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_SMTP_CONFIG` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`NAME`),
  CONSTRAINT `FK_70EJ8XDXGXD0B9HH6180IRR0O` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_SMTP_CONFIG`
--

LOCK TABLES `REALM_SMTP_CONFIG` WRITE;
/*!40000 ALTER TABLE `REALM_SMTP_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_SMTP_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_SUPPORTED_LOCALES`
--

DROP TABLE IF EXISTS `REALM_SUPPORTED_LOCALES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_SUPPORTED_LOCALES` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_SUPP_LOCAL_REALM` (`REALM_ID`),
  CONSTRAINT `FK_SUPPORTED_LOCALES_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_SUPPORTED_LOCALES`
--

LOCK TABLES `REALM_SUPPORTED_LOCALES` WRITE;
/*!40000 ALTER TABLE `REALM_SUPPORTED_LOCALES` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_SUPPORTED_LOCALES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REDIRECT_URIS`
--

DROP TABLE IF EXISTS `REDIRECT_URIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REDIRECT_URIS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`VALUE`),
  KEY `IDX_REDIR_URI_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_1BURS8PB4OUJ97H5WUPPAHV9F` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REDIRECT_URIS`
--

LOCK TABLES `REDIRECT_URIS` WRITE;
/*!40000 ALTER TABLE `REDIRECT_URIS` DISABLE KEYS */;
INSERT INTO `REDIRECT_URIS` VALUES ('3538b8a7-c81d-4ec9-8741-202db96b1a2f','/realms/master/account/*'),('908aac02-ff05-4323-8868-ac055ff4fc49','http://localhost:4200/*'),('908aac02-ff05-4323-8868-ac055ff4fc49','http://localhost:8081/*'),('95b34f61-3dc8-43ff-b304-b07690a45b6f','/realms/stock-manager/account/*'),('b45787d7-41bc-4fb7-98ed-e1e6bff85ef9','/admin/stock-manager/console/*'),('e5918595-c567-4a69-bfd1-0ac9393a561c','/realms/stock-manager/account/*'),('e89cb647-9ac1-4636-8c3a-9e5523c27fda','/realms/master/account/*'),('ef50b7ea-73db-4f62-83fe-f8ab137c1714','/admin/master/console/*');
/*!40000 ALTER TABLE `REDIRECT_URIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIRED_ACTION_CONFIG`
--

DROP TABLE IF EXISTS `REQUIRED_ACTION_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REQUIRED_ACTION_CONFIG` (
  `REQUIRED_ACTION_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`REQUIRED_ACTION_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIRED_ACTION_CONFIG`
--

LOCK TABLES `REQUIRED_ACTION_CONFIG` WRITE;
/*!40000 ALTER TABLE `REQUIRED_ACTION_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `REQUIRED_ACTION_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIRED_ACTION_PROVIDER`
--

DROP TABLE IF EXISTS `REQUIRED_ACTION_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REQUIRED_ACTION_PROVIDER` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DEFAULT_ACTION` bit(1) NOT NULL DEFAULT b'0',
  `PROVIDER_ID` varchar(255) DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_REQ_ACT_PROV_REALM` (`REALM_ID`),
  CONSTRAINT `FK_REQ_ACT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIRED_ACTION_PROVIDER`
--

LOCK TABLES `REQUIRED_ACTION_PROVIDER` WRITE;
/*!40000 ALTER TABLE `REQUIRED_ACTION_PROVIDER` DISABLE KEYS */;
INSERT INTO `REQUIRED_ACTION_PROVIDER` VALUES ('1d5ac34d-d498-4745-be4a-086328665cb9','terms_and_conditions','Terms and Conditions','master',_binary '\0',_binary '\0','terms_and_conditions',20),('21c9f754-c782-4921-a5e3-686e0c063f3a','CONFIGURE_TOTP','Configure OTP','master',_binary '',_binary '\0','CONFIGURE_TOTP',10),('354fb1ad-d9cd-4bb6-aa98-24fb0ab3598e','VERIFY_EMAIL','Verify Email','master',_binary '',_binary '\0','VERIFY_EMAIL',50),('44eba979-3862-4630-8def-0b839723c5fd','update_user_locale','Update User Locale','stock-manager',_binary '',_binary '\0','update_user_locale',1000),('63490cc1-3d54-4ff1-943e-2841e85fc0db','CONFIGURE_TOTP','Configure OTP','stock-manager',_binary '',_binary '\0','CONFIGURE_TOTP',10),('79c8e9d6-3885-4aea-8dbf-46127e0ac756','update_user_locale','Update User Locale','master',_binary '',_binary '\0','update_user_locale',1000),('7ed51553-34dc-4c3f-8cfc-d2631d42dbb2','UPDATE_PROFILE','Update Profile','stock-manager',_binary '',_binary '\0','UPDATE_PROFILE',40),('8ee48728-8d52-48b7-a4e1-4a33af37c4ba','UPDATE_PASSWORD','Update Password','stock-manager',_binary '',_binary '\0','UPDATE_PASSWORD',30),('a4aa734d-c733-4d95-8b4f-efb24e37acd7','delete_account','Delete Account','master',_binary '\0',_binary '\0','delete_account',60),('b69ca281-94f2-4b5d-99b2-9974d10c4e06','terms_and_conditions','Terms and Conditions','stock-manager',_binary '\0',_binary '\0','terms_and_conditions',20),('b7ee1cd3-84f0-4557-aa5c-c6069b3e107c','delete_account','Delete Account','stock-manager',_binary '\0',_binary '\0','delete_account',60),('d646217e-5bb6-42cd-b10d-8fafe687abc4','UPDATE_PASSWORD','Update Password','master',_binary '',_binary '\0','UPDATE_PASSWORD',30),('d955cf74-82a2-40e9-a3a9-265ad7ee637f','VERIFY_EMAIL','Verify Email','stock-manager',_binary '',_binary '\0','VERIFY_EMAIL',50),('f991928b-901e-4b7d-8c15-5d5b830448c1','UPDATE_PROFILE','Update Profile','master',_binary '',_binary '\0','UPDATE_PROFILE',40);
/*!40000 ALTER TABLE `REQUIRED_ACTION_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_ATTRIBUTE`
--

DROP TABLE IF EXISTS `RESOURCE_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `RESOURCE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_5HRM2VLF9QL5FU022KQEPOVBR` (`RESOURCE_ID`),
  CONSTRAINT `FK_5HRM2VLF9QL5FU022KQEPOVBR` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_ATTRIBUTE`
--

LOCK TABLES `RESOURCE_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_POLICY`
--

DROP TABLE IF EXISTS `RESOURCE_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_POLICY` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`POLICY_ID`),
  KEY `IDX_RES_POLICY_POLICY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRPOS53XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRPP213XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_POLICY`
--

LOCK TABLES `RESOURCE_POLICY` WRITE;
/*!40000 ALTER TABLE `RESOURCE_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SCOPE`
--

DROP TABLE IF EXISTS `RESOURCE_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SCOPE` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`SCOPE_ID`),
  KEY `IDX_RES_SCOPE_SCOPE` (`SCOPE_ID`),
  CONSTRAINT `FK_FRSRPOS13XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRPS213XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SCOPE`
--

LOCK TABLES `RESOURCE_SCOPE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER` (
  `ID` varchar(36) NOT NULL,
  `ALLOW_RS_REMOTE_MGMT` bit(1) NOT NULL DEFAULT b'0',
  `POLICY_ENFORCE_MODE` varchar(15) NOT NULL,
  `DECISION_STRATEGY` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER`
--

LOCK TABLES `RESOURCE_SERVER` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_PERM_TICKET`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_PERM_TICKET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_PERM_TICKET` (
  `ID` varchar(36) NOT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  `REQUESTER` varchar(255) DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint NOT NULL,
  `GRANTED_TIMESTAMP` bigint DEFAULT NULL,
  `RESOURCE_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5PMT` (`OWNER`,`REQUESTER`,`RESOURCE_SERVER_ID`,`RESOURCE_ID`,`SCOPE_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG82SSPMT` (`RESOURCE_SERVER_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG83SSPMT` (`RESOURCE_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG84SSPMT` (`SCOPE_ID`),
  KEY `FK_FRSRPO2128CX4WNKOG82SSRFY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSPMT` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG83SSPMT` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG84SSPMT` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`),
  CONSTRAINT `FK_FRSRPO2128CX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_PERM_TICKET`
--

LOCK TABLES `RESOURCE_SERVER_PERM_TICKET` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_PERM_TICKET` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_PERM_TICKET` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_POLICY`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_POLICY` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `TYPE` varchar(255) NOT NULL,
  `DECISION_STRATEGY` varchar(20) DEFAULT NULL,
  `LOGIC` varchar(20) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSRPT700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SERV_POL_RES_SERV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRPO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_POLICY`
--

LOCK TABLES `RESOURCE_SERVER_POLICY` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_RESOURCE`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_RESOURCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_RESOURCE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `ICON_URI` varchar(255) DEFAULT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `OWNER_MANAGED_ACCESS` bit(1) NOT NULL DEFAULT b'0',
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5HA6` (`NAME`,`OWNER`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SRV_RES_RES_SRV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_RESOURCE`
--

LOCK TABLES `RESOURCE_SERVER_RESOURCE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_RESOURCE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_RESOURCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_SCOPE`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_SCOPE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `ICON_URI` varchar(255) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSRST700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SRV_SCOPE_RES_SRV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRSO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_SCOPE`
--

LOCK TABLES `RESOURCE_SERVER_SCOPE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_URIS`
--

DROP TABLE IF EXISTS `RESOURCE_URIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_URIS` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`VALUE`),
  CONSTRAINT `FK_RESOURCE_SERVER_URIS` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_URIS`
--

LOCK TABLES `RESOURCE_URIS` WRITE;
/*!40000 ALTER TABLE `RESOURCE_URIS` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_URIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ROLE_ATTRIBUTE`
--

DROP TABLE IF EXISTS `ROLE_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ROLE_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ROLE_ATTRIBUTE` (`ROLE_ID`),
  CONSTRAINT `FK_ROLE_ATTRIBUTE_ID` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ROLE_ATTRIBUTE`
--

LOCK TABLES `ROLE_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `ROLE_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `ROLE_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCOPE_MAPPING`
--

DROP TABLE IF EXISTS `SCOPE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SCOPE_MAPPING` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`ROLE_ID`),
  KEY `IDX_SCOPE_MAPPING_ROLE` (`ROLE_ID`),
  CONSTRAINT `FK_OUSE064PLMLR732LXJCN1Q5F1` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCOPE_MAPPING`
--

LOCK TABLES `SCOPE_MAPPING` WRITE;
/*!40000 ALTER TABLE `SCOPE_MAPPING` DISABLE KEYS */;
INSERT INTO `SCOPE_MAPPING` VALUES ('e5918595-c567-4a69-bfd1-0ac9393a561c','08a349ff-c7b6-4f1d-80f3-1324cc894d91'),('3538b8a7-c81d-4ec9-8741-202db96b1a2f','78dd6939-5476-4f56-93b1-bb0eb2285fb5');
/*!40000 ALTER TABLE `SCOPE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCOPE_POLICY`
--

DROP TABLE IF EXISTS `SCOPE_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SCOPE_POLICY` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`POLICY_ID`),
  KEY `IDX_SCOPE_POLICY_POLICY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRASP13XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`),
  CONSTRAINT `FK_FRSRPASS3XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCOPE_POLICY`
--

LOCK TABLES `SCOPE_POLICY` WRITE;
/*!40000 ALTER TABLE `SCOPE_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `SCOPE_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USERNAME_LOGIN_FAILURE`
--

DROP TABLE IF EXISTS `USERNAME_LOGIN_FAILURE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USERNAME_LOGIN_FAILURE` (
  `REALM_ID` varchar(36) NOT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FAILED_LOGIN_NOT_BEFORE` int DEFAULT NULL,
  `LAST_FAILURE` bigint DEFAULT NULL,
  `LAST_IP_FAILURE` varchar(255) DEFAULT NULL,
  `NUM_FAILURES` int DEFAULT NULL,
  PRIMARY KEY (`REALM_ID`,`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USERNAME_LOGIN_FAILURE`
--

LOCK TABLES `USERNAME_LOGIN_FAILURE` WRITE;
/*!40000 ALTER TABLE `USERNAME_LOGIN_FAILURE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USERNAME_LOGIN_FAILURE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ATTRIBUTE`
--

DROP TABLE IF EXISTS `USER_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_ATTRIBUTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  PRIMARY KEY (`ID`),
  KEY `IDX_USER_ATTRIBUTE` (`USER_ID`),
  CONSTRAINT `FK_5HRM2VLF9QL5FU043KQEPOVBR` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ATTRIBUTE`
--

LOCK TABLES `USER_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `USER_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_CONSENT`
--

DROP TABLE IF EXISTS `USER_CONSENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_CONSENT` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) DEFAULT NULL,
  `EXTERNAL_CLIENT_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_JKUWUVD56ONTGSUHOGM8UEWRT` (`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`USER_ID`),
  KEY `IDX_USER_CONSENT` (`USER_ID`),
  CONSTRAINT `FK_GRNTCSNT_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_CONSENT`
--

LOCK TABLES `USER_CONSENT` WRITE;
/*!40000 ALTER TABLE `USER_CONSENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_CONSENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_CONSENT_CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `USER_CONSENT_CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_CONSENT_CLIENT_SCOPE` (
  `USER_CONSENT_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`),
  KEY `IDX_USCONSENT_CLSCOPE` (`USER_CONSENT_ID`),
  CONSTRAINT `FK_GRNTCSNT_CLSC_USC` FOREIGN KEY (`USER_CONSENT_ID`) REFERENCES `USER_CONSENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_CONSENT_CLIENT_SCOPE`
--

LOCK TABLES `USER_CONSENT_CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `USER_CONSENT_CLIENT_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_CONSENT_CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ENTITY`
--

DROP TABLE IF EXISTS `USER_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `EMAIL_CONSTRAINT` varchar(255) DEFAULT NULL,
  `EMAIL_VERIFIED` bit(1) NOT NULL DEFAULT b'0',
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `FEDERATION_LINK` varchar(255) DEFAULT NULL,
  `FIRST_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `LAST_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint DEFAULT NULL,
  `SERVICE_ACCOUNT_CLIENT_LINK` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_DYKN684SL8UP1CRFEI6ECKHD7` (`REALM_ID`,`EMAIL_CONSTRAINT`),
  UNIQUE KEY `UK_RU8TT6T700S9V50BU18WS5HA6` (`REALM_ID`,`USERNAME`),
  KEY `IDX_USER_EMAIL` (`EMAIL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ENTITY`
--

LOCK TABLES `USER_ENTITY` WRITE;
/*!40000 ALTER TABLE `USER_ENTITY` DISABLE KEYS */;
INSERT INTO `USER_ENTITY` VALUES ('59bf2b71-8c8b-409d-bc2d-5e4a8591eba1',NULL,'4eb5b071-3678-4034-babd-30dd2f4c4647',_binary '\0',_binary '',NULL,NULL,NULL,'master','admin',1622040111427,NULL,0),('8c177eac-4f51-4153-a87b-3aa460ac8bb3',NULL,'4d1ac8a2-19a7-4d09-9352-0ddd6edb352e',_binary '\0',_binary '',NULL,'Admin','Stock Manager','stock-manager','admin',1622040333541,NULL,1622146045);
/*!40000 ALTER TABLE `USER_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_CONFIG`
--

DROP TABLE IF EXISTS `USER_FEDERATION_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_CONFIG` (
  `USER_FEDERATION_PROVIDER_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_PROVIDER_ID`,`NAME`),
  CONSTRAINT `FK_T13HPU1J94R2EBPEKR39X5EU5` FOREIGN KEY (`USER_FEDERATION_PROVIDER_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_CONFIG`
--

LOCK TABLES `USER_FEDERATION_CONFIG` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_MAPPER`
--

DROP TABLE IF EXISTS `USER_FEDERATION_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `FEDERATION_PROVIDER_ID` varchar(36) NOT NULL,
  `FEDERATION_MAPPER_TYPE` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USR_FED_MAP_FED_PRV` (`FEDERATION_PROVIDER_ID`),
  KEY `IDX_USR_FED_MAP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_FEDMAPPERPM_FEDPRV` FOREIGN KEY (`FEDERATION_PROVIDER_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`),
  CONSTRAINT `FK_FEDMAPPERPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_MAPPER`
--

LOCK TABLES `USER_FEDERATION_MAPPER` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `USER_FEDERATION_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_MAPPER_CONFIG` (
  `USER_FEDERATION_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_FEDMAPPER_CFG` FOREIGN KEY (`USER_FEDERATION_MAPPER_ID`) REFERENCES `USER_FEDERATION_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_MAPPER_CONFIG`
--

LOCK TABLES `USER_FEDERATION_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_PROVIDER`
--

DROP TABLE IF EXISTS `USER_FEDERATION_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_PROVIDER` (
  `ID` varchar(36) NOT NULL,
  `CHANGED_SYNC_PERIOD` int DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  `FULL_SYNC_PERIOD` int DEFAULT NULL,
  `LAST_SYNC` int DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  `PROVIDER_NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USR_FED_PRV_REALM` (`REALM_ID`),
  CONSTRAINT `FK_1FJ32F6PTOLW2QY60CD8N01E8` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_PROVIDER`
--

LOCK TABLES `USER_FEDERATION_PROVIDER` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_PROVIDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_GROUP_MEMBERSHIP`
--

DROP TABLE IF EXISTS `USER_GROUP_MEMBERSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_GROUP_MEMBERSHIP` (
  `GROUP_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  KEY `IDX_USER_GROUP_MAPPING` (`USER_ID`),
  CONSTRAINT `FK_USER_GROUP_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_GROUP_MEMBERSHIP`
--

LOCK TABLES `USER_GROUP_MEMBERSHIP` WRITE;
/*!40000 ALTER TABLE `USER_GROUP_MEMBERSHIP` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_GROUP_MEMBERSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_REQUIRED_ACTION`
--

DROP TABLE IF EXISTS `USER_REQUIRED_ACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_REQUIRED_ACTION` (
  `USER_ID` varchar(36) NOT NULL,
  `REQUIRED_ACTION` varchar(255) NOT NULL DEFAULT ' ',
  PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  KEY `IDX_USER_REQACTIONS` (`USER_ID`),
  CONSTRAINT `FK_6QJ3W1JW9CVAFHE19BWSIUVMD` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_REQUIRED_ACTION`
--

LOCK TABLES `USER_REQUIRED_ACTION` WRITE;
/*!40000 ALTER TABLE `USER_REQUIRED_ACTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_REQUIRED_ACTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `USER_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_ROLE_MAPPING` (
  `ROLE_ID` varchar(255) NOT NULL,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  KEY `IDX_USER_ROLE_MAPPING` (`USER_ID`),
  CONSTRAINT `FK_C4FQV34P1MBYLLOXANG7B1Q3L` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ROLE_MAPPING`
--

LOCK TABLES `USER_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `USER_ROLE_MAPPING` DISABLE KEYS */;
INSERT INTO `USER_ROLE_MAPPING` VALUES ('044ebe4c-c2d6-4c4b-a26d-d0c43b0300d3','59bf2b71-8c8b-409d-bc2d-5e4a8591eba1'),('ab07426c-ff4d-40ff-b4ce-ab5aac3f0db2','59bf2b71-8c8b-409d-bc2d-5e4a8591eba1'),('2ce5a4b9-7967-47da-a465-974fd3d89292','8c177eac-4f51-4153-a87b-3aa460ac8bb3'),('3f66f5fc-764d-449d-8bf9-6b757b02bc31','8c177eac-4f51-4153-a87b-3aa460ac8bb3');
/*!40000 ALTER TABLE `USER_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_SESSION`
--

DROP TABLE IF EXISTS `USER_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_SESSION` (
  `ID` varchar(36) NOT NULL,
  `AUTH_METHOD` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `LAST_SESSION_REFRESH` int DEFAULT NULL,
  `LOGIN_USERNAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `REMEMBER_ME` bit(1) NOT NULL DEFAULT b'0',
  `STARTED` int DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `USER_SESSION_STATE` int DEFAULT NULL,
  `BROKER_SESSION_ID` varchar(255) DEFAULT NULL,
  `BROKER_USER_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_SESSION`
--

LOCK TABLES `USER_SESSION` WRITE;
/*!40000 ALTER TABLE `USER_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_SESSION_NOTE`
--

DROP TABLE IF EXISTS `USER_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_SESSION_NOTE` (
  `USER_SESSION` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` text,
  PRIMARY KEY (`USER_SESSION`,`NAME`),
  CONSTRAINT `FK5EDFB00FF51D3472` FOREIGN KEY (`USER_SESSION`) REFERENCES `USER_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_SESSION_NOTE`
--

LOCK TABLES `USER_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `USER_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WEB_ORIGINS`
--

DROP TABLE IF EXISTS `WEB_ORIGINS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WEB_ORIGINS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`VALUE`),
  KEY `IDX_WEB_ORIG_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_LOJPHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WEB_ORIGINS`
--

LOCK TABLES `WEB_ORIGINS` WRITE;
/*!40000 ALTER TABLE `WEB_ORIGINS` DISABLE KEYS */;
INSERT INTO `WEB_ORIGINS` VALUES ('908aac02-ff05-4323-8868-ac055ff4fc49','*'),('b45787d7-41bc-4fb7-98ed-e1e6bff85ef9','+'),('ef50b7ea-73db-4f62-83fe-f8ab137c1714','+');
/*!40000 ALTER TABLE `WEB_ORIGINS` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-29 23:24:30
