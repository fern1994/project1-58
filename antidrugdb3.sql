-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 09, 2016 at 11:14 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `antidrugdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `addictphase`
--

CREATE TABLE `addictphase` (
  `phaseID` int(3) NOT NULL,
  `phaseName` varchar(50) CHARACTER SET utf32 NOT NULL,
  `phaseDetail` text CHARACTER SET utf32 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `addictphase`
--

INSERT INTO `addictphase` (`phaseID`, `phaseName`, `phaseDetail`) VALUES
(1, 'ระยะที่ 1', 'ระยะเริ่มต้น\r\n\r\nเป็นช่วงทดลองเสพหรือเสพนาน ๆ ครั้ง เพื่อเข้าสังคมกับกลุ่มเพื่อน โดยผู้เสพส่วนใหญ่มักจะมีความรู้สึกว่าสตนเองทำในสิ่งที่ไม่ถูกต้อง"'),
(2, 'ระยะที่ 2', 'ระยะเสพยาต่อเนื่อง\r\n\r\nเป็นระยะที่ผู้เสพรู้สึกว่ายาเสพติดมีประโยชน์ ซึ่งโดยความเป็นจริงนั้น ฤทธิ์ของยาเสพติดที่กด หลอน และกระตุ้นประสาท จะทำให้ขาดการรู้สึกตัวในบางช่วง ซึ่งผุ้เสพเชื่อว่าเป็นการช่วยลดความเครียด ความเหงา ทำให้เสพยาบ่อยขึ้น พฤติกรรมเริ่มเปลี่ยนไปในทางที่แย่ลง'),
(3, 'ระยะที่ 3', 'ระยะหมกมุ่น\r\n\r\nผู้เสพต้องเสพยามากและบ่อยขึ้น เพราะเกิดการดื้อยา เริ่มเสียการเรียน การทำงาน มีเรื่องทะเลาะวิวาทกับผู้อื่น ๆ ความคิดและความจำแย่ลง เพราะเซลล์สมองบางส่วนเริ่มถูกทำลาย'),
(4, 'ระยะที่ 4', 'ระยะวิกฤติ\r\n\r\nระยะนี้ผู้เสพจะเป็นทาสของยาเสพติด คิดถึงและแสวงหายาเสพติดตลอดเวลาไม่สนใจกิจกรรมอื่น ๆ ไม่สามารถเรียนรู้หรือประกอบอาชีพได้ ทำทุกอย่างแม้แต่เรื่องผิดกฎหมายเพื่อให้ได้ยาเสพติดมาเสพ');

-- --------------------------------------------------------

--
-- Table structure for table `alertmeeting`
--

CREATE TABLE `alertmeeting` (
  `alertID` int(5) NOT NULL,
  `meetingDate` date NOT NULL,
  `meetingTitle` varchar(50) CHARACTER SET utf32 NOT NULL,
  `meetingDetail` text CHARACTER SET utf32 NOT NULL,
  `meetingSummary` text CHARACTER SET utf32 NOT NULL,
  `meetingByStaffID` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `alertmeeting`
--

INSERT INTO `alertmeeting` (`alertID`, `meetingDate`, `meetingTitle`, `meetingDetail`, `meetingSummary`, `meetingByStaffID`) VALUES
(30001, '2016-04-29', 'Meeting with P''Suchart', 'The meeting discuss the progress of symptoms and self healing.', 'The healthy get better. Reduce using of substances in moderation.', 10002),
(30002, '2016-05-24', 'Meeting with Nusra', 'The meeting discussed the progress of symptoms and self healing.', 'Be careful and realize about the healthy.', 10005);

-- --------------------------------------------------------

--
-- Table structure for table `drug`
--

CREATE TABLE `drug` (
  `drugID` int(3) NOT NULL,
  `drugName` varchar(50) CHARACTER SET utf32 NOT NULL,
  `drugDetail` text CHARACTER SET utf32 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `drug`
--

INSERT INTO `drug` (`drugID`, `drugName`, `drugDetail`) VALUES
(1, 'ฝิ่น', 'ชื่อทั่วไป :ฝิ่น (Opium)\r\n\r\nชื่ออื่น ๆ :PAPAVER SOMNIFERUM และ PAPAVER BRACTEATUM (ชื่อทางพฤกษศาสตร์) หมู (ฝิ่นที่คลุกยาฉุน ยาเส้น ใบพลู ใบจาก หรือกัญชาใช้ม้วนสูบด้วยกล้อง)\r\n\r\nสารเคมีที่ออกฤทธิ์ : Morphine และ อัลคาลอยด์ของฝิ่น\r\n\r\nลักษณะทางกายภาพ\r\nเนื้อฝิ่นได้มาจากยางของผลฝิ่นที่ถูกกรีดจะมีสีขาว เมื่อถูกอากาศจะมีสีคล้ำลง กลายเป็นยางเหนียวสีน้ำตาลไหม้ หรือดำ มีกลิ่นเหม็นเขียวและรสขม เรียนว่า “ฝิ่นดิบ” ส่วนฝิ่นที่มีการนำมาใช้เสพ เรียกว่า “ฝิ่นสุก” ได้มาจากนำฝิ่นดิบไปต้มหรือเคี่ยวจนสุก\r\n'),
(2, 'มอร์ฟีน', 'ชื่ออื่น ๆ : Cobies , Cube , Miss Emma , White stuff\r\n\r\nชื่อทางวิทยาศาสตร์ : 3,6–dihydroxy-N-methyl-4,5-epoxy-morphinen-7\r\n\r\nลักษณะทางกายภาพ :\r\nมอร์ฟีน เป็นผงสีขาวหรือเทาเกือบขาว ไม่มีกลิ่น มีรสขม มีฤทธิ์สูงกว่าฝิ่นประมาณ 8-10 เท่า เสพติดได้ง่าย มีลักษณะเป็นเม็ด เป็นผง และเป็นก้อน หรือละลายบรรจุหลอดสำหรับฉีด นำเข้าสู่ร่างกายโดยวิธีฉีดเป็นส่วนมาก มอร์ฟีนมีลักษณะ 2 รูป คือ รูปอิสระ (Free) และรูปเกลือ (Salt) สำหรับมอร์ฟีนที่มีลักษณะเป็นรูปของเกลือ ได้แก่ ซัลเฟท (Sulfate) ไฮโดรคลอไรด์ (Hydrochloride) อาซิเตท (Acetate) และทาร์เตรท (Tratrate) มอร์ฟีนรูปเกลือที่นิยมทำมาก คือ ซัลเฟท\r\n'),
(3, 'เฮโรอีน', 'ชื่อทั่วไป : เฮโรอีน (Heroin)\r\n\r\nชื่ออื่น ๆ : ผงขาว แค็ป ไอระเหย\r\n\r\nชื่อทางวิทยาศาสตร์ : Diacetylmorphine\r\n\r\nลักษณะทางกายภาพ\r\n\r\nเฮโรอีนที่แพร่ระบาดในประเทศไทย แบ่งเป็น 2 ชนิด คือ\r\n1. เฮโรอีนบริสุทธิ์ หรือ เฮโรอีนเบอร์ 4 มีลักษณะเป็นผงละเอียดสีขาว ชนิดนี้จะมีเนื้อ เฮโรอีนสูงถึง 90-95% ไม่มีกลิ่น  รสขมจัด นิยมเรียกว่า ผงขาว มักบรรจุอยู่ในถุง ห่อกระดาษ พลาสติก หรือหลอด ส่วนใหญ่เสพโดยวิธีฉีดหรือสูบ\r\n\r\n2. เฮโรอีนผสม หรือ เฮโรอีนเบอร์ 3 มีลักษณะเป็นเกล็ด ไม่มีกลิ่น รสขมจัด ชนิดนี้จะมีเนื้อเฮโรอีน ประมาณ 5-20% และมีการผสมสารอย่างอื่นลงไป เช่น สารหนู สตริกนิน กรดประสานทอง น้ำกัญชาต้ม ยานอนหลับ และเจือสีต่างๆ เช่น สีม่วงอ่อน สีชมพูอ่อน จึงมีสีหลากหลายต่างกัน มักพบบรรจุอยู่ในซองพลาสติกหรือห่อกระดาษ นิยมเสพโดยวิธีสูดไอระเหย ดังนั้นจึงมีคนเรียกเฮโรอีนชนิดนี้ว่า ไอระเหย\r\n'),
(4, 'สารระเหย', 'สารเคมีที่ออกฤทธิ์ :โทลูอีน , อาซีโทน ฯลฯ\r\n\r\nลักษณะทางกายภาพ :\r\nสารระเหยเกือบทุกชนิดเป็นของเหลว มีกลิ่นเฉพาะตัว หรือกลิ่นหอม ระเหยได้ดี มีความหนืดต่ำค่าแรงตึงผิวต่ำ บางตัวติดไฟได้ เช่น Toluene , Ethyl Acetate , Acetone และ Methyl Ethyl Ketone เป็นต้น ส่วนมากมักไม่มีสี ใส ไม่มีตะกอน ค่าความดันไอต่ำ ละลายในน้ำได้ไม่ดี แต่มีคุณสมบัติละลายได้ดีในไขมัน'),
(5, 'ยาบ้า', 'ชื่อทั่วไป : ยาบ้า\r\n\r\nชื่ออื่น ๆ : ยาม้า ยาขยัน\r\n\r\nชื่อทางวิทยาศาสตร์ : (+)-2-methylamino-1-phenylpropane\r\n\r\nสารเคมีที่ออกฤทธิ์ :\r\nสารเคมีประเภทแอมเฟตามีน (Amphetamine) โดยผลการตรวจพิสูจน์ยาบ้าใน ประเทศไทยปัจจุบันเกือบทั้งหมดมีเมทแอมเฟตามีน ไฮโดรคลอไรด์(Methamphetamine Hydrochloride)\r\n\r\nลักษณะทางกายภาพ :\r\nยาบ้า มีลักษณะเป็นยาเม็ดกลมแบนขนาดเล็ก เส้นผ่าศูนย์กลางประมาณ 6-8 มิลลิเมตร ความหนาประมาณ 3 มิลลิเมตร น้ำหนักเม็ดยาประมาณ 80-100 มิลลิกรัม มีสีต่างๆกัน  เช่น สีส้ม สีน้ำตาล สีม่วง สีชมพู สีเทา สีเหลือง และสีเขียว เป็นต้น มีสัญลักษณ์ที่ปรากฏบนเม็ดยา เช่น ฬ , ? , M , PG ,WY สัญลักษณ์รูปดาว , รูปพระจันทร์เสี้ยว ,99 หรืออาจ เป็นลักษณะของเส้นแบ่งครึ่งเม็ด ซึ่งสัญลักษณ์เหล่านี้อาจปรากฏบนเม็ดยาด้านใดด้านหนึ่งหรือทั้งสองด้าน หรืออาจเป็นเม็ดเรียบทั้งสองด้านก็ได้\r\n'),
(6, 'ยาไอซ์', 'ชื่อทั่วไป : ยาไอซ์ (Ice)\r\n\r\nชื่อทางวิทยาศาสตร์ : Methamphetamine\r\n\r\nลักษณะทางกายภาพ\r\nเป็นรูปแบบหนึ่งของ Methamphetamine หรือยาบ้า เนื่องจากมีรูปพรรณเป็นก้อนผลึกใสเหมือนน้ำแข็ง จึงมีชื่อเรียกขานในหมู่ผู้เสพว่า “ไอซ์” (Ice) เนื่องจากยาไอซ์มีความบริสุทธิ์เกือบ 100% จึงมีฤทธิ์แรงกว่ายาบ้า (บางคนเรียกว่า หัวยาบ้า) สารตั้งต้นของการผลิตมักเป็นอีพีดรีน ซูโดอีฟรีดีน ฯลฯ นิยมเสพโดยการนำผลึกลนไฟให้ระเหิด แล้วสูดไอของผลึกที่ได้เข้าปอด การออกฤทธิ์ก็จะผิดกับการเสพยาบ้าที่ใช้ลนไฟ เพราะการสูดควันของยาบ้าจะให้สารหลายอย่างซึ่งเป็นอันตรายต่อร่างกายมากกว่า ขณะที่การสูดไอของยาไอซ์จะได้เฉพาะ methamphetamine หรือ amphetamine เท่านั้น นอกจากนี้เมื่อเผาไหม้แล้วจะไม่มีกลิ่น\r\n\r\n'),
(7, 'ยาอี', 'ชื่อทั่วไป : ยาอี หรือ เอ็กซ์ตาซี่ (Ecstasy)\r\n\r\nชื่ออื่น ๆ :ยาเลิฟ (Love drug หรือ Love Pills) ยากอด (Hug Pills)\r\n\r\nสารเคมีที่ออกฤทธิ์ :\r\n3,4-Methylenedionymethamphetamine (MDMA) หรือ\r\n3,4-Methylenedionyamphetamine (MDA) หรือ\r\n3,4-Methylenedionyethylamphetamine (MDE หรือ MDEA)\r\n\r\nลักษณะทางกายภาพ:\r\nยาอี มีทั้งที่เป็นแคปซูล และเป็นเม็ดยาสีต่าง ๆ แต่ที่พบในประเทศไทย ส่วนใหญ่มีลักษณะเป็นเม็ดกลมแบน เส้นผ่าศูนย์กลาง 0.8 - 12 ซ.ม. หนา 0.3 - 0.4 ซ.ม. ผิวเรียบ และปรากฏสัญลักษณ์บนเม็ดยาเป็นรูปต่าง ๆ เช่น กระต่าย, ค้างคาว, นก, ดวงอาทิตย์, P.T.ฯลฯ เสพโดยการรับประทานเป็นเม็ด จะออกฤทธิ์ภายในเวลา 45 นาที และฤทธิ์ยาจะอยู่ในร่างกายได้นานประมาณ 6 - 8 ชั่วโมง\r\n'),
(8, 'กระท่อม', 'ชื่อทั่วไป : กระท่อม (Kratom)\r\n\r\nสารเคมีที่ออกฤทธิ์ :Mitragynine\r\n\r\nลักษณะทางกายภาพ :\r\nกระท่อมมีลักษณะเป็นไม้ยืนต้นขนาดกลางมีแก่นเป็นไม้เนื้อแข็ง ใช้ส่วนของใบเป็นสิ่งเสพติด ลักษณะใบคล้ายใบกระดังงาหรือใบฝรั่งต้นหนาทึบ ต้นกระท่อมมี 2 ชนิด คือ\r\n\r\n1. ชนิดที่มีก้านและเส้นใบ เป็นสีแดงเรื่อๆ\r\n\r\n2. ชนิดที่ต้นสีเขียว ใบสีเขียว ดอกกลมโตเท่าผลพุทราไทยล้อมรอบด้วยเกสรสีแดงเรื่อๆ คล้ายดอกกระถิน มีชื่อเรียกต่างๆ เช่น กระทุ่มโคก กระทุ่มพาย เป็นต้น\r\n'),
(9, 'โคเคน', 'ชื่อทั่วไป : โคเคน หรือ โคคาอีน (Cocaine)\r\n\r\nชื่ออื่นๆ : COKE , SNOW , SPEED BALL หรือ CRACK\r\n\r\nชื่อวิทยาศาสตร์ : methyl ester of benzoylecgonine\r\n\r\nลักษณะทางกายภาพ:\r\nโคเคนสามารถแบ่งออกได้เป็น 2 ประเภทใหญ่ๆ คือ โคเคนเบส\r\n(Cocaine base) และ เกลือโคเคน เช่น โคเคนไฮโดรคลอไรด์ (Cocaine hydrochloride) และโคเคนซัลเฟต (Cocaine sulfate)\r\nโคเคนที่พบในประเทศไทย มี 2 ชนิด ได้แก่\r\n\r\n1. โคเคนชนิดผง มีลักษณะเป็นผงละเอียดสีขาว รสขม ไม่มีกลิ่น\r\n\r\n2. โคเคนรูปผลึกเป็นก้อน (Free base , crack)'),
(10, 'แอลเอสดี', 'ชื่อทั่วไป : แอลเอสดี (LSD)\r\n\r\nชื่อวิทยาศาสตร์ : lysergic acid diethylamide\r\n\r\nลักษณะทางกายภาพ:\r\nมีฤทธิ์หลอนประสาทอย่างแรง LSD เป็นสารที่ผลิตขึ้นมาจาก lysergic acid ของสารจำพวก ergot ซึ่งเป็นรา (fungus) ที่ขึ้นอยู่ตามเมล็ดข้าวไร ไม่มีสี ไม่มีกลิ่น มีรสขมเล็กน้อย ค้นพบในปี พ.ศ.2481 โดย ดร.อัลเบิร์ท ฮอฟมันน์ (Dr. Albert Hofmann) นักเคมีชาวสวิส โดยสกัดได้จากเชื้อราชนิดหนึ่งจากเมล็ดข้าวไร\r\nการเสพ LSD   มักเสพโดยการรับประทานสูดดม เคี้ยว หรืออม  มีหลากหลายรูปแบบ ได้แก่ เม็ดกลมแบน แคปซูล แผ่นเจล (gelatin sheets) ของเหลวบรรจุในหลอดแก้ว ส่วนใหญ่ที่พบจะนำเอา LSD ไปหยดลงบนกระดาษสี่เหลี่ยม ที่มีคุณสมบัติดูดซับ เรียกว่า blotter paper ที่มีลวดลายและสีสันต่างๆ แล้วแบ่งเป็นชิ้นสี่เหลี่ยมเล็กๆ คล้ายสแตมป์ นิยมเรียกกันในหมู่ผู้เสพว่า สแตมป์เมา กระดาษเมา (magic paper) จะออกฤทธิ์ภายใน 30 – 90 นาที และมีฤทธิ์อยู่ได้นาน 8 – 12 ชั่วโมง ผู้ที่เสพจะมีอาการประสาทหลอนเห็นภาพเหตุการณ์ หรือประสบการณ์ในอดีต (flashbacks) '),
(11, 'เห็ดขี้ควาย', 'ชื่อทั่วไป : เห็ดขี้ควาย หรือ เห็ดวิเศษ (Magic mushroom)\r\n\r\nลักษณะทางกายภาพ:\r\nเป็นเห็ดที่มีฤทธิ์กับระบบประสาท มีขึ้นอยู่ตามกองมูลควายแห้ง สีของเห็ดจะมีสีเหลืองซีดคล้ายสีฟางแห้ง บนหัวของร่มจะมีสีน้ำตาลเข็มจนถึงสีดำ บริเวณก้าน ที่ใกล้จะถึงตัวร่ม จะมีแผ่นเนื้อเยื่อบาง ๆ สีขาวแผ่ขยายออกรอบก้าน แผ่นนี้มีลักษณะคล้ายวงแหวน เห็ดขี้ควายมีขึ้นอยู่ทั่วไปแทบทุกภาคของประเทศไทย ลักษณะของเห็ดตัวสมบูรณ์และโตเต็มที่ ตรงบริเวณหมวกจะมีเส้นผ่าศูนย์กลางประมาณ 6.5 - 8.8 เซนติเมตร ความสูงของลำต้นประมาณ 5.5 - 8.0 เซนติเมตร เส้นผ่าศูนย์กลางประมาณ 0.8 - 1.0 เซนติเมตร ผู้ที่รับประทานเห็ดนี้ จะมีอาการมึนเมา ประสาทหลอน ไม่สามารถลำดับทิศทาง เห็นภาพ แสง สีต่างๆ ลวงตา มีความคิดและอารมณ์เปลี่ยนแปลงคล้าย แอลเอสดี ถ้ากินมากเกินไปอาจจะทำให้ควบคุมสติไม่อยู่ เกิดประสาทหลอนอย่างรุ่นแรง คลื่นไส้ อาเจียน อาจเสียชีวิตได้เพราะหายใจติดขัด"'),
(12, 'ยาเค', 'ชื่อทั่วไป : ยาเค คีทามีน (Ketamine)\r\n\r\nสารออกฤทธิ์ : Ketamine\r\n\r\nลักษณะทางกายภาพ : \r\nเป็นผงผลึกสีขาว มีกลิ่นอ่อนๆเฉพาะตัว ละลายได้ดีในและแอลกอฮอล์ ผลึก หรือ เป็นน้ำบรรจุอยู่ในขวดสีชา จัดอยู่ในกลุ่มยาสลบ แต่ผู้ที่ได้รับจะไม่สลบ เพียงรู้สึกเหมือนตัวเองหลุดออกจากสิ่งแวดล้อมรอบตัว ความวิตกกังวลลดลง เดินเซมีอาการเหมือนเมาสุรา พูดลิ้นพันกัน เหงื่อออกมาก หัวใจเต้นเร็ว ความดันเลือดสูงขึ้น ความสับสน ง่วงนอน หากได้รับยาในปริมาณมากจะทำให้เกิด อาการคล้ายโรคจิต อาละวาดตามด้วยโคม่าและชัก การฟื้นจากฤทธิ์ยาจะรู้สึก เหมือนตื่นจากฝันร้าย ตื่นเต้นง่าย เพ้อคลั่ง และอาจเกิดอาการประสาทหลอน'),
(13, 'กัญชา', 'ชื่อทั่วไป : กัญชา (Cannabis, Marihuana, Ganja)\r\n\r\nลักษณะทางกายภาพ :\r\nกัญชา เป็นพืชล้มลุกจำพวกหญ้าขึ้นได้ง่ายในเขตร้อน ลำต้นสูงประมาณ 2-4 ฟุต ลักษณะใบจะแยกออกเป็นแฉกประมาณ 5-8 แฉก คล้ายใบมันสำปะหลัง ที่ขอบใบทุกใบจะมีรอยหยักอยู่เป็นระยะๆ ออกดอกเป็นช่อเล็กๆ ตามง่ามของกิ่งและก้าน ส่วนที่คนนำมาเสพได้แก่ ส่วนของกิ่ง ก้าน ใบและยอดช่อดอกกัญชา โดยนำมาตากหรืออบแห้งแล้วบดหรือหั่นให้เป็นผงหยาบๆ จากนั้นจึงนำมายัดไส้บุหรี่สูบ (แตกต่างจากบุหรี่ทั่วไปที่ไส้บุหรี่จะมีสีเขียวต่างจากไส้ยาสูบที่มีสีน้ำตาล และขณะจุดสูบจะมีกลิ่นเหมือนหญ้าแห้งไหม้ไฟ) หรืออาจสูบด้วยกล้องหรือบ้องกัญชา สารที่สำคัญที่สุดที่มีฤทธิ์ต่อสมองและทำให้ร่างกาย อารมณ์และจิตใจเปลี่ยนแปลงไป คือ เตตราไฮโดรแคนนาบินอล (Tetrahydro Cannabinol) หรือ THC ทำให้ผู้เสพตื่นเต้น ช่างพูด และหัวเราะตลอดเวลา');

-- --------------------------------------------------------

--
-- Table structure for table `evaluate`
--

CREATE TABLE `evaluate` (
  `evaluateID` int(5) NOT NULL,
  `patientIDCard` varchar(15) CHARACTER SET utf32 NOT NULL,
  `patientName` varchar(50) CHARACTER SET utf32 NOT NULL,
  `patientLastname` varchar(50) CHARACTER SET utf32 NOT NULL,
  `patientAge` int(3) NOT NULL,
  `patientAddress` text CHARACTER SET utf32 NOT NULL,
  `evaluatePoint` int(5) NOT NULL,
  `drugType` varchar(100) CHARACTER SET utf32 NOT NULL,
  `evaluateResult` varchar(30) CHARACTER SET utf32 NOT NULL,
  `evaluateDate` date NOT NULL,
  `evaluateByStaffID` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `evaluate`
--

INSERT INTO `evaluate` (`evaluateID`, `patientIDCard`, `patientName`, `patientLastname`, `patientAge`, `patientAddress`, `evaluatePoint`, `drugType`, `evaluateResult`, `evaluateDate`, `evaluateByStaffID`) VALUES
(20004, '1425566832568', 'Liam', 'Payn', 25, 'Yala', 30, 'Ice', 'Low', '2016-05-09', 10003),
(20006, '1694433970856', 'Nusra', 'cara', 25, 'Pattaya', 15, 'ใบกระท่อม', 'Medium', '2016-05-09', 10002),
(20007, '1966644329581', 'Adul', 'Ahmad', 40, 'Narathiwat', 28, 'โคเคน', 'High', '2016-05-09', 10003),
(20008, '1213366485987', 'Sutin', 'Numsai', 45, 'Yala', 23, 'ผลิตภัณฑ์ยาสูบ', 'Medium', '2016-05-09', 10001),
(20009, '1452233666854', 'Saijai', 'Hani', 34, 'Pattani', 18, 'สารผสมน้ำต้มใบกระท่อม', 'Medium', '2016-05-09', 10003),
(30001, '1456622869347', 'Somsri', 'Jaidee', 25, 'Narathiwat', 35, 'morphine', 'medium', '2016-04-01', 10001),
(30002, '196335502347', 'Suchart', 'Jaitrong', 32, 'Yala', 85, 'Ice', 'high', '2016-05-03', 10002),
(30003, '1988533246579', 'Zayn', 'Horan', 19, 'Pattani', 24, 'morphine', 'Low', '2016-05-08', 10003);

-- --------------------------------------------------------

--
-- Table structure for table `lawtype1`
--

CREATE TABLE `lawtype1` (
  `lawID` int(3) NOT NULL,
  `lawName` varchar(150) CHARACTER SET utf32 NOT NULL,
  `lawDetail` text CHARACTER SET utf32 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lawtype1`
--

INSERT INTO `lawtype1` (`lawID`, `lawName`, `lawDetail`) VALUES
(1, 'ผลิต นำเข้า ส่งออก', '- จำคุกตลอดชีวิต และปรับ 1,000,000-5,000,000 บาท\r\n\r\n- คำนวณเป็นสารบริสุทธิ์ 3 กรัม ขึ้นไป ถือว่ากระทำเพื่อจำหน่าย โทษประหารชีวิต\r\n\r\n- ผลิตโดยแบ่งบรรจุ รวมบรรจุ คำนวณเป็นสารบริสุทธิ์ไม่เกิน 3 กรัม จำคุก 4-15 ปี หรือปรับ 80,000-300,000 บาท หรือทั้งจำทั้งปรับ\r\n\r\n- ผลิตเพื่อจำหน่าย คำนวณเป็นสารบริสุทธิ์ไม่เกิน 3 กรัม จำคุก 4 ปีถึงตลอดชีวิต และปรับ 400,000-5,000,000 บาท\r\n\r\n'),
(2, 'จำหน่าย ครอบครองเพื่อจำหน่าย', '- คำนวณเป็นสารบริสุทธิ์ไม่เกิน 3 กรัม จำคุก 4-15 ปี หรือปรับ 80,000-300,000 บาท หรือทั้งจำทั้งปรับ\r\n\r\n- คำนวณเป็นสารบริสุทธิ์ตั้งแต่ 3 กรัม- 20 กรัม จำคุก 4 ปี ถึงตลอดชีวิต และปรับ 400,000-5,000,000 บาท\r\n\r\n- คำนวณเป็นสารบริสุทธิ์ 20 กรัมขึ้นไป จำคุกตลอดชีวิต และปรับ 1,000,000-5,000,000 บาท หรือประหารชีวิต'),
(3, 'ครอบครอง', '- คำนวณเป็นสารบริสุทธิ์ไม่ถึง 3 กรัม จำคุก 1-10 ปี หรือปรับ 20,000-200,000 บาท หรือทั้งจำทั้งปรับ\r\n\r\n'),
(4, 'เสพ', '- จำคุก 6 เดือน - 3 ปี หรือปรับ 10,000-60,000 บาท หรือทั้งจำทั้งปรับ\r\n\r\n'),
(5, 'ใช้อุบายหลอกลวง ขู่เข็ญ ใช้กำลัง ประทุษร้าย ข่มขืนใจให้ผู้อื่นเสพ', '- จำคุก 1-10 ปี และปรับ 100,000-1,000,000 บาท\r\n\r\n- ถ้าทำโดยมีอาวุธหรือร่วมกัน 2 คนขึ้นไป จำคุก 2-15 ปี และปรับ 200,000-1,500,000บาท\r\n\r\n- ถ้ากระทำต่อหญิงหรือผู้ยังไม่บรรลุนิติภาวะ หรือเพื่อจูงใจใหผู้อื่นทำผิดอาญา หรือเพื่อประโยชน์ในการทำผิดอาญา จำคุก 3 ปี ถึงตลอดชีวิต และปรับ 300,000 -500,000บาท\r\n\r\n- ถ้าเป็นมอร์ฟีน โคคาอีน เพิ่มโทษขึ้นกึ่งหนึ่ง และถ้ากระทำต่อหญิงหรือผู้ยังไม่บรรลุนิติภาวะ จำคุกตลอดชีวิต และปรับ 1,000,000-5,000,000 บาท\r\n\r\n- ถ้าเป็นเฮโรอีน โทษเป็น 2 เท่า และถ้ากระทำต่อหญิงหรือผู้ยังไม่บรรลุนิติภาวะ โทษประหารชีวิต\r\n'),
(6, 'ใช้อุบายหลอกลวง ขู่เข็ญ ใช้กำลัง ประทุษร้าย ข่มขืนใจให้ผู้อื่นผลิต นำเข้า ส่งออก จำหน่าย ครอบครองเพื่อจำหน่าย ครอบครอง', '- โทษเป็น 2 เท่าของความผิดนั้นๆ'),
(7, 'ยุยงส่งเสริมให้ผู้อื่นเสพ', '- จำคุก 1-5 ปี หรือปรับ 20,000- 100,000 บาท หรือทั้งจำทั้งปรับ');

-- --------------------------------------------------------

--
-- Table structure for table `lawtype2`
--

CREATE TABLE `lawtype2` (
  `lawID` int(3) NOT NULL,
  `lawName` varchar(150) CHARACTER SET utf32 NOT NULL,
  `lawDetail` text CHARACTER SET utf32 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lawtype2`
--

INSERT INTO `lawtype2` (`lawID`, `lawName`, `lawDetail`) VALUES
(1, 'ผลิต นำเข้า ส่งออก', '- จำคุก 1-10 ปีและปรับ 100,000 -1,000,000 บาท\r\n\r\n- ถ้าเป็นมอร์ฟีน ฝิ่น โคคาอีน จำคุก 20 ปี ถึงตลอดชีวิต และปรับ 2,000,000-5,000,000 บาท'),
(2, 'จำหน่าย ครอบครองเพื่อจำหน่าย', '- จำคุก 1-10 ปี หรือปรับ 20,000 -200,000 บาท หรือทั้งจำทั้งปรับ\r\n\r\n- ถ้าเป็นมอร์ฟีน ฝิ่น โคคาอีน คำนวณเป็นสารบริสุทธิ์ไม่เกิน 100 กรัม จำคุก 3-20 ปี หรือปรับ 60,000-400,000 บาท หรือทั้งจำทั้งปรับ\r\nถ้าคำนวณเป็นสารบริสุทธิ์เกิน100 กรัม จำคุก 5 ปี ถึงตลอดชีวิต และปรับ 500,000-5,000,000 บาท'),
(3, 'ครอบครอง', '- จำคุกไม่เกิน 5 ปี หรือปรับไม่เกิน 100,000 บาท หรือทั้งจำทั้งปรับ\r\n\r\n- คำนวณเป็นสารบริสุทธิ์ 100 กรัมขึ้นไป ถือว่าครอบครองเพื่อจำหน่าย'),
(4, 'เสพ', '- จำคุก 6 เดือน - 3 ปี หรือปรับ 10,000-60,000 บาท หรือทั้งจำทั้งปรับ'),
(5, 'ใช้อุบายหลอกลวง ขู่เข็ญ ใช้กำลัง ประทุษร้าย ข่มขืนใจให้ผู้อื่นเสพ', '- จำคุก 1-10 ปี และปรับ 100,000-1,000,000 บาท\r\n\r\n- ถ้าทำโดยมีอาวุธหรือร่วมกัน 2 คนขึ้นไป จำคุก 2-15 ปี และปรับ 200,000-1,500,000บาท\r\n\r\n- ถ้ากระทำต่อหญิงหรือผู้ยังไม่บรรลุนิติภาวะ หรือเพื่อจูงใจให้ผู้อื่นทำผิดอาญา หรือเพื่อประโยชน์ในการทำผิดอาญา จำคุก 3 ปี ถึงตลอดชีวิต\r\nและปรับ 300,000 -500,000บาท\r\n\r\n- ถ้าเป็นมอร์ฟีน โคคาอีน เพิ่มโทษขึ้นกึ่งหนึ่ง และถ้ากระทำต่อหญิงหรือผู้ยังไม่บรรลุนิติภาวะ จำคุกตลอดชีวิต และปรับ 1,000,000-5,000,000 บาท\r\n\r\n- ถ้าเป็นเฮโรอีน โทษเป็น 2 เท่า และถ้ากระทำต่อหญิงหรือผู้ยังไม่บรรลุนิติภาวะ โทษประหารชีวิต'),
(6, 'ยุยงส่งเสริมให้ผู้อื่นเสพ', '- จำคุก 1-5 ปี หรือปรับ 20,000- 100,000 บาท หรือทั้งจำทั้งปรับ');

-- --------------------------------------------------------

--
-- Table structure for table `lawtype3`
--

CREATE TABLE `lawtype3` (
  `lawID` int(3) NOT NULL,
  `lawName` varchar(15) CHARACTER SET utf32 NOT NULL,
  `lawDetail` text CHARACTER SET utf32 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lawtype3`
--

INSERT INTO `lawtype3` (`lawID`, `lawName`, `lawDetail`) VALUES
(1, 'ผลิต นำเข้า ส่ง', '- จำคุก 1-3 ปี และปรับ 100,000- 300,000บาท\r\n\r\n'),
(2, 'จำหน่าย ครอบครอ', '- จำนวนไม่เกินกฎกระทรวงกำหนด จำคุกไม่เกิน 1 ปี หรือปรับไม่เกิน 20,000 บาท หรือทั้งจำทั้งปรับจำนวนเกินกฎกระทรวงกำหนด จำคุกไม่เกิน 2 ปี และปรับไม่เกิน 200,000 บาท'),
(3, 'ใช้อุบายหลอกลวง', '- จำคุก 1-10 ปี และปรับ 100,000-1,000,000 บาท\r\n\r\n- ถ้าทำโดยมีอาวุธหรือร่วมกัน 2 คนขึ้นไป จำคุก 2-15 ปี และปรับ 200,000-1,500,000บาท\r\n\r\n- ถ้ากระทำต่อหญิงหรือผู้ยังไม่บรรลุนิติภาวะ หรือเพื่อจูงใจให้ผู้อื่นทำผิดอาญา หรือเพื่อประโยชน์ในการทำผิดอาญา จำคุก 3 ปี ถึงตลอดชีวิต และปรับ 300,000 -500,000บาท\r\n\r\n- ถ้าเป็นมอร์ฟีน โคคาอีน เพิ่มโทษขึ้นกึ่งหนึ่ง และถ้ากระทำต่อหญิงหรือผู้ยังไม่บรรลุนิติภาวะ จำคุกตลอดชีวิต และปรับ 1,000,000-5,000,000 บาท\r\n\r\n- ถ้าเป็นเฮโรอีน โทษเป็น 2 เท่า และถ้ากระทำต่อหญิงหรือผู้ยังไม่บรรลุนิติภาวะ โทษประหารชีวิต   '),
(4, 'ใช้อุบายหลอกลวง', '- โทษเป็น 2 เท่าของความผิดนั้นๆ');

-- --------------------------------------------------------

--
-- Table structure for table `lawtype4`
--

CREATE TABLE `lawtype4` (
  `lawID` int(3) NOT NULL,
  `lawName` varchar(150) CHARACTER SET utf32 NOT NULL,
  `lawDetail` text CHARACTER SET utf32 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lawtype4`
--

INSERT INTO `lawtype4` (`lawID`, `lawName`, `lawDetail`) VALUES
(1, 'ผลิต นำเข้า ส่งออก จำหน่าย ครอบครองเพื่อจำหน่าย', '- จำคุกตั้งแต่ 1-10 ปี และปรับ 20,000-200,000 บาท\r\n\r\n- 10 กก.ขึ้นไป จำคุก 1 -15 ปี และปรับ 100,000-1,500,000 บาท'),
(2, 'ครอบครอง', '- จำคุกไม่เกิน 5 ปี หรือปรับไม่เกิน 100,000 บาท หรือทั้งจำทั้งปรับ'),
(3, 'ใช้อุบายหลอกลวงขู่เข็ญ\r\nใช้กำลังประทุษร้าย\r\nข่มขืนใจให้ผู้อื่นเสพ', '- จำคุก 1-10 ปี และปรับ 100,000-1,000,000 บาท\r\n\r\n- ถ้าทำโดยมีอาวุธหรือร่วมกัน 2 คนขึ้นไป จำคุก 2-15 ปี และปรับ 200,000-1,500,000บาท\r\n\r\n- ถ้ากระทำต่อหญิงหรือผู้ยังไม่บรรลุนิติภาวะ หรือเพื่อจูงใจให้ผู้อื่นทำผิดอาญา หรือเพื่อประโยชน์ในการทำผิดอาญาจำคุก 3 ปี ถึงตลอดชีวิต และปรับ 300,000 -500,000บาท\r\n\r\n- ถ้าเป็นมอร์ฟีน โคคาอีน เพิ่มโทษขึ้นกึ่งหนึ่ง และถ้ากระทำต่อหญิงหรือผู้ยังไม่บรรลุนิติภาวะ จำคุกตลอดชีวิต และปรับ 1,000,000-5,000,000 บาท\r\n\r\n- ถ้าเป็นเฮโรอีน โทษเป็น 2 เท่า และถ้ากระทำต่อหญิงหรือผู้ยังไม่บรรลุนิติภาวะ โทษประหารชีวิต'),
(4, 'ใช้อุบายหลอกลวง ขู่เข็ญ ใช้กำลัง ประทุษร้าย ข่มขืนใจให้ผู้อื่นผลิต นำเข้า ส่งออก จำหน่าย ครอบครองเพื่อจำหน่าย ครอบครอง', 'โทษเป็น 2 เท่าของความผิดนั้นๆ');

-- --------------------------------------------------------

--
-- Table structure for table `lawtype5`
--

CREATE TABLE `lawtype5` (
  `lawID` int(3) NOT NULL,
  `lawName` varchar(150) CHARACTER SET utf32 NOT NULL,
  `lawDetail` text CHARACTER SET utf32 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lawtype5`
--

INSERT INTO `lawtype5` (`lawID`, `lawName`, `lawDetail`) VALUES
(1, 'ผลิต นำเข้า ส่งออก', '- จำคุกตั้งแต่ 2-15 ปี และปรับ 200,000-1,500,000 บาท'),
(2, 'ครอบครอง', '- จำคุกไม่เกิน 5 ปี หรือปรับไม่เกิน 100,000 บาท หรือทั้งจำทั้งปรับ'),
(3, 'จำหน่าย ครอบครองเพื่อจำหน่าย', '- ไม่ถึง 10 กก. จำคุก 2-10 ปี หรือปรับ 40,000-200,000 บาท หรือทั้งจำทั้งปรับ\r\n\r\n- 10 กก.ขึ้นไป จำคุก 2 -15 ปี และปรับ 200,000- 1,500,000 บาท'),
(4, 'เสพ', '- จำคุกไม่เกิน 1 ปี หรือปรับไม่เกิน 20,000 บาท หรือทั้งจำทั้งปรับ'),
(5, 'ใช้อุบายหลอกลวง ขู่เข็ญ ใช้กำลังประทุษร้าย ข่มขืนใจให้ผู้อื่นเสพ', '- จำคุก 1-10 ปี และปรับ 100,000-1,000,000 บาท\r\n\r\n- ถ้าทำโดยมีอาวุธหรือร่วมกัน 2 คนขึ้นไป จำคุก 2-15 ปี และปรับ 200,000-1,500,000บาท\r\n\r\n- ถ้ากระทำต่อหญิงหรือผู้ยังไม่บรรลุนิติภาวะ หรือเพื่อจูงใจให้ผู้อื่นทำผิดอาญา หรือเพื่อประโยชน์ในการทำผิดอาญา จำคุก 3 ปี ถึงตลอดชีวิต และปรับ 300,000 -500,000บาท\r\n\r\n- ถ้าเป็นมอร์ฟีน โคคาอีน เพิ่มโทษขึ้นกึ่งหนึ่ง และถ้ากระทำต่อหญิงหรือผู้ยังไม่บรรลุนิติภาวะ จำคุกตลอดชีวิต และปรับ 1,000,000-5,000,000 บาท\r\n\r\n- ถ้าเป็นเฮโรอีน โทษเป็น 2 เท่า และถ้ากระทำต่อหญิงหรือผู้ยังไม่บรรลุนิติภาวะ โทษประหารชีวิต"'),
(6, 'ยุยงส่งเสริมให้ผู้อื่นเสพ', '- จำคุกไม่เกิน 1 ปี หรือปรับไม่เกิน 20,000 บาท หรือทั้งจำทั้งปรับ'),
(7, 'ใช้อุบายหลอกลวง ขู่เข็ญ ใช้กำลัง ประทุษร้าย ข่มขืนใจให้ผู้อื่นผลิต นำเข้า ส่งออก จำหน่าย ครอบครองเพื่อจำหน่าย ครอบครอง', '- โทษเป็น 2 เท่าของความผิดนั้นๆ');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `newsID` int(5) NOT NULL,
  `newsTitile` varchar(100) NOT NULL,
  `newsDetails` text NOT NULL,
  `newsDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`newsID`, `newsTitile`, `newsDetails`, `newsDate`) VALUES
(20001, 'Training anti drugs staff at Yala', 'Training  anti drugs staff and activity at Yala', '2016-05-16'),
(20002, 'Staff meeting at Pattani', 'meeting all at Pattani', '2016-05-22'),
(20003, 'Training staff at Narathiwat', 'Training new staff at Narathiwat', '2016-05-15');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staffID` int(5) NOT NULL,
  `staffName` varchar(20) CHARACTER SET utf32 NOT NULL,
  `staffLastname` varchar(20) CHARACTER SET utf32 NOT NULL,
  `staffAddress` text CHARACTER SET utf32 NOT NULL,
  `staffTel` int(13) NOT NULL,
  `staffUsername` varchar(20) CHARACTER SET utf32 NOT NULL,
  `staffPassword` varchar(20) CHARACTER SET utf32 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staffID`, `staffName`, `staffLastname`, `staffAddress`, `staffTel`, `staffUsername`, `staffPassword`) VALUES
(10001, 'Patcharamai', 'Heamhongsa', 'Phuket', 833140625, 'Fearnn', 'fearn01'),
(10002, 'Kansuda', 'Sridee', 'Phuket', 852130245, 'Nanny', 'Nanny02'),
(10003, 'Norayounee', 'Hajeealee', 'Narathiwat', 862932904, 'Ayou', 'Ayou03'),
(10004, 'Niall', 'Horan', 'London', 862222347, 'Nialla', 'Niall04'),
(10005, 'Harry', 'Style', 'Pattani', 25334687, 'Harry', 'Harry05');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addictphase`
--
ALTER TABLE `addictphase`
  ADD PRIMARY KEY (`phaseID`);

--
-- Indexes for table `alertmeeting`
--
ALTER TABLE `alertmeeting`
  ADD PRIMARY KEY (`alertID`);

--
-- Indexes for table `drug`
--
ALTER TABLE `drug`
  ADD PRIMARY KEY (`drugID`);

--
-- Indexes for table `evaluate`
--
ALTER TABLE `evaluate`
  ADD PRIMARY KEY (`evaluateID`);

--
-- Indexes for table `lawtype1`
--
ALTER TABLE `lawtype1`
  ADD PRIMARY KEY (`lawID`);

--
-- Indexes for table `lawtype2`
--
ALTER TABLE `lawtype2`
  ADD PRIMARY KEY (`lawID`);

--
-- Indexes for table `lawtype3`
--
ALTER TABLE `lawtype3`
  ADD PRIMARY KEY (`lawID`);

--
-- Indexes for table `lawtype4`
--
ALTER TABLE `lawtype4`
  ADD PRIMARY KEY (`lawID`);

--
-- Indexes for table `lawtype5`
--
ALTER TABLE `lawtype5`
  ADD PRIMARY KEY (`lawID`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`newsID`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staffID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addictphase`
--
ALTER TABLE `addictphase`
  MODIFY `phaseID` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `alertmeeting`
--
ALTER TABLE `alertmeeting`
  MODIFY `alertID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30003;
--
-- AUTO_INCREMENT for table `drug`
--
ALTER TABLE `drug`
  MODIFY `drugID` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `evaluate`
--
ALTER TABLE `evaluate`
  MODIFY `evaluateID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20010;
--
-- AUTO_INCREMENT for table `lawtype1`
--
ALTER TABLE `lawtype1`
  MODIFY `lawID` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `lawtype2`
--
ALTER TABLE `lawtype2`
  MODIFY `lawID` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `lawtype3`
--
ALTER TABLE `lawtype3`
  MODIFY `lawID` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `lawtype4`
--
ALTER TABLE `lawtype4`
  MODIFY `lawID` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `lawtype5`
--
ALTER TABLE `lawtype5`
  MODIFY `lawID` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `newsID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10004;
--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `staffID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
