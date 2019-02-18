﻿-- =================================================================================
-- Copyright 2014 Wolfgang Gatterbauer, Stephan Guennemann, Danai Koutra, Christos Faloutsos
-- 
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
-- 
--     http://www.apache.org/licenses/LICENSE-2.0
-- 
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
-- =================================================================================
-- =================================================================================
-- Paper experiment for Torus graph
-- First version: 6/24/2014
-- This version: 6/28/2014
-- Wolfgang Gatterbauer
-- =================================================================================



-- =================================================================================
-- (1) Create input data in database plus appropriate indices

-- A_torus: adjacency matrix
drop table if exists A_torus;
create table A_torus(s int, t int, w double precision, primary key (s, t));
create index sA_torus_idx ON A_torus(s);
create index tA_torus_idx ON A_torus(t);
insert into A_torus Values
	(66,87,1),
	(80,119,1),
	(19,137,1),
	(119,124,1),
	(131,130,1),
	(99,98,1),
	(40,106,1),
	(221,275,1),
	(19,201,1),
	(96,137,1),
	(166,166,1),
	(121,118,1),
	(123,80,1),
	(45,47,1),
	(54,57,1),
	(146,204,1),
	(19,138,1),
	(183,193,1),
	(69,19,1),
	(119,123,1),
	(14,14,1),
	(144,146,1),
	(226,144,1),
	(18,14,1),
	(108,111,1),
	(110,173,1),
	(275,221,1),
	(296,296,1),
	(184,232,1),
	(126,124,1),
	(246,247,1),
	(155,155,1),
	(78,52,1),
	(278,202,1),
	(26,121,1),
	(163,161,1),
	(195,196,1),
	(68,71,1),
	(98,133,1),
	(164,168,1),
	(45,49,1),
	(5,6,1),
	(4,80,1),
	(264,264,1),
	(223,169,1),
	(53,294,1),
	(145,146,1),
	(45,78,1),
	(19,64,1),
	(247,246,1),
	(298,299,1),
	(34,77,1),
	(19,18,1),
	(10,8,1),
	(164,167,1),
	(86,19,1),
	(46,97,1),
	(98,27,1),
	(224,106,1),
	(152,153,1),
	(232,193,1),
	(20,14,1),
	(126,80,1),
	(242,241,1),
	(294,213,1),
	(7,200,1),
	(217,168,1),
	(4,8,1),
	(19,38,1),
	(71,29,1),
	(184,184,1),
	(6,6,1),
	(53,53,1),
	(215,212,1),
	(125,125,1),
	(293,168,1),
	(92,42,1),
	(8,8,1),
	(55,54,1),
	(212,168,1),
	(222,294,1),
	(155,94,1),
	(202,202,1),
	(85,83,1),
	(272,19,1),
	(175,34,1),
	(8,116,1),
	(183,86,1),
	(292,264,1),
	(10,2,1),
	(121,6,1),
	(106,139,1),
	(34,174,1),
	(118,118,1),
	(104,40,1),
	(101,34,1),
	(96,50,1),
	(94,50,1),
	(34,130,1),
	(220,220,1),
	(32,224,1),
	(8,97,1),
	(154,16,1),
	(5,96,1),
	(96,6,1),
	(66,30,1),
	(41,34,1),
	(4,2,1),
	(129,129,1),
	(32,223,1),
	(306,128,1),
	(3,46,1),
	(129,32,1),
	(78,45,1),
	(43,40,1),
	(190,161,1),
	(75,75,1),
	(121,121,1),
	(207,208,1),
	(121,67,1),
	(193,232,1),
	(137,163,1),
	(19,111,1),
	(122,264,1),
	(41,182,1),
	(139,34,1),
	(7,90,1),
	(44,43,1),
	(130,132,1),
	(195,44,1),
	(32,106,1),
	(19,120,1),
	(19,19,1),
	(79,116,1),
	(34,259,1),
	(69,71,1),
	(51,126,1),
	(15,49,1),
	(317,317,1),
	(294,220,1),
	(243,231,1),
	(34,92,1),
	(307,43,1),
	(19,127,1),
	(285,285,1),
	(70,19,1),
	(19,109,1),
	(73,75,1),
	(199,34,1),
	(108,25,1),
	(34,252,1),
	(71,121,1),
	(34,40,1),
	(4,116,1),
	(265,6,1),
	(15,15,1),
	(231,229,1),
	(82,29,1),
	(53,4,1),
	(27,98,1),
	(19,100,1),
	(163,198,1),
	(48,45,1),
	(110,108,1),
	(168,218,1),
	(43,307,1),
	(172,36,1),
	(86,81,1),
	(116,97,1),
	(34,104,1),
	(130,131,1),
	(101,44,1),
	(15,37,1),
	(43,105,1),
	(289,288,1),
	(53,8,1),
	(231,243,1),
	(5,4,1),
	(225,30,1),
	(40,44,1),
	(59,58,1),
	(7,2,1),
	(282,20,1),
	(283,20,1),
	(239,183,1),
	(15,30,1),
	(220,30,1),
	(71,69,1),
	(19,228,1),
	(264,121,1),
	(207,150,1),
	(43,139,1),
	(218,294,1),
	(216,212,1),
	(219,212,1),
	(137,190,1),
	(160,155,1),
	(68,121,1),
	(19,179,1),
	(153,153,1),
	(42,41,1),
	(40,43,1),
	(232,229,1),
	(71,71,1),
	(235,234,1),
	(8,2,1),
	(118,229,1),
	(25,19,1),
	(111,19,1),
	(16,14,1),
	(129,193,1),
	(36,172,1),
	(70,93,1),
	(47,8,1),
	(21,14,1),
	(80,126,1),
	(224,32,1),
	(147,171,1),
	(40,107,1),
	(176,176,1),
	(75,29,1),
	(2,47,1),
	(121,119,1),
	(8,117,1),
	(54,54,1),
	(46,3,1),
	(80,121,1),
	(132,132,1),
	(10,96,1),
	(14,15,1),
	(256,257,1),
	(144,147,1),
	(19,209,1),
	(108,110,1),
	(212,222,1),
	(120,15,1),
	(80,96,1),
	(34,300,1),
	(34,180,1),
	(71,240,1),
	(46,45,1),
	(191,163,1),
	(234,234,1),
	(29,75,1),
	(161,120,1),
	(36,35,1),
	(52,47,1),
	(116,5,1),
	(45,48,1),
	(124,124,1),
	(96,70,1),
	(145,145,1),
	(228,19,1),
	(52,78,1),
	(168,293,1),
	(149,149,1),
	(212,218,1),
	(46,96,1),
	(95,159,1),
	(104,170,1),
	(161,190,1),
	(124,123,1),
	(40,300,1),
	(137,189,1),
	(233,230,1),
	(140,32,1),
	(34,290,1),
	(305,34,1),
	(242,242,1),
	(294,214,1),
	(189,161,1),
	(5,8,1),
	(4,78,1),
	(6,10,1),
	(273,273,1),
	(68,19,1),
	(34,60,1),
	(34,34,1),
	(26,145,1),
	(32,129,1),
	(72,65,1),
	(117,8,1),
	(10,6,1),
	(172,171,1),
	(94,155,1),
	(1,0,1),
	(176,142,1),
	(264,202,1),
	(44,140,1),
	(233,34,1),
	(34,175,1),
	(45,50,1),
	(10,4,1),
	(135,134,1),
	(77,34,1),
	(198,163,1),
	(229,118,1),
	(9,5,1),
	(147,144,1),
	(70,119,1),
	(174,34,1),
	(49,176,1),
	(30,151,1),
	(199,112,1),
	(122,122,1),
	(144,226,1),
	(121,26,1),
	(106,34,1),
	(127,80,1),
	(90,7,1),
	(201,7,1),
	(129,128,1),
	(228,228,1),
	(183,233,1),
	(97,50,1),
	(280,70,1),
	(123,123,1),
	(118,121,1),
	(193,129,1),
	(243,245,1),
	(8,5,1),
	(86,37,1),
	(92,91,1),
	(96,121,1),
	(53,45,1),
	(6,96,1),
	(86,184,1),
	(187,19,1),
	(186,86,1),
	(19,119,1),
	(19,121,1),
	(19,22,1),
	(257,256,1),
	(34,131,1),
	(284,78,1),
	(313,312,1),
	(108,86,1),
	(117,5,1),
	(195,34,1),
	(119,15,1),
	(106,104,1),
	(47,45,1),
	(90,111,1),
	(106,140,1),
	(57,54,1),
	(56,54,1),
	(19,29,1),
	(142,143,1),
	(140,44,1),
	(121,96,1),
	(73,74,1),
	(49,45,1),
	(53,70,1),
	(34,251,1),
	(124,280,1),
	(66,66,1),
	(163,120,1),
	(168,216,1),
	(156,155,1),
	(121,68,1),
	(34,47,1),
	(106,129,1),
	(243,239,1),
	(96,19,1),
	(4,4,1),
	(15,14,1),
	(121,30,1),
	(140,43,1),
	(103,34,1),
	(27,99,1),
	(114,108,1),
	(7,250,1),
	(42,103,1),
	(249,7,1),
	(49,20,1),
	(175,125,1),
	(204,146,1),
	(168,219,1),
	(240,90,1),
	(19,187,1),
	(58,108,1),
	(241,242,1),
	(260,91,1),
	(121,37,1),
	(124,15,1),
	(208,207,1),
	(61,62,1),
	(34,103,1),
	(220,294,1),
	(37,15,1),
	(13,13,1),
	(19,118,1),
	(170,170,1),
	(155,85,1),
	(15,120,1),
	(199,25,1),
	(42,40,1),
	(109,108,1),
	(67,65,1),
	(213,294,1),
	(56,8,1),
	(36,129,1),
	(201,199,1),
	(254,25,1),
	(102,40,1),
	(232,183,1),
	(305,309,1),
	(244,19,1),
	(19,178,1),
	(168,164,1),
	(4,10,1),
	(25,199,1),
	(8,54,1),
	(207,53,1),
	(155,160,1),
	(66,121,1),
	(274,274,1),
	(40,101,1),
	(176,178,1),
	(25,239,1),
	(19,264,1),
	(91,92,1),
	(102,34,1),
	(39,43,1),
	(120,137,1),
	(42,44,1),
	(80,127,1),
	(230,229,1),
	(206,206,1),
	(44,34,1),
	(274,273,1),
	(42,76,1),
	(88,88,1),
	(49,19,1),
	(166,164,1),
	(117,297,1),
	(54,55,1),
	(126,123,1),
	(19,49,1),
	(143,298,1),
	(73,67,1),
	(39,34,1),
	(212,221,1),
	(199,86,1),
	(118,19,1),
	(34,303,1),
	(155,157,1),
	(240,71,1),
	(178,178,1),
	(234,235,1),
	(70,69,1),
	(36,36,1),
	(19,71,1),
	(97,96,1),
	(212,216,1),
	(81,86,1),
	(19,80,1),
	(145,144,1),
	(22,22,1),
	(303,308,1),
	(202,278,1),
	(92,34,1),
	(212,219,1),
	(19,97,1),
	(161,191,1),
	(169,170,1),
	(236,234,1),
	(77,77,1),
	(34,84,1),
	(294,215,1),
	(37,86,1),
	(15,96,1),
	(161,198,1),
	(161,189,1),
	(92,40,1),
	(247,247,1),
	(239,232,1),
	(163,190,1),
	(19,37,1),
	(216,294,1),
	(83,85,1),
	(8,10,1),
	(45,51,1),
	(20,283,1),
	(147,147,1),
	(116,79,1),
	(46,15,1),
	(294,53,1),
	(96,46,1),
	(286,117,1),
	(144,144,1),
	(49,177,1),
	(199,115,1),
	(227,227,1),
	(3,2,1),
	(53,275,1),
	(178,22,1),
	(20,141,1),
	(135,135,1),
	(163,268,1),
	(30,225,1),
	(104,104,1),
	(30,68,1),
	(34,139,1),
	(171,147,1),
	(183,232,1),
	(108,113,1),
	(43,42,1),
	(123,15,1),
	(144,199,1),
	(30,15,1),
	(243,244,1),
	(122,199,1),
	(184,193,1),
	(92,92,1),
	(34,226,1),
	(34,195,1),
	(130,130,1),
	(86,185,1),
	(30,66,1),
	(141,20,1),
	(26,27,1),
	(43,140,1),
	(16,154,1),
	(70,118,1),
	(294,222,1),
	(145,26,1),
	(261,262,1),
	(47,97,1),
	(83,34,1),
	(54,8,1),
	(116,4,1),
	(35,19,1),
	(106,40,1),
	(244,244,1),
	(15,46,1),
	(168,217,1),
	(100,19,1),
	(226,34,1),
	(199,19,1),
	(264,19,1),
	(53,78,1),
	(26,26,1),
	(139,106,1),
	(80,19,1),
	(108,19,1),
	(199,201,1),
	(5,9,1),
	(7,109,1),
	(42,43,1),
	(34,102,1),
	(239,184,1),
	(37,14,1),
	(60,163,1),
	(97,46,1),
	(302,34,1),
	(111,199,1),
	(137,120,1),
	(86,108,1),
	(230,233,1),
	(111,90,1),
	(40,34,1),
	(275,53,1),
	(123,96,1),
	(124,264,1),
	(232,184,1),
	(19,177,1),
	(70,96,1),
	(108,58,1),
	(270,19,1),
	(33,163,1),
	(44,101,1),
	(80,4,1),
	(71,66,1),
	(274,275,1),
	(40,102,1),
	(87,66,1),
	(219,219,1),
	(123,121,1),
	(20,49,1),
	(99,133,1),
	(120,19,1),
	(19,241,1),
	(111,7,1),
	(316,315,1),
	(203,125,1),
	(259,34,1),
	(3,79,1),
	(221,278,1),
	(185,86,1),
	(218,212,1),
	(70,87,1),
	(19,270,1),
	(197,195,1),
	(34,305,1),
	(210,211,1),
	(202,168,1),
	(49,178,1),
	(19,46,1),
	(65,29,1),
	(33,34,1),
	(178,176,1),
	(51,51,1),
	(104,34,1),
	(23,23,1),
	(229,231,1),
	(175,19,1),
	(119,274,1),
	(27,133,1),
	(212,220,1),
	(78,284,1),
	(94,94,1),
	(19,51,1),
	(34,302,1),
	(155,156,1),
	(137,96,1),
	(223,32,1),
	(234,236,1),
	(164,71,1),
	(40,18,1),
	(191,137,1),
	(19,70,1),
	(52,45,1),
	(124,119,1),
	(212,217,1),
	(121,15,1),
	(6,8,1),
	(157,155,1),
	(71,164,1),
	(96,10,1),
	(129,106,1),
	(32,139,1),
	(19,67,1),
	(137,19,1),
	(50,45,1),
	(22,141,1),
	(312,313,1),
	(19,96,1),
	(277,34,1),
	(140,139,1),
	(140,34,1),
	(77,76,1),
	(34,83,1),
	(294,216,1),
	(205,205,1),
	(47,78,1),
	(189,163,1),
	(133,27,1),
	(91,260,1),
	(124,96,1),
	(192,163,1),
	(96,80,1),
	(15,80,1),
	(163,191,1),
	(258,258,1),
	(68,30,1),
	(127,49,1),
	(14,22,1),
	(29,81,1),
	(51,45,1),
	(47,148,1),
	(163,34,1),
	(128,306,1),
	(45,52,1),
	(70,199,1),
	(182,41,1),
	(20,282,1),
	(0,1,1),
	(116,19,1),
	(42,39,1),
	(199,109,1),
	(113,113,1),
	(4,117,1),
	(119,96,1),
	(220,212,1),
	(106,32,1),
	(163,269,1),
	(34,140,1),
	(91,82,1),
	(39,41,1),
	(199,144,1),
	(177,19,1),
	(66,71,1),
	(28,29,1),
	(47,4,1),
	(106,224,1),
	(201,19,1),
	(163,7,1),
	(121,126,1),
	(19,25,1),
	(20,20,1),
	(97,19,1),
	(136,96,1),
	(97,116,1),
	(19,15,1),
	(86,199,1),
	(96,123,1),
	(195,31,1),
	(200,199,1),
	(138,19,1),
	(53,47,1),
	(189,190,1),
	(2,3,1),
	(96,15,1),
	(120,161,1),
	(38,19,1),
	(35,37,1),
	(19,123,1),
	(44,139,1),
	(66,86,1),
	(102,106,1),
	(116,8,1),
	(60,34,1),
	(2,5,1),
	(106,102,1),
	(298,298,1),
	(165,164,1),
	(126,30,1),
	(25,25,1),
	(195,129,1),
	(304,34,1),
	(116,116,1),
	(171,267,1),
	(4,47,1),
	(120,189,1),
	(2,7,1),
	(8,4,1),
	(15,47,1),
	(168,214,1),
	(241,19,1),
	(105,40,1),
	(41,43,1),
	(78,3,1),
	(2,9,1),
	(87,70,1),
	(11,12,1),
	(40,39,1),
	(29,126,1),
	(49,22,1),
	(301,301,1),
	(53,207,1),
	(117,117,1),
	(199,200,1),
	(4,9,1),
	(263,263,1),
	(168,168,1),
	(41,44,1),
	(34,233,1),
	(95,50,1),
	(34,101,1),
	(58,199,1),
	(131,34,1),
	(210,311,1),
	(258,81,1),
	(91,34,1),
	(81,29,1),
	(121,264,1),
	(2,10,1),
	(202,199,1),
	(229,232,1),
	(202,264,1),
	(97,47,1),
	(4,6,1),
	(262,261,1),
	(6,2,1),
	(67,67,1),
	(264,122,1),
	(8,45,1),
	(65,70,1),
	(20,127,1),
	(124,80,1),
	(303,34,1),
	(310,310,1),
	(19,176,1),
	(271,19,1),
	(267,266,1),
	(211,210,1),
	(245,243,1),
	(308,303,1),
	(44,39,1),
	(269,269,1),
	(40,103,1),
	(171,172,1),
	(221,294,1),
	(162,120,1),
	(189,198,1),
	(47,9,1),
	(22,19,1),
	(19,240,1),
	(4,19,1),
	(232,232,1),
	(220,168,1),
	(80,125,1),
	(18,40,1),
	(3,78,1),
	(10,123,1),
	(19,271,1),
	(34,246,1),
	(34,304,1),
	(213,212,1),
	(133,99,1),
	(126,121,1),
	(159,95,1),
	(39,44,1),
	(29,71,1),
	(34,39,1),
	(199,58,1),
	(18,18,1),
	(255,255,1),
	(108,115,1),
	(14,80,1),
	(94,95,1),
	(34,277,1),
	(281,281,1),
	(119,80,1),
	(189,189,1),
	(297,117,1),
	(117,9,1),
	(19,61,1),
	(44,195,1),
	(110,80,1),
	(314,147,1),
	(124,118,1),
	(164,164,1),
	(182,40,1),
	(184,239,1),
	(80,124,1),
	(127,20,1),
	(19,86,1),
	(119,127,1),
	(22,20,1),
	(19,68,1),
	(126,51,1),
	(241,241,1),
	(138,51,1),
	(86,15,1),
	(163,60,1),
	(193,193,1),
	(143,142,1),
	(34,82,1),
	(294,217,1),
	(221,168,1),
	(86,71,1),
	(290,34,1),
	(63,64,1),
	(90,199,1),
	(15,50,1),
	(82,82,1),
	(268,189,1),
	(188,188,1),
	(86,118,1),
	(163,192,1),
	(28,30,1),
	(212,214,1),
	(19,35,1),
	(14,21,1),
	(29,80,1),
	(300,34,1),
	(121,70,1),
	(163,137,1),
	(175,29,1),
	(219,294,1),
	(90,90,1),
	(179,19,1),
	(45,53,1),
	(22,14,1),
	(58,58,1),
	(41,39,1),
	(14,37,1),
	(103,40,1),
	(84,84,1),
	(86,86,1),
	(30,30,1),
	(34,199,1),
	(123,10,1),
	(148,47,1),
	(104,106,1),
	(80,29,1),
	(19,114,1),
	(79,3,1),
	(32,237,1),
	(129,36,1),
	(47,15,1),
	(123,124,1),
	(145,204,1),
	(193,183,1),
	(47,2,1),
	(126,29,1),
	(47,52,1),
	(118,96,1),
	(44,40,1),
	(78,78,1),
	(111,111,1),
	(19,4,1),
	(168,222,1),
	(183,239,1),
	(108,109,1),
	(19,14,1),
	(275,274,1),
	(180,40,1),
	(119,19,1),
	(180,34,1),
	(2,8,1),
	(121,80,1),
	(104,102,1),
	(86,183,1),
	(80,80,1),
	(120,162,1),
	(141,22,1),
	(30,71,1),
	(19,124,1),
	(32,31,1),
	(118,70,1),
	(153,152,1),
	(5,2,1),
	(290,84,1),
	(43,34,1),
	(67,121,1),
	(173,110,1),
	(80,15,1),
	(162,162,1),
	(168,212,1),
	(214,212,1),
	(34,43,1),
	(123,119,1),
	(294,294,1),
	(140,106,1),
	(47,46,1),
	(25,24,1),
	(61,19,1),
	(139,43,1),
	(69,66,1),
	(66,65,1),
	(49,35,1),
	(168,215,1),
	(115,199,1),
	(199,122,1),
	(279,279,1),
	(34,44,1),
	(248,7,1),
	(15,86,1),
	(41,42,1),
	(128,129,1),
	(271,271,1),
	(37,19,1),
	(29,29,1),
	(221,202,1),
	(15,121,1),
	(190,189,1),
	(121,66,1),
	(96,110,1),
	(170,104,1),
	(217,294,1),
	(176,49,1),
	(264,292,1),
	(101,40,1),
	(219,168,1),
	(202,221,1),
	(264,124,1),
	(37,121,1),
	(64,63,1),
	(90,240,1),
	(229,233,1),
	(67,73,1),
	(222,222,1),
	(196,195,1),
	(40,180,1),
	(199,70,1),
	(14,175,1),
	(40,40,1),
	(300,40,1),
	(6,121,1),
	(71,19,1),
	(96,97,1),
	(50,96,1),
	(70,280,1),
	(65,71,1),
	(32,261,1),
	(19,175,1),
	(214,294,1),
	(9,117,1),
	(177,49,1),
	(8,53,1),
	(40,104,1),
	(112,112,1),
	(51,19,1),
	(96,37,1),
	(24,25,1),
	(119,121,1),
	(14,16,1),
	(37,96,1),
	(287,287,1),
	(62,19,1),
	(200,200,1),
	(112,108,1),
	(9,47,1),
	(201,201,1),
	(37,35,1),
	(239,25,1),
	(65,67,1),
	(19,272,1),
	(268,163,1),
	(133,98,1),
	(121,19,1),
	(126,126,1),
	(35,49,1),
	(82,34,1),
	(79,79,1),
	(27,175,1),
	(30,121,1),
	(200,7,1),
	(18,19,1),
	(108,114,1),
	(163,189,1),
	(183,184,1),
	(84,290,1),
	(161,176,1),
	(8,9,1),
	(12,11,1),
	(14,18,1),
	(30,126,1),
	(147,314,1),
	(19,62,1),
	(74,73,1),
	(65,69,1),
	(179,179,1),
	(6,265,1),
	(164,165,1),
	(274,119,1),
	(212,215,1),
	(7,163,1),
	(280,124,1),
	(155,159,1),
	(189,120,1),
	(82,91,1),
	(107,40,1),
	(19,69,1),
	(4,5,1),
	(198,198,1),
	(20,19,1),
	(95,155,1),
	(6,5,1),
	(92,44,1),
	(294,218,1),
	(27,27,1),
	(149,14,1),
	(146,144,1),
	(110,96,1),
	(125,175,1),
	(175,27,1),
	(195,76,1),
	(124,126,1),
	(170,195,1),
	(251,34,1),
	(118,124,1),
	(14,20,1),
	(207,19,1),
	(121,71,1),
	(199,111,1),
	(78,4,1),
	(32,140,1),
	(3,53,1),
	(127,127,1),
	(70,53,1),
	(45,8,1),
	(58,59,1),
	(93,70,1),
	(311,210,1),
	(86,66,1),
	(7,249,1),
	(98,99,1),
	(170,169,1),
	(30,28,1),
	(78,47,1),
	(273,274,1),
	(113,108,1),
	(190,163,1),
	(75,73,1),
	(7,111,1),
	(121,123,1),
	(30,220,1),
	(137,161,1),
	(110,199,1),
	(121,124,1),
	(29,19,1),
	(22,49,1),
	(96,124,1),
	(237,32,1),
	(193,184,1),
	(15,118,1),
	(47,53,1),
	(141,141,1),
	(315,316,1),
	(44,41,1),
	(20,22,1),
	(161,137,1),
	(168,221,1),
	(9,4,1),
	(275,273,1),
	(85,155,1),
	(99,27,1),
	(151,30,1),
	(5,117,1),
	(222,212,1),
	(120,163,1),
	(222,168,1),
	(67,19,1),
	(70,70,1),
	(252,34,1),
	(10,10,1),
	(115,108,1),
	(102,104,1),
	(95,94,1),
	(80,14,1),
	(126,19,1),
	(96,5,1),
	(34,42,1),
	(266,267,1),
	(295,295,1),
	(291,291,1),
	(273,275,1),
	(244,243,1),
	(139,44,1),
	(69,65,1),
	(288,289,1),
	(19,199,1),
	(47,34,1),
	(194,194,1),
	(183,183,1),
	(76,76,1),
	(112,199,1),
	(118,86,1),
	(34,106,1),
	(41,40,1),
	(29,28,1),
	(70,121,1),
	(15,122,1),
	(53,3,1),
	(29,175,1),
	(50,95,1),
	(233,183,1),
	(22,127,1),
	(199,202,1),
	(117,4,1),
	(15,19,1),
	(250,7,1),
	(277,277,1),
	(229,230,1),
	(96,118,1),
	(260,260,1),
	(5,10,1),
	(40,41,1),
	(221,212,1),
	(17,14,1),
	(110,110,1),
	(50,97,1),
	(8,47,1),
	(65,72,1),
	(91,91,1),
	(150,207,1),
	(129,195,1),
	(39,40,1),
	(9,116,1),
	(137,7,1),
	(232,239,1),
	(90,89,1),
	(267,171,1),
	(111,108,1),
	(97,8,1),
	(71,65,1),
	(39,42,1),
	(40,105,1),
	(175,14,1),
	(96,136,1),
	(109,19,1),
	(116,9,1),
	(54,56,1),
	(80,123,1),
	(29,65,1),
	(7,137,1),
	(132,130,1),
	(216,168,1),
	(14,17,1),
	(144,145,1),
	(19,207,1),
	(108,112,1),
	(224,224,1),
	(51,138,1),
	(65,66,1),
	(178,19,1),
	(49,15,1),
	(34,182,1),
	(246,246,1),
	(125,203,1),
	(46,47,1),
	(81,258,1),
	(191,161,1),
	(114,19,1),
	(239,243,1),
	(195,197,1),
	(96,138,1),
	(118,15,1),
	(171,36,1),
	(212,213,1),
	(14,19,1),
	(81,81,1),
	(119,70,1),
	(70,65,1),
	(39,39,1),
	(71,30,1),
	(71,86,1),
	(68,65,1),
	(65,68,1),
	(84,34,1),
	(164,166,1),
	(168,213,1),
	(209,19,1),
	(158,155,1),
	(117,286,1),
	(127,22,1),
	(124,121,1),
	(269,163,1),
	(155,158,1),
	(34,163,1),
	(294,212,1),
	(176,19,1),
	(7,201,1),
	(168,294,1),
	(294,168,1),
	(184,183,1),
	(253,253,1),
	(184,86,1),
	(130,34,1),
	(123,50,1),
	(215,294,1),
	(294,219,1),
	(27,26,1),
	(155,95,1),
	(169,223,1),
	(238,238,1),
	(214,168,1),
	(260,82,1),
	(199,90,1),
	(261,32,1),
	(146,145,1),
	(42,34,1),
	(43,44,1),
	(8,6,1),
	(189,137,1),
	(62,61,1),
	(198,189,1),
	(29,82,1),
	(150,150,1),
	(45,46,1),
	(199,110,1),
	(31,195,1),
	(163,33,1),
	(181,181,1),
	(50,15,1),
	(40,92,1),
	(212,294,1),
	(142,176,1),
	(103,42,1),
	(46,19,1),
	(7,248,1),
	(190,137,1),
	(31,32,1),
	(2,4,1),
	(4,53,1),
	(189,268,1),
	(43,41,1),
	(240,19,1),
	(137,191,1),
	(83,84,1),
	(215,168,1),
	(198,161,1),
	(19,116,1),
	(64,19,1),
	(2,6,1),
	(8,173,1),
	(176,161,1),
	(82,260,1),
	(43,39,1),
	(123,126,1),
	(49,127,1),
	(123,19,1),
	(44,42,1),
	(9,8,1),
	(86,186,1),
	(204,145,1),
	(178,49,1),
	(19,20,1),
	(168,220,1),
	(298,143,1),
	(69,70,1),
	(66,69,1),
	(161,161,1),
	(106,106,1),
	(122,15,1),
	(139,32,1),
	(233,229,1),
	(294,221,1),
	(22,178,1),
	(5,116,1),
	(261,261,1),
	(159,155,1),
	(34,91,1),
	(19,126,1),
	(80,110,1),
	(19,108,1),
	(138,96,1),
	(25,254,1),
	(127,19,1),
	(34,41,1),
	(309,305,1),
	(34,33,1),
	(173,8,1),
	(195,170,1),
	(50,123,1),
	(15,124,1),
	(50,94,1),
	(161,163,1),
	(125,80,1),
	(299,298,1),
	(44,92,1),
	(76,77,1),
	(84,83,1),
	(127,119,1),
	(246,34,1),
	(213,168,1),
	(6,4,1),
	(203,203,1),
	(134,135,1),
	(15,123,1),
	(167,164,1),
	(109,199,1),
	(217,212,1),
	(59,59,1),
	(106,169,1),
	(89,90,1),
	(9,2,1),
	(71,68,1),
	(168,202,1),
	(169,106,1),
	(76,42,1),
	(218,168,1),
	(10,5,1),
	(96,119,1),
	(15,119,1),
	(40,182,1),
	(40,42,1),
	(105,43,1),
	(182,34,1),
	(124,19,1),
	(78,53,1),
	(278,221,1),
	(76,195,1),
	(8,56,1),
	(25,108,1),
	(36,171,1),
	(35,36,1),
	(139,140,1),
	(42,92,1),
	(276,276,1),
	(14,149,1),
	(109,7,1),
	(19,244,1),
	(52,52,1);


-- E_torus: explicit beliefs
drop table if exists E_torus;
create table E_torus(v int, c int, b double precision, primary key (v, c));
insert into E_torus Values
	(282,1,-1),
	(282,2,2),
	(282,3,-1),
	(255,1,-1),
	(255,2,-1),
	(255,3,2),
	(207,1,-1),
	(207,2,2),
	(207,3,-1),
	(289,1,-1),
	(289,2,2),
	(289,3,-1),
	(103,1,-1),
	(103,2,2),
	(103,3,-1),
	(169,1,-1),
	(169,2,-1),
	(169,3,2),
	(285,1,-1),
	(285,2,2),
	(285,3,-1),
	(222,1,-1),
	(222,2,-1),
	(222,3,2),
	(317,1,-1),
	(317,2,2),
	(317,3,-1),
	(27,1,-1),
	(27,2,2),
	(27,3,-1),
	(104,1,-1),
	(104,2,2),
	(104,3,-1),
	(303,1,-1),
	(303,2,2),
	(303,3,-1),
	(142,1,-1),
	(142,2,2),
	(142,3,-1),
	(234,1,-1),
	(234,2,-1),
	(234,3,2),
	(17,1,-1),
	(17,2,2),
	(17,3,-1),
	(24,1,-1),
	(24,2,-1),
	(24,3,2),
	(123,1,-1),
	(123,2,2),
	(123,3,-1),
	(311,1,2),
	(311,2,-1),
	(311,3,-1),
	(270,1,-1),
	(270,2,-1),
	(270,3,2),
	(49,1,-1),
	(49,2,2),
	(49,3,-1),
	(274,1,-1),
	(274,2,2),
	(274,3,-1),
	(284,1,-1),
	(284,2,2),
	(284,3,-1),
	(279,1,-1),
	(279,2,2),
	(279,3,-1),
	(293,1,-1),
	(293,2,-1),
	(293,3,2),
	(16,1,2),
	(16,2,-1),
	(16,3,-1),
	(15,1,-1),
	(15,2,2),
	(15,3,-1),
	(219,1,-1),
	(219,2,2),
	(219,3,-1),
	(88,1,-1),
	(88,2,2),
	(88,3,-1),
	(214,1,-1),
	(214,2,2),
	(214,3,-1),
	(100,1,-1),
	(100,2,2),
	(100,3,-1),
	(94,1,-1),
	(94,2,2),
	(94,3,-1),
	(240,1,-1),
	(240,2,2),
	(240,3,-1),
	(250,1,-1),
	(250,2,2),
	(250,3,-1),
	(56,1,-1),
	(56,2,2),
	(56,3,-1),
	(191,1,-1),
	(191,2,2),
	(191,3,-1),
	(162,1,-1),
	(162,2,2),
	(162,3,-1),
	(283,1,-1),
	(283,2,-1),
	(283,3,2),
	(2,1,-1),
	(2,2,-1),
	(2,3,2),
	(276,1,-1),
	(276,2,-1),
	(276,3,2),
	(173,1,2),
	(173,2,-1),
	(173,3,-1),
	(4,1,-1),
	(4,2,2),
	(4,3,-1),
	(302,1,-1),
	(302,2,-1),
	(302,3,2),
	(92,1,-1),
	(92,2,2),
	(92,3,-1),
	(307,1,-1),
	(307,2,-1),
	(307,3,2),
	(252,1,-1),
	(252,2,2),
	(252,3,-1),
	(167,1,-1),
	(167,2,-1),
	(167,3,2),
	(147,1,-1),
	(147,2,2),
	(147,3,-1),
	(265,1,-1),
	(265,2,2),
	(265,3,-1),
	(69,1,2),
	(69,2,-1),
	(69,3,-1),
	(292,1,-1),
	(292,2,2),
	(292,3,-1),
	(248,1,-1),
	(248,2,-1),
	(248,3,2),
	(76,1,-1),
	(76,2,-1),
	(76,3,2),
	(0,1,-1),
	(0,2,2),
	(0,3,-1),
	(130,1,-1),
	(130,2,2),
	(130,3,-1),
	(295,1,-1),
	(295,2,2),
	(295,3,-1),
	(38,1,-1),
	(38,2,2),
	(38,3,-1),
	(194,1,-1),
	(194,2,2),
	(194,3,-1),
	(310,1,-1),
	(310,2,2),
	(310,3,-1),
	(230,1,2),
	(230,2,-1),
	(230,3,-1),
	(70,1,-1),
	(70,2,-1),
	(70,3,2),
	(14,1,-1),
	(14,2,-1),
	(14,3,2),
	(23,1,-1),
	(23,2,2),
	(23,3,-1),
	(53,1,-1),
	(53,2,2),
	(53,3,-1),
	(218,1,-1),
	(218,2,2),
	(218,3,-1),
	(90,1,2),
	(90,2,-1),
	(90,3,-1),
	(164,1,-1),
	(164,2,2),
	(164,3,-1),
	(314,1,-1),
	(314,2,2),
	(314,3,-1),
	(301,1,-1),
	(301,2,2),
	(301,3,-1),
	(105,1,-1),
	(105,2,2),
	(105,3,-1),
	(120,1,-1),
	(120,2,2),
	(120,3,-1),
	(128,1,-1),
	(128,2,2),
	(128,3,-1),
	(101,1,-1),
	(101,2,2),
	(101,3,-1),
	(312,1,-1),
	(312,2,2),
	(312,3,-1),
	(160,1,-1),
	(160,2,2),
	(160,3,-1),
	(296,1,-1),
	(296,2,2),
	(296,3,-1),
	(60,1,-1),
	(60,2,2),
	(60,3,-1),
	(42,1,-1),
	(42,2,-1),
	(42,3,2),
	(168,1,-1),
	(168,2,2),
	(168,3,-1),
	(178,1,-1),
	(178,2,2),
	(178,3,-1),
	(268,1,-1),
	(268,2,2),
	(268,3,-1),
	(288,1,-1),
	(288,2,2),
	(288,3,-1),
	(97,1,-1),
	(97,2,2),
	(97,3,-1),
	(30,1,-1),
	(30,2,2),
	(30,3,-1),
	(163,1,-1),
	(163,2,-1),
	(163,3,2),
	(3,1,-1),
	(3,2,-1),
	(3,3,2),
	(57,1,-1),
	(57,2,2),
	(57,3,-1),
	(146,1,-1),
	(146,2,2),
	(146,3,-1),
	(247,1,-1),
	(247,2,2),
	(247,3,-1),
	(121,1,-1),
	(121,2,2),
	(121,3,-1),
	(287,1,-1),
	(287,2,2),
	(287,3,-1),
	(213,1,-1),
	(213,2,-1),
	(213,3,2),
	(203,1,-1),
	(203,2,2),
	(203,3,-1),
	(204,1,-1),
	(204,2,2),
	(204,3,-1),
	(51,1,-1),
	(51,2,2),
	(51,3,-1),
	(242,1,-1),
	(242,2,2),
	(242,3,-1),
	(259,1,-1),
	(259,2,2),
	(259,3,-1),
	(183,1,-1),
	(183,2,2),
	(183,3,-1),
	(28,1,-1),
	(28,2,-1),
	(28,3,2),
	(125,1,-1),
	(125,2,2),
	(125,3,-1),
	(294,1,-1),
	(294,2,2),
	(294,3,-1),
	(41,1,-1),
	(41,2,2),
	(41,3,-1),
	(11,1,2),
	(11,2,-1),
	(11,3,-1),
	(236,1,-1),
	(236,2,-1),
	(236,3,2),
	(256,1,-1),
	(256,2,2),
	(256,3,-1),
	(180,1,-1),
	(180,2,2),
	(180,3,-1),
	(140,1,-1),
	(140,2,-1),
	(140,3,2),
	(209,1,-1),
	(209,2,2),
	(209,3,-1),
	(54,1,-1),
	(54,2,2),
	(54,3,-1),
	(135,1,-1),
	(135,2,-1),
	(135,3,2),
	(68,1,2),
	(68,2,-1),
	(68,3,-1),
	(75,1,-1),
	(75,2,2),
	(75,3,-1);

	
-- H_torus: original (unscaled) H matrix; important not to use name 'H'
drop table if exists H_torus;
create table H_torus(c1 int, c2 int, h double precision, primary key (c1, c2));
-- insert into H_torus Values
-- 	(1,1,-0.153333333), 
-- 	(1,2,0.186666667),
-- 	(1,3,-0.033333333),
-- 	(2,1,-0.213333333),
-- 	(2,2,0.276666667),
-- 	(2,3,-0.063333333),
-- 	(3,1,-0.133333333),
-- 	(3,2,0.116666667),
-- 	(3,3,0.016666667);
-- insert into H_torus Values
-- 	(1,1,0.166666667), 
-- 	(1,2,-0.033333333),
-- 	(1,3,-0.133333333),
-- 	(2,1,-0.003333333),
-- 	(2,2,0.096666667),
-- 	(2,3,-0.103333333),
-- 	(3,1,-0.033333333),
-- 	(3,2,0.016666667),
-- 	(3,3,0.016666667);
insert into H_torus Values
	(1,1,0.116666667), 
	(1,2,0.016666667),
	(1,3,-0.133333333),
	(2,1,-0.083333333),
	(2,2,0.166666667),
	(2,3,-0.083333333),
	(3,1,-0.083333333),
	(3,2,-0.033333333),
	(3,3,0.016666667);


-- =================================================================================
-- (2) Example use of LinBP and SBP


-- Run LinBP
drop table if exists temp_table;
CREATE TABLE temp_table AS SELECT * from LinBP('A_torus','E_torus','H_torus',0.1, 100,'LinBP Torus', 1, 0.01,0);

-- Show all final beliefs
drop table if exists output_table;
CREATE TABLE output_table AS select * from B_LinBP order by v,c;

COPY output_table TO '/tmp/roles.tsv' DELIMITER '	' CSV HEADER;

-- return normalized final beliefs
-- drop table if exists output_table;
-- select c, b*f as b from B_LinBP_v, (select	1/stddev_pop(b) as f from B_LinBP_v) as X order by c;
-- COPY output_table TO '/y/dijin/' DELIMITER '\t' CSV HEADER;


-- Run SBP
-- SELECT * from SBP('A_torus','E_torus','H_torus',0.1, 'SBP Torus',0);

-- Show all final beliefs
-- select * from B order by v,c;

-- return normalized final beliefs
-- select c, b*f as b
-- from B_SBP_v4, 	(select	1/stddev_pop(b) as f from B_SBP_v4) as X
-- order by c;





-- =================================================================================
-- (4) Result interpretation

-- Sufficient convergence guarantee for eps_H:
-- select * from fct_epsilonBound('A_torus', 'H_torus');

-- Comparing the top beliefs between LinBP and SBP
 -- select * from fct_beliefAccuracy('B_LinBP','B');






