#include scripts\codescripts\struct;
#include scripts\shared\clientfield_shared;
#include scripts\shared\flag_shared;

#namespace namespace_7b1eb23c;

/*
	Name: init
	Namespace: namespace_7b1eb23c
	Checksum: 0x424F4353
	Offset: 0x900
	Size: 0xF928
	Parameters: 0
	Flags: None
	Line Number: 16
*/
function init()
{
	MapName = ToLower(GetDvarString("mapname"));
	if(isdefined(level.var_c4940f7e))
	{
		return;
	}
	if(MapName == "zm_town")
	{
		function_15b19a13((484, -1616, 136), (0, 0, 0), &function_57c748b3);
		function_15b19a13((571, -577, 136), VectorScale((0, 1, 0), 90), &function_57c748b3);
		function_15b19a13((390, 577, 141), VectorScale((0, 1, 0), 180), &function_57c748b3);
		function_15b19a13((1343, 250, 136), VectorScale((0, 1, 0), 135), &function_57c748b3);
		function_15b19a13((1850, 541, 276), VectorScale((0, -1, 0), 90), &function_57c748b3);
		function_15b19a13((1374, -917, 143), VectorScale((0, 1, 0), 180), &function_57c748b3);
	}
	if(MapName == "zm_das_herrenhaus")
	{
		function_15b19a13((1230, -542, 1114), (0, 0, 0));
		function_15b19a13((832, -586, 818), VectorScale((0, 1, 0), 90));
		function_15b19a13((-450, -354, 818), VectorScale((0, -1, 0), 90));
		function_15b19a13((521, 319, 650), (0, 0, 0));
		function_15b19a13((3368, -1741, 666), (0, 0, 0));
		function_15b19a13((949, -2521, 655), VectorScale((0, 1, 0), 90));
		function_15b19a13((433, -2416, 666), VectorScale((0, 1, 0), 180));
		function_15b19a13((-1241, -1294, 882), (0, 0, 0));
		function_15b19a13((-134, 1458, 818), VectorScale((0, -1, 0), 90));
	}
	if(MapName == "zm_log_kowloon")
	{
		function_15b19a13((8223, 684, 8), VectorScale((0, -1, 0), 90));
		function_15b19a13((8256, -1418, -383), VectorScale((0, 1, 0), 90));
		function_15b19a13((8892, -1167, -373), VectorScale((0, -1, 0), 135));
		function_15b19a13((9576, -1909, -383), VectorScale((0, 1, 0), 180));
		function_15b19a13((7167, -2965, -351), (0, 0, 0));
		function_15b19a13((7587, -2146, -519), VectorScale((0, 1, 0), 135));
		function_15b19a13((6984, -1156, -385), VectorScale((0, 1, 0), 180));
		function_15b19a13((8119, -3300, -351), (0, 0, 0));
		function_15b19a13((8066, -1040, -127), VectorScale((0, 1, 0), 135));
		function_15b19a13((7457, -1080, 156), VectorScale((0, 1, 0), 90));
	}
	if(MapName == "zm_mw2rust")
	{
		function_15b19a13((931, -711, 408), VectorScale((0, 1, 0), 140));
		function_15b19a13((160, -222, 414), VectorScale((0, -1, 0), 180));
		function_15b19a13((172, 856, 516), VectorScale((0, -1, 0), 90));
		function_15b19a13((1168, 856, 415), VectorScale((0, -1, 0), 135));
		function_15b19a13((1502, -474, 427), VectorScale((0, -1, 0), 162));
		function_15b19a13((-87, -1288, 409), VectorScale((0, 1, 0), 90));
	}
	if(MapName == "zm_dsfacility")
	{
		function_15b19a13((-1233, -887, 8), VectorScale((0, 1, 0), 90));
	}
	if(MapName == "zm_dsoverlook")
	{
		function_15b19a13((-5349, 3709, 8), VectorScale((0, -1, 0), 90));
	}
	if(MapName == "zm_dstemple")
	{
		function_15b19a13((3353, 3631, 168), (0, 0, 0));
	}
	if(MapName == "zm_dshouse")
	{
		function_15b19a13((-807, 760, 128), (0, 0, 0));
	}
	if(MapName == "zm_pantagon")
	{
		function_15b19a13((368, 1592, -723), VectorScale((0, -1, 0), 176));
		function_15b19a13((-667, 1621, -724), VectorScale((0, -1, 0), 90));
		function_15b19a13((-756, -656, -522), VectorScale((0, 1, 0), 90));
		function_15b19a13((-1629, -488, -522), VectorScale((0, -1, 0), 90));
		function_15b19a13((-736, 2285, -722), VectorScale((0, -1, 0), 90));
	}
	if(MapName == "zm_doom2")
	{
		function_15b19a13((-186, -41, 64), VectorScale((0, -1, 0), 180));
		function_15b19a13((413, -271, 112), VectorScale((0, -1, 0), 90));
		function_15b19a13((123, -1465, 100), VectorScale((0, 1, 0), 90));
	}
	if(MapName == "zm_e1m1_t2")
	{
		function_15b19a13((588, -368, -23), VectorScale((0, 1, 0), 90));
		function_15b19a13((1569, -1695, 36), VectorScale((0, 1, 0), 90));
		function_15b19a13((1012, -3155, 143), VectorScale((0, -1, 0), 90));
		function_15b19a13((1056, -778, -77), VectorScale((0, 1, 0), 180));
	}
	if(MapName == "zm_minecraft_tower")
	{
		function_15b19a13((100, -144, 40), VectorScale((0, 1, 0), 90));
		function_15b19a13((202, -264, 4280), VectorScale((0, 1, 0), 90));
	}
	if(MapName == "zm_void")
	{
		function_15b19a13((1734, 5363, 376), VectorScale((0, -1, 0), 180));
		function_15b19a13((-1698, 3233, 487), VectorScale((0, -1, 0), 45));
		function_15b19a13((-1075, 2076, 296), VectorScale((0, 1, 0), 135));
		function_15b19a13((-169, 4180, 418), VectorScale((0, 1, 0), 15));
		function_15b19a13((32, -557, 140), VectorScale((0, 1, 0), 90));
	}
	if(MapName == "zm_survival")
	{
		function_15b19a13((828, -604, 4), VectorScale((0, 1, 0), 180));
		function_15b19a13((47, 662, 4), VectorScale((0, -1, 0), 180));
		function_15b19a13((-1140, -722, -3), VectorScale((0, 1, 0), 90));
		function_15b19a13((988, 328, 4), VectorScale((0, -1, 0), 90));
		function_15b19a13((1763, -59, 0), VectorScale((0, 1, 0), 90));
	}
	if(MapName == "zm_outdoor")
	{
		function_15b19a13((935, -2792, 0), VectorScale((0, 1, 0), 90));
		function_15b19a13((1822, -674, 413), (0, 0, 0));
		function_15b19a13((941, -354, 0), VectorScale((0, -1, 0), 90));
		function_15b19a13((-309, -152, 0), (0, 0, 0));
		function_15b19a13((2038, -705, 0), VectorScale((0, -1, 0), 90));
	}
	if(MapName == "zm_mwdomerust")
	{
		function_15b19a13((3888, -620, -374), VectorScale((0, 1, 0), 180));
		function_15b19a13((7434, -8260, -863), (0, 0, 0));
		function_15b19a13((7198, -1767, -447), VectorScale((0, -1, 0), 90));
		function_15b19a13((8, -201, -106), VectorScale((0, 1, 0), 180));
		function_15b19a13((1709, -7160, -1043), VectorScale((0, -1, 0), 45));
	}
	if(MapName == "zm_stairway_to_aether")
	{
		function_15b19a13((892, -669, 4), VectorScale((0, -1, 0), 180));
		function_15b19a13((-1869, -287, 436), VectorScale((0, -1, 0), 90));
		function_15b19a13((-6925, -724, 940), VectorScale((0, 1, 0), 90));
		function_15b19a13((-5468, -759, 796), VectorScale((0, 1, 0), 90));
		function_15b19a13((-3628, -688, 583), VectorScale((0, 1, 0), 90));
	}
	if(MapName == "zm_killhouse_kj")
	{
		function_15b19a13((842, 2585, 20), VectorScale((0, -1, 0), 90));
		function_15b19a13((874, 803, 3), VectorScale((0, -1, 0), 180));
		function_15b19a13((787, -687, 0), VectorScale((0, 1, 0), 90));
		function_15b19a13((-1316, 7, 189), VectorScale((0, -1, 0), 90));
		function_15b19a13((651, 1811, 0), (0, 0, 0));
	}
	if(MapName == "zm_mchalloween")
	{
		function_15b19a13((-700, -720, 0), VectorScale((0, 1, 0), 90));
		function_15b19a13((975, 1765, 256), (0, 0, 0));
		function_15b19a13((492, -2255, -223), VectorScale((0, -1, 0), 90));
		function_15b19a13((1875, -495, 64), VectorScale((0, -1, 0), 90));
		function_15b19a13((1968, -1842, 0), VectorScale((0, 1, 0), 180));
	}
	if(MapName == "zm_night_day")
	{
		function_15b19a13((-281, -39, 0), VectorScale((0, 1, 0), 91));
		function_15b19a13((-232, 1437, 136), (0, 0, 0));
		function_15b19a13((-79, 1228, 8), VectorScale((0, -1, 0), 179));
	}
	if(MapName == "zm_ice_shrek")
	{
		function_15b19a13((50938, 37528, 1539), VectorScale((0, 1, 0), 48));
		function_15b19a13((-550, 324, 1116), VectorScale((0, -1, 0), 23));
		function_15b19a13((753, -1871, 1057), VectorScale((0, -1, 0), 163));
		function_15b19a13((-16879, -15934, 1078), VectorScale((0, 1, 0), 179));
		function_15b19a13((52111, 39538, 1535), VectorScale((0, -1, 0), 179));
	}
	if(MapName == "zm_tower")
	{
		function_15b19a13((993, -431, 1368), VectorScale((0, -1, 0), 90));
		function_15b19a13((8, -1664, 1736), VectorScale((0, 1, 0), 90));
	}
	if(MapName == "zm_ww2_headquarters")
	{
		function_15b19a13((1496, -1451, 0), VectorScale((0, 1, 0), 179));
		function_15b19a13((1348, -730, -1), VectorScale((0, -1, 0), 89));
		function_15b19a13((1233, -1374, -1), (0, 0, 0));
		function_15b19a13((1219, -942, -1), (0, 0, 0));
	}
	if(MapName == "zm_mcdonalds")
	{
		function_15b19a13((-3042, -499, 6), VectorScale((0, -1, 0), 90));
		function_15b19a13((-4384, 900, 0), VectorScale((0, -1, 0), 91));
		function_15b19a13((-2657, -1942, 254), (0, 0, 0));
		function_15b19a13((-5298, 484, 0), VectorScale((0, -1, 0), 89));
		function_15b19a13((-4873, -1440, 0), VectorScale((0, 1, 0), 90));
	}
	if(MapName == "zm_wendys")
	{
		function_15b19a13((1744, 4363, 180), VectorScale((0, -1, 0), 89));
		function_15b19a13((3103, 2018, -1), VectorScale((0, 1, 0), 89));
		function_15b19a13((2266, 5796, 0), VectorScale((0, -1, 0), 89));
		function_15b19a13((2752, 3227, -3), VectorScale((0, 1, 0), 175));
		function_15b19a13((1729, 4435, 0), VectorScale((0, 1, 0), 90));
	}
	if(MapName == "zm_pie5")
	{
		function_15b19a13((-1108, 7719, 8), VectorScale((0, -1, 0), 89));
		function_15b19a13((-1118, 6168, 8), VectorScale((0, -1, 0), 89));
		function_15b19a13((183, 6835, 8), VectorScale((0, 1, 0), 90));
		function_15b19a13((-5061, 7480, 9), VectorScale((0, -1, 0), 6));
		function_15b19a13((1752, 6377, 8), VectorScale((0, -1, 0), 179));
	}
	if(MapName == "zm_hos_errors")
	{
		function_15b19a13((300, -865, 440), VectorScale((0, -1, 0), 180));
		function_15b19a13((-1154, -685, 440), VectorScale((0, -1, 0), 90));
		function_15b19a13((-1475, 465, 600), VectorScale((0, 1, 0), 90));
		function_15b19a13((343, 1690, 443), VectorScale((0, -1, 0), 180));
		function_15b19a13((1466, 726, 613), VectorScale((0, -1, 0), 180));
		function_15b19a13((103, 107, 600), VectorScale((0, -1, 0), 90));
		function_15b19a13((596, 669, 443), VectorScale((0, 1, 0), 90));
		function_15b19a13((72, 2903, 313), VectorScale((0, -1, 0), 180));
		function_15b19a13((128, 5199, -101), VectorScale((0, -1, 0), 117));
		function_15b19a13((-1651, 5068, -94), (0, 0, 0));
	}
	if(MapName == "zm_daybreak")
	{
		function_15b19a13((-7208, -6927, -71), VectorScale((0, 1, 0), 47));
		function_15b19a13((-5995, -6469, -56), VectorScale((0, 1, 0), 173));
		function_15b19a13((-4757, -5690, -69), VectorScale((0, 1, 0), 23));
		function_15b19a13((-3654, -5695, -51), VectorScale((0, -1, 0), 165));
		function_15b19a13((-4041, -6794, -67), VectorScale((0, -1, 0), 134));
		function_15b19a13((-4692, -7521, -63), VectorScale((0, -1, 0), 90));
		function_15b19a13((-6456, -7594, 0), VectorScale((0, -1, 0), 41));
		function_15b19a13((-5308, -7135, -63), (0, 0, 0));
		function_15b19a13((-5190, -5726, -188), VectorScale((0, 1, 0), 34));
		function_15b19a13((-6047, -5614, -56), VectorScale((0, 1, 0), 5));
	}
	if(MapName == "zm_lasagna_party")
	{
		function_15b19a13((201, -1011, 0), VectorScale((0, 1, 0), 89));
		function_15b19a13((439, 1118, 0), VectorScale((0, 1, 0), 129));
		function_15b19a13((597, 1348, 200), VectorScale((0, -1, 0), 179));
		function_15b19a13((605, 479, 391), VectorScale((0, 1, 0), 178));
		function_15b19a13((-12, -264, 584), (0, 0, 0));
		function_15b19a13((646, 633, -198), VectorScale((0, -1, 0), 89));
		function_15b19a13((592, 230, 0), VectorScale((0, 1, 0), 179));
		function_15b19a13((-54, -774, 0), VectorScale((0, 1, 0), 43));
	}
	if(MapName == "zm_stack1")
	{
		function_15b19a13((-88, -743, 86), VectorScale((0, -1, 0), 122));
		function_15b19a13((-133, -1317, 0), VectorScale((0, -1, 0), 87));
		function_15b19a13((129, -2084, 2), VectorScale((0, 1, 0), 101));
		function_15b19a13((1123, -1392, 38), VectorScale((0, 1, 0), 179));
		function_15b19a13((984, -430, 209), VectorScale((0, 1, 0), 128));
		function_15b19a13((957, -1007, 209), VectorScale((0, -1, 0), 162));
		function_15b19a13((994, -44, 30), VectorScale((0, 1, 0), 177));
		function_15b19a13((-466, 684, 3), VectorScale((0, 1, 0), 61));
		function_15b19a13((-1196, 333, 0), VectorScale((0, 1, 0), 142));
		function_15b19a13((-1171, -737, 61), VectorScale((0, 1, 0), 86));
	}
	if(MapName == "zm_harborage")
	{
		function_15b19a13((-685, -851, 16), VectorScale((0, -1, 0), 48));
		function_15b19a13((493, -455, -28), VectorScale((0, -1, 0), 97));
		function_15b19a13((-1359, 257, -15), VectorScale((0, 1, 0), 35));
		function_15b19a13((-933, 1866, 1), VectorScale((0, -1, 0), 155));
		function_15b19a13((-1515, -502, -230), VectorScale((0, 1, 0), 88));
		function_15b19a13((-787, 590, -305), VectorScale((0, -1, 0), 90));
		function_15b19a13((465, 187, -198), VectorScale((0, 1, 0), 179));
		function_15b19a13((-756, 572, -409), VectorScale((0, 1, 0), 135));
		function_15b19a13((500, 1392, -57), VectorScale((0, 1, 0), 178));
	}
	if(MapName == "zm_newfound")
	{
		function_15b19a13((-163, 646, 2671), VectorScale((0, -1, 0), 91));
		function_15b19a13((1562, 1788, 2672), VectorScale((0, 1, 0), 124));
		function_15b19a13((2369, 2046, 2671), VectorScale((0, -1, 0), 179));
		function_15b19a13((3283, -589, 2768), VectorScale((0, 1, 0), 90));
		function_15b19a13((2425, -1000, 2767), VectorScale((0, 1, 0), 43));
		function_15b19a13((1448, -803, 2672), VectorScale((0, -1, 0), 90));
		function_15b19a13((898, -367, 2671), VectorScale((0, -1, 0), 136));
		function_15b19a13((3022, 249, 2768), VectorScale((0, 1, 0), 179));
		function_15b19a13((1830, -79, 3128), VectorScale((0, -1, 0), 179));
	}
	if(MapName == "zm_ski_resort")
	{
		function_15b19a13((-2303, -2166, 221), VectorScale((0, 1, 0), 106));
		function_15b19a13((-1767, -832, 346), VectorScale((0, -1, 0), 121));
		function_15b19a13((2767, -975, 513), VectorScale((0, -1, 0), 93));
		function_15b19a13((-2876, -2116, 306), VectorScale((0, -1, 0), 44));
		function_15b19a13((-4395, -404, 398), VectorScale((0, -1, 0), 130));
		function_15b19a13((-5832, -352, 934), VectorScale((0, -1, 0), 138));
		function_15b19a13((-7325, -1374, 1372), VectorScale((0, 1, 0), 54));
		function_15b19a13((-5139, -776, 589), VectorScale((0, 1, 0), 88));
		function_15b19a13((-3889, -1491, 629), VectorScale((0, -1, 0), 108));
		function_15b19a13((-6976, -2088, 1524), VectorScale((0, -1, 0), 43));
	}
	if(MapName == "zm_xmas_az")
	{
		function_15b19a13((338, 4407, 501), VectorScale((0, 1, 0), 178));
		function_15b19a13((1075, 3886, 478), VectorScale((0, -1, 0), 174));
		function_15b19a13((-160, 3061, 454), VectorScale((0, 1, 0), 14));
		function_15b19a13((-464, 2116, 299), VectorScale((0, -1, 0), 133));
		function_15b19a13((-435, 1189, 15), VectorScale((0, -1, 0), 134));
		function_15b19a13((-1438, 1764, 27), VectorScale((0, -1, 0), 91));
		function_15b19a13((-112, -1055, 65), VectorScale((0, 1, 0), 87));
		function_15b19a13((-2101, -1953, 0), VectorScale((0, 1, 0), 89));
		function_15b19a13((-1500, -348, -9), VectorScale((0, 1, 0), 178));
	}
	if(MapName == "zm_blockade")
	{
		function_15b19a13((-497, 224, 13), VectorScale((0, 1, 0), 2));
		function_15b19a13((-538, 1025, 11), VectorScale((0, -1, 0), 88));
		function_15b19a13((181, 405, 8), VectorScale((0, 1, 0), 3));
		function_15b19a13((744, -359, 14), VectorScale((0, -1, 0), 92));
		function_15b19a13((772, 272, 14), VectorScale((0, -1, 0), 88));
		function_15b19a13((1400, 358, 16), VectorScale((0, -1, 0), 89));
		function_15b19a13((1755, -485, 16), (0, 0, 0));
		function_15b19a13((1565, -898, -119), VectorScale((0, -1, 0), 178));
		function_15b19a13((1103, -181, 16), (0, 0, 0));
		function_15b19a13((303, -217, 24), (0, 0, 0));
		function_15b19a13((872, -1118, 8), VectorScale((0, -1, 0), 179));
		function_15b19a13((-1023, -832, 8), VectorScale((0, 1, 0), 89));
		function_15b19a13((-651, -284, 8), VectorScale((0, 1, 0), 179));
		function_15b19a13((1761, -161, -119), VectorScale((0, 1, 0), 44));
	}
	if(MapName == "zm_cenotes")
	{
		function_15b19a13((1719, -5114, 0), VectorScale((0, -1, 0), 179));
		function_15b19a13((2518, -4119, 166), VectorScale((0, -1, 0), 61));
		function_15b19a13((4120, -3962, 135), VectorScale((0, -1, 0), 30));
		function_15b19a13((2292, -2995, 506), VectorScale((0, -1, 0), 179));
		function_15b19a13((1690, -3494, 507), VectorScale((0, 1, 0), 90));
		function_15b19a13((-446, -3139, 507), VectorScale((0, 1, 0), 35));
		function_15b19a13((-654, -3515, 66), VectorScale((0, -1, 0), 87));
		function_15b19a13((-644, -3254, -21), VectorScale((0, -1, 0), 85));
		function_15b19a13((-224, -4893, 148), VectorScale((0, 1, 0), 45));
		function_15b19a13((2903, -3229, 71), VectorScale((0, -1, 0), 165));
		function_15b19a13((-540, -2135, 364), VectorScale((0, 1, 0), 87));
		function_15b19a13((5528, 2103, 619), VectorScale((0, 1, 0), 179));
	}
	if(MapName == "zm_frigid")
	{
		function_15b19a13((-303, -147, 0), VectorScale((0, 1, 0), 2));
		function_15b19a13((704, 698, 0), VectorScale((0, -1, 0), 179));
		function_15b19a13((1075, 815, 2), VectorScale((0, 1, 0), 36));
		function_15b19a13((1143, 271, 2), (0, 1, 0));
		function_15b19a13((657, -513, 0), VectorScale((0, -1, 0), 173));
		function_15b19a13((639, -510, -160), (0, 0, 0));
		function_15b19a13((3159, 120, 162), VectorScale((0, 1, 0), 132));
		function_15b19a13((1603, 1128, 0), VectorScale((0, 1, 0), 161));
		function_15b19a13((2839, 183, -325), VectorScale((0, 1, 0), 90));
		function_15b19a13((3783, 791, -488), VectorScale((0, 1, 0), 91));
		function_15b19a13((4947, 425, -488), VectorScale((0, 1, 0), 124));
		function_15b19a13((5117, 832, -260), VectorScale((0, 1, 0), 44));
		function_15b19a13((5188, 840, -97), VectorScale((0, 1, 0), 138));
		function_15b19a13((4918, 295, -255), VectorScale((0, 1, 0), 27));
		function_15b19a13((7299, 1228, -248), VectorScale((0, -1, 0), 179));
		function_15b19a13((5066, 2231, -255), VectorScale((0, 1, 0), 93));
		function_15b19a13((4553, 1146, -88), VectorScale((0, -1, 0), 87));
		function_15b19a13((920, -169, 162), VectorScale((0, 1, 0), 89));
	}
	if(MapName == "zm_kyassuruz")
	{
		function_15b19a13((2839, 915, 168), VectorScale((0, -1, 0), 104));
		function_15b19a13((3506, 113, 328), VectorScale((0, -1, 0), 86));
		function_15b19a13((3326, 2006, 192), VectorScale((0, -1, 0), 177));
		function_15b19a13((1436, -815, 462), VectorScale((0, -1, 0), 44));
		function_15b19a13((-568, 16, 365), VectorScale((0, -1, 0), 2));
		function_15b19a13((103, 979, 150), VectorScale((0, -1, 0), 176));
		function_15b19a13((652, 625, 306), VectorScale((0, 1, 0), 142));
		function_15b19a13((857, 899, 128), VectorScale((0, 1, 0), 89));
		function_15b19a13((1920, 1496, 13), VectorScale((0, -1, 0), 86));
		function_15b19a13((836, 2130, 116), VectorScale((0, 1, 0), 16));
		function_15b19a13((1515, 539, 252), VectorScale((0, -1, 0), 52));
		function_15b19a13((864, 209, 289), VectorScale((0, -1, 0), 2));
	}
	if(MapName == "zm_mwdomerust")
	{
		function_15b19a13((1736, 2158, -107), VectorScale((0, -1, 0), 118));
		function_15b19a13((-373, -697, 16), VectorScale((0, -1, 0), 179));
		function_15b19a13((-895, -1105, -111), VectorScale((0, -1, 0), 177));
		function_15b19a13((-3762, 128, -99), VectorScale((0, -1, 0), 20));
		function_15b19a13((-1906, 1394, -111), VectorScale((0, -1, 0), 88));
		function_15b19a13((831, -47, -102), VectorScale((0, 1, 0), 38));
		function_15b19a13((3162, -2680, -393), VectorScale((0, 1, 0), 140));
		function_15b19a13((-169, -3531, -578), VectorScale((0, -1, 0), 81));
		function_15b19a13((6764, -1098, -319), VectorScale((0, 1, 0), 87));
		function_15b19a13((8226, -688, -313), VectorScale((0, 1, 0), 18));
		function_15b19a13((9070, -1551, -313), VectorScale((0, 1, 0), 64));
		function_15b19a13((7673, -1402, -451), VectorScale((0, -1, 0), 61));
		function_15b19a13((8116, -1140, -321), VectorScale((0, -1, 0), 28));
	}
	if(MapName == "zm_ochilon")
	{
		function_15b19a13((943, -1053, 7), VectorScale((0, -1, 0), 172));
		function_15b19a13((514, -1711, 66), VectorScale((0, -1, 0), 179));
		function_15b19a13((413, -1815, 210), VectorScale((0, -1, 0), 88));
		function_15b19a13((9, -3749, 67), (0, 1, 0));
		function_15b19a13((2078, -3581, 8), VectorScale((0, -1, 0), 63));
		function_15b19a13((4242, -4091, 6), VectorScale((0, -1, 0), 34));
		function_15b19a13((2415, -2705, 1), VectorScale((0, -1, 0), 54));
		function_15b19a13((1546, -3459, -267), VectorScale((0, -1, 0), 178));
		function_15b19a13((886, -1689, -79), VectorScale((0, 1, 0), 89));
		function_15b19a13((911, -2127, 208), VectorScale((0, 1, 0), 88));
		function_15b19a13((2065, -1805, 0), VectorScale((0, -1, 0), 90));
		function_15b19a13((385, -2933, 353), VectorScale((0, 1, 0), 92));
	}
	if(MapName == "zm_gulag")
	{
		function_15b19a13((-1340, -2146, 1108), (0, 1, 0));
		function_15b19a13((-1253, -519, 1048), VectorScale((0, -1, 0), 89));
		function_15b19a13((-1056, 486, 911), VectorScale((0, -1, 0), 179));
		function_15b19a13((-2451, 149, 820), VectorScale((0, 1, 0), 5));
		function_15b19a13((476, 183, 1000), VectorScale((0, 1, 0), 179));
		function_15b19a13((-695, 239, 1000), VectorScale((0, 1, 0), 92));
		function_15b19a13((-721, 1324, 905), VectorScale((0, -1, 0), 87));
		function_15b19a13((650, 1101, 746), (0, 0, 0));
		function_15b19a13((-27, -813, 638), VectorScale((0, -1, 0), 46));
		function_15b19a13((-527, -2323, 332), VectorScale((0, 1, 0), 58));
		function_15b19a13((-1174, -766, 364), VectorScale((0, 1, 0), 88));
		function_15b19a13((-1286, -1586, 134), VectorScale((0, 1, 0), 92));
		function_15b19a13((-86, -1831, 153), VectorScale((0, -1, 0), 45));
		function_15b19a13((264, 363, 24), VectorScale((0, 1, 0), 179));
		function_15b19a13((-445, 1392, 160), VectorScale((0, -1, 0), 89));
		function_15b19a13((-745, -128, 24), (0, 1, 0));
		function_15b19a13((-900, 1337, 638), VectorScale((0, 1, 0), 2));
		function_15b19a13((-1033, -2053, 134), (0, 0, 0));
		function_15b19a13((257, 668, 638), VectorScale((0, -1, 0), 90));
		function_15b19a13((-1180, -766, 727), VectorScale((0, 1, 0), 87));
	}
	if(MapName == "zm_lasagna_party2")
	{
		function_15b19a13((-11, 317, -44), VectorScale((0, -1, 0), 88));
		function_15b19a13((237, 361, 238), VectorScale((0, 1, 0), 92));
		function_15b19a13((598, 1540, 536), VectorScale((0, -1, 0), 136));
		function_15b19a13((270, 947, 381), VectorScale((0, -1, 0), 179));
		function_15b19a13((2030, -215, -12), VectorScale((0, -1, 0), 177));
		function_15b19a13((2035, 468, -12), VectorScale((0, 1, 0), 134));
		function_15b19a13((-44, -494, 308), VectorScale((0, -1, 0), 172));
		function_15b19a13((-1291, 491, 272), VectorScale((0, -1, 0), 43));
		function_15b19a13((-1524, 327, -22), VectorScale((0, -1, 0), 150));
		function_15b19a13((1745, 1843, 30), VectorScale((0, 1, 0), 91));
		function_15b19a13((1754, 1772, 70), VectorScale((0, -1, 0), 88));
	}
	if(MapName == "zm_unusual")
	{
		function_15b19a13((242, -1425, 0), VectorScale((0, -1, 0), 51));
		function_15b19a13((223, -1479, 192), VectorScale((0, 1, 0), 3));
		function_15b19a13((527, -191, 0), (0, -1, 0));
		function_15b19a13((1567, 481, -135), VectorScale((0, -1, 0), 42));
		function_15b19a13((2791, -1255, 150), VectorScale((0, 1, 0), 134));
		function_15b19a13((1012, 896, 0), VectorScale((0, -1, 0), 86));
		function_15b19a13((-176, 881, 0), VectorScale((0, -1, 0), 88));
		function_15b19a13((-202, -233, 0), VectorScale((0, 1, 0), 47));
		function_15b19a13((-399, -75, 0), VectorScale((0, 1, 0), 177));
		function_15b19a13((782, -1632, 0), VectorScale((0, 1, 0), 96));
		function_15b19a13((1935, 130, -135), (0, 0, 0));
	}
	if(MapName == "zm_der_hafen")
	{
		function_15b19a13((999, -784, 621), VectorScale((0, -1, 0), 179));
		function_15b19a13((-1354, -1010, 654), VectorScale((0, -1, 0), 174));
		function_15b19a13((-2903, -1028, 628), VectorScale((0, 1, 0), 94));
		function_15b19a13((-814, 1595, 861), VectorScale((0, -1, 0), 5));
		function_15b19a13((40, 1634, 861), VectorScale((0, -1, 0), 32));
		function_15b19a13((27, 1269, 621), VectorScale((0, -1, 0), 151));
		function_15b19a13((723, -54, 621), VectorScale((0, -1, 0), 178));
		function_15b19a13((1405, 928, 391), VectorScale((0, 1, 0), 91));
		function_15b19a13((850, 2757, 391), VectorScale((0, -1, 0), 89));
		function_15b19a13((1687, 3186, 346), VectorScale((0, -1, 0), 37));
		function_15b19a13((1846, 878, 282), VectorScale((0, 1, 0), 90));
		function_15b19a13((2937, 1842, 331), VectorScale((0, -1, 0), 89));
		function_15b19a13((266, 3827, 484), VectorScale((0, -1, 0), 31));
		function_15b19a13((-2957, 933, 2331), VectorScale((0, 1, 0), 179));
	}
	if(MapName == "zm_apeature")
	{
		function_15b19a13((370, -152, 16), VectorScale((0, 1, 0), 146));
		function_15b19a13((-1081, 1788, -271), (0, 0, 0));
		function_15b19a13((-463, -399, -15), VectorScale((0, -1, 0), 178));
		function_15b19a13((-1120, 890, -103), VectorScale((0, 1, 0), 53));
		function_15b19a13((708, 303, -271), VectorScale((0, 1, 0), 90));
		function_15b19a13((-408, 1586, -271), (0, 0, 0));
	}
	if(MapName == "zm_testing")
	{
		function_15b19a13((1045, 1866, -269), VectorScale((0, 1, 0), 90));
		function_15b19a13((586, 1812, -519), VectorScale((0, 1, 0), 90));
		function_15b19a13((372, 1367, -391), VectorScale((0, 1, 0), 87));
		function_15b19a13((399, 2187, -213), VectorScale((0, 1, 0), 90));
		function_15b19a13((321, 839, 4), VectorScale((0, -1, 0), 124));
		function_15b19a13((-435, 726, 4), VectorScale((0, -1, 0), 44));
		function_15b19a13((518, 2194, 68), VectorScale((0, -1, 0), 172));
		function_15b19a13((323, 2416, 254), VectorScale((0, -1, 0), 45));
		function_15b19a13((-594, 1788, 4), (0, -1, 0));
		function_15b19a13((-6, 1006, 3648), VectorScale((0, 1, 0), 90));
		function_15b19a13((826, -1017, 3336), VectorScale((0, 1, 0), 180));
		function_15b19a13((-304, -1075, 3120), (0, 0, 0));
		function_15b19a13((304, -1075, 3120), VectorScale((0, 1, 0), 180));
	}
	if(MapName == "zm_mws")
	{
		function_15b19a13((868, 798, 0), VectorScale((0, 1, 0), 176));
		function_15b19a13((718, -834, 0), VectorScale((0, 1, 0), 89));
		function_15b19a13((-797, 227, 0), VectorScale((0, 1, 0), 88));
	}
	if(MapName == "zm_anzio")
	{
		function_15b19a13((471, -765, 156), VectorScale((0, -1, 0), 88));
		function_15b19a13((-152, 85, 224), VectorScale((0, 1, 0), 90));
		function_15b19a13((-140, 286, 224), VectorScale((0, -1, 0), 90));
		function_15b19a13((114, 1548, 72), VectorScale((0, -1, 0), 90));
		function_15b19a13((-348, 1067, 72), VectorScale((0, 1, 0), 180));
	}
	if(MapName == "zm_area51")
	{
		function_15b19a13((749, -12, -279), VectorScale((0, -1, 0), 179));
		function_15b19a13((902, -283, -274), VectorScale((0, -1, 0), 85));
		function_15b19a13((940, 1040, -279), VectorScale((0, -1, 0), 87));
		function_15b19a13((18, 1121, -279), VectorScale((0, -1, 0), 87));
		function_15b19a13((-1001, 1918, -279), VectorScale((0, 1, 0), 88));
		function_15b19a13((-1521, 5152, -55), VectorScale((0, -1, 0), 7));
		function_15b19a13((-821, 5981, -55), VectorScale((0, 1, 0), 90));
		function_15b19a13((-2043, 887, -279), (0, 0, 0));
		function_15b19a13((-2848, 2100, -271), VectorScale((0, -1, 0), 89));
		function_15b19a13((-1988, 1939, -279), VectorScale((0, 1, 0), 92));
		function_15b19a13((-1932, 1110, -495), VectorScale((0, 1, 0), 138));
		function_15b19a13((-2076, 1595, -387), VectorScale((0, 1, 0), 89));
		function_15b19a13((-764, 652, -387), VectorScale((0, -1, 0), 89));
		function_15b19a13((-1046, -448, -278), VectorScale((0, 1, 0), 89));
		function_15b19a13((-2010, 474, -278), VectorScale((0, 1, 0), 4));
		function_15b19a13((-2505, 1012, -279), VectorScale((0, 1, 0), 90));
	}
	if(MapName == "zm_collapsed")
	{
		function_15b19a13((-716, 424, -47), VectorScale((0, 1, 0), 95));
		function_15b19a13((953, 101, 0), VectorScale((0, 1, 0), 3));
		function_15b19a13((933, 1186, -92), VectorScale((0, -1, 0), 20));
		function_15b19a13((-856, 3022, -143), VectorScale((0, 1, 0), 4));
		function_15b19a13((822, -1472, 0), VectorScale((0, 1, 0), 48));
		function_15b19a13((1912, -1640, 0), VectorScale((0, 1, 0), 179));
		function_15b19a13((1197, -1797, 0), VectorScale((0, -1, 0), 87));
		function_15b19a13((-1241, -1983, 0), VectorScale((0, 1, 0), 179));
		function_15b19a13((19, -1038, 0), VectorScale((0, 1, 0), 92));
		function_15b19a13((-872, -955, 0), VectorScale((0, -1, 0), 86));
		function_15b19a13((-1263, -42, 0), VectorScale((0, -1, 0), 88));
		function_15b19a13((-3780, 466, 0), (0, -1, 0));
		function_15b19a13((-3295, -1273, 0), VectorScale((0, -1, 0), 87));
		function_15b19a13((-4329, -1576, 2), VectorScale((0, 1, 0), 3));
		function_15b19a13((-4085, -18, 0), VectorScale((0, 1, 0), 91));
		function_15b19a13((-2612, 1651, -263), VectorScale((0, 1, 0), 3));
		function_15b19a13((-699, 738, -263), VectorScale((0, -1, 0), 177));
		function_15b19a13((-3696, 1939, -263), VectorScale((0, -1, 0), 139));
		function_15b19a13((-2878, 2776, -261), VectorScale((0, -1, 0), 86));
		function_15b19a13((-2240, 2163, 0), (0, 0, 0));
		function_15b19a13((-2686, 4101, -196), VectorScale((0, -1, 0), 170));
		function_15b19a13((228, 4538, -390), VectorScale((0, -1, 0), 69));
		function_15b19a13((191, 4218, -29), VectorScale((0, -1, 0), 5));
		function_15b19a13((1522, 4249, -321), VectorScale((0, -1, 0), 17));
		function_15b19a13((3265, 5511, -295), VectorScale((0, -1, 0), 37));
		function_15b19a13((4518, 6137, -47), VectorScale((0, -1, 0), 178));
	}
	if(MapName == "zm_leprechaunx")
	{
		function_15b19a13((769, 2083, 32), VectorScale((0, 1, 0), 178));
		function_15b19a13((-216, 2070, 30), (0, 1, 0));
		function_15b19a13((778, 3282, 178), VectorScale((0, -1, 0), 102));
		function_15b19a13((604, 1260, 176), VectorScale((0, -1, 0), 167));
		function_15b19a13((713, 737, 176), VectorScale((0, -1, 0), 167));
	}
	if(MapName == "zm_mw3dome")
	{
		function_15b19a13((-147, -951, 260), VectorScale((0, 1, 0), 118));
		function_15b19a13((129, -1379, 254), VectorScale((0, 1, 0), 146));
		function_15b19a13((399, -1537, 320), VectorScale((0, -1, 0), 25));
		function_15b19a13((775, -814, 360), VectorScale((0, 1, 0), 2));
		function_15b19a13((624, 560, 252), VectorScale((0, -1, 0), 90));
		function_15b19a13((492, -411, 256), VectorScale((0, -1, 0), 177));
		function_15b19a13((1497, 686, 216), VectorScale((0, -1, 0), 87));
		function_15b19a13((1537, -1476, 390), VectorScale((0, -1, 0), 30));
		function_15b19a13((976, -2319, 390), VectorScale((0, 1, 0), 155));
		function_15b19a13((2024, -386, 357), VectorScale((0, -1, 0), 119));
		function_15b19a13((1584, 803, 495), VectorScale((0, -1, 0), 148));
		function_15b19a13((1127, 2030, 444), VectorScale((0, -1, 0), 55));
	}
	if(MapName == "zm_betterbunker")
	{
		function_15b19a13((-1470, 1133, 21), VectorScale((0, 1, 0), 97));
		function_15b19a13((-1203, 1988, -2), VectorScale((0, -1, 0), 136));
		function_15b19a13((696, 2412, 8), VectorScale((0, 1, 0), 178));
		function_15b19a13((1683, 2703, 8), VectorScale((0, 1, 0), 90));
		function_15b19a13((795, 1868, 8), VectorScale((0, -1, 0), 30));
		function_15b19a13((3494, 2220, -61), VectorScale((0, -1, 0), 90));
		function_15b19a13((3464, 2068, -60), VectorScale((0, 1, 0), 90));
	}
	if(MapName == "zm_beach_house")
	{
		function_15b19a13((257, -49, 18), VectorScale((0, 1, 0), 43));
		function_15b19a13((1087, 518, 14), VectorScale((0, -1, 0), 167));
		function_15b19a13((135, 1175, 15), VectorScale((0, -1, 0), 129));
		function_15b19a13((-79, 608, 76), (0, 0, 0));
		function_15b19a13((-486, 413, 6), VectorScale((0, -1, 0), 82));
		function_15b19a13((-1370, -796, 272), VectorScale((0, -1, 0), 145));
		function_15b19a13((-295, 1520, 12), VectorScale((0, -1, 0), 87));
	}
	if(MapName == "zm_frozenforest")
	{
		function_15b19a13((-304, -1458, 200), VectorScale((0, -1, 0), 144));
		function_15b19a13((994, -1423, 88), VectorScale((0, 1, 0), 102));
	}
	if(MapName == "zm_booris_christmas")
	{
		function_15b19a13((-464, -70, 45), VectorScale((0, -1, 0), 176));
		function_15b19a13((375, 766, 30), VectorScale((0, 1, 0), 143));
		function_15b19a13((1383, 701, 29), VectorScale((0, 1, 0), 132));
		function_15b19a13((-907, -275, 44), VectorScale((0, 1, 0), 143));
		function_15b19a13((-1333, 542, 43), VectorScale((0, -1, 0), 37));
		function_15b19a13((-1095, -955, 65), VectorScale((0, -1, 0), 83));
	}
	if(MapName == "zm_comp")
	{
		function_15b19a13((-1055, 1088, 392), VectorScale((0, 1, 0), 95));
		function_15b19a13((-1588, 986, 192), (0, 0, 0));
		function_15b19a13((455, -236, 239), (0, 0, 0));
		function_15b19a13((808, -865, 239), VectorScale((0, 1, 0), 90));
		function_15b19a13((1299, -457, 261), VectorScale((0, 1, 0), 15));
		function_15b19a13((1974, 236, 239), VectorScale((0, 1, 0), 171));
		function_15b19a13((586, 1392, 237), VectorScale((0, -1, 0), 174));
		function_15b19a13((-435, 987, 192), (0, 0, 0));
		function_15b19a13((2773, 4263, 347), (0, 0, 0));
	}
	if(MapName == "zm_leprechaun")
	{
		function_15b19a13((796, -754, 318), VectorScale((0, 1, 0), 119));
		function_15b19a13((815, 4, 316), VectorScale((0, -1, 0), 151));
		function_15b19a13((402, -2, 313), VectorScale((0, 1, 0), 13));
		function_15b19a13((195, 60, 314), VectorScale((0, -1, 0), 61));
	}
	if(MapName == "zm_treasure_island")
	{
		function_15b19a13((-6513, 8022, 552), VectorScale((0, 1, 0), 164));
		function_15b19a13((-7614, 7914, 566), VectorScale((0, -1, 0), 23));
		function_15b19a13((-8416, 9658, 575), VectorScale((0, -1, 0), 148));
		function_15b19a13((-6574, 11404, 577), VectorScale((0, -1, 0), 2));
		function_15b19a13((-5993, 10134, 554), VectorScale((0, -1, 0), 9));
		function_15b19a13((-5717, 8752, 550), VectorScale((0, -1, 0), 117));
		function_15b19a13((-6787, 9415, 660), VectorScale((0, 1, 0), 90));
		function_15b19a13((-7324, 12414, 676), VectorScale((0, 1, 0), 36));
		function_15b19a13((-6043, 11684, 704), VectorScale((0, -1, 0), 178));
		function_15b19a13((-7100, 14550, 690), VectorScale((0, -1, 0), 17));
		function_15b19a13((-6970, 15180, 816), VectorScale((0, -1, 0), 87));
		function_15b19a13((-5835, 13701, 708), VectorScale((0, 1, 0), 4));
	}
	if(MapName == "zm_farm_hd")
	{
		function_15b19a13((-157, -2161, 1), VectorScale((0, 1, 0), 90));
		function_15b19a13((-1126, -1505, 93), VectorScale((0, 1, 0), 39));
		function_15b19a13((-499, -1201, 104), VectorScale((0, 1, 0), 178));
		function_15b19a13((-638, -850, 320), (0, 0, 0));
		function_15b19a13((-288, -615, 100), VectorScale((0, 1, 0), 3));
		function_15b19a13((831, -660, 169), VectorScale((0, -1, 0), 153));
		function_15b19a13((377, -1423, 185), VectorScale((0, 1, 0), 113));
		function_15b19a13((1023, -1106, 185), VectorScale((0, 1, 0), 152));
		function_15b19a13((341, -1439, 321), VectorScale((0, 1, 0), 67));
	}
	if(MapName == "zm_remoteoperations_vk")
	{
		function_15b19a13((1847, 5511, 16), VectorScale((0, 1, 0), 179));
		function_15b19a13((2865, 5515, 16), VectorScale((0, -1, 0), 179));
		function_15b19a13((1444, 6552, 195), VectorScale((0, -1, 0), 88));
		function_15b19a13((2634, 6222, 16), VectorScale((0, 1, 0), 122));
		function_15b19a13((2747, 7006, 22), VectorScale((0, -1, 0), 57));
		function_15b19a13((3678, 7866, 27), VectorScale((0, -1, 0), 142));
		function_15b19a13((3230, 5540, 24), VectorScale((0, 1, 0), 40));
		function_15b19a13((106, 6938, 84), VectorScale((0, 1, 0), 23));
		function_15b19a13((958, 8289, 63), VectorScale((0, 1, 0), 135));
		function_15b19a13((2168, 8250, 78), VectorScale((0, 1, 0), 65));
	}
	if(MapName == "zm_hackerspace_vk")
	{
		function_15b19a13((30, -199, 16), VectorScale((0, 1, 0), 91));
		function_15b19a13((1737, -316, 35), VectorScale((0, 1, 0), 90));
		function_15b19a13((900, 122, 35), VectorScale((0, -1, 0), 90));
		function_15b19a13((1601, 183, 51), VectorScale((0, 1, 0), 93));
		function_15b19a13((1870, 745, 51), VectorScale((0, -1, 0), 178));
		function_15b19a13((1494, -377, 51), VectorScale((0, -1, 0), 88));
		function_15b19a13((1047, -1027, 51), VectorScale((0, 1, 0), 128));
		function_15b19a13((1458, -324, -118), VectorScale((0, 1, 0), 91));
		function_15b19a13((1886, 326, 214), VectorScale((0, -1, 0), 87));
		function_15b19a13((695, -835, 214), VectorScale((0, 1, 0), 3));
		function_15b19a13((309, 68, 214), VectorScale((0, -1, 0), 90));
	}
	if(MapName == "zm_depot")
	{
		function_15b19a13((268, 240, -111), VectorScale((0, -1, 0), 141));
		function_15b19a13((-1390, -441, -119), VectorScale((0, 1, 0), 2));
		function_15b19a13((13, -936, -118), VectorScale((0, -1, 0), 117));
		function_15b19a13((502, 208, -112), VectorScale((0, -1, 0), 89));
		function_15b19a13((75, -784, -111), (0, 0, 0));
		function_15b19a13((-963, -959, -98), VectorScale((0, 1, 0), 45));
		function_15b19a13((-415, -1485, -111), VectorScale((0, 1, 0), 175));
		function_15b19a13((-727, 57, -111), VectorScale((0, -1, 0), 73));
		function_15b19a13((-27083, -876, -1307), VectorScale((0, 1, 0), 95));
		function_15b19a13((-464, -482, -803), VectorScale((0, -1, 0), 90));
	}
	if(MapName == "zm_revenge")
	{
		function_15b19a13((2579, 1679, 400), VectorScale((0, 1, 0), 88));
		function_15b19a13((-30, 1895, 232), VectorScale((0, -1, 0), 179));
		function_15b19a13((-87, 3116, -87), VectorScale((0, 1, 0), 179));
		function_15b19a13((-1359, 3219, -87), VectorScale((0, 1, 0), 88));
		function_15b19a13((-1823, 2595, -242), VectorScale((0, -1, 0), 179));
		function_15b19a13((-3433, 2799, -571), VectorScale((0, -1, 0), 114));
		function_15b19a13((-3112, 2596, -177), (0, 0, 0));
		function_15b19a13((-2391, 2861, -199), VectorScale((0, 1, 0), 179));
		function_15b19a13((-167, 920, 4), VectorScale((0, 1, 0), 90));
		function_15b19a13((-1918, 8, 37), VectorScale((0, 1, 0), 90));
		function_15b19a13((-2676, 866, -161), (0, 0, 0));
		function_15b19a13((-3311, 599, 0), VectorScale((0, -1, 0), 56));
		function_15b19a13((-3315, 597, 0), VectorScale((0, -1, 0), 50));
		function_15b19a13((-4090, -776, -55), VectorScale((0, 1, 0), 89));
		function_15b19a13((-3880, 2306, -113), VectorScale((0, 1, 0), 145));
		function_15b19a13((-5256, 2959, 4), VectorScale((0, 1, 0), 89));
		function_15b19a13((-3087, 4065, -167), VectorScale((0, -1, 0), 179));
		function_15b19a13((-2352, 4067, -167), (0, 0, 0));
		function_15b19a13((-980, 1607, -179), VectorScale((0, 1, 0), 90));
		function_15b19a13((2131, 2030, 1092), VectorScale((0, -1, 0), 90));
	}
	if(MapName == "zm_cosmos")
	{
		function_15b19a13((750, 149, 0), VectorScale((0, 1, 0), 62));
		function_15b19a13((954, -223, 125), VectorScale((0, 1, 0), 180));
		function_15b19a13((-456, -2238, 1), VectorScale((0, 1, 0), 90));
		function_15b19a13((1204, -2507, -195), VectorScale((0, 1, 0), 90));
		function_15b19a13((1725, -3885, -194), VectorScale((0, 1, 0), 90));
		function_15b19a13((2458, -3627, -381), VectorScale((0, 1, 0), 90));
		function_15b19a13((1737, -1761, -195), VectorScale((0, -1, 0), 90));
		function_15b19a13((2325, -1264, -202), VectorScale((0, -1, 0), 90));
		function_15b19a13((1801, 60, -202), (0, 0, 0));
		function_15b19a13((683, 929, -193), VectorScale((0, 1, 0), 90));
		function_15b19a13((1188, 900, 0), VectorScale((0, -1, 0), 36));
		function_15b19a13((2761, 1327, 0), VectorScale((0, -1, 0), 64));
	}
	if(MapName == "zm_dongle")
	{
		function_15b19a13((-770, -585, 0), VectorScale((0, 1, 0), 90));
		function_15b19a13((284, 680, 0), VectorScale((0, -1, 0), 90));
		function_15b19a13((446, 558, 0), (0, 0, 0));
		function_15b19a13((-609, 84, 0), (0, 0, 0));
		function_15b19a13((-1231, 94, 40), (0, 0, 0));
		function_15b19a13((-894, 1357, 39), VectorScale((0, -1, 0), 90));
	}
	if(MapName == "zm_test")
	{
		function_15b19a13((2636, -276, 8), VectorScale((0, 1, 0), 180));
		function_15b19a13((1863, -962, 8), VectorScale((0, 1, 0), 90));
		function_15b19a13((1683, -975, 333), VectorScale((0, 1, 0), 90));
		function_15b19a13((221, -1470, 3), VectorScale((0, -1, 0), 90));
		function_15b19a13((-1108, -1333, 0), VectorScale((0, 1, 0), 66));
		function_15b19a13((-1229, 655, 0), VectorScale((0, -1, 0), 134));
		function_15b19a13((159, 1082, 0), VectorScale((0, 1, 0), 40));
		function_15b19a13((1227, 635, 0), VectorScale((0, -1, 0), 64));
	}
	if(MapName == "zm_cwfactory")
	{
		function_15b19a13((428, -162, 0), VectorScale((0, 1, 0), 118));
		function_15b19a13((551, -503, 0), (0, 0, 0));
		function_15b19a13((527, -63, -225), (0, 0, 0));
		function_15b19a13((-354, -17, 0), VectorScale((0, 1, 0), 90));
		function_15b19a13((-834, 240, 0), VectorScale((0, -1, 0), 90));
		function_15b19a13((-855, -1264, 0), VectorScale((0, 1, 0), 90));
		function_15b19a13((-1264, 219, 192), (0, 0, 0));
		function_15b19a13((-1824, -318, 192), VectorScale((0, 1, 0), 180));
	}
	if(MapName == "zm_bonsoir")
	{
		function_15b19a13((-54, 2205, 0), VectorScale((0, -1, 0), 90));
		function_15b19a13((-12, 1279, 0), VectorScale((0, 1, 0), 180));
		function_15b19a13((211, 483, 0), VectorScale((0, 1, 0), 75));
		function_15b19a13((-1169, 382, 0), VectorScale((0, 1, 0), 65));
		function_15b19a13((-831, 3355, -1), VectorScale((0, -1, 0), 2));
		function_15b19a13((-680, 4937, 27), VectorScale((0, 1, 0), 45));
		function_15b19a13((417, 4863, 32), VectorScale((0, 1, 0), 135));
		function_15b19a13((-2795, 1299, 138), VectorScale((0, -1, 0), 12));
		function_15b19a13((-2921, 2296, 137), VectorScale((0, -1, 0), 169));
	}
	if(MapName == "zm_scrapyard")
	{
		function_15b19a13((-594, -387, 30), VectorScale((0, -1, 0), 16));
		function_15b19a13((-11, -1245, 25), VectorScale((0, 1, 0), 162));
		function_15b19a13((-851, -3185, 28), VectorScale((0, -1, 0), 120));
		function_15b19a13((836, -3820, 24), VectorScale((0, -1, 0), 90));
		function_15b19a13((351, -5030, 24), VectorScale((0, -1, 0), 96));
		function_15b19a13((-2400, -2947, 30), VectorScale((0, -1, 0), 125));
		function_15b19a13((-1878, 1048, 33), VectorScale((0, -1, 0), 76));
		function_15b19a13((503, -96, 26), VectorScale((0, -1, 0), 90));
	}
	if(MapName == "zm_onewindow")
	{
		function_15b19a13((-1095, 181, 448), VectorScale((0, 1, 0), 180));
		function_15b19a13((-3546, 327, 1263), VectorScale((0, 1, 0), 180));
		function_15b19a13((-7056, 300, 2351), VectorScale((0, 1, 0), 180));
	}
	if(MapName == "zm_diner")
	{
		function_15b19a13((-101, -581, 0), (0, 0, 0));
		function_15b19a13((1006, 212, 35), VectorScale((0, -1, 0), 45));
		function_15b19a13((1018, -1041, 7), VectorScale((0, 1, 0), 180));
		function_15b19a13((-117, 1004, 8), VectorScale((0, -1, 0), 95));
		function_15b19a13((-960, 63, 19), VectorScale((0, 1, 0), 50));
		function_15b19a13((-867, -882, 65), (0, 0, 0));
		function_15b19a13((-437, -1194, 288), (0, 0, 0));
		function_15b19a13((1620, -661, 7), VectorScale((0, -1, 0), 135));
	}
	if(MapName == "zm_the_iwar")
	{
		function_15b19a13((-1083, -1926, -77), VectorScale((0, 1, 0), 90));
		function_15b19a13((378, -1322, 47), VectorScale((0, -1, 0), 45));
		function_15b19a13((365, -2325, 47), (0, 0, 0));
		function_15b19a13((274, -3034, 36), VectorScale((0, -1, 0), 95));
		function_15b19a13((-680, -4987, 36), VectorScale((0, 1, 0), 85));
		function_15b19a13((-514, -1830, -77), VectorScale((0, 1, 0), 90));
		function_15b19a13((-3957, -2534, 50), VectorScale((0, 1, 0), 180));
		function_15b19a13((-4184, -3439, 50), VectorScale((0, 1, 0), 153));
		function_15b19a13((-4535, -2620, 50), VectorScale((0, 1, 0), 40));
		function_15b19a13((-4649, -2234, 50), VectorScale((0, -1, 0), 90));
		function_15b19a13((774, -4925, 36), VectorScale((0, 1, 0), 154));
	}
	if(MapName == "zm_devil")
	{
		function_15b19a13((408, 1128, -127), VectorScale((0, 1, 0), 180));
		function_15b19a13((-475, 413, -127), VectorScale((0, 1, 0), 90));
		function_15b19a13((485, -625, -151), (0, 0, 0));
		function_15b19a13((1939, -871, -229), (0, 0, 0));
		function_15b19a13((699, -1549, -104), VectorScale((0, 1, 0), 180));
		function_15b19a13((592, -2832, -190), VectorScale((0, 1, 0), 180));
		function_15b19a13((-75, -3625, -475), VectorScale((0, 1, 0), 180));
		function_15b19a13((1496, -3227, -601), VectorScale((0, -1, 0), 90));
	}
	if(MapName == "zm_extinct")
	{
		function_15b19a13((-390, -551, 0), VectorScale((0, -1, 0), 90));
		function_15b19a13((-81, -10, 4), VectorScale((0, 1, 0), 90));
		function_15b19a13((423, -636, 128), VectorScale((0, 1, 0), 90));
		function_15b19a13((-24, -1803, -9), (0, 0, 0));
		function_15b19a13((946, 598, 0), VectorScale((0, -1, 0), 90));
		function_15b19a13((1046, 1252, 0), VectorScale((0, -1, 0), 90));
		function_15b19a13((1087, 229, 171), VectorScale((0, -1, 0), 90));
		function_15b19a13((-114, -814, -6), VectorScale((0, 1, 0), 45));
		function_15b19a13((-1122, -732, 0), VectorScale((0, -1, 0), 90));
	}
	if(MapName == "zm_moor_3")
	{
		function_15b19a13((-1161, -941, 9), VectorScale((0, 1, 0), 90));
		function_15b19a13((797, -1300, -190), VectorScale((0, 1, 0), 180));
		function_15b19a13((-7, -1320, -190), (0, 0, 0));
		function_15b19a13((-533, -526, -9), VectorScale((0, 1, 0), 90));
		function_15b19a13((336, -604, 179), VectorScale((0, -1, 0), 90));
		function_15b19a13((-1553, 3, 9), VectorScale((0, -1, 0), 30));
		function_15b19a13((-1956, 749, -46), VectorScale((0, -1, 0), 90));
		function_15b19a13((-1274, 1498, -53), VectorScale((0, -1, 0), 125));
		function_15b19a13((1147, 537, -53), (0, 0, 0));
		function_15b19a13((-378, -544, 179), VectorScale((0, 1, 0), 90));
		function_15b19a13((-59, -859, 9), VectorScale((0, 1, 0), 45));
		function_15b19a13((7222, -487, -61), VectorScale((0, -1, 0), 41));
		function_15b19a13((9345, -508, -61), VectorScale((0, -1, 0), 90));
		function_15b19a13((7649, -1430, -61), VectorScale((0, 1, 0), 90));
		function_15b19a13((8798, -437, -61), VectorScale((0, -1, 0), 90));
		function_15b19a13((8453, -1249, 108), VectorScale((0, 1, 0), 90));
		function_15b19a13((-431, -930, -151), VectorScale((0, 1, 0), 35));
	}
	if(MapName == "zm_woods")
	{
		function_15b19a13((-125, -2879, 26), VectorScale((0, -1, 0), 173));
		function_15b19a13((-1892, -2586, 114), VectorScale((0, 1, 0), 100));
		function_15b19a13((-1395, -678, 72), VectorScale((0, 1, 0), 155));
		function_15b19a13((-2489, -533, 165), VectorScale((0, 1, 0), 129));
		function_15b19a13((-2554, -943, -95), VectorScale((0, -1, 0), 90));
		function_15b19a13((-1085, -1743, -383), VectorScale((0, -1, 0), 90));
		function_15b19a13((2239, 360, -95), VectorScale((0, -1, 0), 90));
		function_15b19a13((921, -1583, -347), VectorScale((0, -1, 0), 90));
		function_15b19a13((-228, -770, -383), (0, 0, 0));
	}
	if(MapName == "zm_forest")
	{
		function_15b19a13((297, 135, 1), VectorScale((0, 1, 0), 180));
		function_15b19a13((242, -232, 0), VectorScale((0, 1, 0), 180));
		function_15b19a13((777, 651, 0), VectorScale((0, 1, 0), 90));
		function_15b19a13((603, -897, 0), VectorScale((0, -1, 0), 60));
		function_15b19a13((-760, -1053, 0), VectorScale((0, -1, 0), 97));
		function_15b19a13((1931, -711, 1), VectorScale((0, 1, 0), 180));
	}
	if(MapName == "zm_chateau")
	{
		function_15b19a13((-22, 2436, 1606), VectorScale((0, 1, 0), 90));
		function_15b19a13((1452, 2358, 1614), (0, 0, 0));
		function_15b19a13((1780, 181, 1640), VectorScale((0, 1, 0), 90));
		function_15b19a13((2357, 1532, 1671), VectorScale((0, 1, 0), 90));
		function_15b19a13((2921, 1476, 1671), (0, 0, 0));
		function_15b19a13((2044, 609, 1671), VectorScale((0, -1, 0), 90));
		function_15b19a13((4263, -97, 1654), (0, 0, 0));
		function_15b19a13((3505, 42, 1653), (0, 0, 0));
		function_15b19a13((2936, 1242, 1651), (0, 0, 0));
		function_15b19a13((3088, 975, 1797), VectorScale((0, 1, 0), 180));
	}
	if(MapName == "zm_wulfburg")
	{
		function_15b19a13((-4225, 2411, 20428), VectorScale((0, 1, 0), 180));
		function_15b19a13((-5017, 1331, 20431), VectorScale((0, 1, 0), 36));
		function_15b19a13((-4381, 82, 20436), VectorScale((0, 1, 0), 90));
		function_15b19a13((-3832, 2185, 20440), VectorScale((0, -1, 0), 143));
		function_15b19a13((-6798, 20, 19901), VectorScale((0, 1, 0), 180));
		function_15b19a13((-8465, -1543, 20129), (0, 0, 0));
		function_15b19a13((-8169, -2254, 20087), VectorScale((0, 1, 0), 180));
		function_15b19a13((-4800, -2254, 20087), VectorScale((0, 1, 0), 90));
	}
	if(MapName == "zm_emergence")
	{
		function_15b19a13((405, 627, 96), VectorScale((0, -1, 0), 90));
		function_15b19a13((-63, -710, 192), VectorScale((0, -1, 0), 90));
		function_15b19a13((687, -1189, 192), VectorScale((0, 1, 0), 90));
		function_15b19a13((286, -1663, 401), VectorScale((0, 1, 0), 48));
		function_15b19a13((-1055, 236, 96), (0, 0, 0));
		function_15b19a13((262, 692, 240), VectorScale((0, -1, 0), 129));
		function_15b19a13((731, -345, 192), VectorScale((0, -1, 0), 138));
		function_15b19a13((1806, -726, 656), VectorScale((0, 1, 0), 90));
		function_15b19a13((3160, 340, 655), VectorScale((0, -1, 0), 90));
		function_15b19a13((-856, -227, 96), (0, 0, 0));
	}
	if(MapName == "zm_lastresort")
	{
		function_15b19a13((-512, -4185, 2), VectorScale((0, 1, 0), 56));
		function_15b19a13((960, -2858, 2), VectorScale((0, -1, 0), 124));
		function_15b19a13((-761, -3479, 6), VectorScale((0, 1, 0), 96));
		function_15b19a13((1656, -2213, 11), VectorScale((0, 1, 0), 29));
		function_15b19a13((576, -1163, 40), VectorScale((0, -1, 0), 105));
		function_15b19a13((-1506, -2592, 124), VectorScale((0, 1, 0), 103));
		function_15b19a13((-2481, -2437, 381), VectorScale((0, 1, 0), 50));
		function_15b19a13((-1470, -1137, 520), (0, 0, 0));
		function_15b19a13((-997, -1231, 55), VectorScale((0, 1, 0), 95));
		function_15b19a13((-3161, -851, 102), VectorScale((0, -1, 0), 38));
		function_15b19a13((-2259, 141, 165), VectorScale((0, -1, 0), 129));
		function_15b19a13((-1319, 295, 349), VectorScale((0, -1, 0), 76));
		function_15b19a13((-1105, -2329, 136), VectorScale((0, -1, 0), 38));
		function_15b19a13((-508, -2059, 135), VectorScale((0, -1, 0), 77));
		function_15b19a13((-651, -2023, 77), VectorScale((0, 1, 0), 48));
		function_15b19a13((-1209, -1506, 222), VectorScale((0, -1, 0), 129));
		function_15b19a13((-2186, -1189, 246), VectorScale((0, -1, 0), 84));
		function_15b19a13((-2319, -2003, 277), VectorScale((0, -1, 0), 166));
	}
	if(MapName == "zm_nazi_zombie_school")
	{
		function_15b19a13((-1087, -493, -15), VectorScale((0, 1, 0), 40));
		function_15b19a13((-1252, 203, -15), (0, 0, 0));
		function_15b19a13((-264, 290, -15), VectorScale((0, 1, 0), 90));
		function_15b19a13((570, 99, -15), VectorScale((0, 1, 0), 90));
		function_15b19a13((-364, -821, -15), VectorScale((0, 1, 0), 180));
		function_15b19a13((-1096, -829, -15), (0, 0, 0));
		function_15b19a13((623, -29, -15), VectorScale((0, -1, 0), 140));
	}
	if(MapName == "zm_feddyfazballs3")
	{
		function_15b19a13((-153, -453, 0), VectorScale((0, -1, 0), 46));
		function_15b19a13((239, -243, 0), (0, -1, 0));
		function_15b19a13((-199, -282, 0), VectorScale((0, 1, 0), 174));
		function_15b19a13((404, -120, 0), VectorScale((0, 1, 0), 90));
		function_15b19a13((-226, 331, -7), VectorScale((0, 1, 0), 11));
		function_15b19a13((531, 284, -6), VectorScale((0, -1, 0), 90));
		function_15b19a13((1334, -1064, 112), VectorScale((0, 1, 0), 108));
		function_15b19a13((1217, -250, -7), VectorScale((0, -1, 0), 131));
		function_15b19a13((544, -735, -7), VectorScale((0, -1, 0), 100));
	}
	if(MapName == "zm_scrooged")
	{
		function_15b19a13((-49, 1356, -31), VectorScale((0, -1, 0), 72));
		function_15b19a13((-980, 1512, -31), VectorScale((0, -1, 0), 90));
		function_15b19a13((-296, 112, 0), VectorScale((0, 1, 0), 103));
		function_15b19a13((-187, -547, 0), (0, 0, 0));
		function_15b19a13((-272, -712, 0), VectorScale((0, 1, 0), 151));
		function_15b19a13((36, 140, 0), VectorScale((0, 1, 0), 90));
		function_15b19a13((1159, -940, -7), VectorScale((0, 1, 0), 103));
		function_15b19a13((1747, 707, 96), VectorScale((0, -1, 0), 145));
		function_15b19a13((1364, 1565, -25), VectorScale((0, -1, 0), 179));
		function_15b19a13((1875, 288, 95), VectorScale((0, 1, 0), 45));
		function_15b19a13((1559, -132, 95), (0, 0, 0));
	}
	if(MapName == "zm_xmas_rust")
	{
		function_15b19a13((-165, -69, -214), VectorScale((0, -1, 0), 116));
		function_15b19a13((335, -66, -213), VectorScale((0, -1, 0), 179));
		function_15b19a13((294, 519, -176), (0, 0, 0));
		function_15b19a13((963, 769, -212), VectorScale((0, 1, 0), 90));
		function_15b19a13((1440, 689, -210), VectorScale((0, -1, 0), 90));
		function_15b19a13((1179, 143, -228), VectorScale((0, 1, 0), 90));
		function_15b19a13((837, 602, -208), VectorScale((0, -1, 0), 45));
		function_15b19a13((1448, 954, -203), VectorScale((0, 1, 0), 90));
		function_15b19a13((1556, 1492, -131), VectorScale((0, -1, 0), 178));
		function_15b19a13((1156, 1103, -93), VectorScale((0, 1, 0), 90));
		function_15b19a13((577, 827, 17), VectorScale((0, -1, 0), 90));
		function_15b19a13((925, 615, 0), VectorScale((0, 1, 0), 90));
		function_15b19a13((495, 889, 17), VectorScale((0, 1, 0), 90));
		function_15b19a13((666, 1626, -190), VectorScale((0, -1, 0), 49));
		function_15b19a13((-419, 1625, -210), VectorScale((0, -1, 0), 45));
		function_15b19a13((105, 1211, -211), VectorScale((0, -1, 0), 45));
		function_15b19a13((401, 818, -199), VectorScale((0, 1, 0), 90));
		function_15b19a13((-284, 1130, -206), VectorScale((0, -1, 0), 90));
		function_15b19a13((643, 1142, -153), VectorScale((0, -1, 0), 90));
		function_15b19a13((306, 731, -103), VectorScale((0, 1, 0), 179));
		function_15b19a13((520, -200, -83), VectorScale((0, 1, 0), 90));
		function_15b19a13((735, 553, -206), VectorScale((0, -1, 0), 51));
	}
	if(MapName == "zm_skyjacked")
	{
		function_15b19a13((1565, 1, 192), VectorScale((0, 1, 0), 179));
		function_15b19a13((592, 270, 294), VectorScale((0, -1, 0), 45));
		function_15b19a13((401, 175, 475), (0, 0, 0));
		function_15b19a13((1111, 106, 475), VectorScale((0, -1, 0), 90));
		function_15b19a13((-113, 561, 412), VectorScale((0, 1, 0), 88));
		function_15b19a13((-102, -575, 412), VectorScale((0, -1, 0), 90));
		function_15b19a13((-392, -839, 266), VectorScale((0, 1, 0), 49));
		function_15b19a13((-2296, -1, 334), (0, 0, 0));
		function_15b19a13((-1791, -4, 334), VectorScale((0, 1, 0), 179));
		function_15b19a13((-740, -193, 306), VectorScale((0, 1, 0), 134));
		function_15b19a13((-933, 157, 475), VectorScale((0, -1, 0), 90));
		function_15b19a13((-621, -207, 513), VectorScale((0, 1, 0), 90));
		function_15b19a13((-1397, 267, 475), VectorScale((0, -1, 0), 137));
		function_15b19a13((868, -663, 262), VectorScale((0, 1, 0), 86));
		function_15b19a13((117, -145, 167), VectorScale((0, 1, 0), 178));
		function_15b19a13((100, 611, 70), VectorScale((0, 1, 0), 179));
		function_15b19a13((-42, -620, 70), (0, 0, 0));
		function_15b19a13((-844, 15, 70), (0, 0, 0));
		function_15b19a13((412, 290, 70), VectorScale((0, -1, 0), 90));
		function_15b19a13((1701, 0, 192), (0, 0, 0));
	}
	if(MapName == "zm_piemanschristmasmapremake")
	{
		function_15b19a13((15, -1086, 16), (0, 0, 0));
		function_15b19a13((-627, 116, 1), VectorScale((0, -1, 0), 90));
		function_15b19a13((616, -868, 0), VectorScale((0, 1, 0), 127));
		function_15b19a13((-778, -2108, 5), VectorScale((0, -1, 0), 22));
		function_15b19a13((3192, -1506, 13), VectorScale((0, 1, 0), 90));
		function_15b19a13((2136, -1363, 200), VectorScale((0, -1, 0), 138));
		function_15b19a13((1455, 1714, 7), (0, 0, 0));
		function_15b19a13((2268, 2521, 19), VectorScale((0, 1, 0), 179));
		function_15b19a13((4178, 1860, 3), VectorScale((0, 1, 0), 179));
		function_15b19a13((4169, 151, 16), VectorScale((0, 1, 0), 90));
		function_15b19a13((5197, -3188, 199), VectorScale((0, 1, 0), 179));
		function_15b19a13((5964, -3216, 3), VectorScale((0, 1, 0), 144));
		function_15b19a13((422, 776, -75), VectorScale((0, 1, 0), 29));
		function_15b19a13((-1071, -2329, 120), VectorScale((0, -1, 0), 85));
	}
	if(MapName == "zm_adm")
	{
		function_15b19a13((587, 304, 312), VectorScale((0, -1, 0), 90));
		function_15b19a13((-392, 877, 312), VectorScale((0, -1, 0), 90));
		function_15b19a13((-7, 234, 440), (0, 0, 0));
		function_15b19a13((-784, 744, 316), (0, 0, 0));
		function_15b19a13((-187, -910, 440), VectorScale((0, 1, 0), 98));
		function_15b19a13((-957, -800, 440), VectorScale((0, -1, 0), 53));
		function_15b19a13((-574, -1363, 447), VectorScale((0, 1, 0), 103));
		function_15b19a13((-1523, -1024, 440), VectorScale((0, -1, 0), 179));
		function_15b19a13((-3939, -947, 440), VectorScale((0, 1, 0), 179));
		function_15b19a13((-3919, 160, 312), VectorScale((0, 1, 0), 131));
		function_15b19a13((-4771, 1133, 311), VectorScale((0, -1, 0), 48));
		function_15b19a13((-2499, 865, 312), VectorScale((0, 1, 0), 41));
		function_15b19a13((-1781, -512, 301), VectorScale((0, 1, 0), 165));
		function_15b19a13((-2220, 1573, 316), (0, 0, 0));
		function_15b19a13((-705, 1218, 312), VectorScale((0, -1, 0), 161));
		function_15b19a13((-2618, -1136, 440), VectorScale((0, 1, 0), 90));
		function_15b19a13((-1780, 146, 309), VectorScale((0, -1, 0), 154));
	}
	if(MapName == "zm_cove")
	{
		function_15b19a13((1523, 1366, 60), VectorScale((0, 1, 0), 83));
		function_15b19a13((-784, 2652, 60), VectorScale((0, 1, 0), 89));
		function_15b19a13((757, 2404, 56), VectorScale((0, -1, 0), 69));
		function_15b19a13((1910, 67, 50), VectorScale((0, -1, 0), 15));
		function_15b19a13((255, -1036, 66), VectorScale((0, -1, 0), 46));
		function_15b19a13((662, 209, 147), VectorScale((0, -1, 0), 101));
		function_15b19a13((-205, -53, 87), VectorScale((0, -1, 0), 113));
		function_15b19a13((-24, 746, 112), VectorScale((0, -1, 0), 162));
		function_15b19a13((-1470, 1317, 68), VectorScale((0, -1, 0), 124));
		function_15b19a13((-958, 629, 198), VectorScale((0, -1, 0), 175));
		function_15b19a13((-561, -694, 94), VectorScale((0, -1, 0), 114));
		function_15b19a13((-134, -630, 72), VectorScale((0, -1, 0), 70));
		function_15b19a13((1120, -1022, 62), VectorScale((0, -1, 0), 49));
		function_15b19a13((-936, 1533, 192), VectorScale((0, -1, 0), 126));
	}
	if(MapName == "zm_deadlightremaster")
	{
		function_15b19a13((-460, 743, -166), (0, 0, 0));
		function_15b19a13((1254, 1117, -166), VectorScale((0, 1, 0), 180));
		function_15b19a13((391, 1222, -166), VectorScale((0, -1, 0), 75));
		function_15b19a13((1701, -429, 25), VectorScale((0, 1, 0), 90));
		function_15b19a13((1667, -62, 171), VectorScale((0, 1, 0), 90));
		function_15b19a13((1430, 511, -166), VectorScale((0, 1, 0), 90));
		function_15b19a13((-599, -567, 3), VectorScale((0, 1, 0), 102));
		function_15b19a13((-304, 705, 19), (0, 0, 0));
		function_15b19a13((1058, 1592, 44), VectorScale((0, -1, 0), 90));
		function_15b19a13((704, -275, 159), VectorScale((0, 1, 0), 90));
		function_15b19a13((434, -847, 21), VectorScale((0, 1, 0), 156));
		function_15b19a13((611, -146, -166), (0, 0, 0));
	}
	if(MapName == "zm_raid")
	{
		function_15b19a13((-1331, -709, 147), VectorScale((0, 1, 0), 179));
		function_15b19a13((-1179, -551, 147), VectorScale((0, -1, 0), 88));
		function_15b19a13((-1025, -895, 147), VectorScale((0, 1, 0), 52));
		function_15b19a13((-687, -582, 0), VectorScale((0, 1, 0), 178));
		function_15b19a13((-994, -1877, 0), VectorScale((0, 1, 0), 53));
		function_15b19a13((-1360, -1568, 0), VectorScale((0, -1, 0), 88));
		function_15b19a13((-977, -2066, -128), VectorScale((0, 1, 0), 179));
		function_15b19a13((-1557, -1598, -128), VectorScale((0, -1, 0), 179));
		function_15b19a13((-1602, -1568, 147), VectorScale((0, -1, 0), 89));
		function_15b19a13((-1020, -1345, 147), VectorScale((0, -1, 0), 53));
		function_15b19a13((-1941, -1205, 147), VectorScale((0, -1, 0), 178));
		function_15b19a13((-1563, -1148, 0), VectorScale((0, -1, 0), 179));
		function_15b19a13((-1448, -1259, 0), VectorScale((0, -1, 0), 89));
		function_15b19a13((-1332, -1147, 0), (0, 1, 0));
		function_15b19a13((-1449, -1031, 0), VectorScale((0, 1, 0), 91));
		function_15b19a13((-1753, -1498, 0), VectorScale((0, 1, 0), 14));
	}
	if(MapName == "zm_shoothouse")
	{
		function_15b19a13((-5383, 3719, 2055), VectorScale((0, 1, 0), 73));
		function_15b19a13((-4561, 4880, 2047), VectorScale((0, -1, 0), 94));
		function_15b19a13((-3271, 4542, 2053), VectorScale((0, 1, 0), 179));
		function_15b19a13((-13954, 4271, 992), VectorScale((0, 1, 0), 89));
	}
	if(MapName == "zm_odyssey")
	{
		function_15b19a13((-1630, -840, 0), VectorScale((0, 1, 0), 179));
		function_15b19a13((-2001, 1734, 0), VectorScale((0, 1, 0), 178));
		function_15b19a13((-2300, -1653, 159), (0, 0, 0));
		function_15b19a13((-1872, -1926, 330), VectorScale((0, -1, 0), 178));
		function_15b19a13((-1878, -640, 330), VectorScale((0, 1, 0), 89));
		function_15b19a13((-2015, -281, 120), VectorScale((0, -1, 0), 87));
		function_15b19a13((-1391, -462, 120), VectorScale((0, 1, 0), 45));
		function_15b19a13((-2566, -671, 176), VectorScale((0, -1, 0), 44));
		function_15b19a13((-2668, -838, 176), VectorScale((0, -1, 0), 89));
		function_15b19a13((-1329, -1665, 0), VectorScale((0, 1, 0), 92));
		function_15b19a13((-902, -1611, -179), VectorScale((0, 1, 0), 4));
		function_15b19a13((-1939, -1452, -269), VectorScale((0, 1, 0), 91));
	}
	if(MapName == "zm_focus")
	{
		function_15b19a13((-596, 1249, 10), VectorScale((0, 1, 0), 128));
		function_15b19a13((-1693, 2043, -148), (0, 1, 0));
		function_15b19a13((1030, 1488, -168), VectorScale((0, 1, 0), 56));
		function_15b19a13((760, 933, -88), VectorScale((0, -1, 0), 124));
		function_15b19a13((2498, -30, -66), VectorScale((0, 1, 0), 42));
		function_15b19a13((2330, -1989, -81), VectorScale((0, 1, 0), 16));
		function_15b19a13((1006, -3282, -5), VectorScale((0, 1, 0), 110));
		function_15b19a13((228, -3146, -41), VectorScale((0, 1, 0), 43));
		function_15b19a13((436, -3570, 456), VectorScale((0, -1, 0), 139));
		function_15b19a13((268, -887, -62), VectorScale((0, -1, 0), 93));
		function_15b19a13((-1382, -564, -2), VectorScale((0, -1, 0), 40));
		function_15b19a13((-1344, 513, -53), VectorScale((0, -1, 0), 171));
		function_15b19a13((-331, -647, 196), VectorScale((0, 1, 0), 128));
		function_15b19a13((-605, 28, -25), VectorScale((0, 1, 0), 98));
		function_15b19a13((620, -630, -166), VectorScale((0, 1, 0), 131));
		function_15b19a13((1178, -1515, -158), VectorScale((0, -1, 0), 139));
		function_15b19a13((2026, -1360, -175), VectorScale((0, 1, 0), 130));
		function_15b19a13((1014, -902, 3), VectorScale((0, 1, 0), 40));
		function_15b19a13((702, -157, 33), VectorScale((0, -1, 0), 136));
		function_15b19a13((1766, -1721, -39), VectorScale((0, -1, 0), 48));
		function_15b19a13((-10281, 12426, 2320), VectorScale((0, -1, 0), 58));
	}
	if(MapName == "zm_ccube")
	{
		function_15b19a13((328, -3, 0), VectorScale((0, 1, 0), 179));
		function_15b19a13((328, 138, 0), VectorScale((0, -1, 0), 134));
		function_15b19a13((328, -134, 0), VectorScale((0, 1, 0), 133));
		function_15b19a13((-328, 3, 0), (0, 0, 0));
		function_15b19a13((-328, -134, 0), VectorScale((0, 1, 0), 47));
		function_15b19a13((-328, 138, 0), VectorScale((0, -1, 0), 46));
		function_15b19a13((-151, 205, 0), VectorScale((0, 1, 0), 179));
		function_15b19a13((-151, -215, 0), VectorScale((0, 1, 0), 179));
		function_15b19a13((2, -262, 0), VectorScale((0, 1, 0), 90));
		function_15b19a13((151, -193, 0), (0, 0, 0));
		function_15b19a13((246, 266, 0), VectorScale((0, -1, 0), 90));
		function_15b19a13((-4, 266, 0), VectorScale((0, -1, 0), 89));
		function_15b19a13((34, 7, 0), (0, 0, 0));
	}
	if(MapName == "zm_coast")
	{
		function_15b19a13((-52, 509, 29), VectorScale((0, -1, 0), 17));
		function_15b19a13((722, 374, -7), VectorScale((0, -1, 0), 98));
		function_15b19a13((-251, -861, 50), VectorScale((0, -1, 0), 36));
		function_15b19a13((812, -1652, 335), VectorScale((0, 1, 0), 140));
		function_15b19a13((328, -2155, 359), VectorScale((0, 1, 0), 12));
		function_15b19a13((1499, -1290, 289), VectorScale((0, -1, 0), 168));
		function_15b19a13((1372, -2050, 362), VectorScale((0, -1, 0), 168));
		function_15b19a13((2756, -2641, 267), VectorScale((0, 1, 0), 138));
		function_15b19a13((2711, -1769, 90), VectorScale((0, -1, 0), 127));
		function_15b19a13((3269, -2667, -13), VectorScale((0, -1, 0), 15));
		function_15b19a13((3696, -2845, -14), VectorScale((0, 1, 0), 141));
		function_15b19a13((3023, -2841, 267), VectorScale((0, -1, 0), 37));
		function_15b19a13((3169, -2207, 261), VectorScale((0, 1, 0), 139));
		function_15b19a13((1207, 685, 371), VectorScale((0, 1, 0), 177));
		function_15b19a13((1387, 6, 477), VectorScale((0, 1, 0), 90));
		function_15b19a13((1437, -78, 202), (0, 0, 0));
		function_15b19a13((1853, -60, 170), (0, 0, 0));
		function_15b19a13((2988, -1170, -16), VectorScale((0, 1, 0), 108));
		function_15b19a13((2257, 260, 241), VectorScale((0, 1, 0), 123));
		function_15b19a13((2173, 819, 380), VectorScale((0, -1, 0), 112));
		function_15b19a13((2139, 713, 815), VectorScale((0, -1, 0), 45));
		function_15b19a13((2056, 1392, 240), VectorScale((0, -1, 0), 90));
		function_15b19a13((2436, 2682, 24), VectorScale((0, 1, 0), 20));
		function_15b19a13((2151, 2790, 24), VectorScale((0, -1, 0), 160));
		function_15b19a13((4526, -492, -16), VectorScale((0, 1, 0), 150));
		function_15b19a13((4137, 333, -11), VectorScale((0, -1, 0), 115));
		function_15b19a13((3528, -280, 29), VectorScale((0, -1, 0), 162));
		function_15b19a13((2323, -2304, 97), VectorScale((0, 1, 0), 52));
		function_15b19a13((1690, -1960, 621), VectorScale((0, -1, 0), 170));
		function_15b19a13((1537, -1274, 560), VectorScale((0, -1, 0), 170));
		level thread function_ff2cdffe();
	}
	if(MapName == "zm_leviathan")
	{
		function_15b19a13((-316, -1171, 58), VectorScale((0, 1, 0), 52));
		function_15b19a13((720, -2149, 74), VectorScale((0, 1, 0), 90));
		function_15b19a13((-482, -2485, 74), VectorScale((0, 1, 0), 45));
		function_15b19a13((-593, -3014, -52), VectorScale((0, 1, 0), 180));
		function_15b19a13((-1546, -2457, 74), (0, 0, 0));
		function_15b19a13((-304, -3909, -6), VectorScale((0, -1, 0), 90));
		function_15b19a13((499, -4382, -12), VectorScale((0, 1, 0), 155));
		function_15b19a13((1089, -3736, -18), (0, 0, 0));
		function_15b19a13((1281, -5283, -48), VectorScale((0, -1, 0), 90));
		function_15b19a13((533, -5193, -159), VectorScale((0, 1, 0), 180));
		function_15b19a13((651, -4045, -159), VectorScale((0, 1, 0), 90));
		function_15b19a13((1603, -3278, -141), (0, 0, 0));
		function_15b19a13((2980, -3287, -13), VectorScale((0, 1, 0), 180));
		function_15b19a13((3323, -3630, 32), VectorScale((0, -1, 0), 90));
		function_15b19a13((4168, -1425, 61), (0, 0, 0));
		function_15b19a13((3574, -1680, -85), (0, 0, 0));
		function_15b19a13((4006, -1919, -95), (0, 0, 0));
		function_15b19a13((5082, -2153, -95), VectorScale((0, -1, 0), 90));
		function_15b19a13((4929, -2550, -95), VectorScale((0, -1, 0), 90));
		function_15b19a13((2279, -1489, -52), (0, 0, 0));
		function_15b19a13((2718, -2057, -76), VectorScale((0, -1, 0), 90));
		function_15b19a13((4857, -123, 84), (0, 0, 0));
		function_15b19a13((5584, -415, 22), VectorScale((0, 1, 0), 180));
		function_15b19a13((4366, 67, -106), VectorScale((0, -1, 0), 180));
		function_15b19a13((1875, 482, -18), (0, 0, 0));
		function_15b19a13((2947, -561, 98), (0, 0, 0));
		function_15b19a13((2271, 501, 154), VectorScale((0, 1, 0), 180));
		function_15b19a13((749, -276, 74), VectorScale((0, 1, 0), 180));
		clientfield::register("toplayer", "mule_kick", 1, 1, "int");
	}
	if(MapName == "zm_log_seatown")
	{
		function_fa82ae38();
		function_15b19a13((1544, 2655, 24), VectorScale((0, -1, 0), 113));
		function_15b19a13((-812, 1822, -23), (0, 0, 0));
		function_15b19a13((1828, 3659, -63), VectorScale((0, 1, 0), 180));
		function_15b19a13((659, 3799, -15), VectorScale((0, 1, 0), 90));
		function_15b19a13((-764, 3379, -48), (0, 0, 0));
		function_15b19a13((-1000, 4299, -114), VectorScale((0, 1, 0), 180));
		function_15b19a13((-764, 3881, -104), (0, 0, 0));
		function_15b19a13((-95, 3221, -48), VectorScale((0, 1, 0), 180));
		function_15b19a13((69, 3009, -48), VectorScale((0, 1, 0), 180));
		function_15b19a13((-1958, 1883, 8), VectorScale((0, 1, 0), 90));
		function_15b19a13((-917, 1327, -109), VectorScale((0, 1, 0), 180));
		function_15b19a13((852, 2219, 72), (0, 0, 0));
		function_15b19a13((-948, 4179, 104), (0, 0, 0));
		clientfield::register("clientuimodel", "hudItems.perks.icu", 1, 2, "int");
	}
	if(MapName == "zm_westernz")
	{
		function_15b19a13((-545, 1731, -3), VectorScale((0, -1, 0), 90));
		function_15b19a13((-516, 988, 0), VectorScale((0, 1, 0), 90));
		function_15b19a13((2603, -1527, 4), VectorScale((0, -1, 0), 145));
		function_15b19a13((2666, -508, 4), VectorScale((0, 1, 0), 115));
		function_15b19a13((428, 298, -10), VectorScale((0, -1, 0), 45));
		function_15b19a13((271, -1336, 8), VectorScale((0, -1, 0), 145));
		function_15b19a13((1435, -350, 30), VectorScale((0, -1, 0), 150));
		function_15b19a13((2015, -684, 15), VectorScale((0, -1, 0), 146));
	}
	if(MapName == "zm_howl_noahj")
	{
		function_15b19a13((-2242, 2656, 717), VectorScale((0, 1, 0), 180));
		function_15b19a13((-3092, 4538, 713), VectorScale((0, 1, 0), 180));
		function_15b19a13((-7188, -576, 517), VectorScale((0, 1, 0), 90));
		function_15b19a13((-6489, 1107, 415), VectorScale((0, -1, 0), 120));
		function_15b19a13((-1806, 7713, 657), VectorScale((0, 1, 0), 90));
		function_15b19a13((-5631, 3944, 486), VectorScale((0, 1, 0), 165));
		function_15b19a13((-6292, 5320, 478), VectorScale((0, -1, 0), 74));
		function_15b19a13((-2415, -375, 894), VectorScale((0, -1, 0), 180));
	}
	if(MapName == "zm_bioshock")
	{
		function_15b19a13((-2242, 2656, 717), VectorScale((0, 1, 0), 180));
		function_15b19a13((-35, -2210, -76), VectorScale((0, 1, 0), 128));
		function_15b19a13((-295, -1178, 24), VectorScale((0, -1, 0), 179));
		function_15b19a13((689, -141, 50), VectorScale((0, -1, 0), 90));
		function_15b19a13((1146, -892, -191), VectorScale((0, 1, 0), 179));
		function_15b19a13((687, -2035, 51), VectorScale((0, 1, 0), 90));
		function_15b19a13((1795, -1927, 57), VectorScale((0, -1, 0), 179));
		function_15b19a13((1843, -1043, 0), (0, 0, 0));
		function_15b19a13((2507, -1457, 152), VectorScale((0, -1, 0), 90));
		function_15b19a13((2516, -310, 0), (0, 0, 0));
		function_15b19a13((2993, -976, -6), VectorScale((0, 1, 0), 177));
		function_15b19a13((4257, -1922, 260), VectorScale((0, -1, 0), 178));
		function_15b19a13((3615, -2420, 442), VectorScale((0, 1, 0), 91));
		function_15b19a13((3825, -1452, 442), VectorScale((0, -1, 0), 89));
		function_15b19a13((3989, -1248, 178), VectorScale((0, 1, 0), 87));
		function_15b19a13((1448, -1167, 50), VectorScale((0, 1, 0), 89));
	}
	if(MapName == "zm_rig")
	{
		function_15b19a13((5977, 469, 1024), VectorScale((0, -1, 0), 90));
		function_15b19a13((6751, 599, 1024), (0, 0, 0));
		function_15b19a13((5909, 480, 1182), VectorScale((0, -1, 0), 90));
		function_15b19a13((7261, -640, 1024), VectorScale((0, 1, 0), 90));
		function_15b19a13((7328, -1449, 1024), VectorScale((0, 1, 0), 179));
		function_15b19a13((5893, -1072, 1280), VectorScale((0, 1, 0), 90));
		function_15b19a13((5408, -513, 1280), VectorScale((0, -1, 0), 179));
		function_15b19a13((4215, 1061, 1280), (0, 0, 0));
		function_15b19a13((7516, 646, 1280), VectorScale((0, -1, 0), 179));
		function_15b19a13((4908, 2083, 1536), VectorScale((0, 1, 0), 136));
		function_15b19a13((7539, 1860, 1536), VectorScale((0, -1, 0), 131));
		function_15b19a13((5362, 495, 1280), VectorScale((0, 1, 0), 90));
		function_15b19a13((6985, 1456, 1536), VectorScale((0, -1, 0), 90));
		function_15b19a13((6139, 1012, 1550), VectorScale((0, -1, 0), 90));
		function_15b19a13((6531, -1295, 1539), VectorScale((0, -1, 0), 90));
		function_15b19a13((7439, -53, 1536), (0, 0, 0));
		function_15b19a13((7042, -527, 1536), VectorScale((0, -1, 0), 90));
		function_15b19a13((6979, -496, 1760), VectorScale((0, 1, 0), 90));
		function_15b19a13((6472, -187, 1536), VectorScale((0, -1, 0), 119));
		function_15b19a13((5248, -484, 1543), VectorScale((0, 1, 0), 179));
		function_15b19a13((5491, 868, 1536), VectorScale((0, -1, 0), 90));
		function_15b19a13((5551, 234, 1731), (0, 0, 0));
		function_15b19a13((4890, -1436, 1536), VectorScale((0, 1, 0), 90));
		function_15b19a13((3696, -290, 2086), VectorScale((0, 1, 0), 179));
		function_15b19a13((5854, 1815, 1680), VectorScale((0, 1, 0), 90));
		function_15b19a13((3582, 1914, 1638), VectorScale((0, -1, 0), 40));
		function_15b19a13((5812, 400, 1280), VectorScale((0, -1, 0), 90));
		function_15b19a13((6256, 463, 1280), VectorScale((0, 1, 0), 90));
		function_15b19a13((5528, -1232, 1024), VectorScale((0, 1, 0), 135));
		function_15b19a13((6654, -1772, 766), VectorScale((0, 1, 0), 90));
	}
	if(MapName == "zm_escape_room")
	{
		function_15b19a13((221, -343, 56), VectorScale((0, 1, 0), 180));
		function_15b19a13((426, -151, 56), VectorScale((0, -1, 0), 90));
		function_15b19a13((952, -1281, 56), VectorScale((0, 1, 0), 180));
		function_15b19a13((1161, -2280, 56), VectorScale((0, 1, 0), 90));
		function_15b19a13((189, -2133, 36), VectorScale((0, 1, 0), 90));
		function_15b19a13((263, -1589, 212), (0, 0, 0));
		function_15b19a13((469, -1162, 212), (0, 0, 0));
		function_15b19a13((592, -93, 212), VectorScale((0, 1, 0), 90));
		function_15b19a13((10, -1400, -103), VectorScale((0, 1, 0), 90));
	}
	if(MapName == "zm_die")
	{
		function_15b19a13((-53, 1138, 1456), VectorScale((0, 1, 0), 180));
		function_15b19a13((-1230, 1366, 1456), (0, 0, 0));
		function_15b19a13((883, 1107, 1372), VectorScale((0, 1, 0), 180));
		function_15b19a13((1220, 132, 1476), VectorScale((0, 1, 0), 180));
		function_15b19a13((139, 859, 1034), (0, 0, 0));
		function_15b19a13((1242, 782, 605), VectorScale((0, 1, 0), 180));
		function_15b19a13((2097, 789, 157), VectorScale((0, -1, 0), 90));
		function_15b19a13((1160, 74, -40), VectorScale((0, 1, 0), 90));
		function_15b19a13((448, 888, -372), VectorScale((0, -1, 0), 90));
		function_15b19a13((325, -105, -287), VectorScale((0, -1, 0), 30));
		function_15b19a13((719, -750, -287), VectorScale((0, 1, 0), 60));
		function_15b19a13((470, -688, -287), VectorScale((0, -1, 0), 120));
		function_15b19a13((-963, -1338, -287), VectorScale((0, -1, 0), 30));
		function_15b19a13((-616, -1017, -463), VectorScale((0, -1, 0), 120));
		function_15b19a13((563, -1175, -438), VectorScale((0, 1, 0), 150));
		function_15b19a13((483, -699, 1120), VectorScale((0, 1, 0), 150));
		function_15b19a13((531, -710, 1120), VectorScale((0, -1, 0), 30));
		function_15b19a13((310, -661, 1296), VectorScale((0, -1, 0), 30));
		function_15b19a13((-35, -669, 1296), VectorScale((0, -1, 0), 30));
		function_15b19a13((-423, -478, 1296), VectorScale((0, -1, 0), 30));
		function_15b19a13((-569, 545, 1472), VectorScale((0, -1, 0), 90));
		function_15b19a13((-166, 552, 1632), VectorScale((0, 1, 0), 90));
		level thread function_28d623a0();
	}
	if(MapName == "zm_mob")
	{
		function_15b19a13((2231, 10011, 1705), (0, 0, 0));
		function_15b19a13((3942, 9472, 1705), VectorScale((0, 1, 0), 180));
		function_15b19a13((3557, 9666, 1705), VectorScale((0, 1, 0), 180));
		function_15b19a13((2679, 9998, 1705), VectorScale((0, 1, 0), 180));
	}
	if(MapName == "zm_mob_bridge")
	{
		function_15b19a13((-1613, -3720, 6), VectorScale((0, 1, 0), 180));
		function_15b19a13((-1049, -3234, 6), VectorScale((0, 1, 0), 180));
		function_15b19a13((-721, -3546, 6), VectorScale((0, 1, 0), 90));
	}
	if(MapName == "zm_asc_box")
	{
		function_15b19a13((505, -559, 9), VectorScale((0, 1, 0), 135));
		function_15b19a13((-59, 443, 9), VectorScale((0, -1, 0), 90));
	}
	if(MapName == "zm_ice_noah_mada")
	{
		function_15b19a13((1032, -679, 1024), VectorScale((0, 1, 0), 180));
		function_15b19a13((1581, -761, 996), VectorScale((0, -1, 0), 55));
		function_15b19a13((602, -417, 1022), VectorScale((0, 1, 0), 125));
	}
	if(MapName == "zm_minecraft")
	{
		function_15b19a13((-879, 2605, -415), VectorScale((0, 1, 0), 180));
		function_15b19a13((-1617, 2544, -31), VectorScale((0, -1, 0), 90));
		function_15b19a13((-2607, 1455, -351), VectorScale((0, 1, 0), 180));
		function_15b19a13((-911, 718, -415), VectorScale((0, 1, 0), 180));
		function_15b19a13((-1663, 400, -415), VectorScale((0, -1, 0), 90));
		function_15b19a13((-223, -468, -415), VectorScale((0, -1, 0), 180));
		function_15b19a13((-2242, -944, -415), VectorScale((0, 1, 0), 90));
		function_15b19a13((432, 1233, -255), (0, 0, 0));
	}
	if(MapName == "zm_karma")
	{
		function_15b19a13((-86, 1615, 4168), VectorScale((0, 1, 0), 165));
		function_15b19a13((-8068, -4062, 36), VectorScale((0, -1, 0), 90));
		function_15b19a13((-6118, -4745, 55), VectorScale((0, 1, 0), 90));
		function_15b19a13((-4863, -4694, -121), VectorScale((0, 1, 0), 180));
		function_15b19a13((-4368, -3584, -171), VectorScale((0, 1, 0), 170));
		function_15b19a13((-6801, -2743, 21), VectorScale((0, 1, 0), 180));
		function_15b19a13((-8468, -2775, -275), VectorScale((0, -1, 0), 90));
		function_15b19a13((-9340, -1279, -279), VectorScale((0, -1, 0), 20));
		function_15b19a13((-8026, 1439, -322), VectorScale((0, -1, 0), 7));
		function_15b19a13((-5228, 3836, -277), VectorScale((0, 1, 0), 58));
	}
	if(MapName == "zm_prison")
	{
		function_15b19a13((-1548, 5255, 2688), VectorScale((0, 1, 0), 90));
		function_15b19a13((-1660, 3979, 2688), VectorScale((0, 1, 0), 90));
		function_15b19a13((-757, 4209, 2688), VectorScale((0, 1, 0), 90));
		function_15b19a13((-838, 4562, 2878), VectorScale((0, -1, 0), 90));
		function_15b19a13((-273, 4441, 2878), VectorScale((0, 1, 0), 90));
		function_15b19a13((-1353, 4189, 2910), VectorScale((0, 1, 0), 90));
		function_15b19a13((-2486, 3309, 2894), VectorScale((0, 1, 0), 90));
		function_15b19a13((-4132, 4141, 2688), VectorScale((0, 1, 0), 90));
		function_15b19a13((-2384, 5202, 2688), VectorScale((0, -1, 0), 90));
		function_15b19a13((-2668, 4871, 2894), (0, 0, 0));
		function_15b19a13((-2765, 3857, 2482), VectorScale((0, 1, 0), 90));
		function_15b19a13((-2765, 5030, 2482), VectorScale((0, -1, 0), 90));
		function_15b19a13((-2074, 4809, 2482), VectorScale((0, 1, 0), 90));
		function_15b19a13((-1473, 3975, 2498), VectorScale((0, 1, 0), 90));
		function_15b19a13((-2901, 3487, 2191), VectorScale((0, 1, 0), 135));
		function_15b19a13((-3272, 3099, 1640), VectorScale((0, 1, 0), 135));
		function_15b19a13((-3357, 2540, 1428), VectorScale((0, 1, 0), 135));
		function_15b19a13((-4072, 2024, 1428), VectorScale((0, -1, 0), 80));
		function_15b19a13((-3430, 1298, 1428), VectorScale((0, 1, 0), 100));
		function_15b19a13((-2737, 1539, 1573), VectorScale((0, -1, 0), 170));
	}
	if(MapName == "zm_family_guy")
	{
		function_15b19a13((-767, -112, 3), (0, 0, 0));
		function_15b19a13((672, 24, 3), VectorScale((0, 1, 0), 180));
		function_15b19a13((-759, -820, 3), (0, 0, 0));
		function_15b19a13((672, -820, 3), VectorScale((0, 1, 0), 180));
		function_15b19a13((-343, -249, -125), VectorScale((0, -1, 0), 90));
	}
	if(MapName == "zm_der_riese")
	{
		function_15b19a13((-225, 632, -2), VectorScale((0, -1, 0), 90));
		function_15b19a13((-509, 69, 69), VectorScale((0, -1, 0), 90));
		function_15b19a13((77, -1464, 191), VectorScale((0, 1, 0), 90));
		function_15b19a13((524, -1948, 64), VectorScale((0, 1, 0), 90));
		function_15b19a13((618, -2020, 88), VectorScale((0, 1, 0), 180));
	}
	if(MapName == "zm_lethalcompany")
	{
		function_15b19a13((-11481, 28420, -292), VectorScale((0, -1, 0), 40));
		function_15b19a13((-10481, 27272, -269), VectorScale((0, 1, 0), 90));
		function_15b19a13((-10262, 27193, -32), VectorScale((0, -1, 0), 90));
		function_15b19a13((-12348, 27193, -32), VectorScale((0, -1, 0), 90));
		function_15b19a13((-10263, 24918, -55), VectorScale((0, 1, 0), 90));
		function_15b19a13((-11772, 26213, -55), VectorScale((0, 1, 0), 180));
		function_15b19a13((-10313, 16528, 360), (0, 0, 0));
		function_15b19a13((-11197, 17177, 360), (0, 0, 0));
		function_15b19a13((-11101, 16743, 360), (0, 0, 0));
		function_15b19a13((-10732, 15699, 360), (0, 0, 0));
		function_15b19a13((-8863, 17429, 360), VectorScale((0, 1, 0), 90));
		function_15b19a13((-5692, 18400, 520), VectorScale((0, 1, 0), 180));
		function_15b19a13((-10715, 25082, 448), VectorScale((0, 1, 0), 90));
	}
	if(MapName == "zm_ice_forest")
	{
		function_15b19a13((712, -974, 7), VectorScale((0, 1, 0), 135));
	}
	if(MapName == "zm_1")
	{
		function_15b19a13((-869, -967, 227), VectorScale((0, 1, 0), 27));
		function_15b19a13((-1001, 190, 208), VectorScale((0, -1, 0), 157));
		function_15b19a13((1000, -436, 289), VectorScale((0, 1, 0), 104));
		function_15b19a13((602, -1740, 478), VectorScale((0, 1, 0), 90));
		function_15b19a13((1467, -725, 256), VectorScale((0, 1, 0), 180));
		function_15b19a13((1546, -222, 253), VectorScale((0, 1, 0), 90));
		function_15b19a13((544, 519, 269), VectorScale((0, -1, 0), 15));
		function_15b19a13((2357, -606, 320), VectorScale((0, 1, 0), 90));
		function_15b19a13((2763, 201, 472), VectorScale((0, 1, 0), 180));
		function_15b19a13((3272, -576, 230), (0, 0, 0));
		function_15b19a13((4505, 101, 230), (0, 0, 0));
		function_15b19a13((3909, -763, 230), (0, 0, 0));
		function_15b19a13((3953, 605, 230), (0, 0, 0));
		function_15b19a13((3131, -24, 323), VectorScale((0, 1, 0), 180));
		function_15b19a13((2081, 442, 320), VectorScale((0, -1, 0), 90));
		function_15b19a13((2081, -613, 320), VectorScale((0, 1, 0), 90));
	}
	if(MapName == "zm_dormammu")
	{
		function_15b19a13((-48, 1329, 0), (0, 0, 0));
		function_15b19a13((643, -112, 0), VectorScale((0, 1, 0), 90));
	}
	if(MapName == "zm_vk_tra_sur_tunnel")
	{
		function_15b19a13((4168, -1056, 72), VectorScale((0, -1, 0), 60));
		function_15b19a13((3506, -2657, 320), VectorScale((0, -1, 0), 145));
		function_15b19a13((2779, -2221, 320), VectorScale((0, -1, 0), 120));
		function_15b19a13((1208, -1615, 280), VectorScale((0, -1, 0), 60));
		function_15b19a13((451, -2733, 25), VectorScale((0, 1, 0), 120));
	}
	if(MapName == "zm_escape")
	{
		function_15b19a13((-163, -471, 8), VectorScale((0, -1, 0), 90));
		function_15b19a13((-163, -471, 8), VectorScale((0, -1, 0), 90));
		function_15b19a13((-497, -884, 8), VectorScale((0, -1, 0), 90));
		function_15b19a13((-1112, -1899, 774), VectorScale((0, 1, 0), 90));
		function_15b19a13((-569, -3158, 440), VectorScale((0, 1, 0), 90));
		function_15b19a13((-571, -2607, 170), (0, 0, 0));
	}
	if(MapName == "zm_vk_tra_sur_busdepot")
	{
		function_15b19a13((1555, 4114, 0), VectorScale((0, -1, 0), 90));
		function_15b19a13((1982, 5436, -5), VectorScale((0, -1, 0), 80));
		function_15b19a13((1208, 4864, 0), VectorScale((0, 1, 0), 90));
		function_15b19a13((1453, 2901, -37), VectorScale((0, 1, 0), 10));
		function_15b19a13((2578, 3862, 0), (0, 0, 0));
		function_15b19a13((2705, 4302, 0), VectorScale((0, 1, 0), 90));
		function_15b19a13((3612, 4946, 24), VectorScale((0, 1, 0), 90));
		function_15b19a13((1421, 4494, -151), VectorScale((0, 1, 0), 180));
	}
	if(MapName == "zm_rapture")
	{
		function_15b19a13((-1995, -1595, 261), (0, 0, 0));
		function_15b19a13((-802, -592, 0), VectorScale((0, -1, 0), 90));
		function_15b19a13((-1492, -658, 137), (0, 0, 0));
	}
	if(MapName == "zm_evil_dead")
	{
		function_15b19a13((-436, -201, 128), (0, 0, 0));
		function_15b19a13((-53, 676, 112), VectorScale((0, -1, 0), 90));
		function_15b19a13((-72, -818, -41), VectorScale((0, 1, 0), 90));
	}
	if(MapName == "zm_defend")
	{
		function_15b19a13((-333, -197, 182), VectorScale((0, 1, 0), 90));
		function_15b19a13((161, -639, 175), VectorScale((0, 1, 0), 180));
		function_15b19a13((-502, -717, 175), (0, 0, 0));
	}
	if(MapName == "zm_mc_castle")
	{
		function_15b19a13((399, -1477, -415), (0, 0, 0));
		function_15b19a13((784, -2006, -383), VectorScale((0, 1, 0), 180));
		function_15b19a13((688, -2481, -127), VectorScale((0, 1, 0), 180));
		function_15b19a13((-882, -655, -127), VectorScale((0, -1, 0), 90));
		function_15b19a13((882, -655, -127), VectorScale((0, -1, 0), 90));
	}
	if(MapName == "zm_mgs2_big_shell")
	{
		function_15b19a13((-364, -60, 0), VectorScale((0, 1, 0), 90));
		function_15b19a13((379, 247, 0), VectorScale((0, -1, 0), 90));
		function_15b19a13((367, 1483, 32), (0, 0, 0));
		function_15b19a13((293, 1931, 5473), (0, 0, 0));
		function_15b19a13((1381, 1859, 5232), VectorScale((0, 1, 0), 120));
		function_15b19a13((2600, 2782, 5232), VectorScale((0, -1, 0), 60));
		function_15b19a13((3303, 3950, 5232), (0, 0, 0));
		function_15b19a13((3496, 5452, 5232), VectorScale((0, 1, 0), 180));
		function_15b19a13((2619, 6634, 5232), VectorScale((0, 1, 0), 60));
		function_15b19a13((1407, 7555, 5232), VectorScale((0, -1, 0), 120));
		function_15b19a13((-60, 7390, 5232), VectorScale((0, 1, 0), 120));
		function_15b19a13((-1459, 6802, 5232), VectorScale((0, -1, 0), 60));
		function_15b19a13((-2050, 5447, 5232), VectorScale((0, 1, 0), 180));
		function_15b19a13((-2239, 3941, 5232), (0, 0, 0));
		function_15b19a13((-1340, 2785, 5232), VectorScale((0, -1, 0), 120));
		function_15b19a13((-132, 1860, 5232), VectorScale((0, 1, 0), 60));
	}
	if(MapName == "zm_pvz")
	{
		function_15b19a13((112, -45, 0), VectorScale((0, 1, 0), 180));
		function_15b19a13((-296, -680, -103), VectorScale((0, 1, 0), 45));
		function_15b19a13((-23, -112, 5), VectorScale((0, 1, 0), 180));
		function_15b19a13((-48, -911, 5), VectorScale((0, -1, 0), 90));
	}
	if(MapName == "zm_nazi_zombie_mansion")
	{
		function_15b19a13((-338, -688, 0), VectorScale((0, 1, 0), 90));
		function_15b19a13((0, -1613, 184), VectorScale((0, 1, 0), 90));
		function_15b19a13((541, -1007, 248), VectorScale((0, 1, 0), 90));
		function_15b19a13((1623, -1128, 248), (0, 0, 0));
		function_15b19a13((1009, -2376, 248), VectorScale((0, 1, 0), 90));
		function_15b19a13((-408, -2516, 248), (0, 0, 0));
		function_15b19a13((-1124, -2583, 248), (0, 0, 0));
		function_15b19a13((-1198, -772, 248), VectorScale((0, -1, 0), 90));
		function_15b19a13((-1174, -743, 24), VectorScale((0, -1, 0), 135));
		function_15b19a13((-764, -1328, 24), VectorScale((0, 1, 0), 90));
		function_15b19a13((1100, -1392, 24), VectorScale((0, 1, 0), 90));
		function_15b19a13((1095, -2097, 24), (0, 0, 0));
		function_15b19a13((930, -3756, -199), VectorScale((0, 1, 0), 90));
	}
	if(MapName == "zm_light")
	{
		function_15b19a13((-175, 3995, 78), (0, 0, 0));
		function_15b19a13((-65, 4208, -49), VectorScale((0, 1, 0), 180));
		function_15b19a13((610, 3897, -48), VectorScale((0, 1, 0), 180));
		function_15b19a13((1543, 2280, -51), VectorScale((0, 1, 0), 135));
		function_15b19a13((848, 1064, -5), VectorScale((0, 1, 0), 100));
		function_15b19a13((-11, -333, -33), VectorScale((0, 1, 0), 180));
		function_15b19a13((-351, -1988, -41), VectorScale((0, 1, 0), 180));
	}
	if(MapName == "zm_bm")
	{
		function_15b19a13((226, 51, -7), VectorScale((0, -1, 0), 90));
		function_15b19a13((-1455, -236, -7), VectorScale((0, -1, 0), 90));
		function_15b19a13((-1992, 12, -7), VectorScale((0, 1, 0), 90));
		function_15b19a13((-752, -35, 184), (0, 0, 0));
		function_15b19a13((-1795, -16, 184), VectorScale((0, -1, 0), 90));
		function_15b19a13((-2706, -744, 184), VectorScale((0, 1, 0), 90));
		function_15b19a13((-2833, 990, 184), VectorScale((0, -1, 0), 45));
	}
	if(MapName == "zm_dng_christmas")
	{
		function_15b19a13((55, -198, 136), VectorScale((0, 1, 0), 180));
		function_15b19a13((104, 156, 136), VectorScale((0, 1, 0), 180));
		function_15b19a13((-329, -526, 3), VectorScale((0, 1, 0), 90));
		function_15b19a13((29, -983, 3), VectorScale((0, 1, 0), 135));
	}
	if(MapName == "zm_2fort")
	{
		function_15b19a13((2054, -4126, 258), VectorScale((0, 1, 0), 90));
		function_15b19a13((2579, -4139, 258), VectorScale((0, 1, 0), 90));
		function_15b19a13((2714, -3348, 258), VectorScale((0, -1, 0), 90));
		function_15b19a13((3690, -3253, 3), VectorScale((0, 1, 0), 180));
		function_15b19a13((2754, -3507, 66), (0, 0, 0));
		function_15b19a13((3757, -4134, 66), VectorScale((0, 1, 0), 90));
		function_15b19a13((4326, -4141, 66), VectorScale((0, 1, 0), 90));
		function_15b19a13((4223, -4096, -192), VectorScale((0, 1, 0), 180));
		function_15b19a13((2778, -1685, 7), VectorScale((0, -1, 0), 90));
		function_15b19a13((2467, -4841, 258), VectorScale((0, -1, 0), 180));
		function_15b19a13((2249, -5837, -189), VectorScale((0, -1, 0), 90));
		function_15b19a13((3793, -5934, -173), VectorScale((0, 1, 0), 90));
	}
	if(MapName == "zm_supermario64")
	{
		function_15b19a13((-65, 2539, 9630), VectorScale((0, 1, 0), 130));
		function_15b19a13((-40, 3774, 9803), VectorScale((0, 1, 0), 90));
		function_15b19a13((1174, 6018, 9725), (0, 0, 0));
		function_15b19a13((219, 4935, 9803), VectorScale((0, 1, 0), 180));
		function_15b19a13((323, 7085, 9803), VectorScale((0, 1, 0), 135));
		function_15b19a13((463, 8280, 9771), VectorScale((0, -1, 0), 90));
		function_15b19a13((-630, 7594, 9867), VectorScale((0, 1, 0), 180));
		function_15b19a13((-273, 9890, 9772), VectorScale((0, 1, 0), 45));
	}
	if(MapName == "zm_monkey_village")
	{
		function_15b19a13((195, -171, 0), VectorScale((0, 1, 0), 135));
		function_15b19a13((375, 713, 0), VectorScale((0, 1, 0), 165));
		function_15b19a13((-713, 2915, 0), VectorScale((0, 1, 0), 16));
		function_15b19a13((-1808, 3524, 165), VectorScale((0, 1, 0), 66));
		function_15b19a13((1672, 3746, 932), VectorScale((0, 1, 0), 135));
		function_15b19a13((745, 3612, 0), VectorScale((0, -1, 0), 45));
	}
	if(MapName == "zm_skatopia")
	{
		function_15b19a13((-4339, -7471, -384), VectorScale((0, 1, 0), 50));
		function_15b19a13((-3706, -6583, -321), VectorScale((0, 1, 0), 156));
		function_15b19a13((-1273, -5890, -154), VectorScale((0, -1, 0), 129));
		function_15b19a13((-2207, -7726, -168), VectorScale((0, -1, 0), 36));
		function_15b19a13((-2540, -7185, -168), VectorScale((0, 1, 0), 149));
		function_15b19a13((-3369, -9037, -27), VectorScale((0, -1, 0), 67));
		function_15b19a13((-4389, -7978, -265), VectorScale((0, 1, 0), 5));
		function_15b19a13((-3850, -10221, 68), VectorScale((0, 1, 0), 11));
		function_15b19a13((-2619, -10386, 200), VectorScale((0, -1, 0), 142));
		function_15b19a13((-1384, -10734, 110), VectorScale((0, -1, 0), 157));
		function_15b19a13((-1758, -11978, 380), VectorScale((0, 1, 0), 35));
		function_15b19a13((-964, -10498, 530), VectorScale((0, -1, 0), 138));
		function_15b19a13((-1439, -8305, 107), VectorScale((0, 1, 0), 144));
		function_15b19a13((-198, -12499, 371), VectorScale((0, 1, 0), 117));
		function_15b19a13((25, -13311, 371), VectorScale((0, 1, 0), 69));
		function_15b19a13((750, -12201, 371), VectorScale((0, -1, 0), 145));
		function_15b19a13((1602, -12766, 425), VectorScale((0, 1, 0), 169));
		function_15b19a13((263, -12577, 612), VectorScale((0, 1, 0), 33));
		function_15b19a13((650, -11948, 611), VectorScale((0, -1, 0), 55));
		function_15b19a13((-1335, -8387, 444), VectorScale((0, 1, 0), 98));
		function_15b19a13((51, -13640, 659), VectorScale((0, 1, 0), 33));
		function_15b19a13((1819, -12625, 612), VectorScale((0, -1, 0), 178));
		function_15b19a13((1097, -11632, 612), VectorScale((0, -1, 0), 53));
		function_15b19a13((1412, -11829, 433), VectorScale((0, 1, 0), 34));
		function_15b19a13((699, -14062, 497), VectorScale((0, 1, 0), 65));
		function_15b19a13((-569, -12811, 375), VectorScale((0, -1, 0), 143));
		function_15b19a13((-1536, -9314, 748), VectorScale((0, -1, 0), 2));
		function_15b19a13((-734, -9810, 978), VectorScale((0, -1, 0), 22));
		function_15b19a13((817, -9873, 661), VectorScale((0, -1, 0), 144));
		function_15b19a13((231, -8997, 896), VectorScale((0, -1, 0), 144));
		function_15b19a13((-1203, -8742, 939), VectorScale((0, -1, 0), 167));
		function_15b19a13((-1135, -8583, 107), VectorScale((0, -1, 0), 166));
		function_15b19a13((60584, 7233, 836), VectorScale((0, 1, 0), 34));
		function_15b19a13((61453, 7814, 836), VectorScale((0, -1, 0), 142));
		function_15b19a13((61821, 7294, 865), VectorScale((0, -1, 0), 145));
		function_15b19a13((60965, 6695, 863), VectorScale((0, 1, 0), 34));
		function_15b19a13((60495, 8296, 484), VectorScale((0, 1, 0), 124));
		function_15b19a13((61483, 9027, 484), VectorScale((0, -1, 0), 145));
		function_15b19a13((59871, 6997, 486), VectorScale((0, 1, 0), 82));
		function_15b19a13((60424, 7384, 486), VectorScale((0, 1, 0), 167));
		function_15b19a13((61285, 9309, 338), VectorScale((0, -1, 0), 145));
		function_15b19a13((60463, 10393, 401), VectorScale((0, -1, 0), 145));
		function_15b19a13((59883, 11307, 485), VectorScale((0, -1, 0), 98));
		function_15b19a13((58438, 10293, 485), VectorScale((0, -1, 0), 5));
		function_15b19a13((57756, 9378, 486), VectorScale((0, -1, 0), 5));
		function_15b19a13((57960, 8985, 338), VectorScale((0, 1, 0), 35));
	}
	if(MapName == "zm_nuked")
	{
		function_15b19a13((3606, 1160, 11), VectorScale((0, 1, 0), 128));
		function_15b19a13((3396, 228, 18), VectorScale((0, 1, 0), 103));
		function_15b19a13((2514, 1847, 26), VectorScale((0, -1, 0), 114));
		function_15b19a13((2301, 631, 7), VectorScale((0, 1, 0), 64));
		function_15b19a13((3214, 1859, 24), VectorScale((0, -1, 0), 162));
		function_15b19a13((2772, 1880, 24), VectorScale((0, 1, 0), 104));
		function_15b19a13((2856, 2282, 158), VectorScale((0, 1, 0), 103));
		function_15b19a13((2900, 1947, 166), VectorScale((0, 1, 0), 106));
		function_15b19a13((2321, 1973, -19), VectorScale((0, 1, 0), 73));
		function_15b19a13((3254, 2638, 16), VectorScale((0, -1, 0), 131));
		function_15b19a13((2957, 479, 23), VectorScale((0, 1, 0), 155));
		function_15b19a13((2751, 151, 23), VectorScale((0, 1, 0), 67));
		function_15b19a13((2626, 565, 167), VectorScale((0, 1, 0), 11));
		function_15b19a13((2715, 75, 159), VectorScale((0, -1, 0), 113));
		function_15b19a13((2398, 209, 35), VectorScale((0, -1, 0), 96));
		function_15b19a13((3194, 63, 19), VectorScale((0, -1, 0), 87));
		function_15b19a13((2161, 2362, -62), VectorScale((0, 1, 0), 9));
	}
	level thread function_b4c76d73();
	return;
	ERROR: Exception occured: Stack empty.
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_b4c76d73
	Namespace: namespace_7b1eb23c
	Checksum: 0x424F4353
	Offset: 0x10230
	Size: 0x58
	Parameters: 0
	Flags: None
	Line Number: 1759
*/
function function_b4c76d73()
{
	while(1)
	{
		if(isdefined(level.var_c4940f7e))
		{
			level [[level.var_c4940f7e]]();
			wait(0.05);
			level thread function_cbfb4b4b();
			break;
		}
		wait(0.1);
	}
}

/*
	Name: function_cbfb4b4b
	Namespace: namespace_7b1eb23c
	Checksum: 0x424F4353
	Offset: 0x10290
	Size: 0xD0
	Parameters: 0
	Flags: None
	Line Number: 1784
*/
function function_cbfb4b4b()
{
	points = GetEntArray("random_perk_loc", "targetname");
	for(i = 0; i < points.size; i++)
	{
		level thread function_15b19a13(points[i].origin, points[i].angles - VectorScale((0, 1, 0), 90), points[i].var_231fac73, points[i].var_2c7b6735);
	}
}

/*
	Name: function_15b78985
	Namespace: namespace_7b1eb23c
	Checksum: 0x424F4353
	Offset: 0x10368
	Size: 0xC8
	Parameters: 4
	Flags: None
	Line Number: 1803
*/
function function_15b78985(var_7aef55f1, var_2c81877f, var_231fac73, var_2c7b6735)
{
	perk = spawn("script_model", var_7aef55f1);
	perk.angles = var_2c81877f + VectorScale((0, 1, 0), 90);
	perk SetModel("tag_origin");
	perk.targetname = "random_perk_loc";
	perk.var_231fac73 = var_231fac73;
	perk.var_2c7b6735 = var_2c7b6735;
}

/*
	Name: function_15b19a13
	Namespace: namespace_7b1eb23c
	Checksum: 0x424F4353
	Offset: 0x10438
	Size: 0xB8
	Parameters: 4
	Flags: None
	Line Number: 1823
*/
function function_15b19a13(var_7aef55f1, var_2c81877f, var_231fac73, var_2c7b6735)
{
	perk = spawnstruct();
	perk.var_7aef55f1 = var_7aef55f1;
	perk.var_2c81877f = var_2c81877f + VectorScale((0, 1, 0), 90);
	perk.var_231fac73 = var_231fac73;
	perk.var_2c7b6735 = var_2c7b6735;
	level.var_6d54f498[level.var_6d54f498.size] = perk;
}

/*
	Name: function_57c748b3
	Namespace: namespace_7b1eb23c
	Checksum: 0x424F4353
	Offset: 0x104F8
	Size: 0x40
	Parameters: 2
	Flags: None
	Line Number: 1843
*/
function function_57c748b3(perk, arg)
{
	wait(0.1);
	var_fb1cd1b2 = perk + "_power_on";
	level notify(var_fb1cd1b2);
}

/*
	Name: function_fa82ae38
	Namespace: namespace_7b1eb23c
	Checksum: 0x424F4353
	Offset: 0x10540
	Size: 0x170
	Parameters: 0
	Flags: None
	Line Number: 1860
*/
function function_fa82ae38()
{
	if(isdefined(level.override_perk_targetname))
	{
		structs = struct::get_array(level.override_perk_targetname, "targetname");
	}
	else
	{
		structs = struct::get_array("zm_perk_machine", "targetname");
	}
	points = GetEntArray("zm_perk_machine", "targetname");
	if(isdefined(points) && points.size > 0)
	{
		structs = ArrayCombine(structs, points, 0, 0);
	}
	foreach(struct in structs)
	{
		struct.angles = struct.angles + VectorScale((0, 1, 0), 90);
	}
}

/*
	Name: function_ff2cdffe
	Namespace: namespace_7b1eb23c
	Checksum: 0x424F4353
	Offset: 0x106B8
	Size: 0x160
	Parameters: 0
	Flags: None
	Line Number: 1891
*/
function function_ff2cdffe()
{
	wait(1);
	level flag::wait_till("reap_collection_loaded");
	wait(0.5);
	fixed = 0;
	while(!fixed)
	{
		var_8cf2feee = undefined;
		a_ai = GetAIArray();
		for(i = 0; i < a_ai.size; i++)
		{
			if(IsSubStr(a_ai[i].model, "_george_"))
			{
				var_8cf2feee = a_ai[i];
				a_ai[i] ForceTeleport((634, -84, -15), a_ai[i].angles, 1, 1);
			}
		}
		if(isdefined(var_8cf2feee) && var_8cf2feee.origin[2] > -20)
		{
			fixed = 1;
		}
		wait(1);
	}
	return;
	ERROR: Exception occured: Stack empty.
}

/*
	Name: function_28d623a0
	Namespace: namespace_7b1eb23c
	Checksum: 0x424F4353
	Offset: 0x10820
	Size: 0x2B4
	Parameters: 0
	Flags: None
	Line Number: 1929
*/
function function_28d623a0()
{
	wait(1);
	level flag::wait_till("all_players_spawned");
	wait(1);
	tombstones = GetEntArray("Tombstone Soda", "targetname");
	tombstone = tombstones[0];
	for(i = 0; i < tombstones.size; i++)
	{
		if(tombstones[i].model == "cz_zombie_vending_da_tombstone" || tombstones[i].model == "cz_zombie_vending_da_tombstone_off")
		{
			tombstone = tombstones[i];
		}
	}
	Elevators = GetEntArray("elevator_bldg1a_body", "targetname");
	Elevators = ArrayCombine(Elevators, GetEntArray("elevator_bldg1b_body", "targetname"), 0, 0);
	Elevators = ArrayCombine(Elevators, GetEntArray("elevator_bldg1c_body", "targetname"), 0, 0);
	Elevators = ArrayCombine(Elevators, GetEntArray("elevator_bldg1d_body", "targetname"), 0, 0);
	elevator = Elevators[0];
	for(i = 0; i < Elevators.size; i++)
	{
		if(Distance(Elevators[i].origin, tombstone.origin) < Distance(elevator.origin, tombstone.origin))
		{
			elevator = Elevators[i];
		}
	}
	elevator EnableLinkTo();
	tombstone EnableLinkTo();
	tombstone LinkTo(elevator);
}

