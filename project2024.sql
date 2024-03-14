-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 22 fév. 2024 à 12:45
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `project2024`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

CREATE TABLE `admin` (
  `admin_id` bigint(20) NOT NULL,
  `approval` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `appointment`
--

CREATE TABLE `appointment` (
  `appointmentid` bigint(20) NOT NULL,
  `time` date DEFAULT NULL,
  `date` date DEFAULT NULL,
  `post_postingid` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

CREATE TABLE `article` (
  `article_id` bigint(20) NOT NULL,
  `author` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `publication_date` date DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `blog_blog_id` bigint(20) DEFAULT NULL,
  `comment_comment_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `blog`
--

CREATE TABLE `blog` (
  `blog_id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `certificate`
--

CREATE TABLE `certificate` (
  `certificateid` bigint(20) NOT NULL,
  `issue_date` date DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `chat`
--

CREATE TABLE `chat` (
  `chatid` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `claim`
--

CREATE TABLE `claim` (
  `claim_id` bigint(20) NOT NULL,
  `status` bit(1) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` bit(1) DEFAULT NULL,
  `response_id_response` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `comment`
--

CREATE TABLE `comment` (
  `comment_id` bigint(20) NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `react` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `company`
--

CREATE TABLE `company` (
  `companyid` bigint(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `industry` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `competition`
--

CREATE TABLE `competition` (
  `competitionid` bigint(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `result` varchar(255) DEFAULT NULL,
  `startdate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `contract`
--

CREATE TABLE `contract` (
  `contractid` bigint(20) NOT NULL,
  `date_debut` date DEFAULT NULL,
  `date_fin` date DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `taux` float DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `course`
--

CREATE TABLE `course` (
  `dtype` varchar(31) NOT NULL,
  `courseid` bigint(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `speciality` enum('Bi','DATASCIENCE','SE') DEFAULT NULL,
  `fileid` bigint(20) DEFAULT NULL,
  `file_type` enum('PDF','VIDEO') DEFAULT NULL,
  `quizzid` bigint(20) DEFAULT NULL,
  `certificate_certificateid` bigint(20) DEFAULT NULL,
  `contract_contractid` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `digital_certificate`
--

CREATE TABLE `digital_certificate` (
  `dig_certif_id` bigint(20) NOT NULL,
  `crt_file` varchar(255) DEFAULT NULL,
  `public_key` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `evaluation`
--

CREATE TABLE `evaluation` (
  `evaluation_id` bigint(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `user_user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `meet`
--

CREATE TABLE `meet` (
  `meetid` bigint(20) NOT NULL,
  `end_date` date DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `timetable_time_tableid` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `participation`
--

CREATE TABLE `participation` (
  `participationid` bigint(20) NOT NULL,
  `competition_competitionid` bigint(20) DEFAULT NULL,
  `user_user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `post`
--

CREATE TABLE `post` (
  `dtype` varchar(31) NOT NULL,
  `postingid` bigint(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `requirements` varchar(255) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `internshipid` bigint(20) DEFAULT NULL,
  `jobid` bigint(20) DEFAULT NULL,
  `company_companyid` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `response`
--

CREATE TABLE `response` (
  `id_response` bigint(20) NOT NULL,
  `response` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `sign_placement`
--

CREATE TABLE `sign_placement` (
  `x` bigint(20) NOT NULL,
  `page_nbr` bigint(20) DEFAULT NULL,
  `y` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `sign_process`
--

CREATE TABLE `sign_process` (
  `status` bigint(20) NOT NULL,
  `time_stamp` date DEFAULT NULL,
  `certificate_certificateid` bigint(20) DEFAULT NULL,
  `digitalcertificate_dig_certif_id` bigint(20) DEFAULT NULL,
  `signplacement_x` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `test`
--

CREATE TABLE `test` (
  `testid` bigint(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `end_time` date DEFAULT NULL,
  `start_time` date DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `prenom_et` varchar(255) DEFAULT NULL,
  `post_postingid` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `time_table`
--

CREATE TABLE `time_table` (
  `time_tableid` bigint(20) NOT NULL,
  `end_date` date DEFAULT NULL,
  `start_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `training_center`
--

CREATE TABLE `training_center` (
  `trainingcenterid` bigint(20) NOT NULL,
  `adress` varchar(255) DEFAULT NULL,
  `capacity` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `dtype` varchar(31) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `dateofbirth` date DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` bigint(20) DEFAULT NULL,
  `role` enum('STUDENT','TEACHER','RECRUITER','ADMIN') DEFAULT NULL,
  `recruiter_id` bigint(20) DEFAULT NULL,
  `student_id` bigint(20) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `teacher_id` bigint(20) DEFAULT NULL,
  `availabillity` enum('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday') DEFAULT NULL,
  `recruitmentdate` date DEFAULT NULL,
  `chat_chatid` bigint(20) DEFAULT NULL,
  `group_groupid` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user_articles`
--

CREATE TABLE `user_articles` (
  `users_user_id` bigint(20) NOT NULL,
  `articles_article_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user_claims`
--

CREATE TABLE `user_claims` (
  `users_user_id` bigint(20) NOT NULL,
  `claims_claim_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user_companys`
--

CREATE TABLE `user_companys` (
  `users_user_id` bigint(20) NOT NULL,
  `companys_companyid` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user_contracts`
--

CREATE TABLE `user_contracts` (
  `users_user_id` bigint(20) NOT NULL,
  `contracts_contractid` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user_trainingcenters`
--

CREATE TABLE `user_trainingcenters` (
  `users_user_id` bigint(20) NOT NULL,
  `trainingcenters_trainingcenterid` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Index pour la table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`appointmentid`),
  ADD UNIQUE KEY `UK_d5wdu2rphrtg7gs7bsrldnw6h` (`post_postingid`);

--
-- Index pour la table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`article_id`),
  ADD KEY `FKr0uda7cnk9cew9limobawjv8o` (`blog_blog_id`),
  ADD KEY `FKixjy0go2n38lveb37cnfanp0e` (`comment_comment_id`);

--
-- Index pour la table `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`blog_id`);

--
-- Index pour la table `certificate`
--
ALTER TABLE `certificate`
  ADD PRIMARY KEY (`certificateid`);

--
-- Index pour la table `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`chatid`);

--
-- Index pour la table `claim`
--
ALTER TABLE `claim`
  ADD PRIMARY KEY (`claim_id`),
  ADD UNIQUE KEY `UK_cap086fvik6cmecivstebijyw` (`response_id_response`);

--
-- Index pour la table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`comment_id`);

--
-- Index pour la table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`companyid`);

--
-- Index pour la table `competition`
--
ALTER TABLE `competition`
  ADD PRIMARY KEY (`competitionid`);

--
-- Index pour la table `contract`
--
ALTER TABLE `contract`
  ADD PRIMARY KEY (`contractid`);

--
-- Index pour la table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`courseid`),
  ADD UNIQUE KEY `UK_1ihbeeprpq8l4njfsvplkmhu` (`certificate_certificateid`),
  ADD KEY `FKsy7rb5ve93ior3ypkxcxpdpe1` (`contract_contractid`);

--
-- Index pour la table `digital_certificate`
--
ALTER TABLE `digital_certificate`
  ADD PRIMARY KEY (`dig_certif_id`);

--
-- Index pour la table `evaluation`
--
ALTER TABLE `evaluation`
  ADD PRIMARY KEY (`evaluation_id`),
  ADD KEY `FKb1hfrouprfvnh2r92s2353um5` (`user_user_id`);

--
-- Index pour la table `meet`
--
ALTER TABLE `meet`
  ADD PRIMARY KEY (`meetid`),
  ADD KEY `FK2av0xr8v7pyck1u2f5jpmois6` (`timetable_time_tableid`);

--
-- Index pour la table `participation`
--
ALTER TABLE `participation`
  ADD PRIMARY KEY (`participationid`),
  ADD KEY `FKk31g99hy0m3y706ityfkk864v` (`competition_competitionid`),
  ADD KEY `FKtjlaigte7yufgch349ls1vjnc` (`user_user_id`);

--
-- Index pour la table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`postingid`),
  ADD KEY `FKmgnbs1q1poleu2lbwdcugg4o2` (`company_companyid`);

--
-- Index pour la table `response`
--
ALTER TABLE `response`
  ADD PRIMARY KEY (`id_response`);

--
-- Index pour la table `sign_placement`
--
ALTER TABLE `sign_placement`
  ADD PRIMARY KEY (`x`);

--
-- Index pour la table `sign_process`
--
ALTER TABLE `sign_process`
  ADD PRIMARY KEY (`status`),
  ADD UNIQUE KEY `UK_kwjjmf9uxvucfo23nwh97iyy2` (`certificate_certificateid`),
  ADD UNIQUE KEY `UK_h6p6vetvrch2rpvon3mfw8lbi` (`digitalcertificate_dig_certif_id`),
  ADD KEY `FKri35y05gph9wgpbq6k8mfujbw` (`signplacement_x`);

--
-- Index pour la table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`testid`),
  ADD KEY `FK46x895sdp5xh01el0qs46maqf` (`post_postingid`);

--
-- Index pour la table `time_table`
--
ALTER TABLE `time_table`
  ADD PRIMARY KEY (`time_tableid`);

--
-- Index pour la table `training_center`
--
ALTER TABLE `training_center`
  ADD PRIMARY KEY (`trainingcenterid`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `FK1ppew7n3jh0a3ktpuc60g8fev` (`chat_chatid`);

--
-- Index pour la table `user_articles`
--
ALTER TABLE `user_articles`
  ADD PRIMARY KEY (`users_user_id`,`articles_article_id`),
  ADD KEY `FKkth6ljmdapt6buxi2ve95y6wm` (`articles_article_id`);

--
-- Index pour la table `user_claims`
--
ALTER TABLE `user_claims`
  ADD PRIMARY KEY (`users_user_id`,`claims_claim_id`),
  ADD KEY `FK8mby0ueju8bxv9c1dwed37eas` (`claims_claim_id`);

--
-- Index pour la table `user_companys`
--
ALTER TABLE `user_companys`
  ADD PRIMARY KEY (`users_user_id`,`companys_companyid`),
  ADD KEY `FK7248m4vjjq6oixruno4m18xx1` (`companys_companyid`);

--
-- Index pour la table `user_contracts`
--
ALTER TABLE `user_contracts`
  ADD PRIMARY KEY (`users_user_id`,`contracts_contractid`),
  ADD KEY `FKmhyxe61vf81xtkdri7y61odgt` (`contracts_contractid`);

--
-- Index pour la table `user_trainingcenters`
--
ALTER TABLE `user_trainingcenters`
  ADD PRIMARY KEY (`users_user_id`,`trainingcenters_trainingcenterid`),
  ADD KEY `FKm4qxlc3soe72ufcq6ck4kwn23` (`trainingcenters_trainingcenterid`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `appointmentid` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `article`
--
ALTER TABLE `article`
  MODIFY `article_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `blog`
--
ALTER TABLE `blog`
  MODIFY `blog_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `certificate`
--
ALTER TABLE `certificate`
  MODIFY `certificateid` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `chat`
--
ALTER TABLE `chat`
  MODIFY `chatid` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `claim`
--
ALTER TABLE `claim`
  MODIFY `claim_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `comment`
--
ALTER TABLE `comment`
  MODIFY `comment_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `company`
--
ALTER TABLE `company`
  MODIFY `companyid` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `competition`
--
ALTER TABLE `competition`
  MODIFY `competitionid` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `contract`
--
ALTER TABLE `contract`
  MODIFY `contractid` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `course`
--
ALTER TABLE `course`
  MODIFY `courseid` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `digital_certificate`
--
ALTER TABLE `digital_certificate`
  MODIFY `dig_certif_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `evaluation`
--
ALTER TABLE `evaluation`
  MODIFY `evaluation_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `meet`
--
ALTER TABLE `meet`
  MODIFY `meetid` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `participation`
--
ALTER TABLE `participation`
  MODIFY `participationid` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `post`
--
ALTER TABLE `post`
  MODIFY `postingid` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `response`
--
ALTER TABLE `response`
  MODIFY `id_response` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `sign_placement`
--
ALTER TABLE `sign_placement`
  MODIFY `x` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `sign_process`
--
ALTER TABLE `sign_process`
  MODIFY `status` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `test`
--
ALTER TABLE `test`
  MODIFY `testid` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `time_table`
--
ALTER TABLE `time_table`
  MODIFY `time_tableid` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `training_center`
--
ALTER TABLE `training_center`
  MODIFY `trainingcenterid` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `FKmm5mkbbsle7mnpncgdjcr9894` FOREIGN KEY (`post_postingid`) REFERENCES `post` (`postingid`);

--
-- Contraintes pour la table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `FKixjy0go2n38lveb37cnfanp0e` FOREIGN KEY (`comment_comment_id`) REFERENCES `comment` (`comment_id`),
  ADD CONSTRAINT `FKr0uda7cnk9cew9limobawjv8o` FOREIGN KEY (`blog_blog_id`) REFERENCES `blog` (`blog_id`);

--
-- Contraintes pour la table `claim`
--
ALTER TABLE `claim`
  ADD CONSTRAINT `FKmjkt2nkj384fi4u16ct4vxhri` FOREIGN KEY (`response_id_response`) REFERENCES `response` (`id_response`);

--
-- Contraintes pour la table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `FK9tcveweksnc0ksywi0fcmwqtk` FOREIGN KEY (`certificate_certificateid`) REFERENCES `certificate` (`certificateid`),
  ADD CONSTRAINT `FKsy7rb5ve93ior3ypkxcxpdpe1` FOREIGN KEY (`contract_contractid`) REFERENCES `contract` (`contractid`);

--
-- Contraintes pour la table `evaluation`
--
ALTER TABLE `evaluation`
  ADD CONSTRAINT `FKb1hfrouprfvnh2r92s2353um5` FOREIGN KEY (`user_user_id`) REFERENCES `user` (`user_id`);

--
-- Contraintes pour la table `meet`
--
ALTER TABLE `meet`
  ADD CONSTRAINT `FK2av0xr8v7pyck1u2f5jpmois6` FOREIGN KEY (`timetable_time_tableid`) REFERENCES `time_table` (`time_tableid`);

--
-- Contraintes pour la table `participation`
--
ALTER TABLE `participation`
  ADD CONSTRAINT `FKk31g99hy0m3y706ityfkk864v` FOREIGN KEY (`competition_competitionid`) REFERENCES `competition` (`competitionid`),
  ADD CONSTRAINT `FKtjlaigte7yufgch349ls1vjnc` FOREIGN KEY (`user_user_id`) REFERENCES `user` (`user_id`);

--
-- Contraintes pour la table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `FKmgnbs1q1poleu2lbwdcugg4o2` FOREIGN KEY (`company_companyid`) REFERENCES `company` (`companyid`);

--
-- Contraintes pour la table `sign_process`
--
ALTER TABLE `sign_process`
  ADD CONSTRAINT `FKbs2qcby90bxhoinm5srv8bg2t` FOREIGN KEY (`digitalcertificate_dig_certif_id`) REFERENCES `digital_certificate` (`dig_certif_id`),
  ADD CONSTRAINT `FKj2ihfm73kntc8k7dw40laweeg` FOREIGN KEY (`certificate_certificateid`) REFERENCES `certificate` (`certificateid`),
  ADD CONSTRAINT `FKri35y05gph9wgpbq6k8mfujbw` FOREIGN KEY (`signplacement_x`) REFERENCES `sign_placement` (`x`);

--
-- Contraintes pour la table `test`
--
ALTER TABLE `test`
  ADD CONSTRAINT `FK46x895sdp5xh01el0qs46maqf` FOREIGN KEY (`post_postingid`) REFERENCES `post` (`postingid`);

--
-- Contraintes pour la table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK1ppew7n3jh0a3ktpuc60g8fev` FOREIGN KEY (`chat_chatid`) REFERENCES `chat` (`chatid`);

--
-- Contraintes pour la table `user_articles`
--
ALTER TABLE `user_articles`
  ADD CONSTRAINT `FK3k7m9ot3iss8fm0nc9bwaoacn` FOREIGN KEY (`users_user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `FKkth6ljmdapt6buxi2ve95y6wm` FOREIGN KEY (`articles_article_id`) REFERENCES `article` (`article_id`);

--
-- Contraintes pour la table `user_claims`
--
ALTER TABLE `user_claims`
  ADD CONSTRAINT `FK610tw6ncu9ueqwpn0ivqnjbdt` FOREIGN KEY (`users_user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `FK8mby0ueju8bxv9c1dwed37eas` FOREIGN KEY (`claims_claim_id`) REFERENCES `claim` (`claim_id`);

--
-- Contraintes pour la table `user_companys`
--
ALTER TABLE `user_companys`
  ADD CONSTRAINT `FK7248m4vjjq6oixruno4m18xx1` FOREIGN KEY (`companys_companyid`) REFERENCES `company` (`companyid`),
  ADD CONSTRAINT `FKqeo7pqg096jnx1ljwkxvlnynk` FOREIGN KEY (`users_user_id`) REFERENCES `user` (`user_id`);

--
-- Contraintes pour la table `user_contracts`
--
ALTER TABLE `user_contracts`
  ADD CONSTRAINT `FKgv77i49l7b16a8975diqr2pov` FOREIGN KEY (`users_user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `FKmhyxe61vf81xtkdri7y61odgt` FOREIGN KEY (`contracts_contractid`) REFERENCES `contract` (`contractid`);

--
-- Contraintes pour la table `user_trainingcenters`
--
ALTER TABLE `user_trainingcenters`
  ADD CONSTRAINT `FKapq3lb9epp0tilrb1d5gruxhw` FOREIGN KEY (`users_user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `FKm4qxlc3soe72ufcq6ck4kwn23` FOREIGN KEY (`trainingcenters_trainingcenterid`) REFERENCES `training_center` (`trainingcenterid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
