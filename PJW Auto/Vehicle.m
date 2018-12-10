// Vehicle.m
// PJW Auto
// Created by John Christopher Ferris
// Copyright © 2018 sub11 LLC. All rights reserved.

#import "Vehicle.h"

// 32 makes
static NSString* const Acura = @"Acura";
 static NSString* const OneDot6EL = @"1.6EL"; //1997-2000
 static NSString* const OneDot7EL = @"1.7EL"; // 2001-2005
 static NSString* const TwoDot2CL = @"2.2CL"; // 1997
 static NSString* const TwoDot3CL = @"2.3CL"; // 1998-1999
 static NSString* const TwoDot5TL = @"2.5TL"; // 1995-1998
 static NSString* const ThreeDot0CL = @"3.0CL"; // 1997-1999
 static NSString* const ThreeDot2CL = @"3.2CL"; // 2001-2003
 static NSString* const ThreeDot2TL = @"3.2TL"; // 1996-2003
 static NSString* const ThreeDot5RL = @"3.5RL"; // 1996-2004
 static NSString* const CSX = @"CSX"; // 2006-2011
 static NSString* const ILX = @"ILX"; // 2013-2014
 static NSString* const Integra = @"Integra"; // 1986-2001
 static NSString* const Legend = @"Legend"; // 1986-1995
 static NSString* const MDX = @"MDX"; // 2001-2014
 static NSString* const NSX = @"NSX"; // 1991-2005
 static NSString* const NSXDashT = @"NSX-T"; // 1995-2003
 static NSString* const RDX = @"RDX"; // 2007-2014
 static NSString* const RL = @"RL"; // 2005-2012
 static NSString* const RLX = @"RLX"; // 2014
 static NSString* const RSX = @"RSX"; // 2002-2006
 static NSString* const SLX = @"SLX"; // 1996-1999
 static NSString* const TL = @"TL"; // 2004-2014
 static NSString* const TLX = @"TLX"; // 2015
 static NSString* const TSX = @"TSX"; // 2004-2014
 static NSString* const Vigor = @"Vigor"; // 1992-1994
 static NSString* const ZDX = @"ZDX"; // 2010-2013

static NSString* const Buick = @"Buick";
 static NSString* const Allure = @"Allure"; // 2005-2009
 static NSString* const Century = @"Century"; // 1980-2005
 static NSString* const Electra = @"Electra"; // 1980-1990
 static NSString* const Enclave = @"Enclave"; // 2008-2014
 static NSString* const Encore = @"Encore"; // 2013-2014
 static NSString* const EstateWagon = @"Estate Wagon"; // 1990
 static NSString* const LaCrosse = @"LaCrosse"; // 2005-2014
 static NSString* const LeSabre = @"LeSabre"; // 1980-2005
 static NSString* const Lucerne = @"Lucerne"; // 2006-2011
 static NSString* const ParkAvenue = @"Park Avenue"; // 1991-2005
 static NSString* const Rainier = @"Rainier"; // 2004-2007
 static NSString* const Reatta = @"Reatta"; // 1988-1991
 static NSString* const Regal = @"Regal"; // 1980-2004, 2011-2014
 static NSString* const Rendezvous = @"Rendezvous"; // 2002-2007
 static NSString* const Riviera = @"Riviera"; // 1980-1993, 1995-1999
 static NSString* const Roadmaster = @"Roadmaster"; // 1991-1996
 static NSString* const Skyhawk = @"Skyhawk"; // 1980, 1982-1989
 static NSString* const Skylark = @"Skylark"; // 1980-1998
 static NSString* const Somerset = @"Somerset"; // 1986-1987
 static NSString* const SomersetRegal = @"Somerset Regal"; // 1985-1987
 static NSString* const Terraza = @"Terraza"; // 2005-2007
 static NSString* const Verano = @"Verano"; // 2012-2014

static NSString* const Cadillac = @"Cadillac";
 static NSString* const Allante = @"Allante"; // 1987-1993
 static NSString* const ATS = @"ATS"; // 2013-2014
 static NSString* const Brougham = @"Brougham"; // 1987-1992
 static NSString* const Catera = @"Catera"; // 1997-2001
 static NSString* const Cimarron = @"Cimarron"; // 1982-1988
 static NSString* const CTS = @"CTS"; // 2003-2014
 static NSString* const CTSDashV = @"CTS-V"; // 2015
 static NSString* const DeVille = @"DeVille"; // 1980-2005
 static NSString* const DTS = @"DTS"; // 2006-2011
 static NSString* const Eldorado = @"Eldorado"; // 1980-2002
 static NSString* const ELR = @"ELR"; // 2014
 static NSString* const Escalade = @"Escalade"; // 1999-2000, 2002-2015
 static NSString* const EscaladeESV = @"Escalade ESV"; // 2003-2015
 static NSString* const EscaladeEXT = @"Escalade EXT"; // 2002-2013
 static NSString* const Fleetwood = @"Fleetwood"; // 1980-1996
 static NSString* const Seville = @"Seville"; // 1980-2004
 static NSString* const SixtySpecial = @"Sixty Special"; // 1993
 static NSString* const SRX = @"SRX"; // 2004-2014
 static NSString* const STS = @"STS"; // 2005-2011
 static NSString* const XLR = @"XLR"; // 2004-2009
 static NSString* const XTS = @"XTS"; // 2013-2015

static NSString* const Chevrolet = @"Chevrolet";
 static NSString* const APV = @"APV"; // 1990-1993
 static NSString* const Astro = @"Astro"; // 1985-2005
 static NSString* const Avalanche = @"Avalanche"; // 2002-2013
 static NSString* const Aveo = @"Aveo"; // 2004-2011
 static NSString* const BelAir = @"Bel Air"; // 1980-1981
 static NSString* const Beretta = @"Beretta"; // 1987-1996
 static NSString* const Blazer = @"Blazer"; // 1980-2005
 static NSString* const C3500HD = @"C3500 HD"; // 1991-2002
 static NSString* const Camaro = @"Camaro"; // 1980-2002, 2010-2014
 static NSString* const Caprice = @"Caprice"; // 1980-1996, 2011-2014
 static NSString* const CaptivaSport = @"Captiva Sport"; // 2012-2014
 static NSString* const Cavalier = @"Cavalier"; // 1982-2005
 static NSString* const Celebrity = @"Celebrity"; // 1982-1990
 static NSString* const Chevette = @"Chevette"; // 1980-1987
 static NSString* const ChevyExpress = @"Chevy Express"; // 1996-2012
 static NSString* const ChevyVan = @"Chevy Van"; // 1980-1998
 static NSString* const Citation = @"Citation"; // 1980-1983
 static NSString* const CitationII = @"Citation II"; // 1984-1985
 static NSString* const CityExpress = @"CityExpress"; // 2015
 static NSString* const Classic = @"Classic"; // 2004-2005
 static NSString* const Cobalt = @"Cobalt"; // 2005-2010
 static NSString* const Colorado = @"Colorado"; // 2004-2012
 static NSString* const Corsica = @"Corsica"; // 1987-1996
 static NSString* const Corvette = @"Corvette"; // 1980-1982, 1984-2014
 static NSString* const Cruze = @"Cruze"; // 2011-2014
 static NSString* const ElCamino = @"El Camino"; // 1980-1987
 static NSString* const Epica = @"Epica"; // 2004-2006
 static NSString* const Equinox = @"Equinox"; // 2005-2014
 static NSString* const Express = @"Express"; // 2013
 static NSString* const Express1500 = @"Express 1500"; // 2014
 static NSString* const Express2500 = @"Express 2500"; // 2014
 static NSString* const Express3500 = @"Express 3500"; // 2014
 static NSString* const ForwardControl = @"Forward Control"; // 1980-1999
 static NSString* const HHR = @"HHR"; // 2006-2011
 static NSString* const HiDashCube = @"Hi-Cube"; // 1980-1993
 static NSString* const Impala = @"Impala"; // 1980-1985, 2000-2015
 static NSString* const ImpalaLimited = @"Impala Limited"; // 2014
 static NSString* const Lumina = @"Lumina"; // 1990-2001
 static NSString* const LuminaAPV = @"Lumina APV"; // 1990-1996
 static NSString* const Luv = @"Luv"; // 1980-1982
 static NSString* const Malibu = @"Malibu"; // 1980-1983, 1997-2014
 static NSString* const MalibuClassic = @"Malibu Classic"; // 2008
 static NSString* const Metro = @"Metro"; // 1998-2001
 static NSString* const MonteCarlo = @"Monte Carlo"; // 1980-1988, 1995-2007
 static NSString* const Monza = @"Monza"; // 1980
 static NSString* const Nova = @"Nova"; // 1985-1988
 static NSString* const Optra = @"Optra"; // 2004-2008
 static NSString* const Optra5 = @"Optra5"; // 2004-2008
 static NSString* const Orlando = @"Orlando"; // 2012-2014
// static NSString* const Pickup = @"Pickup"; // 1980-2000 // Repeat
 static NSString* const Prizm = @"Prizm"; // 1998-2002
 static NSString* const S10Blazer = @"S10 Blazer"; // 1983-1994
 static NSString* const S10Pickup = @"S10 Pickup"; // 1982-2004
 static NSString* const Silverado = @"Silverado"; // 1999-2012
 static NSString* const Silverado1500 = @"Silverado 1500"; // 2013-2015
 static NSString* const Silverado2500HD = @"Silverado 2500 HD"; // 2013-2015
 static NSString* const Silverado3500HD = @"Silverado 3500 HD"; // 2013-2015
 static NSString* const SilveradoClassic = @"Silverado Classic"; // 2007
 static NSString* const Sonic = @"Sonic"; // 2012-2014
 static NSString* const Spark = @"Spark"; // 2013-2014
 static NSString* const SparkEV = @"Spark EV"; // 2014
 static NSString* const Spectrum = @"Spectrum"; // 1985-1988
 static NSString* const Sportvan = @"Sportvan"; // 1980-1996
 static NSString* const Sprint = @"Sprint"; // 1985-1992
 static NSString* const SS = @"SS"; // 2014
 static NSString* const SSR = @"SSR"; // 2003-2006
 static NSString* const StepVan = @"Step Van"; // 1980-1993
 static NSString* const Suburban = @"Suburban"; // 1980-2013, 2015
 static NSString* const Suburban1500 = @"Suburban 1500"; // 2014
 static NSString* const Tahoe = @"Tahoe"; // 1995-2015
 static NSString* const Tracker = @"Tracker"; // 1989-1992, 1998-2004
 static NSString* const TrailBlazer = @"TrailBlazer"; // 2002-2009
 static NSString* const Traverse = @"Traverse"; // 2009-2014
 static NSString* const Trax = @"Trax"; // 2013-2014
 static NSString* const Uplander = @"Uplander"; // 2005-2009
 static NSString* const Venture = @"Venture"; // 1997-2005
 static NSString* const Volt = @"Volt"; // 2011-2014

static NSString* const Chrysler = @"Chrysler";
 static NSString* const Two00 = @"200"; // 2011-2015
 static NSString* const Three00 = @"300"; // 2005-2014
 static NSString* const Three00M = @"300M"; // 1999-2004
 static NSString* const Aspen = @"Aspen"; // 2007-2009
 static NSString* const Cirrus = @"Cirrus"; // 1995-2000
 static NSString* const Concorde = @"Concorde"; // 1993-2004
 static NSString* const Conquest = @"Conquest"; // 1987-1989
 static NSString* const Cordoba = @"Cordoba"; // 1980-1983
 static NSString* const Crossfire = @"Crossfire"; // 2004-2008
 static NSString* const Daytona = @"Daytona"; // 1984-1993
 static NSString* const Dynasty = @"Dynasty"; // 1988-1993
 static NSString* const EClass = @"E Class"; // 1983-1984
 static NSString* const Executive = @"Executive"; // 1983-1986
 static NSString* const FifthAvenue = @"Fifth Avenue"; // 1983-1989
 static NSString* const GrandVoyager = @"Grand Voyager"; // 2000
 static NSString* const Imperial = @"Imperial"; // 1981-1983, 1990-1993
 static NSString* const Intrepid = @"Intrepid"; // 1993-2004
 static NSString* const Laser = @"Laser"; // 1984-1986
 static NSString* const LeBaron = @"LeBaron"; // 1980-1995
 static NSString* const LeBaronGTS = @"LeBaron GTS"; // 1985-1988
 static NSString* const LHS = @"LHS"; // 1994-1997, 1999-2001
 static NSString* const Neon = @"Neon"; // 2000-2002
 static NSString* const NewYorker = @"New Yorker"; // 1980-1996
 static NSString* const NewYorkerFifthAvenue = @"New Yorker Fifth Avenue"; // 1990-1993
 static NSString* const Newport = @"Newport"; // 1980-1981
 static NSString* const Pacifica = @"Pacifica"; // 2004-2008
 static NSString* const Prowler = @"Prowler"; // 2001-2002
 static NSString* const PTCruiser = @"PT Cruiser"; // 2001-2010
 static NSString* const Sebring = @"Sebring"; // 1995-2010
 static NSString* const TC = @"TC"; // 1989-1991
 static NSString* const TownAndCountry = @"Town & Country"; // 1990-2014
 static NSString* const Voyager = @"Voyager"; // 2000-2003

static NSString* const Dodge = @"Dodge";
 static NSString* const Zero24 = @"024"; // 1981-1982
 static NSString* const Two000 = @"2000"; // 1989-1990
 static NSString* const Four00 = @"400"; // 1982-1983
 static NSString* const Six00 = @"600"; // 1983-1988
 static NSString* const Aries = @"Aries"; // 1981-1989
// static NSString* const Aspen = @"Aspen"; // 1980 // Repeat of Chrysler model
 static NSString* const Avenger = @"Avenger"; // 1995-2000, 2008-2014
 static NSString* const Caliber = @"Caliber"; // 2007-2012
 static NSString* const Caravan = @"Caravan"; // 1984-2007
 static NSString* const Challenger = @"Challenger"; // 1980-1983, 2008-2014
 static NSString* const Charger = @"Charger"; // 1983-1987, 2006-2014
 static NSString* const Colt = @"Colt"; // 1980-1996
 static NSString* const Colt100 = @"Colt 100"; // 1989-1992
 static NSString* const Colt200 = @"Colt 200"; // 1989-1992
 static NSString* const ColtVista = @"Colt Vista"; // 1984-1991
 static NSString* const ColtWagon = @"Colt Wagon"; // 1992-1994
// static NSString* const Conquest = @"Conquest"; // 1984-1986 // Repeat of Chrysler model
 static NSString* const Dakota = @"Dakota"; // 1987-2010
 static NSString* const Dart = @"Dart"; // 2013-2014
// static NSString* const Daytona = @"Daytona"; // 1984-1993 // Repeat of Chrysler model
 static NSString* const Diplomat = @"Diplomat"; // 1980-1989
 static NSString* const Durango = @"Durango"; // 1998-2009, 2011-2014
// static NSString* const Dynasty = @"Dynasty"; // 1988-1993 // Repeat of Chrysler model
 static NSString* const Expo = @"Expo"; // 1987-1988
 static NSString* const GrandCaravan = @"Grand Caravan"; // 1987-2014
// static NSString* const Intrepid = @"Intrepid"; // 1993-2004 // Repeat of Chrysler model
 static NSString* const Journey = @"Journey"; // 2009-2014
 static NSString* const Lancer = @"Lancer"; // 1985-1989
 static NSString* const Magnum = @"Magnum"; // 2005-2008
 static NSString* const MiniRamVan = @"Mini Ram Van"; // 1984-1988
 static NSString* const Mirada = @"Mirada"; // 1980-1983
 static NSString* const Monaco = @"Monaco"; // 1990-1992
// static NSString* const Neon = @"Neon"; // 1995-2005 // Repeat of Chrysler model
 static NSString* const Nitro = @"Nitro"; // 2007-2011
 static NSString* const Omni = @"Omni"; // 1980-1990
 static NSString* const Omni024 = @"Omni 024"; // 1980
// static NSString* const Pickup = @"Pickup"; // 1980-2010 // Repeat
 static NSString* const Raider = @"Raider"; // 1987-1989
 static NSString* const Ram50 = @"Ram 50"; // 1980-1993
 static NSString* const RamVan = @"Ram Van"; // 1980-2003
 static NSString* const RamWagon = @"Ram Wagon"; // 1980-2002
 static NSString* const Ramcharger = @"Ramcharger"; // 1980-1993
 static NSString* const Rampage = @"Rampage"; // 1982-1984
 static NSString* const Shadow = @"Shadow"; // 1987-1994
 static NSString* const Spirit = @"Spirit"; // 1989-1995
 static NSString* const Sprinter = @"Sprinter"; // 2003-2009
 static NSString* const SRTDash4 = @"SRT-4"; // 2003-2005
 static NSString* const StDotRegis = @"St. Regis"; // 1980-1981
 static NSString* const Stealth = @"Stealth"; // 1991-1996
 static NSString* const Stratus = @"Stratus"; // 1995-2006
 static NSString* const SX = @"SX"; // 2003-2005
 static NSString* const Viper = @"Viper"; // 1992-2006, 2008-2010, 2013-2014

static NSString* const Eagle = @"Eagle";
// static NSString* const Two000 = @"2000"; // 1991-1993 // Repeat of Dodge model
 static NSString* const Medallion = @"Medallion"; // 1988-1989
 static NSString* const Premier = @"Premier"; // 1988-1992
 static NSString* const Summit = @"Summit"; // 1989-1996
 static NSString* const SummitWagon = @"Summit Wagon"; // 1992-1996
 static NSString* const Talon = @"Talon"; // 1990-1998
 static NSString* const Vision = @"Vision"; // 1993-1997
 static NSString* const Vista = @"Vista"; // 1989-1992
 static NSString* const VistaWagon = @"Vista Wagon"; // 1989-1991

static NSString* const Ford = @"Ford";
 static NSString* const Aerostar = @"Aerostar"; // 1986-1997
 static NSString* const Aspire = @"Aspire"; // 1994-1997
 static NSString* const Bronco = @"Bronco"; // 1980-1996
 static NSString* const BroncoII = @"Bronco II"; // 1984-1990
 static NSString* const CDashMax = @"C-Max"; // 2013-2014
 static NSString* const ClubWagon = @"Club Wagon"; // 1980-1998
 static NSString* const Contour = @"Contour"; // 1995-2000
 static NSString* const Courier = @"Courier"; // 1980-1982
 static NSString* const CrownVictoria = @"Crown Victoria"; // 1992-2011
 static NSString* const EDash150 = @"E-150"; // 2013-2014
 static NSString* const EDash250SuperDuty = @"E-250 Super Duty"; // 2013-2014
 static NSString* const EDash350SuperDuty = @"E-350 Super Duty"; // 2013-2014
 static NSString* const EDash450SuperDuty = @"E-450 Super Duty"; // 2013-2014
 static NSString* const E450SuperDuty = @"E450 Super Duty"; // 1999-2012
 static NSString* const E550SuperDuty = @"E550 Super Duty"; // 2002-2003
 static NSString* const Econoline = @"Econoline"; // 1980-2012
 static NSString* const Edge = @"Edge"; // 2007-2014
 static NSString* const Escape = @"Escape"; // 2001-2014
 static NSString* const Escort = @"Escort"; // 1981-2002
 static NSString* const EscortEXP = @"Escort EXP"; // 1986-1988
 static NSString* const Excursion = @"Excursion"; // 2000-2005
 static NSString* const EXP = @"EXP"; // 1982-1985
 static NSString* const Expedition = @"Expedition"; // 1997-2014
 static NSString* const ExpeditionEL = @"Expedition EL"; // 2007-2012
 static NSString* const ExpeditionMAX = @"Expedition MAX"; // 2007-2012
 static NSString* const Explorer = @"Explorer"; // 1991-2014
 static NSString* const ExplorerSport = @"Explorer Sport"; // 2001-2003
 static NSString* const ExplorerSportTrac = @"Explorer Sport Trac"; // 2001-2005, 2007-2010
 static NSString* const FDash150 = @"F-150"; // 2013-2014
 static NSString* const FDash250SuperDuty = @"F-250 Super Duty"; // 2013-2015
 static NSString* const FDash350SuperDuty = @"F-350 Super Duty"; // 2013-2015
 static NSString* const FDash450SuperDuty = @"F-450 Super Duty"; // 2013-2015
 static NSString* const FDash550SuperDuty = @"F-550 Super Duty"; // 2013-2015
 static NSString* const FDashSuperDuty = @"F-Super Duty"; // 1988-1997
 static NSString* const F450SuperDuty = @"F450 Super Duty"; // 1999-2012
 static NSString* const F550SuperDuty = @"F550 Super Duty"; // 1999-2012
 static NSString* const Fairmont = @"Fairmont"; // 1980-1983
 static NSString* const Festiva = @"Festiva"; // 1988-1993
 static NSString* const Fiesta = @"Fiesta"; // 1980, 2011-2014
 static NSString* const FiveHundred = @"Five Hundred"; // 2005-2007
 static NSString* const Flex = @"Flex"; // 2009-2014
 static NSString* const Focus = @"Focus"; // 2000-2014
 static NSString* const FocusElectric = @"FocusElectric"; // 2015
 static NSString* const Freestar = @"Freestar"; // 2004-2007
 static NSString* const Freestyle = @"Freestyle"; // 2005-2007
 static NSString* const Fusion = @"Fusion"; // 2006-2014
 static NSString* const FusionEnergi = @"FusionEnergi"; // 2015
 static NSString* const Granada = @"Granada"; // 1980-1982
 static NSString* const GT = @"GT"; // 2005-2006
 static NSString* const LTD = @"LTD"; // 1980-1986
 static NSString* const LTDCrownVictoria = @"LTD Crown Victoria"; // 1980-1991
 static NSString* const Mustang = @"Mustang"; // 1980-2014
 static NSString* const Pickup = @"Pickup"; // 1980-2012
 static NSString* const PickupHeritage = @"Pickup Heritage"; // 2004
 static NSString* const Pinto = @"Pinto"; // 1980
 static NSString* const Probe = @"Probe"; // 1989-1997
 static NSString* const Ranger = @"Ranger"; // 1983-2011
 static NSString* const Taurus = @"Taurus"; // 1986-2014
 static NSString* const TaurusX = @"Taurus X"; // 2008-2009
 static NSString* const Tempo = @"Tempo"; // 1984-1994
 static NSString* const Thunderbird = @"Thunderbird"; // 1980-1997, 2002-2005
 static NSString* const Transit = @"Transit"; // 2015
 static NSString* const TransitConnect = @"Transit Connect"; // 2010-2014
 static NSString* const TransitDash150 = @"Transit-150"; // 2015
 static NSString* const TransitDash250 = @"Transit-250"; // 2015
 static NSString* const TransitDash350 = @"Transit-350"; // 2015
 static NSString* const TransitDash350HD = @"Transit-350 HD"; // 2015
 static NSString* const Windstar = @"Windstar"; // 1995-2003
 static NSString* const ZX2 = @"ZX2"; // 2000-2003

static NSString* const Geo = @"Geo";
// static NSString* const Metro = @"Metro"; // 1989-1997 // Repeat of Chevrolet model
// static NSString* const Prizm = @"Prizm"; // 1989-1997 // Repeat of Chevrolet model
// static NSString* const Spectrum = @"Spectrum"; // 1989 // Repeat of Chevrolet model
 static NSString* const Storm = @"Storm"; // 1990-1993
// static NSString* const Tracker = @"Tracker"; // 1989-1997 // Repeat of Chevrolet model

static NSString* const GMC = @"GMC";
 static NSString* const Acadia = @"Acadia"; // 2007-2014
// static NSString* const C3500HD = @"C3500 HD"; // 1991-2002 // Repeat of Chevrolet model
 static NSString* const Caballero = @"Caballero"; // 1980-1987
 static NSString* const Canyon = @"Canyon"; // 2004-2012
 static NSString* const Envoy = @"Envoy"; // 1998-2000, 2002-2009
 static NSString* const EnvoyXL = @"Envoy XL"; // 2002-2006
 static NSString* const EnvoyXUV = @"Envoy XUV"; // 2004-2005
// static NSString* const ForwardControl = @"Forward Control"; // 1980-1999 // Repeat of Chevrolet model
 static NSString* const Jimmy = @"Jimmy"; // 1980-2005
 static NSString* const Magnavan = @"Magnavan"; // 1980-1993
// static NSString* const Pickup = @"Pickup"; // 1980-2000 // Repeat
 static NSString* const Rally = @"Rally"; // 1980-1996
 static NSString* const RallyCamperSpecial = @"Rally Camper Special"; // 1980-1996
 static NSString* const S15Jimmy = @"S15 Jimmy"; // 1983-1991
 static NSString* const S15Pickup = @"S15 Pickup"; // 1982-1990
 static NSString* const Safari = @"Safari"; // 1985-2005
 static NSString* const Savana = @"Savana"; // 1996-2013
 static NSString* const Savana1500 = @"Savana 1500"; // 2014
 static NSString* const Savana2500 = @"Savana 2500"; // 2014
 static NSString* const Savana3500 = @"Savana 3500"; // 2014
 static NSString* const SavanaCamperSpecial = @"Savana Camper Special"; // 1996-2011
 static NSString* const SavanaSpecial = @"Savana Special"; // 1996-2011
 static NSString* const Sierra = @"Sierra"; // 1999-2012
 static NSString* const Sierra1500 = @"Sierra 1500"; // 2013-2015
 static NSString* const Sierra2500HD = @"Sierra 2500 HD"; // 2013-2015
 static NSString* const Sierra3500HD = @"Sierra 3500 HD"; // 2013-2015
 static NSString* const SierraClassic = @"Sierra Classic"; // 2007
 static NSString* const Sonoma = @"Sonoma"; // 1991-2004
// static NSString* const Suburban = @"Suburban"; // 1980-1999 // Repeat of Chevrolet model
 static NSString* const Terrain = @"Terrain"; // 2010-2014
// static NSString* const Tracker = @"Tracker"; // 1989-1992 // Repeat of Chevrolet model
 static NSString* const ValueVan = @"Value Van"; // 1980-1993
 static NSString* const Vandura = @"Vandura"; // 1980-1997
 static NSString* const VanduraSpecial = @"Vandura Special"; // 1980-1996
 static NSString* const Yukon = @"Yukon"; // 1992-2015
 static NSString* const YukonXL = @"Yukon XL"; // 2000-2013, 2015
 static NSString* const YukonXL1500 = @"Yukon XL 1500"; // 2014

static NSString* const Honda = @"Honda";
 static NSString* const Accord = @"Accord"; // 1980-2014
 static NSString* const AccordCrosstour = @"Accord Crosstour"; // 2010-2011
 static NSString* const Civic = @"Civic"; // 1980-2014
 static NSString* const CivicDelSol = @"Civic del Sol"; // 1993-1997
 static NSString* const CRDashV = @"CR-V"; // 1997-2014
 static NSString* const CRDashZ = @"CR-Z"; // 2011-2014
 static NSString* const Crosstour = @"Crosstour"; // 2012-2014
 static NSString* const Element = @"Element"; // 2003-2011
 static NSString* const EV = @"EV"; // 1997-1999
 static NSString* const Fit = @"Fit"; // 2007-2015
 static NSString* const Insight = @"Insight"; // 2000-2006, 2010-2014
 static NSString* const Odyssey = @"Odyssey"; // 1995-2014
 static NSString* const Passport = @"Passport"; // 1994-2002
 static NSString* const Pilot = @"Pilot"; // 2003-2014
 static NSString* const Prelude = @"Prelude"; // 1980-2001
 static NSString* const Ridgeline = @"Ridgeline"; // 2006-2014
 static NSString* const S2000 = @"S2000"; // 2000-2009

static NSString* const Hummer = @"Hummer";
 static NSString* const H1 = @"H1"; // 1992-2004, 2006
 static NSString* const H2 = @"H2"; // 2003-2009
 static NSString* const H3 = @"H3"; // 2006-2010
 static NSString* const H3T = @"H3T"; // 2009-2010

static NSString* const Hyundai = @"Hyundai";
 static NSString* const Accent = @"Accent"; // 1995-2014
 static NSString* const Azera = @"Azera"; // 2006-2014
 static NSString* const Elantra = @"Elantra"; // 1992-2014
 static NSString* const ElantraCoupe = @"Elantra Coupe"; // 2014
 static NSString* const ElantraGT = @"Elantra GT"; // 2013-2014
 static NSString* const ElantraTouring = @"Elantra Touring"; // 2009-2012
 static NSString* const Entourage = @"Entourage"; // 2007-2009
 static NSString* const Equus = @"Equus"; // 2011-2014
 static NSString* const Excel = @"Excel"; // 1986-1994
 static NSString* const Genesis = @"Genesis"; // 2009-2014
 static NSString* const GenesisCoupe = @"Genesis Coupe"; // 2010-2014
 static NSString* const Pony = @"Pony"; // 1984-1987
 static NSString* const SantaFe = @"Santa Fe"; // 2001-2014
 static NSString* const SantaFeSport = @"Santa Fe Sport"; // 2013-2014
 static NSString* const SantaFeXL = @"Santa Fe XL"; // 2014
 static NSString* const Scoupe = @"Scoupe"; // 1991-1995
 static NSString* const Sonata = @"Sonata"; // 1989-2015
 static NSString* const SonataHybrid = @"SonataHybrid"; // 2013-2015
 static NSString* const Stellar = @"Stellar"; // 1985-1988
 static NSString* const Tiburon = @"Tiburon"; // 1997-2001, 2003-2008
 static NSString* const Tucson = @"Tucson"; // 2005-2014
 static NSString* const Veloster = @"Veloster"; // 2012-2014
 static NSString* const Veracruz = @"Veracruz"; // 2007-2012
 static NSString* const XG300 = @"XG300"; // 2001
 static NSString* const XG350 = @"XG350"; // 2002-2005

static NSString* const Infiniti = @"Infiniti";
 static NSString* const EX35 = @"EX35"; // 2008-2012
 static NSString* const EX37 = @"EX37"; // 2013
 static NSString* const FX35 = @"FX35"; // 2003-2012
 static NSString* const FX37 = @"FX37"; // 2013
 static NSString* const FX45 = @"FX45"; // 2003-2008
 static NSString* const FX50 = @"FX50"; // 2009-2013
 static NSString* const G20 = @"G20"; // 1991-1996, 1999-2002
 static NSString* const G25 = @"G25"; // 2011-2012
 static NSString* const G35 = @"G35"; // 2003-2008
 static NSString* const G37 = @"G37"; // 2008-2013
 static NSString* const I30 = @"I30"; // 1996-2001
 static NSString* const I35 = @"I35"; // 2002-2004
 static NSString* const J30 = @"J30"; // 1993-1997
 static NSString* const JX35 = @"JX35"; // 2013
 static NSString* const M30 = @"M30"; // 1990-1992
 static NSString* const M35 = @"M35"; // 2006-2010
 static NSString* const M35h = @"M35h"; // 2012-2013
 static NSString* const M37 = @"M37"; // 2011-2013
 static NSString* const M45 = @"M45"; // 2003-2004, 2006-2010
 static NSString* const M56 = @"M56"; // 2011-2013
 static NSString* const Q40 = @"Q40"; // 2015
 static NSString* const Q45 = @"Q45"; // 1990-2006
 static NSString* const Q50 = @"Q50"; // 2014
 static NSString* const Q60 = @"Q60"; // 2014
 static NSString* const Q70 = @"Q70"; // 2014
 static NSString* const QX4 = @"QX4"; // 1997-2003
 static NSString* const QX50 = @"QX50"; // 2014
 static NSString* const QX56 = @"QX56"; // 2004-2013
 static NSString* const QX60 = @"QX60"; // 2014
 static NSString* const QX70 = @"QX70"; // 2014
 static NSString* const QX80 = @"QX80"; // 2014

static NSString* const Isuzu = @"Isuzu";
 static NSString* const Amigo = @"Amigo"; // 1989-1994, 1998-2000
 static NSString* const Ascender = @"Ascender"; // 2003-2008
 static NSString* const Axiom = @"Axiom"; // 2002-2004
 static NSString* const Hombre = @"Hombre"; // 1996-2000
 static NSString* const iDash280 = @"i-280"; // 2006
 static NSString* const iDash290 = @"i-290"; // 2007-2008
 static NSString* const iDash350 = @"i-350"; // 2006
 static NSString* const iDash370 = @"i-370"; // 2007-2008
 static NSString* const IDashMark = @"I-Mark"; // 1981-1989
 static NSString* const Impulse = @"Impulse"; // 1983-1992
 static NSString* const Oasis = @"Oasis"; // 1996-1999
// static NSString* const Pickup = @"Pickup"; // 1981-1995 // Repeat
 static NSString* const Rodeo = @"Rodeo"; // 1991-2004
 static NSString* const RodeoSport = @"Rodeo Sport"; // 2001-2003
 static NSString* const Stylus = @"Stylus"; // 1991-1993
 static NSString* const Trooper = @"Trooper"; // 1989-2002
 static NSString* const TrooperII = @"Trooper II"; // 1984-1989
 static NSString* const VehiCROSS = @"VehiCROSS"; // 1999-2001

static NSString* const Jeep = @"Jeep";
 static NSString* const Cherokee = @"Cherokee"; // 1980-2001, 2014
 static NSString* const CJ5 = @"CJ5"; // 1980-1983
 static NSString* const CJ7 = @"CJ7"; // 1980-1986
 static NSString* const Comanche = @"Comanche"; // 1986-1992
 static NSString* const Commander = @"Commander"; // 2006-2010
 static NSString* const Compass = @"Compass"; // 2007-2014
 static NSString* const GrandCherokee = @"Grand Cherokee"; // 1993-2014
 static NSString* const GrandWagoneer = @"Grand Wagoneer"; // 1984-1991
 static NSString* const Liberty = @"Liberty"; // 2002-2012
 static NSString* const Patriot = @"Patriot"; // 2007-2014
// static NSString* const Pickup = @"Pickup"; // 1980-1988 // Repeat
 static NSString* const Renegade = @"Renegade"; // 2015
 static NSString* const Scrambler = @"Scrambler"; // 1981-1985
 static NSString* const Wagoneer = @"Wagoneer"; // 1980-1990
 static NSString* const Wrangler = @"Wrangler"; // 1987-1995, 1997-2014

static NSString* const Kia = @"Kia";
 static NSString* const Amanti = @"Amanti"; // 2004-2009
 static NSString* const Borrego = @"Borrego"; // 2009-2011
 static NSString* const Cadenza = @"Cadenza"; // 2014
 static NSString* const Forte = @"Forte"; // 2010-2014
 static NSString* const ForteKoup = @"Forte Koup"; // 2010-2014
 static NSString* const K900 = @"K900"; // 2015
 static NSString* const Magentis = @"Magentis"; // 2001-2010
 static NSString* const Optima = @"Optima"; // 2001-2014
 static NSString* const OptimaHybrid = @"OptimaHybrid"; // 2013-2015
 static NSString* const Rio = @"Rio"; // 2001-2014
 static NSString* const Rio5 = @"Rio5"; // 2006-2011
 static NSString* const Rondo = @"Rondo"; // 2007-2012, 2014
 static NSString* const Sedona = @"Sedona"; // 2002-2012, 2014
 static NSString* const Sephia = @"Sephia"; // 1994-2001
 static NSString* const Sorento = @"Sorento"; // 2003-2009, 2011-2014
 static NSString* const Soul = @"Soul"; // 2010-2014
 static NSString* const SoulEV = @"SoulEV"; // 2015
 static NSString* const Spectra = @"Spectra"; // 2000-2009
 static NSString* const Spectra5 = @"Spectra5"; // 2005-2009
 static NSString* const Sportage = @"Sportage"; // 1995-2002, 2005-2014

static NSString* const Lexus = @"Lexus";
 static NSString* const CT200h = @"CT 200h"; // 2011-2014
 static NSString* const ES250 = @"ES 250"; // 1990-1991
 static NSString* const ES300 = @"ES 300"; // 1992-2003
 static NSString* const ES300h = @"ES 300h"; // 2013-2014
 static NSString* const ES330 = @"ES 330"; // 2004-2006
 static NSString* const ES350 = @"ES 350"; // 2007-2014
 static NSString* const GS300 = @"GS 300"; // 1993-2006
 static NSString* const GS350 = @"GS 350"; // 2007-2011, 2013-2014
 static NSString* const GS400 = @"GS 400"; // 1998-2000
 static NSString* const GS430 = @"GS 430"; // 2001-2007
 static NSString* const GS450h = @"GS 450h"; // 2007-2011, 2013-2014
 static NSString* const GS460 = @"GS 460"; // 2008-2011
 static NSString* const GX460 = @"GX 460"; // 2010-2014
 static NSString* const GX470 = @"GX 470"; // 2003-2009
 static NSString* const HS250h = @"HS 250h"; // 2010-2012
 static NSString* const IS250 = @"IS 250"; // 2006-2014
 static NSString* const IS250C = @"IS 250C"; // 2010-2014
 static NSString* const IS300 = @"IS 300"; // 2001-2005
 static NSString* const IS350 = @"IS 350"; // 2006-2014
 static NSString* const IS350C = @"IS 350C"; // 2010-2014
 static NSString* const ISF = @"IS F"; // 2008-2014
 static NSString* const LFA = @"LFA"; // 2012
 static NSString* const LS400 = @"LS 400"; // 1990-2000
 static NSString* const LS430 = @"LS 430"; // 2001-2006
 static NSString* const LS460 = @"LS 460"; // 2007-2014
 static NSString* const LS460L = @"LS 460L"; // 2007-2013
 static NSString* const LS600h = @"LS 600h"; // 2014
 static NSString* const LS600hL = @"LS 600hL"; // 2008-2013
 static NSString* const LX450 = @"LX 450"; // 1996-1997
 static NSString* const LX470 = @"LX 470"; // 1998-2007
 static NSString* const LX570 = @"LX 570"; // 2008-2011, 2013-2014
 static NSString* const NX200t = @"NX 200t"; // 2015
 static NSString* const NX300h = @"NX 300h"; // 2015
 static NSString* const RC350 = @"RC 350"; // 2015
 static NSString* const RCF = @"RC F"; // 2015
 static NSString* const RX300 = @"RX 300"; // 1999-2003
 static NSString* const RX330 = @"RX 330"; // 2004-2006
 static NSString* const RX350 = @"RX 350"; // 2007-2014
 static NSString* const RX400h = @"RX 400h"; // 2006-2008
 static NSString* const RX450h = @"RX 450h"; // 2010-2014
 static NSString* const SC300 = @"SC 300"; // 1992-2000
 static NSString* const SC400 = @"SC 400"; // 1992-2000
 static NSString* const SC430 = @"SC 430"; // 2002-2010

static NSString* const Lincoln = @"Lincoln";
 static NSString* const Aviator = @"Aviator"; // 2003-2005
 static NSString* const Blackwood = @"Blackwood"; // 2002-2003
 static NSString* const Continental = @"Continental"; // 1980, 1982-2002
 static NSString* const LS = @"LS"; // 2000-2006
 static NSString* const MarkLT = @"Mark LT"; // 2006-2008
 static NSString* const MarkVI = @"Mark VI"; // 1980-1983
 static NSString* const MarkVII = @"Mark VII"; // 1984-1992
 static NSString* const MarkVIII = @"Mark VIII"; // 1993-1998
 static NSString* const MKC = @"MKC"; // 2015
 static NSString* const MKS = @"MKS"; // 2009-2014
 static NSString* const MKT = @"MKT"; // 2010-2014
 static NSString* const MKX = @"MKX"; // 2007-2014
 static NSString* const MKZ = @"MKZ"; // 2007-2014
 static NSString* const Navigator = @"Navigator"; // 1998-2014
 static NSString* const NavigatorL = @"Navigator L"; // 2007-2012
 static NSString* const TownCar = @"Town Car"; // 1981-2011
 static NSString* const Versailles = @"Versailles"; // 1980
 static NSString* const Zephyr = @"Zephyr"; // 2006

static NSString* const Mazda = @"Mazda";
 static NSString* const Two = @"2"; // 2011-2014
 static NSString* const Three = @"3"; // 2004-2014
 static NSString* const Three23 = @"323"; // 1986-1995
 static NSString* const Five = @"5"; // 2006-2010, 2012-2014
 static NSString* const Six = @"6"; // 2003-2015
 static NSString* const Six26 = @"626"; // 1980-2002
 static NSString* const Six26Cronos = @"626 Cronos"; // 1993-1997
 static NSString* const Nine29 = @"929"; // 1988-1995
 static NSString* const Nine29Serenia = @"929 Serenia"; // 1992-1995
 static NSString* const B2000 = @"B2000"; // 1980-1984, 1986-1987
 static NSString* const B2200 = @"B2200"; // 1982-1984, 1987-1993
 static NSString* const B2300 = @"B2300"; // 1994-1997, 2001-2010
 static NSString* const B2500 = @"B2500"; // 1998-2001
 static NSString* const B2600 = @"B2600"; // 1987-1988
 static NSString* const B2600i = @"B2600i"; // 1989-1993
 static NSString* const B3000 = @"B3000"; // 1994-2008
 static NSString* const B4000 = @"B4000"; // 1994-2010
 static NSString* const CXDash5 = @"CX-5"; // 2013-2014
 static NSString* const CXDash7 = @"CX-7"; // 2007-2012
 static NSString* const CXDash9 = @"CX-9"; // 2007-2014
 static NSString* const GLC = @"GLC"; // 1980-1986
 static NSString* const Millenia = @"Millenia"; // 1995-2002
 static NSString* const MPV = @"MPV"; // 1989-1998, 2000-2006
 static NSString* const MXDash3 = @"MX-3"; // 1992-1995
 static NSString* const MXDash3Precidia = @"MX-3 Precidia"; // 1992-1996
 static NSString* const MXDash5Miata = @"MX-5 Miata"; // 1990-1997, 1999-2014
 static NSString* const MXDash6 = @"MX-6"; // 1988-1997
 static NSString* const MXDash6Mystere = @"MX-6 Mystere"; // 1993-1997
 static NSString* const Navajo = @"Navajo"; // 1991-1994
 static NSString* const Protege = @"Protege"; // 1990-2003
 static NSString* const Protege5 = @"Protege5"; // 2002-2003
 static NSString* const RXDash7 = @"RX-7"; // 1980-91, 1993-1995
 static NSString* const RXDash8 = @"RX-8"; // 2004-2011
 static NSString* const Tribute = @"Tribute"; // 2001-2006, 2008-2011

static NSString* const Mercury = @"Mercury";
 static NSString* const Bobcat = @"Bobcat"; // 1980
 static NSString* const Capri = @"Capri"; // 1980-1986, 1991-1994
 static NSString* const Cougar = @"Cougar"; // 1981-1997, 1999-2002
 static NSString* const CougarXR7 = @"Cougar XR7"; // 1980-1982
 static NSString* const GrandMarquis = @"Grand Marquis"; // 1980-2011
 static NSString* const LN7 = @"LN7"; // 1982-1983
 static NSString* const Lynx = @"Lynx"; // 1981-1987
 static NSString* const Marauder = @"Marauder"; // 2003-2004
 static NSString* const Mariner = @"Mariner"; // 2005-2011
 static NSString* const Marquis = @"Marquis"; // 1980-1986
 static NSString* const Milan = @"Milan"; // 2006-2011
 static NSString* const Monarch = @"Monarch"; // 1980
 static NSString* const Montego = @"Montego"; // 2005-2007
 static NSString* const Monterey = @"Monterey"; // 2004-2007
 static NSString* const Mountaineer = @"Mountaineer"; // 1997-2010
 static NSString* const Mystique = @"Mystique"; // 1995-2000
 static NSString* const Sable = @"Sable"; // 1986-2005, 2008-2009
 static NSString* const Topaz = @"Topaz"; // 1984-1994
 static NSString* const Tracer = @"Tracer"; // 1987-1989, 1991-1999
 static NSString* const Villager = @"Villager"; // 1993-2002
// static NSString* const Zephyr = @"Zephyr"; // 1980-1983 // Repeat of Lincoln model

static NSString* const Mitsubishi = @"Mitsubishi";
 static NSString* const Three000GT = @"3000GT"; // 1991-1999
 static NSString* const Cordia = @"Cordia"; // 1983-1988
 static NSString* const Diamante = @"Diamante"; // 1992-2004
 static NSString* const Eclipse = @"Eclipse"; // 1990-2012
 static NSString* const Endeavor = @"Endeavor"; // 2004-2011
// static NSString* const Expo = @"Expo"; // 1992-1995 // Repeat of Dodge model
 static NSString* const Galant = @"Galant"; // 1985-1987, 1989-2012
 static NSString* const GalantSigma = @"Galant Sigma"; // 1988
 static NSString* const iDashMiEV = @"i-MiEV"; // 2012, 2014
// static NSString* const Lancer = @"Lancer"; // 2002-2014 // Repeat of Dodge model
 static NSString* const Mirage = @"Mirage"; // 1985-2002, 2014
 static NSString* const Montero = @"Montero"; // 1983-2006
 static NSString* const MonteroSport = @"Montero Sport"; // 1997-2004
 static NSString* const Outlander = @"Outlander"; // 2003-2014
 static NSString* const OutlanderSport = @"Outlander Sport"; // 2011-2014
// static NSString* const Pickup = @"Pickup"; // 1983-1996 // Repeat
 static NSString* const Precis = @"Precis"; // 1987-1994
// static NSString* const Raider = @"Raider"; // 2006-2009 // Repeat of Dodge model
 static NSString* const RVR = @"RVR"; // 2011-2014
 static NSString* const Sigma = @"Sigma"; // 1989-1990
 static NSString* const Starion = @"Starion"; // 1983-1989
 static NSString* const Tredia = @"Tredia"; // 1983-1988
// static NSString* const Van = @"Van"; // 1987-1990 // Repeat

static NSString* const Nissan = @"Nissan";
 static NSString* const Two00SX = @"200SX"; // 1980-1988, 1995-1998
 static NSString* const Two10 = @"210"; // 1980-1982
 static NSString* const Two40SX = @"240SX"; // 1989-1998
 static NSString* const Two80ZX = @"280ZX"; // 1980-1983
 static NSString* const Three00ZX = @"300ZX"; // 1984-1996
 static NSString* const Three10 = @"310"; // 1980-1982
 static NSString* const Three50Z = @"350Z"; // 2003-2009
 static NSString* const Three70Z = @"370Z"; // 2009-2014
 static NSString* const Five10 = @"510"; // 1980-1981
 static NSString* const Eight10 = @"810"; // 1980-1981
 static NSString* const Altima = @"Altima"; // 1993-2014
 static NSString* const Armada = @"Armada"; // 2004-2014
 static NSString* const Axxess = @"Axxess"; // 1990-1995
 static NSString* const Cube = @"Cube"; // 2009-2014
 static NSString* const Frontier = @"Frontier"; // 1998-2014
 static NSString* const GTDashR = @"GT-R"; // 2009-2014
 static NSString* const Juke = @"Juke"; // 2011-2014
 static NSString* const Leaf = @"Leaf"; // 2011-2014
 static NSString* const Maxima = @"Maxima"; // 1982-2014
 static NSString* const Micra = @"Micra"; // 1984-1991
 static NSString* const Multi = @"Multi"; // 1986-1988
 static NSString* const Murano = @"Murano"; // 2003-2007, 2009-2014
 static NSString* const NV1500 = @"NV1500"; // 2012-2014
 static NSString* const NV200 = @"NV200"; // 2013-2014
 static NSString* const NV2500HD = @"NV2500 HD"; // 2012-2014
 static NSString* const NV3500HD = @"NV3500 HD"; // 2012-2014
 static NSString* const NVP = @"NVP"; // 2013-2015
 static NSString* const NX = @"NX"; // 1991-1993
 static NSString* const Pathfinder = @"Pathfinder"; // 1987-2014
// static NSString* const Pickup = @"Pickup"; // 1980-1997 // Repeat
 static NSString* const Pulsar = @"Pulsar"; // 1983
 static NSString* const PulsarNX = @"Pulsar NX"; // 1983-1990
 static NSString* const Quest = @"Quest"; // 1993-2002, 2004-2009, 2011-2014
 static NSString* const Rogue = @"Rogue"; // 2008-2014
 static NSString* const RogueSelect = @"Rogue Select"; // 2014
 static NSString* const Sentra = @"Sentra"; // 1982-2014
 static NSString* const Stanza = @"Stanza"; // 1982-1992
 static NSString* const Titan = @"Titan"; // 2004-2014
 static NSString* const Van = @"Van"; // 1987-1988, 1990
 static NSString* const Versa = @"Versa"; // 2007-2014
 static NSString* const VersaNote = @"Versa Note"; // 2014
 static NSString* const XDashTrail = @"X-Trail"; // 2005-2007
 static NSString* const Xterra = @"Xterra"; // 2000-2014

static NSString* const Oldsmobile = @"Oldsmobile";
 static NSString* const Achieva = @"Achieva"; // 1992-1998
 static NSString* const Alero = @"Alero"; // 1999-2004
 static NSString* const Aurora = @"Aurora"; // 1995-1999, 2001-2003
 static NSString* const Bravada = @"Bravada"; // 1991-1994, 1996-2004
 static NSString* const Calais = @"Calais"; // 1985-1987
 static NSString* const Ciera = @"Ciera"; // 1996
 static NSString* const CustomCruiser = @"Custom Cruiser"; // 1980-1992
 static NSString* const Cutlass = @"Cutlass"; // 1980-1988, 1997-1999
 static NSString* const CutlassCalais = @"Cutlass Calais"; // 1988-1991
 static NSString* const CutlassCiera = @"Cutlass Ciera"; // 1982-1995
 static NSString* const CutlassCruiser = @"Cutlass Cruiser"; // 1984-1995
 static NSString* const CutlassSupreme = @"Cutlass Supreme"; // 1988-1997
 static NSString* const Delta88 = @"Delta 88"; // 1980-1991
 static NSString* const EightyDashEight = @"Eighty-Eight"; // 1989-1999
 static NSString* const Firenza = @"Firenza"; // 1982-1988
 static NSString* const Intrigue = @"Intrigue"; // 1998-2002
 static NSString* const LSS = @"LSS"; // 1996-1999
 static NSString* const NinetyDashEight = @"Ninety-Eight"; // 1980-1996
 static NSString* const Omega = @"Omega"; // 1980-1984
 static NSString* const Regency = @"Regency"; // 1997-1998
 static NSString* const Silhouette = @"Silhouette"; // 1990-2004
 static NSString* const Starfire = @"Starfire"; // 1980
 static NSString* const Toronado = @"Toronado"; // 1980-1992

static NSString* const Plymouth = @"Plymouth";
 static NSString* const Acclaim = @"Acclaim"; // 1989-1995
 static NSString* const Arrow = @"Arrow"; // 1980
 static NSString* const ArrowPickup = @"Arrow Pickup"; // 1980-1982
 static NSString* const Breeze = @"Breeze"; // 1996-2000
 static NSString* const Caravelle = @"Caravelle"; // 1981-1989
 static NSString* const Champ = @"Champ"; // 1980-1982
// static NSString* const Colt = @"Colt"; // 1983-1996 // Repeat of Dodge model
// static NSString* const Colt100 = @"Colt 100"; // 1989-1992 // Repeat of Dodge model
// static NSString* const Colt200 = @"Colt 200"; // 1989-1992 // Repeat of Dodge model
// static NSString* const ColtVista = @"Colt Vista"; // 1984-1994 // Repeat of Dodge model
// static NSString* const ColtWagon = @"Colt Wagon"; // 1992-1994 // Repeat of Dodge model
// static NSString* const Conquest = @"Conquest"; // 1984-1986 // Repeat of Chrysler model
// static NSString* const Expo = @"Expo"; // 1987-1989 // Repeat of Dodge model
 static NSString* const GranFury = @"Gran Fury"; // 1980-1989
// static NSString* const GrandVoyager = @"Grand Voyager"; // 1987-2000 // Repeat of Chrysler model
 static NSString* const Horizon = @"Horizon"; // 1980-1990
// static NSString* const Laser = @"Laser"; // 1990-1994 // Repeat of Chrysler model
// static NSString* const Neon = @"Neon"; // 1995-2001 // Repeat of Chrysler model
// static NSString* const Prowler = @"Prowler"; // 1997, 1999-2001 // Repeat of Chrysler model
 static NSString* const Reliant = @"Reliant"; // 1981-1989
 static NSString* const Sapporo = @"Sapporo"; // 1980-1983
 static NSString* const ScampPickup = @"Scamp Pickup"; // 1983
 static NSString* const Sundance = @"Sundance"; // 1987-1994
 static NSString* const TC3 = @"TC3"; // 1982
 static NSString* const Trailduster = @"Trailduster"; // 1980-1981
 static NSString* const Turismo = @"Turismo"; // 1983-1987
 static NSString* const Volare = @"Volare"; // 1980
// static NSString* const Voyager = @"Voyager"; // 1980-2000 // Repeat of Chrysler model

static NSString* const Pontiac = @"Pontiac";
 static NSString* const One000 = @"1000"; // 1983-1987
// static NSString* const Two000 = @"2000"; // 1983 // Repeat of Dodge model
 static NSString* const Two000Sunbird = @"2000 Sunbird"; // 1983-1984
 static NSString* const Six000 = @"6000"; // 1982-1991
 static NSString* const Acadian = @"Acadian"; // 1980-1987
 static NSString* const Aztek = @"Aztek"; // 2001-2005
 static NSString* const Bonneville = @"Bonneville"; // 1980-2005
 static NSString* const Catalina = @"Catalina"; // 1980-1981
 static NSString* const Fiero = @"Fiero"; // 1984-1988
 static NSString* const Firebird = @"Firebird"; // 1980-2002
 static NSString* const Firefly = @"Firefly"; // 1985-1991, 1994-2000
 static NSString* const G3 = @"G3"; // 2009-2010
 static NSString* const G3Wave = @"G3 Wave"; // 2009
 static NSString* const G5 = @"G5"; // 2007-2010
 static NSString* const G5Pursuit = @"G5 Pursuit"; // 2006-2007
 static NSString* const G6 = @"G6"; // 2005-2010
 static NSString* const G8 = @"G8"; // 2008-2009
 static NSString* const GrandAm = @"Grand Am"; // 1980, 1985-2005
 static NSString* const GrandLeMans = @"Grand LeMans"; // 1980-1983
 static NSString* const GrandPrix = @"Grand Prix"; // 1980-2008
 static NSString* const GTO = @"GTO"; // 2004-2006
 static NSString* const J2000 = @"J2000"; // 1982
 static NSString* const Laurentian = @"Laurentian"; // 1980-1981
 static NSString* const LeMans = @"LeMans"; // 1980-1981, 1988-1993
 static NSString* const Montana = @"Montana"; // 1999-2005
 static NSString* const MontanaSV6 = @"Montana SV6"; // 2005-2009
 static NSString* const Parisienne = @"Parisienne"; // 1980-1986
 static NSString* const Phoenix = @"Phoenix"; // 1980-1984
 static NSString* const Pursuit = @"Pursuit"; // 2005
// static NSString* const Safari = @"Safari"; // 1987-1989 // Repeat of GMC model
 static NSString* const Solstice = @"Solstice"; // 2006-2010
 static NSString* const Sunbird = @"Sunbird"; // 1980, 1985-1994
 static NSString* const Sunburst = @"Sunburst"; // 1985-1987
 static NSString* const Sunfire = @"Sunfire"; // 1995-2005
 static NSString* const Sunrunner = @"Sunrunner"; // 1994-1997
 static NSString* const T1000 = @"T1000"; // 1981-1982
 static NSString* const Tempest = @"Tempest"; // 1987-1991
 static NSString* const Torrent = @"Torrent"; // 2006-2009
 static NSString* const TransSport = @"Trans Sport"; // 1990-1998
 static NSString* const Vibe = @"Vibe"; // 2003-2010
 static NSString* const Wave = @"Wave"; // 2005-2008

static NSString* const RAM = @"RAM";
 static NSString* const One500 = @"1500"; // 2013-2014
 static NSString* const Two500HD = @"2500 HD"; // 2013-2014
 static NSString* const Three500HD = @"3500 HD"; // 2013-2014
 static NSString* const CSlashV = @"C/V"; // 2012
 static NSString* const CSlashVTradesman = @"C/V Tradesman"; // 2013-2014
 static NSString* const CargoVan = @"CargoVan"; // 2012-2015
// static NSString* const Dakota = @"Dakota"; // 2011 // Repeat of Dodge model
// static NSString* const Pickup = @"Pickup"; // 2011-2012 // Repeat
 static NSString* const ProMaster1500 = @"ProMaster 1500"; // 2014
 static NSString* const ProMaster2500 = @"ProMaster 2500"; // 2014
 static NSString* const ProMaster3500 = @"ProMaster 3500"; // 2014

static NSString* const Saturn = @"Saturn";
 static NSString* const Astra = @"Astra"; // 2008-2009
 static NSString* const Aura = @"Aura"; // 2007-2009
 static NSString* const Ion1 = @"Ion 1"; // 2003-2005
 static NSString* const Ion2 = @"Ion 2"; // 2003-2007
 static NSString* const Ion3 = @"Ion 3"; // 2003-2007
 static NSString* const IonRedLine = @"Ion Red Line"; // 2004-2007
 static NSString* const L100 = @"L100"; // 2001-2002
 static NSString* const L200 = @"L200"; // 2001-2003
 static NSString* const L300 = @"L300"; // 2001-2005
// static NSString* const LS = @"LS"; // 2000 // Repeat of Lincoln model
 static NSString* const LS1 = @"LS1"; // 2000
 static NSString* const LS2 = @"LS2"; // 2000
 static NSString* const LW1 = @"LW1"; // 2000
 static NSString* const LW2 = @"LW2"; // 2000
 static NSString* const LW200 = @"LW200"; // 2001-2003
 static NSString* const LW300 = @"LW300"; // 2001-2003
 static NSString* const Outlook = @"Outlook"; // 2007-2010
 static NSString* const Relay = @"Relay"; // 2005-2007
 static NSString* const SC = @"SC"; // 1991-1992
 static NSString* const SC1 = @"SC1"; // 1993-2002
 static NSString* const SC2 = @"SC2"; // 1993-2002
 static NSString* const Sky = @"Sky"; // 2007-2010
 static NSString* const SL = @"SL"; // 1991-2002
 static NSString* const SL1 = @"SL1"; // 1991-2002
 static NSString* const SL2 = @"SL2"; // 1991-2002
 static NSString* const SW1 = @"SW1"; // 1993-1999
 static NSString* const SW2 = @"SW2"; // 1993-2001
 static NSString* const Vue = @"Vue"; // 2002-2010

static NSString* const Scion = @"Scion";
 static NSString* const FRDashS = @"FR-S"; // 2013-2014
 static NSString* const iQ = @"iQ"; // 2012-2014
 static NSString* const tC = @"tC"; // 2005-2014
 static NSString* const xA = @"xA"; // 2004-2006
 static NSString* const xB = @"xB"; // 2004-2006, 2008-2014
 static NSString* const xD = @"xD"; // 2008-2014

static NSString* const Subaru = @"Subaru";
 static NSString* const B9Tribeca = @"B9 Tribeca"; // 2006-2007
 static NSString* const Baja = @"Baja"; // 2003-2006
 static NSString* const Brat = @"Brat"; // 1980-1987
 static NSString* const BRZ = @"BRZ"; // 2013-2014
 static NSString* const Chaser = @"Chaser"; // 1988-1989
 static NSString* const DL = @"DL"; // 1980-1989
 static NSString* const FE = @"FE"; // 1980
 static NSString* const Forester = @"Forester"; // 1998-2014
 static NSString* const GL = @"GL"; // 1980-1989
 static NSString* const GLDash10 = @"GL-10"; // 1985-1989
 static NSString* const GLF = @"GLF"; // 1980-1982
 static NSString* const Impreza = @"Impreza"; // 1993-2014
 static NSString* const ImprezaWRX = @"Impreza WRX"; // 2014
 static NSString* const Justy = @"Justy"; // 1987-1994
 static NSString* const Legacy = @"Legacy"; // 1990-2014
 static NSString* const Loyale = @"Loyale"; // 1990-1994
 static NSString* const Outback = @"Outback"; // 2000-2014
 static NSString* const RX = @"RX"; // 1985-1989
// static NSString* const Subaru = @"Subaru"; // 1980-1987 // Repeat
 static NSString* const SVX = @"SVX"; // 1992-1997
 static NSString* const Tribeca = @"Tribeca"; // 2008-2014
 static NSString* const WRX = @"WRX"; // 2015
 static NSString* const XT = @"XT"; // 1985-1991
 static NSString* const XT6 = @"XT6"; // 1988-1991
 static NSString* const XVCrosstrek = @"XV Crosstrek"; // 2013-2014
 static NSString* const XVCrosstrekHybrid = @"XV Crosstrek Hybrid"; // 2014-2015

static NSString* const Suzuki = @"Suzuki";
 static NSString* const Aerio = @"Aerio"; // 2002-2007
 static NSString* const Equator = @"Equator"; // 2009-2012
 static NSString* const Esteem = @"Esteem"; // 1995-2002
 static NSString* const Forenza = @"Forenza"; // 2004-2008
 static NSString* const Forsa = @"Forsa"; // 1986-1988
 static NSString* const GrandVitara = @"Grand Vitara"; // 1999-2013
 static NSString* const Kizashi = @"Kizashi"; // 2010-2013
 static NSString* const Reno = @"Reno"; // 2005-2008
 static NSString* const Samurai = @"Samurai"; // 1985-1995
 static NSString* const Sidekick = @"Sidekick"; // 1989-1998
 static NSString* const Swift = @"Swift"; // 1989-2001
 static NSString* const SwiftPlus = @"Swift +"; // 2004-2009
 static NSString* const SX4 = @"SX4"; // 2007-2013
 static NSString* const Verona = @"Verona"; // 2004-2006
 static NSString* const Vitara = @"Vitara"; // 1999-2004
 static NSString* const XDash90 = @"X-90"; // 1996-1998
 static NSString* const XLDash7 = @"XL-7"; // 2001-2006
 static NSString* const XL7 = @"XL7"; // 2007-2009

static NSString* const Toyota = @"Toyota";
 static NSString* const FourRunner = @"4Runner"; // 1984-2014
 static NSString* const Avalon = @"Avalon"; // 1995-2014
 static NSString* const AvalonHybrid = @"AvalonHybrid"; // 2013-2015
 static NSString* const Camry = @"Camry"; // 1983-2014
 static NSString* const CamrySolara = @"Camry Solara"; // 1999-2008
 static NSString* const Celica = @"Celica"; // 1980-2005
 static NSString* const CelicaSupra = @"Celica Supra"; // 1980-1985
 static NSString* const Corolla = @"Corolla"; // 1980-2014
 static NSString* const CorollaTercel = @"Corolla Tercel"; // 1980-1982
 static NSString* const Corona = @"Corona"; // 1980-1982
 static NSString* const Cressida = @"Cressida"; // 1980-1992
 static NSString* const ECHO = @"ECHO"; // 2000-2005
 static NSString* const FJCruiser = @"FJ Cruiser"; // 2007-2014
 static NSString* const Highlander = @"Highlander"; // 2001-2014
 static NSString* const LandCruiser = @"Land Cruiser"; // 1980-2011, 2013-2014
 static NSString* const Matrix = @"Matrix"; // 2003-2013
 static NSString* const MR2 = @"MR2"; // 1985-1989, 1991-1995, 2000-2005
 static NSString* const Paseo = @"Paseo"; // 1992-1999
// static NSString* const Pickup = @"Pickup"; // 1980-1995 // Repeat
 static NSString* const Previa = @"Previa"; // 1991-1997
 static NSString* const Prius = @"Prius"; // 2001-2014
 static NSString* const PriusC = @"Prius C"; // 2012-2014
 static NSString* const PriusV = @"Prius V"; // 2012-2014
 static NSString* const RAV4 = @"RAV4"; // 1996-2014
 static NSString* const Sequoia = @"Sequoia"; // 2001-2014
 static NSString* const Sienna = @"Sienna"; // 1998-2014
 static NSString* const Starlet = @"Starlet"; // 1981-1984
 static NSString* const Supra = @"Supra"; // 1986-1998
 static NSString* const T100 = @"T100"; // 1993-1998
 static NSString* const Tacoma = @"Tacoma"; // 1995-2014
 static NSString* const Tercel = @"Tercel"; // 1983-1999
 static NSString* const Tundra = @"Tundra"; // 2000-2014
// static NSString* const Van = @"Van"; // 1984-1989 // Repeat
 static NSString* const Venza = @"Venza"; // 2009-2014
 static NSString* const Yaris = @"Yaris"; // 2006-2014

static NSString* const VehicleArrayFilename = @"VehicleArray.plist";
static NSString* const VehicleFilename = @"Vehicle.plist";

@interface Vehicle ()
@property (nonatomic) NSArray* _yearArray;
@property (nonatomic) NSArray* _makeArray;
@property (nonatomic) NSArray* _modelArray;
@property (nonatomic) NSMutableDictionary* _additionalVehicle;
@property (nonatomic) NSURL* _vehicleArrayURL;
@property (nonatomic) NSURL* _vehicleURL;
@property (nonatomic) NSMutableArray* _vehicleArray;
@property (nonatomic) NSDictionary* _vehicle;
@property (nonatomic) NSDictionary* _database;
@end

@implementation Vehicle

- (NSArray*) yearArray {
  return self._yearArray;
}

- (NSString*) year {
  return (NSString*)[self._additionalVehicle objectForKey:VehicleKeyYear];
}

- (NSInteger) yearIndex {
  return [self._yearArray indexOfObject:[self year]];
}

- (void) setYearAtIndex:(VehicleYearIndex)index {
  NSString* year = (NSString*)self._yearArray[index];
  [self._additionalVehicle setObject:year forKey:VehicleKeyYear];
  self._makeArray = (index == VehicleYearIndexOther)? [NSArray array] : [((NSDictionary*)[self._database objectForKey:year]).allKeys sortedArrayUsingComparator:^(id object1, id object2) {
    NSString* string1 = (NSString*)object1;
    NSString* string2 = (NSString*)object2;
    NSComparisonResult comparisonResult;
    if ([string1 isEqualToString:OTHER]) comparisonResult = NSOrderedDescending;
    else if ([string2 isEqualToString:OTHER]) comparisonResult = NSOrderedAscending;
    else comparisonResult = [string1 localizedCompare:string2];
    return comparisonResult;
  }];
  [self._additionalVehicle removeObjectForKey:VehicleKeyMake];
  [self._additionalVehicle removeObjectForKey:VehicleKeyModel];
  [self._additionalVehicle removeObjectForKey:VehicleKeyNote];
}

- (void) setYear:(NSString*)year {
  NSString* string = ([[NSCharacterSet whitespaceAndNewlineCharacterSet] isSupersetOfSet:[NSCharacterSet characterSetWithCharactersInString:year]])? OTHER : year;
  [self._additionalVehicle setObject:string forKey:VehicleKeyYear];
}

- (void) resetYear {
  [self._additionalVehicle removeObjectForKey:VehicleKeyYear];
  [self._additionalVehicle removeObjectForKey:VehicleKeyMake];
  [self._additionalVehicle removeObjectForKey:VehicleKeyModel];
  [self._additionalVehicle removeObjectForKey:VehicleKeyNote];
  self._makeArray = [NSArray array];
}

- (NSArray*) makeArray {
  return self._makeArray;
}

- (NSString*) make {
  return (NSString*)[self._additionalVehicle objectForKey:VehicleKeyMake];
}

- (NSInteger) makeIndex {
  return [self._makeArray indexOfObject:[self make]];
}

- (void) setMakeAtIndex:(NSInteger)index {
  NSString* make = (NSString*)self._makeArray[index];
  [self._additionalVehicle setObject:make forKey:VehicleKeyMake];
  self._modelArray = ([make isEqualToString:OTHER])? [NSArray array] : (NSArray*)[((NSDictionary*)[self._database objectForKey:[self year]]) objectForKey:make];
  [self._additionalVehicle removeObjectForKey:VehicleKeyModel];
  [self._additionalVehicle removeObjectForKey:VehicleKeyNote];
}

- (void) setMake:(NSString*)make {
  NSString* string = ([[NSCharacterSet whitespaceAndNewlineCharacterSet] isSupersetOfSet:[NSCharacterSet characterSetWithCharactersInString:make]])? OTHER : make;
  [self._additionalVehicle setObject:string forKey:VehicleKeyMake];
}

- (void) resetMake {
  [self._additionalVehicle removeObjectForKey:VehicleKeyMake];
  [self._additionalVehicle removeObjectForKey:VehicleKeyModel];
  [self._additionalVehicle removeObjectForKey:VehicleKeyNote];
  self._modelArray = [NSArray array];
}

- (NSArray*) modelArray {
  return self._modelArray;
}

- (NSString*) model {
  return (NSString*)[self._additionalVehicle objectForKey:VehicleKeyModel];
}

- (NSInteger) modelIndex {
  return [self._modelArray indexOfObject:[self model]];
}

- (void) setModelAtIndex:(NSInteger)index {
  [self._additionalVehicle setObject:(NSString*)self._modelArray[index] forKey:VehicleKeyModel];
  [self._additionalVehicle removeObjectForKey:VehicleKeyNote];
}

- (void) setModel:(NSString*)model {
  [self._additionalVehicle setObject:model forKey:VehicleKeyModel];
}

- (void) resetModel {
  [self._additionalVehicle removeObjectForKey:VehicleKeyModel];
  [self._additionalVehicle removeObjectForKey:VehicleKeyNote];
}

- (NSString*) note {
  return (NSString*)[self._additionalVehicle objectForKey:VehicleKeyNote];
}

- (void) setNote:(NSString*)note {
  ([[NSCharacterSet whitespaceAndNewlineCharacterSet] isSupersetOfSet:[NSCharacterSet characterSetWithCharactersInString:note]])? [self._additionalVehicle removeObjectForKey:VehicleKeyNote] : [self._additionalVehicle setObject:note forKey:VehicleKeyNote];
}

- (void) setYear:(NSString*)year make:(NSString*)make model:(NSString*)model note:(NSString*)note {
  [self setYear:year];
  [self setMake:make];
  [self setModel:model];
  [self setNote:note];
  [self save];
}

- (void) save {
  [self._vehicleArray addObject:self._additionalVehicle];
  [self._vehicleArray writeToURL:self._vehicleArrayURL atomically:YES];
  self._vehicle = [NSDictionary dictionaryWithDictionary:self._additionalVehicle];
  [self._vehicle writeToURL:self._vehicleURL atomically:YES];
  self._makeArray = [NSArray array];
  self._modelArray = [NSArray array];
  self._additionalVehicle = [NSMutableDictionary dictionaryWithSharedKeySet:[Vehicle sharedKeySet]];
}

- (void) reload {
  self._makeArray = [NSArray array];
  self._modelArray = [NSArray array];
  self._additionalVehicle = [NSMutableDictionary dictionaryWithSharedKeySet:[Vehicle sharedKeySet]];
}

- (NSArray*) vehicleArray {
  return [NSArray arrayWithArray:self._vehicleArray];
}

- (NSDictionary*) vehicle {
  return self._vehicle;
}

- (NSInteger) vehicleIndex {
  return [self._vehicleArray indexOfObject:self._vehicle];
}

- (void) setVehicleAtIndex:(NSInteger)index {
  self._vehicle = (NSDictionary*)self._vehicleArray[index];
  [self._vehicle writeToURL:self._vehicleURL atomically:YES];
}

- (void) removeVehicleAtIndex:(NSInteger)index {
  BOOL removingSelectedVehicle = (index == [self vehicleIndex]);
  [self._vehicleArray removeObjectAtIndex:index];
  if (self._vehicleArray.count == 0) {
    [[NSFileManager defaultManager] removeItemAtURL:self._vehicleArrayURL error:nil];
    self._vehicle = nil;
    [[NSFileManager defaultManager] removeItemAtURL:self._vehicleURL error:nil];
  }
  else {
    [self._vehicleArray writeToURL:self._vehicleArrayURL atomically:YES];
    if (removingSelectedVehicle) [self setVehicleAtIndex:0];
  }
}

- (void) moveVehicleFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex {
  NSDictionary* vehicle = (NSDictionary*)self._vehicleArray[fromIndex];
  if (fromIndex < toIndex) for (NSInteger index = fromIndex; index < toIndex; index++) [self._vehicleArray replaceObjectAtIndex:index withObject:(NSDictionary*)self._vehicleArray[index + 1]];
  else if (fromIndex > toIndex) for (NSInteger index = fromIndex; index > toIndex; index--) [self._vehicleArray replaceObjectAtIndex:index withObject:(NSDictionary*)self._vehicleArray[index - 1]];
  [self._vehicleArray replaceObjectAtIndex:toIndex withObject:vehicle];
  [self._vehicleArray writeToURL:self._vehicleArrayURL atomically:YES];
}

+ (id) sharedKeySet {
  return [NSDictionary sharedKeySetForKeys:[NSArray arrayWithObjects:VehicleKeyYear, VehicleKeyMake, VehicleKeyModel, VehicleKeyNote, nil]];
}

- (instancetype) init {
  if (self = [super init]) {
    self._yearArray = [NSArray arrayWithObjects:
                                          @"2015", @"2014", @"2013", @"2012", @"2011", @"2010",
      @"2009", @"2008", @"2007", @"2006", @"2005", @"2004", @"2003", @"2002", @"2001", @"2000",
      @"1999", @"1998", @"1997", @"1996", @"1995", @"1994", @"1993", @"1992", @"1991", @"1990",
      @"1989", @"1988", @"1987", @"1986", @"1985", @"1984", @"1983", @"1982", @"1981", @"1980",
      OTHER,
      nil];

    self._makeArray = [NSArray array];
    self._modelArray = [NSArray array];
    self._additionalVehicle = [NSMutableDictionary dictionaryWithSharedKeySet:[Vehicle sharedKeySet]];

    self._vehicleURL = [[Library documentURL] URLByAppendingPathComponent:VehicleFilename];
    self._vehicleArrayURL = [[Library documentURL] URLByAppendingPathComponent:VehicleArrayFilename];

    NSMutableArray* vehicleArray = [NSMutableArray arrayWithContentsOfURL:self._vehicleArrayURL];
    self._vehicleArray = (vehicleArray)? vehicleArray : [NSMutableArray array];

    NSDictionary* vehicle = [NSDictionary dictionaryWithContentsOfURL:self._vehicleURL];
    self._vehicle = (vehicle)? vehicle : nil;

    self._database = [NSDictionary dictionaryWithObjectsAndKeys:
      [NSDictionary dictionaryWithObjectsAndKeys:
        [NSArray arrayWithObjects:ILX, MDX, RDX, RLX, TLX, OTHER, nil], Acura,
        [NSArray arrayWithObjects:Enclave, Encore, LaCrosse, Regal, Verano, OTHER, nil], Buick,
        [NSArray arrayWithObjects:ATS, CTS, CTSDashV, ELR, Escalade, EscaladeESV, SRX, XTS, OTHER, nil], Cadillac,
        [NSArray arrayWithObjects:Camaro, CaptivaSport, CityExpress, Colorado, Corvette, Cruze, Equinox, Express1500, Express2500, Express3500, Impala, ImpalaLimited, Malibu, Silverado1500, Silverado2500HD, Silverado3500HD, Sonic, Spark, SparkEV, SS, Suburban, Tahoe, Traverse, Trax, Volt, OTHER, nil], Chevrolet,
        [NSArray arrayWithObjects:Two00, Three00, TownAndCountry, OTHER, nil], Chrysler,
        [NSArray arrayWithObjects:Challenger, Charger, Dart, Durango, GrandCaravan, Journey, Viper, OTHER, nil], Dodge,
        [NSArray arrayWithObjects:CDashMax, Edge, Escape, Expedition, ExpeditionEL, Explorer, FDash150, FDash250SuperDuty, FDash350SuperDuty, FDash450SuperDuty, Fiesta, Flex, Focus, FocusElectric, Fusion, FusionEnergi, Mustang, Taurus, Transit, OTHER, nil], Ford,
        [NSArray arrayWithObjects:Acadia, Canyon, Savana, Sierra1500, Sierra2500HD, Sierra3500HD, Terrain, Yukon, YukonXL, OTHER, nil], GMC,
        [NSArray arrayWithObjects:Accord, Civic, CRDashV, CRDashZ, Crosstour, Fit, Odyssey, Pilot, OTHER, nil], Honda,
        [NSArray arrayWithObjects:Accent, Azera, Elantra, ElantraGT, Equus, Genesis, GenesisCoupe, SantaFe, SantaFeSport, Sonata, SonataHybrid, Tucson, Veloster, OTHER, nil], Hyundai,
        [NSArray arrayWithObjects:Q40, Q50, Q60, Q70, QX50, QX60, QX70, QX80, OTHER, nil], Infiniti,
        [NSArray arrayWithObjects:Cherokee, Compass, GrandCherokee, Patriot, Renegade, Wrangler, OTHER, nil], Jeep,
        [NSArray arrayWithObjects:Cadenza, Forte, ForteKoup, K900, Optima, OptimaHybrid, Rio, Sedona, Sorento, Soul, SoulEV, Sportage, OTHER, nil], Kia,
        [NSArray arrayWithObjects:CT200h, ES300h, ES350, GS350, GS450h, GX460, IS250, IS250C, IS350, IS350C, LS460, LS600h, LX570, NX200t, NX300h, RC350, RCF, RX350, RX450h, OTHER, nil], Lexus,
        [NSArray arrayWithObjects:MKC, MKS, MKT, MKX, MKZ, Navigator, NavigatorL, OTHER, nil], Lincoln,
        [NSArray arrayWithObjects:CXDash5, CXDash9, Three, Five, Six, MXDash5Miata, OTHER, nil], Mazda,
        [NSArray arrayWithObjects:Lancer, Mirage, Outlander, OutlanderSport, OTHER, nil], Mitsubishi,
        [NSArray arrayWithObjects:Three70Z, Altima, Armada, Frontier, GTDashR, Juke, Leaf, Murano, NV1500, NV200, NVP, Pathfinder, Quest, Rogue, RogueSelect, Sentra, Titan, Versa, VersaNote, Xterra, OTHER, nil], Nissan,
        [NSArray arrayWithObjects:One500, Two500HD, Three500HD, CargoVan, ProMaster1500, ProMaster2500, ProMaster3500, OTHER, nil], RAM,
        [NSArray arrayWithObjects:FRDashS, iQ, tC, xB, OTHER, nil], Scion,
        [NSArray arrayWithObjects:BRZ, Forester, Impreza, Legacy, Outback, WRX, XVCrosstrek, XVCrosstrekHybrid, OTHER, nil], Subaru,
        [NSArray arrayWithObjects:FourRunner, Avalon, AvalonHybrid, Camry, Corolla, Highlander, LandCruiser, Prius, PriusC, PriusV, RAV4, Sequoia, Sienna, Tacoma, Tundra, Venza, Yaris, OTHER, nil], Toyota,
        [NSArray arrayWithObjects:OTHER, nil], OTHER,
        nil], self._yearArray[VehicleYearIndex2015],

      [NSDictionary dictionaryWithObjectsAndKeys:
        [NSArray arrayWithObjects:ILX, MDX, RDX, RLX, TL, TSX, nil], Acura,
        [NSArray arrayWithObjects:Enclave, Encore, LaCrosse, Regal, Verano, nil], Buick,
        [NSArray arrayWithObjects:ATS, CTS, ELR, Escalade, EscaladeESV, SRX, XTS, nil], Cadillac,
        [NSArray arrayWithObjects:Camaro, Caprice, CaptivaSport, Corvette, Cruze, Equinox, Express1500, Express2500, Express3500, Impala, ImpalaLimited, Malibu, Orlando, Silverado1500, Silverado2500HD, Silverado3500HD, Sonic, Spark, SparkEV, SS, Suburban1500, Tahoe, Traverse, Trax, Volt, nil], Chevrolet,
        [NSArray arrayWithObjects:Two00, Three00, TownAndCountry, nil], Chrysler,
        [NSArray arrayWithObjects:Avenger, Challenger, Charger, Dart, Durango, GrandCaravan, Journey, Viper, nil], Dodge,
        [NSArray arrayWithObjects:CDashMax, EDash150, EDash250SuperDuty, EDash350SuperDuty, EDash450SuperDuty, Edge, Escape, Expedition, Explorer, FDash150, FDash250SuperDuty, FDash350SuperDuty, FDash450SuperDuty, FDash550SuperDuty, Fiesta, Flex, Focus, Fusion, FusionEnergi, Mustang, Taurus, TransitConnect, nil], Ford,
        [NSArray arrayWithObjects:Acadia, Savana1500, Savana2500, Savana3500, Sierra1500, Sierra2500HD, Sierra3500HD, Terrain, Yukon, YukonXL1500, nil], GMC,
        [NSArray arrayWithObjects:Accord, Civic, CRDashV, CRDashZ, Crosstour, Fit, Insight, Odyssey, Pilot, Ridgeline, nil], Honda,
        [NSArray arrayWithObjects:Accent, Azera, Elantra, ElantraCoupe, ElantraGT, Equus, Genesis, GenesisCoupe, SantaFe, SantaFeSport, SantaFeXL, Sonata, SonataHybrid, Tucson, Veloster, nil], Hyundai,
        [NSArray arrayWithObjects:Q50, Q60, Q70, QX50, QX60, QX70, QX80, nil], Infiniti,
        [NSArray arrayWithObjects:Cherokee, Compass, GrandCherokee, Patriot, Wrangler, nil], Jeep,
        [NSArray arrayWithObjects:Cadenza, Forte, ForteKoup, Optima, OptimaHybrid, Rio, Rondo, Sedona, Sorento, Soul, Sportage, nil], Kia,
        [NSArray arrayWithObjects:CT200h, ES300h, ES350, GS350, GS450h, GX460, IS250, IS250C, IS350, IS350C, ISF, LS460, LS600h, LX570, RX350, RX450h, nil], Lexus,
        [NSArray arrayWithObjects:MKS, MKT, MKX, MKZ, Navigator, nil], Lincoln,
        [NSArray arrayWithObjects:Two, Three, Five, Six, CXDash5, CXDash9, MXDash5Miata, nil], Mazda,
        [NSArray arrayWithObjects:iDashMiEV, Lancer, Mirage, Outlander, OutlanderSport, RVR, nil], Mitsubishi,
        [NSArray arrayWithObjects:Three70Z, Altima, Armada, Cube, Frontier, GTDashR, Juke, Leaf, Maxima, Murano, NV1500, NV200, NV2500HD, NV3500HD, NVP, Pathfinder, Quest, Rogue, RogueSelect, Sentra, Titan, Versa, VersaNote, Xterra, nil], Nissan,
        [NSArray arrayWithObjects:One500, Two500HD, Three500HD, CSlashVTradesman, ProMaster1500, ProMaster2500, ProMaster3500, nil], RAM,
        [NSArray arrayWithObjects:FRDashS, iQ, tC, xB, xD, nil], Scion,
        [NSArray arrayWithObjects:BRZ, Forester, Impreza, ImprezaWRX, Legacy, Outback, Tribeca, XVCrosstrek, nil], Subaru,
        [NSArray arrayWithObjects:FourRunner, Avalon, Camry, Corolla, FJCruiser, Highlander, LandCruiser, Prius, PriusC, PriusV, RAV4, Sequoia, Sienna, Tacoma, Tundra, Venza, Yaris, nil], Toyota,
        [NSArray arrayWithObjects:OTHER, nil], OTHER,
        nil], self._yearArray[VehicleYearIndex2014],

      [NSDictionary dictionaryWithObjectsAndKeys:
        [NSArray arrayWithObjects:ILX, MDX, RDX, TL, TSX, ZDX, nil], Acura,
        [NSArray arrayWithObjects:Enclave, Encore, LaCrosse, Regal, Verano, nil], Buick,
        [NSArray arrayWithObjects:ATS, CTS, Escalade, EscaladeESV, EscaladeEXT, SRX, XTS, nil], Cadillac,
        [NSArray arrayWithObjects:Avalanche, Camaro, Caprice, CaptivaSport, Corvette, Cruze, Equinox, Express, Impala, Malibu, Orlando, Silverado1500, Silverado2500HD, Silverado3500HD, Sonic, Spark, Suburban, Tahoe, Traverse, Trax, Volt, nil], Chevrolet,
        [NSArray arrayWithObjects:Two00, Three00, TownAndCountry, nil], Chrysler,
        [NSArray arrayWithObjects:Avenger, Challenger, Charger, Dart, Durango, GrandCaravan, Journey, Viper, nil], Dodge,
        [NSArray arrayWithObjects:CDashMax, EDash150, EDash250SuperDuty, EDash350SuperDuty, EDash450SuperDuty, Edge, Escape, Expedition, Explorer, FDash150, FDash250SuperDuty, FDash350SuperDuty, FDash450SuperDuty, FDash550SuperDuty, Fiesta, Flex, Focus, Fusion, FusionEnergi, Mustang, Taurus, TransitConnect, nil], Ford,
        [NSArray arrayWithObjects:Acadia, Savana, Sierra1500, Sierra2500HD, Sierra3500HD, Terrain, Yukon, YukonXL, nil], GMC,
        [NSArray arrayWithObjects:Accord, Civic, CRDashV, CRDashZ, Crosstour, Fit, Insight, Odyssey, Pilot, Ridgeline, nil], Honda,
        [NSArray arrayWithObjects:Accent, Azera, Elantra, ElantraGT, Equus, Genesis, GenesisCoupe, SantaFe, SantaFeSport, Sonata, SonataHybrid, Tucson, Veloster, nil], Hyundai,
        [NSArray arrayWithObjects:EX37, FX37, FX50, G37, JX35, M35h, M37, M56, QX56, nil], Infiniti,
        [NSArray arrayWithObjects:Compass, GrandCherokee, Patriot, Wrangler, nil], Jeep,
        [NSArray arrayWithObjects:Forte, ForteKoup, Optima, OptimaHybrid, Rio, Sorento, Soul, Sportage, nil], Kia,
        [NSArray arrayWithObjects:CT200h, ES300h, ES350, GS350, GS450h, GX460, IS250, IS250C, IS350, IS350C, ISF, LS460, LS460L, LS600hL, LX570, RX350, RX450h, nil], Lexus,
        [NSArray arrayWithObjects:MKS, MKT, MKX, MKZ, Navigator, nil], Lincoln,
        [NSArray arrayWithObjects:Two, Three, Five, Six, CXDash5, CXDash9, MXDash5Miata, nil], Mazda,
        [NSArray arrayWithObjects:Lancer, Outlander, OutlanderSport, RVR, nil], Mitsubishi,
        [NSArray arrayWithObjects:Three70Z, Altima, Armada, Cube, Frontier, GTDashR, Juke, Leaf, Maxima, Murano, NV1500, NV200, NV2500HD, NV3500HD, NVP, Pathfinder, Quest, Rogue, Sentra, Titan, Versa, Xterra, nil], Nissan,
        [NSArray arrayWithObjects:One500, Two500HD, Three500HD, CSlashVTradesman, nil], RAM,
        [NSArray arrayWithObjects:FRDashS, iQ, tC, xB, xD, nil], Scion,
        [NSArray arrayWithObjects:BRZ, Forester, Impreza, Legacy, Outback, Tribeca, XVCrosstrek, nil], Subaru,
        [NSArray arrayWithObjects:GrandVitara, Kizashi, SX4, nil], Suzuki,
        [NSArray arrayWithObjects:FourRunner, Avalon, Camry, Corolla, FJCruiser, Highlander, LandCruiser, Matrix, Prius, PriusC, PriusV, RAV4, Sequoia, Sienna, Tacoma, Tundra, Venza, Yaris, nil], Toyota,
        [NSArray arrayWithObjects:OTHER, nil], OTHER,
        nil], self._yearArray[VehicleYearIndex2013],

      [NSDictionary dictionaryWithObjectsAndKeys:
        [NSArray arrayWithObjects:MDX, RDX, RL, TL, TSX, ZDX, nil], Acura,
        [NSArray arrayWithObjects:Enclave, LaCrosse, Regal, Verano, nil], Buick,
        [NSArray arrayWithObjects:CTS, Escalade, EscaladeESV, EscaladeEXT, SRX, nil], Cadillac,
        [NSArray arrayWithObjects:Avalanche, Camaro, Caprice, CaptivaSport, ChevyExpress, Colorado, Corvette, Cruze, Equinox, Impala, Malibu, Orlando, Silverado, Sonic, Suburban, Tahoe, Traverse, Volt, nil], Chevrolet,
        [NSArray arrayWithObjects:Two00, Three00, TownAndCountry, nil], Chrysler,
        [NSArray arrayWithObjects:Avenger, Caliber, Challenger, Charger, Durango, GrandCaravan, Journey, nil], Dodge,
        [NSArray arrayWithObjects:E450SuperDuty, Econoline, Edge, Escape, Expedition, ExpeditionEL, ExpeditionMAX, Explorer, F450SuperDuty, F550SuperDuty, Fiesta, Flex, Focus, Fusion, Mustang, Pickup, Taurus, TransitConnect, nil], Ford,
        [NSArray arrayWithObjects:Acadia, Canyon, Savana, Sierra, Terrain, Yukon, YukonXL, nil], GMC,
        [NSArray arrayWithObjects:Accord, Civic, CRDashV, CRDashZ, Crosstour, Fit, Insight, Odyssey, Pilot, Ridgeline, nil], Honda,
        [NSArray arrayWithObjects:Accent, Azera, Elantra, ElantraTouring, Equus, Genesis, GenesisCoupe, SantaFe, Sonata, Tucson, Veloster, Veracruz, nil], Hyundai,
        [NSArray arrayWithObjects:EX35, FX35, FX50, G25, G37, M35h, M37, M56, QX56, nil], Infiniti,
        [NSArray arrayWithObjects:Compass, GrandCherokee, Liberty, Patriot, Wrangler, nil], Jeep,
        [NSArray arrayWithObjects:Forte, ForteKoup, Optima, Rio, Rondo, Sedona, Sorento, Soul, Sportage, nil], Kia,
        [NSArray arrayWithObjects:CT200h, ES350, GX460, HS250h, IS250, IS250C, IS350, IS350C, ISF, LFA, LS460, LS460L, LS600hL, RX350, RX450h, nil], Lexus,
        [NSArray arrayWithObjects:MKS, MKT, MKX, MKZ, Navigator, NavigatorL, nil], Lincoln,
        [NSArray arrayWithObjects:Two, Three, Five, Six, CXDash7, CXDash9, MXDash5Miata, nil], Mazda,
        [NSArray arrayWithObjects:Eclipse, Galant, iDashMiEV, Lancer, Outlander, OutlanderSport, RVR, nil], Mitsubishi,
        [NSArray arrayWithObjects:Three70Z, Altima, Armada, Cube, Frontier, GTDashR, Juke, Leaf, Maxima, Murano, NV1500, NV2500HD, NV3500HD, Pathfinder, Quest, Rogue, Sentra, Titan, Versa, Xterra, nil], Nissan,
        [NSArray arrayWithObjects:CSlashV, Pickup, nil], RAM,
        [NSArray arrayWithObjects:iQ, tC, xB, xD, nil], Scion,
        [NSArray arrayWithObjects:Forester, Impreza, Legacy, Outback, Tribeca, nil], Subaru,
        [NSArray arrayWithObjects:Equator, GrandVitara, Kizashi, SX4, nil], Suzuki,
        [NSArray arrayWithObjects:FourRunner, Avalon, Camry, Corolla, FJCruiser, Highlander, Matrix, Prius, PriusC, PriusV, RAV4, Sequoia, Sienna, Tacoma, Tundra, Venza, Yaris, nil], Toyota,
        [NSArray arrayWithObjects:OTHER, nil], OTHER,
        nil], self._yearArray[VehicleYearIndex2012],

      [NSDictionary dictionaryWithObjectsAndKeys:
        [NSArray arrayWithObjects:CSX, MDX, RDX, RL, TL, TSX, ZDX, nil], Acura,
        [NSArray arrayWithObjects:Enclave, LaCrosse, Lucerne, Regal, nil], Buick,
        [NSArray arrayWithObjects:CTS, DTS, Escalade, EscaladeESV, EscaladeEXT, SRX, STS, nil], Cadillac,
        [NSArray arrayWithObjects:Avalanche, Aveo, Camaro, Caprice, ChevyExpress, Colorado, Corvette, Cruze, Equinox, HHR, Impala, Malibu, Silverado, Suburban, Tahoe, Traverse, Volt, nil], Chevrolet,
        [NSArray arrayWithObjects:Two00, Three00, TownAndCountry, nil], Chrysler,
        [NSArray arrayWithObjects:Avenger, Caliber, Challenger, Charger, Durango, GrandCaravan, Journey, Nitro, nil], Dodge,
        [NSArray arrayWithObjects:CrownVictoria, E450SuperDuty, Econoline, Edge, Escape, Expedition, ExpeditionEL, ExpeditionMAX, Explorer, F450SuperDuty, F550SuperDuty, Fiesta, Flex, Focus, Fusion, Mustang, Pickup, Ranger, Taurus, TransitConnect, nil], Ford,
        [NSArray arrayWithObjects:Acadia, Canyon, Savana, SavanaCamperSpecial, SavanaSpecial, Sierra, Terrain, Yukon, YukonXL, nil], GMC,
        [NSArray arrayWithObjects:Accord, AccordCrosstour, Civic, CRDashV, CRDashZ, Element, Fit, Insight, Odyssey, Pilot, Ridgeline, nil], Honda,
        [NSArray arrayWithObjects:Accent, Azera, Elantra, ElantraTouring, Equus, Genesis, GenesisCoupe, SantaFe, Sonata, Tucson, Veracruz, nil], Hyundai,
        [NSArray arrayWithObjects:EX35, FX35, FX50, G25, G37, M37, M56, QX56, nil], Infiniti,
        [NSArray arrayWithObjects:Compass, GrandCherokee, Liberty, Patriot, Wrangler, nil], Jeep,
        [NSArray arrayWithObjects:Borrego, Forte, ForteKoup, Optima, Rio, Rio5, Rondo, Sedona, Sorento, Soul, Sportage, nil], Kia,
        [NSArray arrayWithObjects:CT200h, ES350, GS350, GS450h, GS460, GX460, HS250h, IS250, IS250C, IS350, IS350C, ISF, LS460, LS460L, LS600hL, LX570, RX350, RX450h, nil], Lexus,
        [NSArray arrayWithObjects:MKS, MKT, MKX, MKZ, Navigator, NavigatorL, TownCar, nil], Lincoln,
        [NSArray arrayWithObjects:Two, Three, Six, CXDash7, CXDash9, MXDash5Miata, RXDash8, Tribute, nil], Mazda,
        [NSArray arrayWithObjects:GrandMarquis, Mariner, Milan, nil], Mercury,
        [NSArray arrayWithObjects:Eclipse, Endeavor, Galant, Lancer, Outlander, OutlanderSport, RVR, nil], Mitsubishi,
        [NSArray arrayWithObjects:Three70Z, Altima, Armada, Cube, Frontier, GTDashR, Juke, Leaf, Maxima, Murano, Pathfinder, Quest, Rogue, Sentra, Titan, Versa, Xterra, nil], Nissan,
        [NSArray arrayWithObjects:Dakota, Pickup, nil], RAM,
        [NSArray arrayWithObjects:tC, xB, xD, nil], Scion,
        [NSArray arrayWithObjects:Forester, Impreza, Legacy, Outback, Tribeca, nil], Subaru,
        [NSArray arrayWithObjects:Equator, GrandVitara, Kizashi, SX4, nil], Suzuki,
        [NSArray arrayWithObjects:FourRunner, Avalon, Camry, Corolla, FJCruiser, Highlander, LandCruiser, Matrix, Prius, RAV4, Sequoia, Sienna, Tacoma, Tundra, Venza, Yaris, nil], Toyota,
        [NSArray arrayWithObjects:OTHER, nil], OTHER,
        nil], self._yearArray[VehicleYearIndex2011],

      [NSDictionary dictionaryWithObjectsAndKeys:
        [NSArray arrayWithObjects:CSX, MDX, RDX, RL, TL, TSX, ZDX, nil], Acura,
        [NSArray arrayWithObjects:Enclave, LaCrosse, Lucerne, nil], Buick,
        [NSArray arrayWithObjects:CTS, DTS, Escalade, EscaladeESV, EscaladeEXT, SRX, STS, nil], Cadillac,
        [NSArray arrayWithObjects:Avalanche, Aveo, Camaro, ChevyExpress, Cobalt, Colorado, Corvette, Equinox, HHR, Impala, Malibu, Silverado, Suburban, Tahoe, Traverse, nil], Chevrolet,
        [NSArray arrayWithObjects:Three00, PTCruiser, Sebring, TownAndCountry, nil], Chrysler,
        [NSArray arrayWithObjects:Avenger, Caliber, Challenger, Charger, Dakota, GrandCaravan, Journey, Nitro, Pickup, Viper, nil], Dodge,
        [NSArray arrayWithObjects:CrownVictoria, E450SuperDuty, Econoline, Edge, Escape, Expedition, ExpeditionEL, ExpeditionMAX, Explorer, ExplorerSportTrac, F450SuperDuty, F550SuperDuty, Flex, Focus, Fusion, Mustang, Pickup, Ranger, Taurus, TransitConnect, nil], Ford,
        [NSArray arrayWithObjects:Acadia, Canyon, Savana, SavanaCamperSpecial, SavanaSpecial, Sierra, Terrain, Yukon, YukonXL, nil], GMC,
        [NSArray arrayWithObjects:Accord, AccordCrosstour, Civic, CRDashV, Element, Fit, Insight, Odyssey, Pilot, Ridgeline, nil], Honda,
        [NSArray arrayWithObjects:H3, H3T, nil], Hummer,
        [NSArray arrayWithObjects:Accent, Azera, Elantra, ElantraTouring, Genesis, GenesisCoupe, SantaFe, Sonata, Tucson, Veracruz, nil], Hyundai,
        [NSArray arrayWithObjects:EX35, FX35, FX50, G37, M35, M45, QX56, nil], Infiniti,
        [NSArray arrayWithObjects:Commander, Compass, GrandCherokee, Liberty, Patriot, Wrangler, nil], Jeep,
        [NSArray arrayWithObjects:Borrego, Forte, ForteKoup, Magentis, Optima, Rio, Rio5, Rondo, Sedona, Soul, Sportage, nil], Kia,
        [NSArray arrayWithObjects:ES350, GS350, GS450h, GS460, GX460, HS250h, IS250, IS250C, IS350, IS350C, ISF, LS460, LS460L, LS600hL, LX570, RX350, RX450h, SC430, nil], Lexus,
        [NSArray arrayWithObjects:MKS, MKT, MKX, MKZ, Navigator, NavigatorL, TownCar, nil], Lincoln,
        [NSArray arrayWithObjects:Three, Five, Six, B2300, B4000, CXDash7, CXDash9, MXDash5Miata, RXDash8, Tribute, nil], Mazda,
        [NSArray arrayWithObjects:GrandMarquis, Mariner, Milan, Mountaineer, nil], Mercury,
        [NSArray arrayWithObjects:Eclipse, Endeavor, Galant, Lancer, Outlander, nil], Mitsubishi,
        [NSArray arrayWithObjects:Three70Z, Altima, Armada, Cube, Frontier, GTDashR, Maxima, Murano, Pathfinder, Rogue, Sentra, Titan, Versa, Xterra, nil], Nissan,
        [NSArray arrayWithObjects:G3, G5, G6, Solstice, Vibe, nil], Pontiac,
        [NSArray arrayWithObjects:Outlook, Sky, Vue, nil], Saturn,
        [NSArray arrayWithObjects:tC, xB, xD, nil], Scion,
        [NSArray arrayWithObjects:Forester, Impreza, Legacy, Outback, Tribeca, nil], Subaru,
        [NSArray arrayWithObjects:Equator, GrandVitara, Kizashi, SX4, nil], Suzuki,
        [NSArray arrayWithObjects:FourRunner, Avalon, Camry, Corolla, FJCruiser, Highlander, LandCruiser, Matrix, Prius, RAV4, Sequoia, Sienna, Tacoma, Tundra, Venza, Yaris, nil], Toyota,
        [NSArray arrayWithObjects:OTHER, nil], OTHER,
        nil], self._yearArray[VehicleYearIndex2010],

      [NSDictionary dictionaryWithObjectsAndKeys:
        [NSArray arrayWithObjects:CSX, MDX, RDX, RL, TL, TSX, nil], Acura,
        [NSArray arrayWithObjects:Allure, Enclave, LaCrosse, Lucerne, nil], Buick,
        [NSArray arrayWithObjects:CTS, DTS, Escalade, EscaladeESV, EscaladeEXT, SRX, STS, XLR, nil], Cadillac,
        [NSArray arrayWithObjects:Avalanche, Aveo, ChevyExpress, Cobalt, Colorado, Corvette, Equinox, HHR, Impala, Malibu, Silverado, Suburban, Tahoe, TrailBlazer, Traverse, Uplander, nil], Chevrolet,
        [NSArray arrayWithObjects:Three00, Aspen, PTCruiser, Sebring, TownAndCountry, nil], Chrysler,
        [NSArray arrayWithObjects:Avenger, Caliber, Challenger, Charger, Dakota, Durango, GrandCaravan, Journey, Nitro, Pickup, Sprinter, Viper, nil], Dodge,
        [NSArray arrayWithObjects:CrownVictoria, E450SuperDuty, Econoline, Edge, Escape, Expedition, ExpeditionEL, ExpeditionMAX, Explorer, ExplorerSportTrac, F450SuperDuty, F550SuperDuty, Flex, Focus, Fusion, Mustang, Pickup, Ranger, Taurus, TaurusX, nil], Ford,
        [NSArray arrayWithObjects:Acadia, Canyon, Envoy, Savana, SavanaCamperSpecial, SavanaSpecial, Sierra, Yukon, YukonXL, nil], GMC,
        [NSArray arrayWithObjects:Accord, Civic, CRDashV, Element, Fit, Odyssey, Pilot, Ridgeline, S2000, nil], Honda,
        [NSArray arrayWithObjects:H2, H3, H3T, nil], Hummer,
        [NSArray arrayWithObjects:Accent, Azera, Elantra, ElantraTouring, Entourage, Genesis, SantaFe, Sonata, Tucson, Veracruz, nil], Hyundai,
        [NSArray arrayWithObjects:EX35, FX35, FX50, G37, M35, M45, QX56, nil], Infiniti,
        [NSArray arrayWithObjects:Commander, Compass, GrandCherokee, Liberty, Patriot, Wrangler, nil], Jeep,
        [NSArray arrayWithObjects:Amanti, Borrego, Magentis, Optima, Rio, Rio5, Rondo, Sedona, Sorento, Spectra, Spectra5, Sportage, nil], Kia,
        [NSArray arrayWithObjects:ES350, GS350, GS450h, GS460, GX470, IS250, IS350, ISF, LS460, LS460L, LS600hL, LX570, RX350, SC430, nil], Lexus,
        [NSArray arrayWithObjects:MKS, MKX, MKZ, Navigator, NavigatorL, TownCar, nil], Lincoln,
        [NSArray arrayWithObjects:Three, Five, Six, B2300, B4000, CXDash7, CXDash9, MXDash5Miata, RXDash8, Tribute, nil], Mazda,
        [NSArray arrayWithObjects:GrandMarquis, Mariner, Milan, Mountaineer, Sable, nil], Mercury,
        [NSArray arrayWithObjects:Eclipse, Endeavor, Galant, Lancer, Outlander, Raider, nil], Mitsubishi,
        [NSArray arrayWithObjects:Three50Z, Three70Z, Altima, Armada, Cube, Frontier, GTDashR, Maxima, Murano, Pathfinder, Quest, Rogue, Sentra, Titan, Versa, Xterra, nil], Nissan,
        [NSArray arrayWithObjects:G3, G3Wave, G5, G6, G8, MontanaSV6, Solstice, Torrent, Vibe, nil], Pontiac,
        [NSArray arrayWithObjects:Astra, Aura, Outlook, Sky, Vue, nil], Saturn,
        [NSArray arrayWithObjects:tC, xB, xD, nil], Scion,
        [NSArray arrayWithObjects:Forester, Impreza, Legacy, Outback, Tribeca, nil], Subaru,
        [NSArray arrayWithObjects:Equator, GrandVitara, SwiftPlus, SX4, XL7, nil], Suzuki,
        [NSArray arrayWithObjects:FourRunner, Avalon, Camry, Corolla, FJCruiser, Highlander, LandCruiser, Matrix, Prius, RAV4, Sequoia, Sienna, Tacoma, Tundra, Venza, Yaris, nil], Toyota,
        [NSArray arrayWithObjects:OTHER, nil], OTHER,
        nil], self._yearArray[VehicleYearIndex2009],

      [NSDictionary dictionaryWithObjectsAndKeys:
        [NSArray arrayWithObjects:CSX, MDX, RDX, RL, TL, TSX, nil], Acura,
        [NSArray arrayWithObjects:Allure, Enclave, LaCrosse, Lucerne, nil], Buick,
        [NSArray arrayWithObjects:CTS, DTS, Escalade, EscaladeESV, EscaladeEXT, SRX, STS, XLR, nil], Cadillac,
        [NSArray arrayWithObjects:Avalanche, Aveo, ChevyExpress, Cobalt, Colorado, Corvette, Equinox, HHR, Impala, Malibu, MalibuClassic, Optra, Optra5, Silverado, Suburban, Tahoe, TrailBlazer, Uplander, nil], Chevrolet,
        [NSArray arrayWithObjects:Three00, Aspen, Crossfire, Pacifica, PTCruiser, Sebring, TownAndCountry, nil], Chrysler,
        [NSArray arrayWithObjects:Avenger, Caliber, Challenger, Charger, Dakota, Durango, GrandCaravan, Magnum, Nitro, Pickup, Sprinter, Viper, nil], Dodge,
        [NSArray arrayWithObjects:CrownVictoria, E450SuperDuty, Econoline, Edge, Escape, Expedition, ExpeditionEL, ExpeditionMAX, Explorer, ExplorerSportTrac, F450SuperDuty, F550SuperDuty, Focus, Fusion, Mustang, Pickup, Ranger, Taurus, TaurusX, nil], Ford,
        [NSArray arrayWithObjects:Acadia, Canyon, Envoy, Savana, SavanaCamperSpecial, SavanaSpecial, Sierra, Yukon, YukonXL, nil], GMC,
        [NSArray arrayWithObjects:Accord, Civic, CRDashV, Element, Fit, Odyssey, Pilot, Ridgeline, S2000, nil], Honda,
        [NSArray arrayWithObjects:H2, H3, nil], Hummer,
        [NSArray arrayWithObjects:Accent, Azera, Elantra, Entourage, SantaFe, Sonata, Tiburon, Tucson, Veracruz, nil], Hyundai,
        [NSArray arrayWithObjects:EX35, FX35, FX45, G35, G37, M35, M45, QX56, nil], Infiniti,
        [NSArray arrayWithObjects:Ascender, iDash290, iDash370, nil], Isuzu,
        [NSArray arrayWithObjects:Commander, Compass, GrandCherokee, Liberty, Patriot, Wrangler, nil], Jeep,
        [NSArray arrayWithObjects:Amanti, Magentis, Optima, Rio, Rio5, Rondo, Sedona, Sorento, Spectra, Spectra5, Sportage, nil], Kia,
        [NSArray arrayWithObjects:ES350, GS350, GS450h, GS460, GX470, IS250, IS350, ISF, LS460, LS460L, LS600hL, LX570, RX350, RX400h, SC430, nil], Lexus,
        [NSArray arrayWithObjects:MarkLT, MKX, MKZ, Navigator, NavigatorL, TownCar, nil], Lincoln,
        [NSArray arrayWithObjects:Three, Five, Six, B2300, B3000, B4000, CXDash7, CXDash9, MXDash5Miata, RXDash8, Tribute, nil], Mazda,
        [NSArray arrayWithObjects:GrandMarquis, Mariner, Milan, Mountaineer, Sable, nil], Mercury,
        [NSArray arrayWithObjects:Eclipse, Endeavor, Galant, Lancer, Outlander, Raider, nil], Mitsubishi,
        [NSArray arrayWithObjects:Three50Z, Altima, Armada, Frontier, Maxima, Pathfinder, Quest, Rogue, Sentra, Titan, Versa, Xterra, nil], Nissan,
        [NSArray arrayWithObjects:G5, G6, G8, GrandPrix, MontanaSV6, Solstice, Torrent, Vibe, Wave, nil], Pontiac,
        [NSArray arrayWithObjects:Astra, Aura, Outlook, Sky, Vue, nil], Saturn,
        [NSArray arrayWithObjects:tC, xB, xD, nil], Scion,
        [NSArray arrayWithObjects:Forester, Impreza, Legacy, Outback, Tribeca, nil], Subaru,
        [NSArray arrayWithObjects:Forenza, GrandVitara, Reno, SwiftPlus, SX4, XL7, nil], Suzuki,
        [NSArray arrayWithObjects:FourRunner, Avalon, Camry, CamrySolara, Corolla, FJCruiser, Highlander, LandCruiser, Matrix, Prius, RAV4, Sequoia, Sienna, Tacoma, Tundra, Yaris, nil], Toyota,
        [NSArray arrayWithObjects:OTHER, nil], OTHER,
        nil], self._yearArray[VehicleYearIndex2008],

      [NSDictionary dictionaryWithObjectsAndKeys:
        [NSArray arrayWithObjects:CSX, MDX, RDX, RL, TL, TSX, nil], Acura,
        [NSArray arrayWithObjects:Allure, LaCrosse, Lucerne, Rainier, Rendezvous, Terraza, nil], Buick,
        [NSArray arrayWithObjects:CTS, DTS, Escalade, EscaladeESV, EscaladeEXT, SRX, STS, XLR, nil], Cadillac,
        [NSArray arrayWithObjects:Avalanche, Aveo, ChevyExpress, Cobalt, Colorado, Corvette, Equinox, HHR, Impala, Malibu, MonteCarlo, Optra, Optra5, Silverado, SilveradoClassic, Suburban, Tahoe, TrailBlazer, Uplander, nil], Chevrolet,
        [NSArray arrayWithObjects:Three00, Aspen, Crossfire, Pacifica, PTCruiser, Sebring, TownAndCountry, nil], Chrysler,
        [NSArray arrayWithObjects:Caliber, Caravan, Charger, Dakota, Durango, GrandCaravan, Magnum, Nitro, Pickup, Sprinter, nil], Dodge,
        [NSArray arrayWithObjects:CrownVictoria, E450SuperDuty, Econoline, Edge, Escape, Expedition, ExpeditionEL, ExpeditionMAX, Explorer, ExplorerSportTrac, F450SuperDuty, F550SuperDuty, FiveHundred, Focus, Freestar, Freestyle, Fusion, Mustang, Pickup, Ranger, Taurus, nil], Ford,
        [NSArray arrayWithObjects:Acadia, Canyon, Envoy, Savana, SavanaCamperSpecial, SavanaSpecial, Sierra, SierraClassic, Yukon, YukonXL, nil], GMC,
        [NSArray arrayWithObjects:Accord, Civic, CRDashV, Element, Fit, Odyssey, Pilot, Ridgeline, S2000, nil], Honda,
        [NSArray arrayWithObjects:H2, H3, nil], Hummer,
        [NSArray arrayWithObjects:Accent, Azera, Elantra, Entourage, SantaFe, Sonata, Tiburon, Tucson, Veracruz, nil], Hyundai,
        [NSArray arrayWithObjects:FX35, FX45, G35, M35, M45, QX56, nil], Infiniti,
        [NSArray arrayWithObjects:Ascender, iDash290, iDash370, nil], Isuzu,
        [NSArray arrayWithObjects:Commander, Compass, GrandCherokee, Liberty, Patriot, Wrangler, nil], Jeep,
        [NSArray arrayWithObjects:Amanti, Magentis, Optima, Rio, Rio5, Rondo, Sedona, Sorento, Spectra, Spectra5, Sportage, nil], Kia,
        [NSArray arrayWithObjects:ES350, GS350, GS430, GS450h, GX470, IS250, IS350, LS460, LS460L, LX470, RX350, RX400h, SC430, nil], Lexus,
        [NSArray arrayWithObjects:MarkLT, MKX, MKZ, Navigator, NavigatorL, TownCar, nil], Lincoln,
        [NSArray arrayWithObjects:Three, Five, Six, B2300, B3000, B4000, CXDash7, CXDash9, MXDash5Miata, RXDash8, nil], Mazda,
        [NSArray arrayWithObjects:GrandMarquis, Mariner, Milan, Montego, Monterey, Mountaineer, nil], Mercury,
        [NSArray arrayWithObjects:Eclipse, Endeavor, Galant, Lancer, Outlander, Raider, nil], Mitsubishi,
        [NSArray arrayWithObjects:Three50Z, Altima, Armada, Frontier, Maxima, Murano, Pathfinder, Quest, Sentra, Titan, Versa, XDashTrail, Xterra, nil], Nissan,
        [NSArray arrayWithObjects:G5, G5Pursuit, G6, GrandPrix, MontanaSV6, Solstice, Torrent, Vibe, Wave, nil], Pontiac,
        [NSArray arrayWithObjects:Aura, Ion2, Ion3, IonRedLine, Outlook, Relay, Sky, Vue, nil], Saturn,
        [NSArray arrayWithObjects:tC, nil], Scion,
        [NSArray arrayWithObjects:B9Tribeca, Forester, Impreza, Legacy, Outback, nil], Subaru,
        [NSArray arrayWithObjects:Aerio, Forenza, GrandVitara, Reno, SwiftPlus, SX4, XL7, nil], Suzuki,
        [NSArray arrayWithObjects:FourRunner, Avalon, Camry, CamrySolara, Corolla, FJCruiser, Highlander, LandCruiser, Matrix, Prius, RAV4, Sequoia, Sienna, Tacoma, Tundra, Yaris, nil], Toyota,
        [NSArray arrayWithObjects:OTHER, nil], OTHER,
        nil], self._yearArray[VehicleYearIndex2007],

      [NSDictionary dictionaryWithObjectsAndKeys:
        [NSArray arrayWithObjects:CSX, MDX, RL, RSX, TL, TSX, nil], Acura,
        [NSArray arrayWithObjects:Allure, LaCrosse, Lucerne, Rainier, Rendezvous, Terraza, nil], Buick,
        [NSArray arrayWithObjects:CTS, DTS, Escalade, EscaladeESV, EscaladeEXT, SRX, STS, XLR, nil], Cadillac,
        [NSArray arrayWithObjects:Avalanche, Aveo, ChevyExpress, Cobalt, Colorado, Corvette, Epica, Equinox, HHR, Impala, Malibu, MonteCarlo, Optra, Optra5, Silverado, SSR, Suburban, Tahoe, TrailBlazer, Uplander, nil], Chevrolet,
        [NSArray arrayWithObjects:Three00, Crossfire, Pacifica, PTCruiser, Sebring, TownAndCountry, nil], Chrysler,
        [NSArray arrayWithObjects:Caravan, Charger, Dakota, Durango, GrandCaravan, Magnum, Pickup, Sprinter, Stratus, Viper, nil], Dodge,
        [NSArray arrayWithObjects:CrownVictoria, E450SuperDuty, Econoline, Escape, Expedition, Explorer, F450SuperDuty, F550SuperDuty, FiveHundred, Focus, Freestar, Freestyle, Fusion, GT, Mustang, Pickup, Ranger, Taurus, nil], Ford,
        [NSArray arrayWithObjects:Canyon, Envoy, EnvoyXL, Savana, SavanaCamperSpecial, SavanaSpecial, Sierra, Yukon, YukonXL, nil], GMC,
        [NSArray arrayWithObjects:Accord, Civic, CRDashV, Element, Insight, Odyssey, Pilot, Ridgeline, S2000, nil], Honda,
        [NSArray arrayWithObjects:H1, H2, H3, nil], Hummer,
        [NSArray arrayWithObjects:Accent, Azera, Elantra, SantaFe, Sonata, Tiburon, Tucson, nil], Hyundai,
        [NSArray arrayWithObjects:FX35, FX45, G35, M35, M45, Q45, QX56, nil], Infiniti,
        [NSArray arrayWithObjects:Ascender, iDash280, iDash350, nil], Isuzu,
        [NSArray arrayWithObjects:Commander, GrandCherokee, Liberty, Wrangler, nil], Jeep,
        [NSArray arrayWithObjects:Amanti, Magentis, Optima, Rio, Rio5, Sedona, Sorento, Spectra, Spectra5, Sportage, nil], Kia,
        [NSArray arrayWithObjects:ES330, GS300, GS430, GX470, IS250, IS350, LS430, LX470, RX330, RX400h, SC430, nil], Lexus,
        [NSArray arrayWithObjects:LS, MarkLT, Navigator, TownCar, Zephyr, nil], Lincoln,
        [NSArray arrayWithObjects:Three, Five, Six, B2300, B3000, B4000, MPV, MXDash5Miata, RXDash8, Tribute, nil], Mazda,
        [NSArray arrayWithObjects:GrandMarquis, Mariner, Milan, Montego, Monterey, Mountaineer, nil], Mercury,
        [NSArray arrayWithObjects:Eclipse, Endeavor, Galant, Lancer, Montero, Outlander, Raider, nil], Mitsubishi,
        [NSArray arrayWithObjects:Three50Z, Altima, Armada, Frontier, Maxima, Murano, Pathfinder, Quest, Sentra, Titan, XDashTrail, Xterra, nil], Nissan,
        [NSArray arrayWithObjects:G5Pursuit, G6, GrandPrix, GTO, MontanaSV6, Solstice, Torrent, Vibe, Wave, nil], Pontiac,
        [NSArray arrayWithObjects:Ion2, Ion3, IonRedLine, Relay, Vue, nil], Saturn,
        [NSArray arrayWithObjects:tC, xA, xB, nil], Scion,
        [NSArray arrayWithObjects:B9Tribeca, Baja, Forester, Impreza, Legacy, Outback, nil], Subaru,
        [NSArray arrayWithObjects:Aerio, Forenza, GrandVitara, Reno, SwiftPlus, Verona, XLDash7, nil], Suzuki,
        [NSArray arrayWithObjects:FourRunner, Avalon, Camry, CamrySolara, Corolla, Highlander, LandCruiser, Matrix, Prius, RAV4, Sequoia, Sienna, Tacoma, Tundra, Yaris, nil], Toyota,
        [NSArray arrayWithObjects:OTHER, nil], OTHER,
        nil], self._yearArray[VehicleYearIndex2006],

      [NSDictionary dictionaryWithObjectsAndKeys:
        [NSArray arrayWithObjects:OneDot7EL, MDX, NSX, RL, RSX, TL, TSX, nil], Acura,
        [NSArray arrayWithObjects:Allure, Century, LaCrosse, LeSabre, ParkAvenue, Rainier, Rendezvous, Terraza, nil], Buick,
        [NSArray arrayWithObjects:CTS, DeVille, Escalade, EscaladeESV, EscaladeEXT, SRX, STS, XLR, nil], Cadillac,
        [NSArray arrayWithObjects:Astro, Avalanche, Aveo, Blazer, Cavalier, ChevyExpress, Classic, Cobalt, Colorado, Corvette, Epica, Equinox, Impala, Malibu, MonteCarlo, Optra, Optra5, Silverado, SSR, Suburban, Tahoe, TrailBlazer, Uplander, Venture, nil], Chevrolet,
        [NSArray arrayWithObjects:Three00, Crossfire, Pacifica, PTCruiser, Sebring, TownAndCountry, nil], Chrysler,
        [NSArray arrayWithObjects:Caravan, Dakota, Durango, GrandCaravan, Magnum, Neon, Pickup, Sprinter, SRTDash4, Stratus, SX, Viper, nil], Dodge,
        [NSArray arrayWithObjects:CrownVictoria, E450SuperDuty, Econoline, Escape, Excursion, Expedition, Explorer, ExplorerSportTrac, F450SuperDuty, F550SuperDuty, FiveHundred, Focus, Freestar, Freestyle, GT, Mustang, Pickup, Ranger, Taurus, Thunderbird, nil], Ford,
        [NSArray arrayWithObjects:Canyon, Envoy, EnvoyXL, EnvoyXUV, Jimmy, Safari, Savana, SavanaCamperSpecial, SavanaSpecial, Sierra, Yukon, YukonXL, nil], GMC,
        [NSArray arrayWithObjects:Accord, Civic, CRDashV, Element, Insight, Odyssey, Pilot, S2000, nil], Honda,
        [NSArray arrayWithObjects:H2, nil], Hummer,
        [NSArray arrayWithObjects:Accent, Elantra, SantaFe, Sonata, Tiburon, Tucson, XG350, nil], Hyundai,
        [NSArray arrayWithObjects:FX35, FX45, G35, Q45, QX56, nil], Infiniti,
        [NSArray arrayWithObjects:Ascender, nil], Isuzu,
        [NSArray arrayWithObjects:GrandCherokee, Liberty, Wrangler, nil], Jeep,
        [NSArray arrayWithObjects:Amanti, Magentis, Optima, Rio, Sedona, Sorento, Spectra, Spectra5, Sportage, nil], Kia,
        [NSArray arrayWithObjects:ES330, GS300, GS430, GX470, IS300, LS430, LX470, RX330, SC430, nil], Lexus,
        [NSArray arrayWithObjects:Aviator, LS, Navigator, TownCar, nil], Lincoln,
        [NSArray arrayWithObjects:Three, Six, B2300, B3000, B4000, MPV, MXDash5Miata, RXDash8, Tribute, nil], Mazda,
        [NSArray arrayWithObjects:GrandMarquis, Mariner, Montego, Monterey, Mountaineer, Sable, nil], Mercury,
        [NSArray arrayWithObjects:Eclipse, Endeavor, Galant, Lancer, Montero, Outlander, nil], Mitsubishi,
        [NSArray arrayWithObjects:Three50Z, Altima, Armada, Frontier, Maxima, Murano, Pathfinder, Quest, Sentra, Titan, XDashTrail, Xterra, nil], Nissan,
        [NSArray arrayWithObjects:Aztek, Bonneville, G6, GrandAm, GrandPrix, GTO, Montana, MontanaSV6, Pursuit, Sunfire, Vibe, Wave, nil], Pontiac,
        [NSArray arrayWithObjects:Ion1, Ion2, Ion3, IonRedLine, L300, Relay, Vue, nil], Saturn,
        [NSArray arrayWithObjects:tC, xA, xB, nil], Scion,
        [NSArray arrayWithObjects:Baja, Forester, Impreza, Legacy, Outback, nil], Subaru,
        [NSArray arrayWithObjects:Aerio, Forenza, GrandVitara, Reno, SwiftPlus, Verona, XLDash7, nil], Suzuki,
        [NSArray arrayWithObjects:FourRunner, Avalon, Camry, CamrySolara, Celica, Corolla, ECHO, Highlander, LandCruiser, Matrix, MR2, Prius, RAV4, Sequoia, Sienna, Tacoma, Tundra, nil], Toyota,
        [NSArray arrayWithObjects:OTHER, nil], OTHER,
        nil], self._yearArray[VehicleYearIndex2005],

      [NSDictionary dictionaryWithObjectsAndKeys:
        [NSArray arrayWithObjects:OneDot7EL, ThreeDot5RL, MDX, NSX, RSX, TL, TSX, nil], Acura,
        [NSArray arrayWithObjects:Century, LeSabre, ParkAvenue, Rainier, Regal, Rendezvous, nil], Buick,
        [NSArray arrayWithObjects:CTS, DeVille, Escalade, EscaladeESV, EscaladeEXT, Seville, SRX, XLR, nil], Cadillac,
        [NSArray arrayWithObjects:Astro, Avalanche, Aveo, Blazer, Cavalier, ChevyExpress, Classic, Colorado, Corvette, Epica, Impala, Malibu, MonteCarlo, Optra, Optra5, S10Pickup, Silverado, SSR, Suburban, Tahoe, Tracker, TrailBlazer, Venture, nil], Chevrolet,
        [NSArray arrayWithObjects:Three00M, Concorde, Crossfire, Intrepid, Pacifica, PTCruiser, Sebring, TownAndCountry, nil], Chrysler,
        [NSArray arrayWithObjects:Caravan, Dakota, Durango, GrandCaravan, Intrepid, Neon, Pickup, Sprinter, SRTDash4, Stratus, SX, Viper, nil], Dodge,
        [NSArray arrayWithObjects:CrownVictoria, E450SuperDuty, Econoline, Escape, Excursion, Expedition, Explorer, ExplorerSportTrac, F450SuperDuty, F550SuperDuty, Focus, Freestar, Mustang, Pickup, PickupHeritage, Ranger, Taurus, Thunderbird, nil], Ford,
        [NSArray arrayWithObjects:Canyon, Envoy, EnvoyXL, EnvoyXUV, Jimmy, Safari, Savana, SavanaCamperSpecial, SavanaSpecial, Sierra, Sonoma, Yukon, YukonXL, nil], GMC,
        [NSArray arrayWithObjects:Accord, Civic, CRDashV, Element, Insight, Odyssey, Pilot, S2000, nil], Honda,
        [NSArray arrayWithObjects:H1, H2, nil], Hummer,
        [NSArray arrayWithObjects:Accent, Elantra, SantaFe, Sonata, Tiburon, XG350, nil], Hyundai,
        [NSArray arrayWithObjects:FX35, FX45, G35, I35, M45, Q45, QX56, nil], Infiniti,
        [NSArray arrayWithObjects:Ascender, Axiom, Rodeo, nil], Isuzu,
        [NSArray arrayWithObjects:GrandCherokee, Liberty, Wrangler, nil], Jeep,
        [NSArray arrayWithObjects:Amanti, Magentis, Optima, Rio, Sedona, Sorento, Spectra, nil], Kia,
        [NSArray arrayWithObjects:ES330, GS300, GS430, GX470, IS300, LS430, LX470, RX330, SC430, nil], Lexus,
        [NSArray arrayWithObjects:Aviator, LS, Navigator, TownCar, nil], Lincoln,
        [NSArray arrayWithObjects:Three, Six, B2300, B3000, B4000, MPV, MXDash5Miata, RXDash8, Tribute, nil], Mazda,
        [NSArray arrayWithObjects:GrandMarquis, Marauder, Monterey, Mountaineer, Sable, nil], Mercury,
        [NSArray arrayWithObjects:Diamante, Eclipse, Endeavor, Galant, Lancer, Montero, MonteroSport, Outlander, nil], Mitsubishi,
        [NSArray arrayWithObjects:Three50Z, Altima, Armada, Frontier, Maxima, Murano, Pathfinder, Quest, Sentra, Titan, Xterra, nil], Nissan,
        [NSArray arrayWithObjects:Alero, Bravada, Silhouette, nil], Oldsmobile,
        [NSArray arrayWithObjects:Aztek, Bonneville, GrandAm, GrandPrix, GTO, Montana, Sunfire, Vibe, nil], Pontiac,
        [NSArray arrayWithObjects:Ion1, Ion2, Ion3, IonRedLine, L300, Vue, nil], Saturn,
        [NSArray arrayWithObjects:xA, xB, nil], Scion,
        [NSArray arrayWithObjects:Baja, Forester, Impreza, Legacy, Outback, nil], Subaru,
        [NSArray arrayWithObjects:Aerio, Forenza, GrandVitara, SwiftPlus, Verona, Vitara, XLDash7, nil], Suzuki,
        [NSArray arrayWithObjects:FourRunner, Avalon, Camry, CamrySolara, Celica, Corolla, ECHO, Highlander, LandCruiser, Matrix, MR2, Prius, RAV4, Sequoia, Sienna, Tacoma, Tundra, nil], Toyota,
        [NSArray arrayWithObjects:OTHER, nil], OTHER,
        nil], self._yearArray[VehicleYearIndex2004],

      [NSDictionary dictionaryWithObjectsAndKeys:
        [NSArray arrayWithObjects:OneDot7EL, ThreeDot2CL, ThreeDot2TL, ThreeDot5RL, MDX, NSX, NSXDashT, RSX, nil], Acura,
        [NSArray arrayWithObjects:Century, LeSabre, ParkAvenue, Regal, Rendezvous, nil], Buick,
        [NSArray arrayWithObjects:CTS, DeVille, Escalade, EscaladeESV, EscaladeEXT, Seville, nil], Cadillac,
        [NSArray arrayWithObjects:Astro, Avalanche, Blazer, Cavalier, ChevyExpress, Corvette, Impala, Malibu, MonteCarlo, S10Pickup, Silverado, SSR, Suburban, Tahoe, Tracker, TrailBlazer, Venture, nil], Chevrolet,
        [NSArray arrayWithObjects:Three00M, Concorde, Intrepid, PTCruiser, Sebring, TownAndCountry, Voyager, nil], Chrysler,
        [NSArray arrayWithObjects:Caravan, Dakota, Durango, GrandCaravan, Intrepid, Neon, Pickup, RamVan, Sprinter, SRTDash4, Stratus, SX, Viper, nil], Dodge,
        [NSArray arrayWithObjects:CrownVictoria, E450SuperDuty, E550SuperDuty, Econoline, Escape, Excursion, Expedition, Explorer, ExplorerSport, ExplorerSportTrac, F450SuperDuty, F550SuperDuty, Focus, Mustang, Pickup, Ranger, Taurus, Thunderbird, Windstar, ZX2, nil], Ford,
        [NSArray arrayWithObjects:Envoy, EnvoyXL, Jimmy, Safari, Savana, SavanaCamperSpecial, SavanaSpecial, Sierra, Sonoma, Yukon, YukonXL, nil], GMC,
        [NSArray arrayWithObjects:Accord, Civic, CRDashV, Element, Insight, Odyssey, Pilot, S2000, nil], Honda,
        [NSArray arrayWithObjects:H1, H2, nil], Hummer,
        [NSArray arrayWithObjects:Accent, Elantra, SantaFe, Sonata, Tiburon, XG350, nil], Hyundai,
        [NSArray arrayWithObjects:FX35, FX45, G35, I35, M45, Q45, QX4, nil], Infiniti,
        [NSArray arrayWithObjects:Ascender, Axiom, Rodeo, RodeoSport, nil], Isuzu,
        [NSArray arrayWithObjects:GrandCherokee, Liberty, Wrangler, nil], Jeep,
        [NSArray arrayWithObjects:Magentis, Optima, Rio, Sedona, Sorento, Spectra, nil], Kia,
        [NSArray arrayWithObjects:ES300, GS300, GS430, GX470, IS300, LS430, LX470, RX300, SC430, nil], Lexus,
        [NSArray arrayWithObjects:Aviator, Blackwood, LS, Navigator, TownCar, nil], Lincoln,
        [NSArray arrayWithObjects:Six, B2300, B3000, B4000, MPV, MXDash5Miata, Protege, Protege5, Tribute, nil], Mazda,
        [NSArray arrayWithObjects:GrandMarquis, Marauder, Mountaineer, Sable, nil], Mercury,
        [NSArray arrayWithObjects:Diamante, Eclipse, Galant, Lancer, Montero, MonteroSport, Outlander, nil], Mitsubishi,
        [NSArray arrayWithObjects:Three50Z, Altima, Frontier, Maxima, Murano, Pathfinder, Sentra, Xterra, nil], Nissan,
        [NSArray arrayWithObjects:Alero, Aurora, Bravada, Silhouette, nil], Oldsmobile,
        [NSArray arrayWithObjects:Aztek, Bonneville, GrandAm, GrandPrix, Montana, Sunfire, Vibe, nil], Pontiac,
        [NSArray arrayWithObjects:Ion1, Ion2, Ion3, L200, L300, LW200, LW300, Vue, nil], Saturn,
        [NSArray arrayWithObjects:Baja, Forester, Impreza, Legacy, Outback, nil], Subaru,
        [NSArray arrayWithObjects:Aerio, GrandVitara, Vitara, XLDash7, nil], Suzuki,
        [NSArray arrayWithObjects:FourRunner, Avalon, Camry, CamrySolara, Celica, Corolla, ECHO, Highlander, LandCruiser, Matrix, MR2, Prius, RAV4, Sequoia, Sienna, Tacoma, Tundra, nil], Toyota,
        [NSArray arrayWithObjects:OTHER, nil], OTHER,
        nil], self._yearArray[VehicleYearIndex2003],

      [NSDictionary dictionaryWithObjectsAndKeys:
        [NSArray arrayWithObjects:OneDot7EL, ThreeDot2CL, ThreeDot2TL, ThreeDot5RL, MDX, NSX, NSXDashT, RSX, nil], Acura,
        [NSArray arrayWithObjects:Century, LeSabre, ParkAvenue, Regal, Rendezvous, nil], Buick,
        [NSArray arrayWithObjects:DeVille, Eldorado, Escalade, EscaladeEXT, Seville, nil], Cadillac,
        [NSArray arrayWithObjects:Astro, Avalanche, Blazer, C3500HD, Camaro, Cavalier, ChevyExpress, Corvette, Impala, Malibu, MonteCarlo, Prizm, S10Pickup, Silverado, Suburban, Tahoe, Tracker, TrailBlazer, Venture, nil], Chevrolet,
        [NSArray arrayWithObjects:Three00M, Concorde, Intrepid, Neon, Prowler, PTCruiser, Sebring, TownAndCountry, Voyager, nil], Chrysler,
        [NSArray arrayWithObjects:Caravan, Dakota, Durango, GrandCaravan, Intrepid, Neon, Pickup, RamVan, RamWagon, Stratus, Viper, nil], Dodge,
        [NSArray arrayWithObjects:CrownVictoria, E450SuperDuty, E550SuperDuty, Econoline, Escape, Escort, Excursion, Expedition, Explorer, ExplorerSport, ExplorerSportTrac, F450SuperDuty, F550SuperDuty, Focus, Mustang, Pickup, Ranger, Taurus, Thunderbird, Windstar, ZX2, nil], Ford,
        [NSArray arrayWithObjects:C3500HD, Envoy, EnvoyXL, Jimmy, Safari, Savana, SavanaCamperSpecial, SavanaSpecial, Sierra, Sonoma, Yukon, YukonXL, nil], GMC,
        [NSArray arrayWithObjects:Accord, Civic, CRDashV, Insight, Odyssey, Passport, S2000, nil], Honda,
        [NSArray arrayWithObjects:H1, nil], Hummer,
        [NSArray arrayWithObjects:Accent, Elantra, SantaFe, Sonata, XG350, nil], Hyundai,
        [NSArray arrayWithObjects:G20, I35, Q45, QX4, nil], Infiniti,
        [NSArray arrayWithObjects:Axiom, Rodeo, RodeoSport, Trooper, nil], Isuzu,
        [NSArray arrayWithObjects:GrandCherokee, Liberty, Wrangler, nil], Jeep,
        [NSArray arrayWithObjects:Magentis, Optima, Rio, Sedona, Spectra, Sportage, nil], Kia,
        [NSArray arrayWithObjects:ES300, GS300, GS430, IS300, LS430, LX470, RX300, SC430, nil], Lexus,
        [NSArray arrayWithObjects:Blackwood, Continental, LS, Navigator, TownCar, nil], Lincoln,
        [NSArray arrayWithObjects:Six26, B2300, B3000, B4000, Millenia, MPV, MXDash5Miata, Protege, Protege5, Tribute, nil], Mazda,
        [NSArray arrayWithObjects:Cougar, GrandMarquis, Mountaineer, Sable, Villager, nil], Mercury,
        [NSArray arrayWithObjects:Diamante, Eclipse, Galant, Lancer, Mirage, Montero, MonteroSport, nil], Mitsubishi,
        [NSArray arrayWithObjects:Altima, Frontier, Maxima, Pathfinder, Quest, Sentra, Xterra, nil], Nissan,
        [NSArray arrayWithObjects:Alero, Aurora, Bravada, Intrigue, Silhouette, nil], Oldsmobile,
        [NSArray arrayWithObjects:Aztek, Bonneville, Firebird, GrandAm, GrandPrix, Montana, Sunfire, nil], Pontiac,
        [NSArray arrayWithObjects:L100, L200, L300, LW200, LW300, SC1, SC2, SL, SL1, SL2, Vue, nil], Saturn,
        [NSArray arrayWithObjects:Forester, Impreza, Legacy, Outback, nil], Subaru,
        [NSArray arrayWithObjects:Aerio, Esteem, GrandVitara, Vitara, XLDash7, nil], Suzuki,
        [NSArray arrayWithObjects:FourRunner, Avalon, Camry, CamrySolara, Celica, Corolla, ECHO, Highlander, LandCruiser, MR2, Prius, RAV4, Sequoia, Sienna, Tacoma, Tundra, nil], Toyota,
        [NSArray arrayWithObjects:OTHER, nil], OTHER,
        nil], self._yearArray[VehicleYearIndex2002],

      [NSDictionary dictionaryWithObjectsAndKeys:
        [NSArray arrayWithObjects:OneDot7EL, ThreeDot2CL, ThreeDot2TL, ThreeDot5RL, Integra, MDX, NSX, NSXDashT, nil], Acura,
        [NSArray arrayWithObjects:Century, LeSabre, ParkAvenue, Regal, nil], Buick,
        [NSArray arrayWithObjects:Catera, DeVille, Eldorado, Seville, nil], Cadillac,
        [NSArray arrayWithObjects:Astro, Blazer, C3500HD, Camaro, Cavalier, ChevyExpress, Corvette, Impala, Lumina, Malibu, Metro, MonteCarlo, Prizm, S10Pickup, Silverado, Suburban, Tahoe, Tracker, Venture, nil], Chevrolet,
        [NSArray arrayWithObjects:Three00M, Concorde, Intrepid, LHS, Neon, Prowler, PTCruiser, Sebring, TownAndCountry, Voyager, nil], Chrysler,
        [NSArray arrayWithObjects:Caravan, Dakota, Durango, GrandCaravan, Intrepid, Neon, Pickup, RamVan, RamWagon, Stratus, Viper, nil], Dodge,
        [NSArray arrayWithObjects:CrownVictoria, E450SuperDuty, Econoline, Escape, Escort, Excursion, Expedition, Explorer, ExplorerSport, ExplorerSportTrac, F450SuperDuty, F550SuperDuty, Focus, Mustang, Pickup, Ranger, Taurus, Windstar, ZX2, nil], Ford,
        [NSArray arrayWithObjects:C3500HD, Jimmy, Safari, Savana, SavanaCamperSpecial, SavanaSpecial, Sierra, Sonoma, Yukon, YukonXL, nil], GMC,
        [NSArray arrayWithObjects:Accord, Civic, CRDashV, Insight, Odyssey, Passport, Prelude, S2000, nil], Honda,
        [NSArray arrayWithObjects:H1, nil], Hummer,
        [NSArray arrayWithObjects:Accent, Elantra, SantaFe, Sonata, Tiburon, XG300, nil], Hyundai,
        [NSArray arrayWithObjects:G20, I30, Q45, QX4, nil], Infiniti,
        [NSArray arrayWithObjects:Rodeo, RodeoSport, Trooper, VehiCROSS, nil], Isuzu,
        [NSArray arrayWithObjects:Cherokee, GrandCherokee, Wrangler, nil], Jeep,
        [NSArray arrayWithObjects:Magentis, Optima, Rio, Sephia, Spectra, Sportage, nil], Kia,
        [NSArray arrayWithObjects:ES300, GS300, GS430, IS300, LS430, LX470, RX300, nil], Lexus,
        [NSArray arrayWithObjects:Continental, LS, Navigator, TownCar, nil], Lincoln,
        [NSArray arrayWithObjects:Six26, B2300, B2500, B3000, B4000, Millenia, MPV, MXDash5Miata, Protege, Tribute, nil], Mazda,
        [NSArray arrayWithObjects:Cougar, GrandMarquis, Mountaineer, Sable, Villager, nil], Mercury,
        [NSArray arrayWithObjects:Diamante, Eclipse, Galant, Mirage, Montero, MonteroSport, nil], Mitsubishi,
        [NSArray arrayWithObjects:Altima, Frontier, Maxima, Pathfinder, Quest, Sentra, Xterra, nil], Nissan,
        [NSArray arrayWithObjects:Alero, Aurora, Bravada, Intrigue, Silhouette, nil], Oldsmobile,
        [NSArray arrayWithObjects:Neon, Prowler, nil], Plymouth,
        [NSArray arrayWithObjects:Aztek, Bonneville, Firebird, GrandAm, GrandPrix, Montana, Sunfire, nil], Pontiac,
        [NSArray arrayWithObjects:L100, L200, L300, LW200, LW300, SC1, SC2, SL, SL1, SL2, SW2, nil], Saturn,
        [NSArray arrayWithObjects:Forester, Impreza, Legacy, Outback, nil], Subaru,
        [NSArray arrayWithObjects:Esteem, GrandVitara, Swift, Vitara, XLDash7, nil], Suzuki,
        [NSArray arrayWithObjects:FourRunner, Avalon, Camry, CamrySolara, Celica, Corolla, ECHO, Highlander, LandCruiser, MR2, Prius, RAV4, Sequoia, Sienna, Tacoma, Tundra, nil], Toyota,
        [NSArray arrayWithObjects:OTHER, nil], OTHER,
        nil], self._yearArray[VehicleYearIndex2001],

      [NSDictionary dictionaryWithObjectsAndKeys:
        [NSArray arrayWithObjects:OneDot6EL, ThreeDot2TL, ThreeDot5RL, Integra, NSX, NSXDashT, nil], Acura,
        [NSArray arrayWithObjects:Century, LeSabre, ParkAvenue, Regal, nil], Buick,
        [NSArray arrayWithObjects:Catera, DeVille, Eldorado, Escalade, Seville, nil], Cadillac,
        [NSArray arrayWithObjects:Astro, Blazer, C3500HD, Camaro, Cavalier, ChevyExpress, Corvette, Impala, Lumina, Malibu, Metro, MonteCarlo, Pickup, Prizm, S10Pickup, Silverado, Suburban, Tahoe, Tracker, Venture, nil], Chevrolet,
        [NSArray arrayWithObjects:Three00M, Cirrus, Concorde, GrandVoyager, Intrepid, LHS, Neon, Sebring, TownAndCountry, Voyager, nil], Chrysler,
        [NSArray arrayWithObjects:Avenger, Caravan, Dakota, Durango, GrandCaravan, Intrepid, Neon, Pickup, RamVan, RamWagon, Stratus, Viper, nil], Dodge,
        [NSArray arrayWithObjects:Contour, CrownVictoria, E450SuperDuty, Econoline, Escort, Excursion, Expedition, Explorer, F450SuperDuty, F550SuperDuty, Focus, Mustang, Pickup, Ranger, Taurus, Windstar, ZX2, nil], Ford,
        [NSArray arrayWithObjects:C3500HD, Envoy, Jimmy, Pickup, Safari, Savana, SavanaCamperSpecial, SavanaSpecial, Sierra, Sonoma, Yukon, YukonXL, nil], GMC,
        [NSArray arrayWithObjects:Accord, Civic, CRDashV, Insight, Odyssey, Passport, Prelude, S2000, nil], Honda,
        [NSArray arrayWithObjects:H1, nil], Hummer,
        [NSArray arrayWithObjects:Accent, Elantra, Sonata, Tiburon, nil], Hyundai,
        [NSArray arrayWithObjects:G20, I30, Q45, QX4, nil], Infiniti,
        [NSArray arrayWithObjects:Amigo, Hombre, Rodeo, Trooper, VehiCROSS, nil], Isuzu,
        [NSArray arrayWithObjects:Cherokee, GrandCherokee, Wrangler, nil], Jeep,
        [NSArray arrayWithObjects:Sephia, Spectra, Sportage, nil], Kia,
        [NSArray arrayWithObjects:ES300, GS300, GS400, LS400, LX470, RX300, SC300, SC400, nil], Lexus,
        [NSArray arrayWithObjects:Continental, LS, Navigator, TownCar, nil], Lincoln,
        [NSArray arrayWithObjects:Six26, B2500, B3000, B4000, Millenia, MPV, MXDash5Miata, Protege, nil], Mazda,
        [NSArray arrayWithObjects:Cougar, GrandMarquis, Mountaineer, Mystique, Sable, Villager, nil], Mercury,
        [NSArray arrayWithObjects:Diamante, Eclipse, Galant, Mirage, Montero, MonteroSport, nil], Mitsubishi,
        [NSArray arrayWithObjects:Altima, Frontier, Maxima, Pathfinder, Quest, Sentra, Xterra, nil], Nissan,
        [NSArray arrayWithObjects:Alero, Bravada, Intrigue, Silhouette, nil], Oldsmobile,
        [NSArray arrayWithObjects:Breeze, GrandVoyager, Neon, Prowler, Voyager, nil], Plymouth,
        [NSArray arrayWithObjects:Bonneville, Firebird, Firefly, GrandAm, GrandPrix, Montana, Sunfire, nil], Pontiac,
        [NSArray arrayWithObjects:LS, LS1, LS2, LW1, LW2, SC1, SC2, SL, SL1, SL2, SW2, nil], Saturn,
        [NSArray arrayWithObjects:Forester, Impreza, Legacy, Outback, nil], Subaru,
        [NSArray arrayWithObjects:Esteem, GrandVitara, Swift, Vitara, nil], Suzuki,
        [NSArray arrayWithObjects:FourRunner, Avalon, Camry, CamrySolara, Celica, Corolla, ECHO, LandCruiser, MR2, RAV4, Sienna, Tacoma, Tundra, nil], Toyota,
        [NSArray arrayWithObjects:OTHER, nil], OTHER,
        nil], self._yearArray[VehicleYearIndex2000],

      [NSDictionary dictionaryWithObjectsAndKeys:
        [NSArray arrayWithObjects:OneDot6EL, TwoDot3CL, ThreeDot0CL, ThreeDot2TL, ThreeDot5RL, Integra, NSX, NSXDashT, SLX, nil], Acura,
        [NSArray arrayWithObjects:Century, LeSabre, ParkAvenue, Regal, Riviera, nil], Buick,
        [NSArray arrayWithObjects:Catera, DeVille, Eldorado, Escalade, Seville, nil], Cadillac,
        [NSArray arrayWithObjects:Astro, Blazer, C3500HD, Camaro, Cavalier, ChevyExpress, Corvette, ForwardControl, Lumina, Malibu, Metro, MonteCarlo, Pickup, Prizm, S10Pickup, Silverado, Suburban, Tahoe, Tracker, Venture, nil], Chevrolet,
        [NSArray arrayWithObjects:Three00M, Cirrus, Concorde, Intrepid, LHS, Sebring, TownAndCountry, nil], Chrysler,
        [NSArray arrayWithObjects:Avenger, Caravan, Dakota, Durango, GrandCaravan, Intrepid, Neon, Pickup, RamVan, RamWagon, Stratus, Viper, nil], Dodge,
        [NSArray arrayWithObjects:Contour, CrownVictoria, E450SuperDuty, Econoline, Escort, Expedition, Explorer, F450SuperDuty, F550SuperDuty, Mustang, Pickup, Ranger, Taurus, Windstar, nil], Ford,
        [NSArray arrayWithObjects:C3500HD, Envoy, ForwardControl, Jimmy, Pickup, Safari, Savana, SavanaCamperSpecial, SavanaSpecial, Sierra, Sonoma, Suburban, Yukon, nil], GMC,
        [NSArray arrayWithObjects:Accord, Civic, CRDashV, EV, Odyssey, Passport, Prelude, nil], Honda,
        [NSArray arrayWithObjects:H1, nil], Hummer,
        [NSArray arrayWithObjects:Accent, Elantra, Sonata, Tiburon, nil], Hyundai,
        [NSArray arrayWithObjects:G20, I30, Q45, QX4, nil], Infiniti,
        [NSArray arrayWithObjects:Amigo, Hombre, Oasis, Rodeo, Trooper, VehiCROSS, nil], Isuzu,
        [NSArray arrayWithObjects:Cherokee, GrandCherokee, Wrangler, nil], Jeep,
        [NSArray arrayWithObjects:Sephia, Sportage, nil], Kia,
        [NSArray arrayWithObjects:ES300, GS300, GS400, LS400, LX470, RX300, SC300, SC400, nil], Lexus,
        [NSArray arrayWithObjects:Continental, Navigator, TownCar, nil], Lincoln,
        [NSArray arrayWithObjects:Six26, B2500, B3000, B4000, Millenia, MXDash5Miata, Protege, nil], Mazda,
        [NSArray arrayWithObjects:Cougar, GrandMarquis, Mountaineer, Mystique, Sable, Tracer, Villager, nil], Mercury,
        [NSArray arrayWithObjects:Three000GT, Diamante, Eclipse, Galant, Mirage, Montero, MonteroSport, nil], Mitsubishi,
        [NSArray arrayWithObjects:Altima, Frontier, Maxima, Pathfinder, Quest, Sentra, nil], Nissan,
        [NSArray arrayWithObjects:Alero, Aurora, Bravada, Cutlass, EightyDashEight, Intrigue, LSS, Silhouette, nil], Oldsmobile,
        [NSArray arrayWithObjects:Breeze, GrandVoyager, Neon, Prowler, Voyager, nil], Plymouth,
        [NSArray arrayWithObjects:Bonneville, Firebird, Firefly, GrandAm, GrandPrix, Montana, Sunfire, nil], Pontiac,
        [NSArray arrayWithObjects:SC1, SC2, SL, SL1, SL2, SW1, SW2, nil], Saturn,
        [NSArray arrayWithObjects:Forester, Impreza, Legacy, nil], Subaru,
        [NSArray arrayWithObjects:Esteem, GrandVitara, Swift, Vitara, nil], Suzuki,
        [NSArray arrayWithObjects:FourRunner, Avalon, Camry, CamrySolara, Celica, Corolla, LandCruiser, Paseo, RAV4, Sienna, Tacoma, Tercel, nil], Toyota,
        [NSArray arrayWithObjects:OTHER, nil], OTHER,
        nil], self._yearArray[VehicleYearIndex1999],

      [NSDictionary dictionaryWithObjectsAndKeys:
        [NSArray arrayWithObjects:OneDot6EL, TwoDot3CL, TwoDot5TL, ThreeDot0CL, ThreeDot2TL, ThreeDot5RL, Integra, NSX, NSXDashT, SLX, nil], Acura,
        [NSArray arrayWithObjects:Century, LeSabre, ParkAvenue, Regal, Riviera, Skylark, nil], Buick,
        [NSArray arrayWithObjects:Catera, DeVille, Eldorado, Seville, nil], Cadillac,
        [NSArray arrayWithObjects:Astro, Blazer, C3500HD, Camaro, Cavalier, ChevyExpress, ChevyVan, Corvette, ForwardControl, Lumina, Malibu, Metro, MonteCarlo, Pickup, Prizm, S10Pickup, Suburban, Tahoe, Tracker, Venture, nil], Chevrolet,
        [NSArray arrayWithObjects:Cirrus, Concorde, Intrepid, Sebring, TownAndCountry, nil], Chrysler,
        [NSArray arrayWithObjects:Avenger, Caravan, Dakota, Durango, GrandCaravan, Intrepid, Neon, Pickup, RamVan, RamWagon, Stratus, Viper, nil], Dodge,
        [NSArray arrayWithObjects:Talon, nil], Eagle,
        [NSArray arrayWithObjects:ClubWagon, Contour, CrownVictoria, Econoline, Escort, Expedition, Explorer, Mustang, Pickup, Ranger, Taurus, Windstar, nil], Ford,
        [NSArray arrayWithObjects:C3500HD, Envoy, ForwardControl, Jimmy, Pickup, Safari, Savana, SavanaCamperSpecial, SavanaSpecial, Sonoma, Suburban, Yukon, nil], GMC,
        [NSArray arrayWithObjects:Accord, Civic, CRDashV, EV, Odyssey, Passport, Prelude, nil], Honda,
        [NSArray arrayWithObjects:H1, nil], Hummer,
        [NSArray arrayWithObjects:Accent, Elantra, Sonata, Tiburon, nil], Hyundai,
        [NSArray arrayWithObjects:I30, Q45, QX4, nil], Infiniti,
        [NSArray arrayWithObjects:Amigo, Hombre, Oasis, Rodeo, Trooper, nil], Isuzu,
        [NSArray arrayWithObjects:Cherokee, GrandCherokee, Wrangler, nil], Jeep,
        [NSArray arrayWithObjects:Sephia, Sportage, nil], Kia,
        [NSArray arrayWithObjects:ES300, GS300, GS400, LS400, LX470, SC300, SC400, nil], Lexus,
        [NSArray arrayWithObjects:Continental, MarkVIII, Navigator, TownCar, nil], Lincoln,
        [NSArray arrayWithObjects:Six26, B2500, B3000, B4000, Millenia, MPV, Protege, nil], Mazda,
        [NSArray arrayWithObjects:GrandMarquis, Mountaineer, Mystique, Sable, Tracer, Villager, nil], Mercury,
        [NSArray arrayWithObjects:Three000GT, Diamante, Eclipse, Galant, Mirage, Montero, MonteroSport, nil], Mitsubishi,
        [NSArray arrayWithObjects:Two00SX, Two40SX, Altima, Frontier, Maxima, Pathfinder, Quest, Sentra, nil], Nissan,
        [NSArray arrayWithObjects:Achieva, Aurora, Bravada, Cutlass, EightyDashEight,Intrigue, LSS, Regency, Silhouette, nil], Oldsmobile,
        [NSArray arrayWithObjects:Breeze, GrandVoyager, Neon, Voyager, nil], Plymouth,
        [NSArray arrayWithObjects:Bonneville, Firebird, Firefly, GrandAm, GrandPrix, Sunfire, TransSport, nil], Pontiac,
        [NSArray arrayWithObjects:SC1, SC2, SL, SL1, SL2, SW1, SW2, nil], Saturn,
        [NSArray arrayWithObjects:Forester, Impreza, Legacy, nil], Subaru,
        [NSArray arrayWithObjects:Esteem, Sidekick, Swift, XDash90, nil], Suzuki,
        [NSArray arrayWithObjects:FourRunner, Avalon, Camry, Celica, Corolla, LandCruiser, Paseo, RAV4, Sienna, Supra, T100, Tacoma, Tercel, nil], Toyota,
        [NSArray arrayWithObjects:OTHER, nil], OTHER,
        nil], self._yearArray[VehicleYearIndex1998],

      [NSDictionary dictionaryWithObjectsAndKeys:
        [NSArray arrayWithObjects:OneDot6EL, TwoDot2CL, TwoDot5TL, ThreeDot0CL, ThreeDot2TL, ThreeDot5RL, Integra, NSX, NSXDashT, SLX, nil], Acura,
        [NSArray arrayWithObjects:Century, LeSabre, ParkAvenue, Regal, Riviera, Skylark, nil], Buick,
        [NSArray arrayWithObjects:Catera, DeVille, Eldorado, Seville, nil], Cadillac,
        [NSArray arrayWithObjects:Astro, Blazer, C3500HD, Camaro, Cavalier, ChevyExpress, ChevyVan, Corvette, ForwardControl, Lumina, Malibu, MonteCarlo, Pickup, S10Pickup, Suburban, Tahoe, Venture, nil], Chevrolet,
        [NSArray arrayWithObjects:Cirrus, Concorde, Intrepid, LHS, Sebring, TownAndCountry, nil], Chrysler,
        [NSArray arrayWithObjects:Avenger, Caravan, Dakota, GrandCaravan, Intrepid, Neon, Pickup, RamVan, RamWagon, Stratus, Viper, nil], Dodge,
        [NSArray arrayWithObjects:Talon, Vision, nil], Eagle,
        [NSArray arrayWithObjects:Aerostar, Aspire, ClubWagon, Contour, CrownVictoria, Econoline, Escort, Expedition, Explorer, FDashSuperDuty, Mustang, Pickup, Probe, Ranger, Taurus, Thunderbird, Windstar, nil], Ford,
        [NSArray arrayWithObjects:Metro, Prizm, Tracker, nil], Geo,
        [NSArray arrayWithObjects:C3500HD, ForwardControl, Jimmy, Pickup, Safari, Savana, SavanaCamperSpecial, SavanaSpecial, Sonoma, Suburban, Vandura, Yukon, nil], GMC,
        [NSArray arrayWithObjects:Accord, Civic, CivicDelSol, CRDashV, EV, Odyssey, Passport, Prelude, nil], Honda,
        [NSArray arrayWithObjects:H1, nil], Hummer,
        [NSArray arrayWithObjects:Accent, Elantra, Sonata, Tiburon, nil], Hyundai,
        [NSArray arrayWithObjects:I30, J30, Q45, QX4, nil], Infiniti,
        [NSArray arrayWithObjects:Hombre, Oasis, Rodeo, Trooper, nil], Isuzu,
        [NSArray arrayWithObjects:Cherokee, GrandCherokee, Wrangler, nil], Jeep,
        [NSArray arrayWithObjects:Sephia, Sportage, nil], Kia,
        [NSArray arrayWithObjects:ES300, GS300, LS400, LX450, SC300, SC400, nil], Lexus,
        [NSArray arrayWithObjects:Continental, MarkVIII, TownCar, nil], Lincoln,
        [NSArray arrayWithObjects:Six26, Six26Cronos, B2300, B3000, B4000, Millenia, MPV, MXDash5Miata, MXDash6, MXDash6Mystere, Protege, nil], Mazda,
        [NSArray arrayWithObjects:Cougar, GrandMarquis, Mountaineer, Mystique, Sable, Tracer, Villager, nil], Mercury,
        [NSArray arrayWithObjects:Three000GT, Diamante, Eclipse, Galant, Mirage, Montero, MonteroSport, nil], Mitsubishi,
        [NSArray arrayWithObjects:Two00SX, Two40SX, Altima, Maxima, Pathfinder, Pickup, Quest, Sentra, nil], Nissan,
        [NSArray arrayWithObjects:Achieva, Aurora, Bravada, Cutlass, CutlassSupreme, EightyDashEight, LSS, Regency, Silhouette, nil], Oldsmobile,
        [NSArray arrayWithObjects:Breeze, GrandVoyager, Neon, Prowler, Voyager, nil], Plymouth,
        [NSArray arrayWithObjects:Bonneville, Firebird, Firefly, GrandAm, GrandPrix, Sunfire, Sunrunner, TransSport, nil], Pontiac,
        [NSArray arrayWithObjects:SC1, SC2, SL, SL1, SL2, SW1, SW2, nil], Saturn,
        [NSArray arrayWithObjects:Impreza, Legacy, SVX, nil], Subaru,
        [NSArray arrayWithObjects:Esteem, Sidekick, Swift, XDash90, nil], Suzuki,
        [NSArray arrayWithObjects:FourRunner, Avalon, Camry, Celica, Corolla, LandCruiser, Paseo, Previa, RAV4, Supra, T100, Tacoma, Tercel, nil], Toyota,
        [NSArray arrayWithObjects:OTHER, nil], OTHER,
        nil], self._yearArray[VehicleYearIndex1997],

      [NSDictionary dictionaryWithObjectsAndKeys:
        [NSArray arrayWithObjects:TwoDot5TL, ThreeDot2TL, ThreeDot5RL, Integra, NSX, NSXDashT, SLX, nil], Acura,
        [NSArray arrayWithObjects:Century, LeSabre, ParkAvenue, Regal, Riviera, Roadmaster, Skylark, nil], Buick,
        [NSArray arrayWithObjects:DeVille, Eldorado, Fleetwood, Seville, nil], Cadillac,
        [NSArray arrayWithObjects:Astro, Beretta, Blazer, C3500HD, Camaro, Caprice, Cavalier, ChevyExpress, ChevyVan, Corsica, Corvette, ForwardControl, Lumina, LuminaAPV, MonteCarlo, Pickup, S10Pickup, Sportvan, Suburban, Tahoe, nil], Chevrolet,
        [NSArray arrayWithObjects:Cirrus, Concorde, Intrepid, LHS, NewYorker, Sebring, TownAndCountry, nil], Chrysler,
        [NSArray arrayWithObjects:Avenger, Caravan, Colt, Dakota, GrandCaravan, Intrepid, Neon, Pickup, RamVan, RamWagon, Stealth, Stratus, Viper, nil], Dodge,
        [NSArray arrayWithObjects:Summit, SummitWagon, Talon, Vision, nil], Eagle,
        [NSArray arrayWithObjects:Aerostar, Aspire, Bronco, ClubWagon, Contour, CrownVictoria, Econoline, Escort, Explorer, FDashSuperDuty, Mustang, Pickup, Probe, Ranger, Taurus, Thunderbird, Windstar, nil], Ford,
        [NSArray arrayWithObjects:Metro, Prizm, Tracker, nil], Geo,
        [NSArray arrayWithObjects:C3500HD, ForwardControl, Jimmy, Pickup, Rally, RallyCamperSpecial, Safari, Savana, SavanaCamperSpecial, SavanaSpecial, Sonoma, Suburban, Vandura, VanduraSpecial, Yukon, nil], GMC,
        [NSArray arrayWithObjects:Accord, Civic, CivicDelSol, Odyssey, Passport, Prelude, nil], Honda,
        [NSArray arrayWithObjects:H1, nil], Hummer,
        [NSArray arrayWithObjects:Accent, Elantra, Sonata, nil], Hyundai,
        [NSArray arrayWithObjects:G20, I30, J30, Q45, nil], Infiniti,
        [NSArray arrayWithObjects:Hombre, Oasis, Rodeo, Trooper, nil], Isuzu,
        [NSArray arrayWithObjects:Cherokee, GrandCherokee, nil], Jeep,
        [NSArray arrayWithObjects:Sephia, Sportage, nil], Kia,
        [NSArray arrayWithObjects:ES300, GS300, LS400, LX450, SC300, SC400, nil], Lexus,
        [NSArray arrayWithObjects:Continental, MarkVIII, TownCar, nil], Lincoln,
        [NSArray arrayWithObjects:Six26, Six26Cronos, B2300, B3000, B4000, Millenia, MPV, MXDash3Precidia, MXDash5Miata, MXDash6, MXDash6Mystere, Protege, nil], Mazda,
        [NSArray arrayWithObjects:Cougar, GrandMarquis, Mystique, Sable, Tracer, Villager, nil], Mercury,
        [NSArray arrayWithObjects:Three000GT, Diamante, Eclipse, Galant, Mirage, Montero, Pickup, nil], Mitsubishi,
        [NSArray arrayWithObjects:Two00SX, Two40SX, Three00ZX, Altima, Maxima, Pathfinder, Pickup, Quest, Sentra, nil], Nissan,
        [NSArray arrayWithObjects:Achieva, Aurora, Bravada, Ciera, CutlassSupreme, EightyDashEight, LSS, NinetyDashEight, Silhouette, nil], Oldsmobile,
        [NSArray arrayWithObjects:Breeze, Colt, GrandVoyager, Neon, Voyager, nil], Plymouth,
        [NSArray arrayWithObjects:Bonneville, Firebird, Firefly, GrandAm, GrandPrix, Sunfire, Sunrunner, TransSport, nil], Pontiac,
        [NSArray arrayWithObjects:SC1, SC2, SL, SL1, SL2, SW1, SW2, nil], Saturn,
        [NSArray arrayWithObjects:Impreza, Legacy, SVX, nil], Subaru,
        [NSArray arrayWithObjects:Esteem, Sidekick, Swift, XDash90, nil], Suzuki,
        [NSArray arrayWithObjects:FourRunner, Avalon, Camry, Celica, Corolla, LandCruiser, Paseo, Previa, RAV4, Supra, T100, Tacoma, Tercel, nil], Toyota,
        [NSArray arrayWithObjects:OTHER, nil], OTHER,
        nil], self._yearArray[VehicleYearIndex1996],

      [NSDictionary dictionaryWithObjectsAndKeys:
        [NSArray arrayWithObjects:TwoDot5TL, Integra, Legend, NSX, NSXDashT, nil], Acura,
        [NSArray arrayWithObjects:Century, LeSabre, ParkAvenue, Regal, Riviera, Roadmaster, Skylark, nil], Buick,
        [NSArray arrayWithObjects:DeVille, Eldorado, Fleetwood, Seville, nil], Cadillac,
        [NSArray arrayWithObjects:Astro, Beretta, Blazer, C3500HD, Camaro, Caprice, Cavalier, ChevyVan, Corsica, Corvette, ForwardControl, Lumina, LuminaAPV, MonteCarlo, Pickup, S10Pickup, Sportvan, Suburban, Tahoe, nil], Chevrolet,
        [NSArray arrayWithObjects:Cirrus, Concorde, Intrepid, LeBaron, LHS, NewYorker, Sebring, TownAndCountry, nil], Chrysler,
        [NSArray arrayWithObjects:Avenger, Caravan, Colt, Dakota, GrandCaravan, Intrepid, Neon, Pickup, RamVan, RamWagon, Spirit, Stealth, Stratus, Viper, nil], Dodge,
        [NSArray arrayWithObjects:Summit, SummitWagon, Talon, Vision, nil], Eagle,
        [NSArray arrayWithObjects:Aerostar, Aspire, Bronco, ClubWagon, Contour, CrownVictoria, Econoline, Escort, Explorer, FDashSuperDuty, Mustang, Pickup, Probe, Ranger, Taurus, Thunderbird, Windstar, nil], Ford,
        [NSArray arrayWithObjects:Metro, Prizm, Tracker, nil], Geo,
        [NSArray arrayWithObjects:C3500HD, ForwardControl, Jimmy, Pickup, Rally, RallyCamperSpecial, Safari, Sonoma, Suburban, Vandura, VanduraSpecial, Yukon, nil], GMC,
        [NSArray arrayWithObjects:Accord, Civic, CivicDelSol, Odyssey, Passport, Prelude, nil], Honda,
        [NSArray arrayWithObjects:H1, nil], Hummer,
        [NSArray arrayWithObjects:Accent, Elantra, Scoupe, Sonata, nil], Hyundai,
        [NSArray arrayWithObjects:G20, J30, Q45, nil], Infiniti,
        [NSArray arrayWithObjects:Pickup, Rodeo, Trooper, nil], Isuzu,
        [NSArray arrayWithObjects:Cherokee, GrandCherokee, Wrangler, nil], Jeep,
        [NSArray arrayWithObjects:Sephia, Sportage, nil], Kia,
        [NSArray arrayWithObjects:ES300, GS300, LS400, SC300, SC400, nil], Lexus,
        [NSArray arrayWithObjects:Continental, MarkVIII, TownCar, nil], Lincoln,
        [NSArray arrayWithObjects:Three23, Six26, Six26Cronos, Nine29, Nine29Serenia, B2300, B3000, B4000, Millenia, MPV, MXDash3, MXDash3Precidia, MXDash5Miata, MXDash6, MXDash6Mystere, Protege, RXDash7, nil], Mazda,
        [NSArray arrayWithObjects:Cougar, GrandMarquis, Mystique, Sable, Tracer, Villager, nil], Mercury,
        [NSArray arrayWithObjects:Three000GT, Diamante, Eclipse, Expo, Galant, Mirage, Montero, Pickup, nil], Mitsubishi,
        [NSArray arrayWithObjects:Two00SX, Two40SX, Three00ZX, Altima, Axxess, Maxima, Pathfinder, Pickup, Quest, Sentra, nil], Nissan,
        [NSArray arrayWithObjects:Achieva, Aurora, CutlassCiera, CutlassCruiser, CutlassSupreme, EightyDashEight, NinetyDashEight, Silhouette, nil], Oldsmobile,
        [NSArray arrayWithObjects:Acclaim, Colt, GrandVoyager, Neon, Voyager, nil], Plymouth,
        [NSArray arrayWithObjects:Bonneville, Firebird, Firefly, GrandAm, GrandPrix, Sunfire, Sunrunner, TransSport, nil], Pontiac,
        [NSArray arrayWithObjects:SC1, SC2, SL, SL1, SL2, SW1, SW2, nil], Saturn,
        [NSArray arrayWithObjects:Impreza, Legacy, SVX, nil], Subaru,
        [NSArray arrayWithObjects:Esteem, Samurai, Sidekick, Swift, nil], Suzuki,
        [NSArray arrayWithObjects:FourRunner, Avalon, Camry, Celica, Corolla, LandCruiser, MR2, Paseo, Pickup, Previa, Supra, T100, Tacoma, Tercel, nil], Toyota,
        [NSArray arrayWithObjects:OTHER, nil], OTHER,
        nil], self._yearArray[VehicleYearIndex1995],

      [NSDictionary dictionaryWithObjectsAndKeys:
        [NSArray arrayWithObjects:Integra, Legend, NSX, Vigor, nil], Acura,
        [NSArray arrayWithObjects:Century, LeSabre, ParkAvenue, Regal, Roadmaster, Skylark, nil], Buick,
        [NSArray arrayWithObjects:DeVille, Eldorado, Fleetwood, Seville, nil], Cadillac,
        [NSArray arrayWithObjects:Astro, Beretta, Blazer, C3500HD, Camaro, Caprice, Cavalier, ChevyVan, Corsica, Corvette, ForwardControl, Lumina, LuminaAPV, Pickup, S10Blazer, S10Pickup, Sportvan, Suburban, nil], Chevrolet,
        [NSArray arrayWithObjects:Concorde, Intrepid, LeBaron, LHS, NewYorker, TownAndCountry, nil], Chrysler,
        [NSArray arrayWithObjects:Caravan, Colt, ColtWagon, Dakota, GrandCaravan, Intrepid, Pickup, RamVan, RamWagon, Shadow, Spirit, Stealth, Viper, nil], Dodge,
        [NSArray arrayWithObjects:Summit, SummitWagon, Talon, Vision, nil], Eagle,
        [NSArray arrayWithObjects:Aerostar, Aspire, Bronco, ClubWagon, CrownVictoria, Econoline, Escort, Explorer, FDashSuperDuty, Mustang, Pickup, Probe, Ranger, Taurus, Tempo, Thunderbird, nil], Ford,
        [NSArray arrayWithObjects:Metro, Prizm, Tracker, nil], Geo,
        [NSArray arrayWithObjects:C3500HD, ForwardControl, Jimmy, Pickup, Rally, RallyCamperSpecial, Safari, Sonoma, Suburban, Vandura, VanduraSpecial, Yukon, nil], GMC,
        [NSArray arrayWithObjects:Accord, Civic, CivicDelSol, Passport, Prelude, nil], Honda,
        [NSArray arrayWithObjects:H1, nil], Hummer,
        [NSArray arrayWithObjects:Elantra, Excel, Scoupe, Sonata, nil], Hyundai,
        [NSArray arrayWithObjects:G20, J30, Q45, nil], Infiniti,
        [NSArray arrayWithObjects:Amigo, Pickup, Rodeo, Trooper, nil], Isuzu,
        [NSArray arrayWithObjects:Cherokee, GrandCherokee, Wrangler, nil], Jeep,
        [NSArray arrayWithObjects:Sephia, nil], Kia,
        [NSArray arrayWithObjects:ES300, GS300, LS400, SC300, SC400, nil], Lexus,
        [NSArray arrayWithObjects:Continental, MarkVIII, TownCar, nil], Lincoln,
        [NSArray arrayWithObjects:Three23, Six26, Six26Cronos, Nine29, Nine29Serenia, B2300, B3000, B4000, MPV, MXDash3, MXDash3Precidia, MXDash5Miata, MXDash6, MXDash6Mystere, Navajo, Protege, RXDash7, nil], Mazda,
        [NSArray arrayWithObjects:Cougar, GrandMarquis, Sable, Topaz, Tracer, Villager, nil], Mercury,
        [NSArray arrayWithObjects:Three000GT, Diamante, Eclipse, Expo, Galant, Mirage, Montero, Pickup, Precis, nil], Mitsubishi,
        [NSArray arrayWithObjects:Two40SX, Three00ZX, Altima, Axxess, Maxima, Pathfinder, Pickup, Quest, Sentra, nil], Nissan,
        [NSArray arrayWithObjects:Achieva, Bravada, CutlassCiera, CutlassCruiser, CutlassSupreme, EightyDashEight, NinetyDashEight, Silhouette, nil], Oldsmobile,
        [NSArray arrayWithObjects:Acclaim, Colt, ColtVista, ColtWagon, GrandVoyager, Laser, Sundance, Voyager, nil], Plymouth,
        [NSArray arrayWithObjects:Bonneville, Firebird, Firefly, GrandAm, GrandPrix, Sunbird, Sunrunner, TransSport, nil], Pontiac,
        [NSArray arrayWithObjects:SC1, SC2, SL, SL1, SL2, SW1, SW2, nil], Saturn,
        [NSArray arrayWithObjects:Impreza, Justy, Legacy, Loyale, SVX, nil], Subaru,
        [NSArray arrayWithObjects:Samurai, Sidekick, Swift, nil], Suzuki,
        [NSArray arrayWithObjects:FourRunner, Camry, Celica, Corolla, LandCruiser, MR2, Paseo, Pickup, Previa, Supra, T100, Tercel, nil], Toyota,
        [NSArray arrayWithObjects:OTHER, nil], OTHER,
        nil], self._yearArray[VehicleYearIndex1994],

      [NSDictionary dictionaryWithObjectsAndKeys:
        [NSArray arrayWithObjects:Integra, Legend, NSX, Vigor, nil], Acura,
        [NSArray arrayWithObjects:Century, LeSabre, ParkAvenue, Regal, Riviera, Roadmaster, Skylark, nil], Buick,
        [NSArray arrayWithObjects:Allante, DeVille, Eldorado, Fleetwood, Seville, SixtySpecial, nil], Cadillac,
        [NSArray arrayWithObjects:APV, Astro, Beretta, Blazer, C3500HD, Camaro, Caprice, Cavalier, ChevyVan, Corsica, Corvette, ForwardControl, HiDashCube, Lumina, LuminaAPV, Pickup, S10Blazer, S10Pickup, Sportvan, StepVan, Suburban, nil], Chevrolet,
        [NSArray arrayWithObjects:Concorde, Daytona, Dynasty, Imperial, Intrepid, LeBaron, NewYorker, NewYorkerFifthAvenue, TownAndCountry, nil], Chrysler,
        [NSArray arrayWithObjects:Caravan, Colt, ColtWagon, Dakota, Daytona, Dynasty, GrandCaravan, Intrepid, Pickup, Ram50, RamVan, RamWagon, Ramcharger, Shadow, Spirit, Stealth, Viper, nil], Dodge,
        [NSArray arrayWithObjects:Two000, Summit, SummitWagon, Talon, Vision, nil], Eagle,
        [NSArray arrayWithObjects:Aerostar, Bronco, ClubWagon, CrownVictoria, Econoline, Escort, Explorer, FDashSuperDuty, Festiva, Mustang, Pickup, Probe, Ranger, Taurus, Tempo, Thunderbird, nil], Ford,
        [NSArray arrayWithObjects:Metro, Prizm, Storm, Tracker, nil], Geo,
        [NSArray arrayWithObjects:C3500HD, ForwardControl, Jimmy, Magnavan, Pickup, Rally, RallyCamperSpecial, Safari, Sonoma, Suburban, ValueVan, Vandura, VanduraSpecial, Yukon, nil], GMC,
        [NSArray arrayWithObjects:Accord, Civic, CivicDelSol, Prelude, nil], Honda,
        [NSArray arrayWithObjects:H1, nil], Hummer,
        [NSArray arrayWithObjects:Elantra, Excel, Scoupe, Sonata, nil], Hyundai,
        [NSArray arrayWithObjects:G20, J30, Q45, nil], Infiniti,
        [NSArray arrayWithObjects:Amigo, Pickup, Rodeo, Stylus, Trooper, nil], Isuzu,
        [NSArray arrayWithObjects:Cherokee, GrandCherokee, Wrangler, nil], Jeep,
        [NSArray arrayWithObjects:ES300, GS300, LS400, SC300, SC400, nil], Lexus,
        [NSArray arrayWithObjects:Continental, MarkVIII, TownCar, nil], Lincoln,
        [NSArray arrayWithObjects:Three23, Six26, Six26Cronos, Nine29, Nine29Serenia, B2200, B2600i, MPV, MXDash3, MXDash3Precidia, MXDash5Miata, MXDash6, MXDash6Mystere, Navajo, Protege, RXDash7, nil], Mazda,
        [NSArray arrayWithObjects:Cougar, GrandMarquis, Sable, Topaz, Tracer, Villager, nil], Mercury,
        [NSArray arrayWithObjects:Three000GT, Diamante, Eclipse, Expo, Galant, Mirage, Montero, Pickup, Precis, nil], Mitsubishi,
        [NSArray arrayWithObjects:Two40SX, Three00ZX, Altima, Axxess, Maxima, NX, Pathfinder, Pickup, Quest, Sentra, nil], Nissan,
        [NSArray arrayWithObjects:Achieva, Bravada, CutlassCiera, CutlassCruiser, CutlassSupreme, EightyDashEight, NinetyDashEight, Silhouette, nil], Oldsmobile,
        [NSArray arrayWithObjects:Acclaim, Colt, ColtVista, ColtWagon, GrandVoyager, Laser, Sundance, Voyager, nil], Plymouth,
        [NSArray arrayWithObjects:Bonneville, Firebird, GrandAm, GrandPrix, LeMans, Sunbird, TransSport, nil], Pontiac,
        [NSArray arrayWithObjects:SC1, SC2, SL, SL1, SL2, SW1, SW2, nil], Saturn,
        [NSArray arrayWithObjects:Impreza, Justy, Legacy, Loyale, SVX, nil], Subaru,
        [NSArray arrayWithObjects:Samurai, Sidekick, Swift, nil], Suzuki,
        [NSArray arrayWithObjects:FourRunner, Camry, Celica, Corolla, LandCruiser, MR2, Paseo, Pickup, Previa, Supra, T100, Tercel, nil], Toyota,
        [NSArray arrayWithObjects:OTHER, nil], OTHER,
        nil], self._yearArray[VehicleYearIndex1993],

      [NSDictionary dictionaryWithObjectsAndKeys:
        [NSArray arrayWithObjects:Integra, Legend, NSX, Vigor, nil], Acura,
        [NSArray arrayWithObjects:Century, LeSabre, ParkAvenue, Regal, Riviera, Roadmaster, Skylark, nil], Buick,
        [NSArray arrayWithObjects:Allante, Brougham, DeVille, Eldorado, Fleetwood, Seville, nil], Cadillac,
        [NSArray arrayWithObjects:APV, Astro, Beretta, Blazer, C3500HD, Camaro, Caprice, Cavalier, ChevyVan, Corsica, Corvette, ForwardControl, HiDashCube, Lumina, LuminaAPV, Pickup, S10Blazer, S10Pickup, Sportvan, Sprint, StepVan, Suburban, Tracker, nil], Chevrolet,
        [NSArray arrayWithObjects:Daytona, Dynasty, Imperial, LeBaron, NewYorker, NewYorkerFifthAvenue, TownAndCountry, nil], Chrysler,
        [NSArray arrayWithObjects:Caravan, Colt, Colt100, Colt200, ColtWagon, Dakota, Daytona, Dynasty, GrandCaravan, Monaco, Pickup, Ram50, RamVan, RamWagon, Ramcharger, Shadow, Spirit, Stealth, Viper, nil], Dodge,
        [NSArray arrayWithObjects:Two000, Premier, Summit, SummitWagon, Talon, Vista, nil], Eagle,
        [NSArray arrayWithObjects:Aerostar, Bronco, ClubWagon, CrownVictoria, Econoline, Escort, Explorer, FDashSuperDuty, Festiva, Mustang, Pickup, Probe, Ranger, Taurus, Tempo, Thunderbird, nil], Ford,
        [NSArray arrayWithObjects:Metro, Prizm, Storm, Tracker, nil], Geo,
        [NSArray arrayWithObjects:C3500HD, ForwardControl, Jimmy, Magnavan, Pickup, Rally, RallyCamperSpecial, Safari, Sonoma, Suburban, Tracker, ValueVan, Vandura, VanduraSpecial, Yukon, nil], GMC,
        [NSArray arrayWithObjects:Accord, Civic, Prelude, nil], Honda,
        [NSArray arrayWithObjects:H1, nil], Hummer,
        [NSArray arrayWithObjects:Elantra, Excel, Scoupe, Sonata, nil], Hyundai,
        [NSArray arrayWithObjects:G20, M30, Q45, nil], Infiniti,
        [NSArray arrayWithObjects:Amigo, Impulse, Pickup, Rodeo, Stylus, Trooper, nil], Isuzu,
        [NSArray arrayWithObjects:Cherokee, Comanche, Wrangler, nil], Jeep,
        [NSArray arrayWithObjects:ES300, LS400, SC300, SC400, nil], Lexus,
        [NSArray arrayWithObjects:Continental, MarkVII, TownCar, nil], Lincoln,
        [NSArray arrayWithObjects:Three23, Six26, Nine29, Nine29Serenia, B2200, B2600i, MPV, MXDash3, MXDash3Precidia, MXDash5Miata, MXDash6, Navajo, Protege, nil], Mazda,
        [NSArray arrayWithObjects:Cougar, GrandMarquis, Sable, Topaz, Tracer, nil], Mercury,
        [NSArray arrayWithObjects:Three000GT, Diamante, Eclipse, Expo, Galant, Mirage, Montero, Pickup, Precis, nil], Mitsubishi,
        [NSArray arrayWithObjects:Two40SX, Three00ZX, Axxess, Maxima, NX, Pathfinder, Pickup, Sentra, Stanza, nil], Nissan,
        [NSArray arrayWithObjects:Achieva, Bravada, CustomCruiser, CutlassCiera, CutlassCruiser, CutlassSupreme, EightyDashEight, NinetyDashEight, Silhouette, Toronado, nil], Oldsmobile,
        [NSArray arrayWithObjects:Acclaim, Colt, Colt100, Colt200, ColtVista, ColtWagon, GrandVoyager, Laser, Sundance, Voyager, nil], Plymouth,
        [NSArray arrayWithObjects:Bonneville, Firebird, GrandAm, GrandPrix, LeMans, Sunbird, TransSport, nil], Pontiac,
        [NSArray arrayWithObjects:SC, SL, SL1, SL2, nil], Saturn,
        [NSArray arrayWithObjects:Justy, Legacy, Loyale, SVX, nil], Subaru,
        [NSArray arrayWithObjects:Samurai, Sidekick, Swift, nil], Suzuki,
        [NSArray arrayWithObjects:FourRunner, Camry, Celica, Corolla, Cressida, LandCruiser, MR2, Paseo, Pickup, Previa, Supra, Tercel, nil], Toyota,
        [NSArray arrayWithObjects:OTHER, nil], OTHER,
        nil], self._yearArray[VehicleYearIndex1992],

      [NSDictionary dictionaryWithObjectsAndKeys:
        [NSArray arrayWithObjects:Integra, Legend, NSX, nil], Acura,
        [NSArray arrayWithObjects:Century, LeSabre, ParkAvenue, Reatta, Regal, Riviera, Roadmaster, Skylark, nil], Buick,
        [NSArray arrayWithObjects:Allante, Brougham, DeVille, Eldorado, Fleetwood, Seville, nil], Cadillac,
        [NSArray arrayWithObjects:APV, Astro, Beretta, Blazer, C3500HD, Camaro, Caprice, Cavalier, ChevyVan, Corsica, Corvette, ForwardControl, HiDashCube, Lumina, LuminaAPV, Pickup, S10Blazer, S10Pickup, Sportvan, Sprint, StepVan, Suburban, Tracker, nil], Chevrolet,
        [NSArray arrayWithObjects:Daytona, Dynasty, Imperial, LeBaron, NewYorker, NewYorkerFifthAvenue, TC, TownAndCountry, nil], Chrysler,
        [NSArray arrayWithObjects:Caravan, Colt, Colt100, Colt200, ColtVista, Dakota, Daytona, Dynasty, GrandCaravan, Monaco, Pickup, Ram50, RamVan, RamWagon, Ramcharger, Shadow, Spirit, Stealth, nil], Dodge,
        [NSArray arrayWithObjects:Two000, Premier, Summit, Talon, Vista, VistaWagon, nil], Eagle,
        [NSArray arrayWithObjects:Aerostar, Bronco, ClubWagon, Econoline, Escort, Explorer, FDashSuperDuty, Festiva, LTDCrownVictoria, Mustang, Pickup, Probe, Ranger, Taurus, Tempo, Thunderbird, nil], Ford,
        [NSArray arrayWithObjects:Metro, Prizm, Storm, Tracker, nil], Geo,
        [NSArray arrayWithObjects:C3500HD, ForwardControl, Jimmy, Magnavan, Pickup, Rally, RallyCamperSpecial, S15Jimmy, Safari, Sonoma, Suburban, Tracker, ValueVan, Vandura, VanduraSpecial, nil], GMC,
        [NSArray arrayWithObjects:Accord, Civic, Prelude, nil], Honda,
        [NSArray arrayWithObjects:Excel, Scoupe, Sonata, nil], Hyundai,
        [NSArray arrayWithObjects:G20, M30, Q45, nil], Infiniti,
        [NSArray arrayWithObjects:Amigo, Impulse, Pickup, Rodeo, Stylus, Trooper, nil], Isuzu,
        [NSArray arrayWithObjects:Cherokee, Comanche, GrandWagoneer, Wrangler, nil], Jeep,
        [NSArray arrayWithObjects:ES250, LS400, nil], Lexus,
        [NSArray arrayWithObjects:Continental, MarkVII, TownCar, nil], Lincoln,
        [NSArray arrayWithObjects:Three23, Six26, Nine29, B2200, B2600i, MPV, MXDash5Miata, MXDash6, Navajo, Protege, RXDash7, nil], Mazda,
        [NSArray arrayWithObjects:Cougar, GrandMarquis, Sable, Topaz, Tracer, nil], Mercury,
        [NSArray arrayWithObjects:Three000GT, Eclipse, Galant, Mirage, Montero, Pickup, Precis, nil], Mitsubishi,
        [NSArray arrayWithObjects:Two40SX, Three00ZX, Axxess, Maxima, Micra, NX, Pathfinder, Pickup, Sentra, Stanza, nil], Nissan,
        [NSArray arrayWithObjects:Bravada, CustomCruiser, CutlassCalais, CutlassCiera, CutlassCruiser, CutlassSupreme, Delta88, EightyDashEight, NinetyDashEight, Silhouette, Toronado, nil], Oldsmobile,
        [NSArray arrayWithObjects:Acclaim, Colt, Colt100, Colt200, ColtVista, GrandVoyager, Laser, Sundance, Voyager, nil], Plymouth,
        [NSArray arrayWithObjects:Six000, Bonneville, Firebird, Firefly, GrandAm, GrandPrix, LeMans, Sunbird, Tempest, TransSport, nil], Pontiac,
        [NSArray arrayWithObjects:SC, SL, SL1, SL2, nil], Saturn,
        [NSArray arrayWithObjects:Justy, Legacy, Loyale, XT, XT6, nil], Subaru,
        [NSArray arrayWithObjects:Samurai, Sidekick, Swift, nil], Suzuki,
        [NSArray arrayWithObjects:FourRunner, Camry, Celica, Corolla, Cressida, LandCruiser, MR2, Pickup, Previa, Supra, Tercel, nil], Toyota,
        [NSArray arrayWithObjects:OTHER, nil], OTHER,
        nil], self._yearArray[VehicleYearIndex1991],

      [NSDictionary dictionaryWithObjectsAndKeys:
        [NSArray arrayWithObjects:Integra, Legend, nil], Acura,
        [NSArray arrayWithObjects:Century, Electra, EstateWagon, LeSabre, Reatta, Regal, Riviera, Skylark, nil], Buick,
        [NSArray arrayWithObjects:Allante, Brougham, DeVille, Eldorado, Fleetwood, Seville, nil], Cadillac,
        [NSArray arrayWithObjects:APV, Astro, Beretta, Blazer, Camaro, Caprice, Cavalier, Celebrity, ChevyVan, Corsica, Corvette, ForwardControl, HiDashCube, Lumina, LuminaAPV, Pickup, S10Blazer, S10Pickup, Sportvan, Sprint, StepVan, Suburban, Tracker, nil], Chevrolet,
        [NSArray arrayWithObjects:Daytona, Dynasty, Imperial, LeBaron, NewYorker, NewYorkerFifthAvenue, TC, TownAndCountry, nil], Chrysler,
        [NSArray arrayWithObjects:Two000, Caravan, Colt, Colt100, Colt200, ColtVista, Dakota, Daytona, Dynasty, GrandCaravan, Monaco, Omni, Pickup, Ram50, RamVan, RamWagon, Ramcharger, Shadow, Spirit, nil], Dodge,
        [NSArray arrayWithObjects:Premier, Summit, Talon, Vista, VistaWagon, nil], Eagle,
        [NSArray arrayWithObjects:Aerostar, Bronco, BroncoII, ClubWagon, Econoline, Escort, FDashSuperDuty, Festiva, LTDCrownVictoria, Mustang, Pickup, Probe, Ranger, Taurus, Tempo, Thunderbird, nil], Ford,
        [NSArray arrayWithObjects:Metro, Prizm, Storm, Tracker, nil], Geo,
        [NSArray arrayWithObjects:ForwardControl, Jimmy, Magnavan, Pickup, Rally, RallyCamperSpecial, S15Jimmy, S15Pickup, Safari, Suburban, Tracker, ValueVan, Vandura, VanduraSpecial, nil], GMC,
        [NSArray arrayWithObjects:Accord, Civic, Prelude, nil], Honda,
        [NSArray arrayWithObjects:Excel, Sonata, nil], Hyundai,
        [NSArray arrayWithObjects:M30, Q45, nil], Infiniti,
        [NSArray arrayWithObjects:Amigo, Impulse, Pickup, Trooper, nil], Isuzu,
        [NSArray arrayWithObjects:Cherokee, Comanche, GrandWagoneer, Wagoneer, Wrangler, nil], Jeep,
        [NSArray arrayWithObjects:ES250, LS400, nil], Lexus,
        [NSArray arrayWithObjects:Continental, MarkVII, TownCar, nil], Lincoln,
        [NSArray arrayWithObjects:Three23, Six26, Nine29, B2200, B2600i, MPV, MXDash5Miata, MXDash6, Protege, RXDash7, nil], Mazda,
        [NSArray arrayWithObjects:Cougar, GrandMarquis, Sable, Topaz, nil], Mercury,
        [NSArray arrayWithObjects:Eclipse, Galant, Mirage, Montero, Pickup, Precis, Sigma, Van, nil], Mitsubishi,
        [NSArray arrayWithObjects:Two40SX, Three00ZX, Axxess, Maxima, Micra, Pathfinder, Pickup, PulsarNX, Sentra, Stanza, Van, nil], Nissan,
        [NSArray arrayWithObjects:CustomCruiser, CutlassCalais, CutlassCiera, CutlassCruiser, CutlassSupreme, Delta88, EightyDashEight, NinetyDashEight, Silhouette, Toronado, nil], Oldsmobile,
        [NSArray arrayWithObjects:Acclaim, Colt, Colt100, Colt200, ColtVista, GrandVoyager, Horizon, Laser, Sundance, Voyager, nil], Plymouth,
        [NSArray arrayWithObjects:Six000, Bonneville, Firebird, Firefly, GrandAm, GrandPrix, LeMans, Sunbird, Tempest, TransSport, nil], Pontiac,
        [NSArray arrayWithObjects:Justy, Legacy, Loyale, XT, XT6, nil], Subaru,
        [NSArray arrayWithObjects:Samurai, Sidekick, Swift, nil], Suzuki,
        [NSArray arrayWithObjects:FourRunner, Camry, Celica, Corolla, Cressida, LandCruiser, Pickup, Supra, Tercel, nil], Toyota,
        [NSArray arrayWithObjects:OTHER, nil], OTHER,
        nil], self._yearArray[VehicleYearIndex1990],

      [NSDictionary dictionaryWithObjectsAndKeys:
        [NSArray arrayWithObjects:Integra, Legend, nil], Acura,
        [NSArray arrayWithObjects:Century, Electra, LeSabre, Reatta, Regal, Riviera, Skyhawk, Skylark, nil], Buick,
        [NSArray arrayWithObjects:Allante, Brougham, DeVille, Eldorado, Fleetwood, Seville, nil], Cadillac,
        [NSArray arrayWithObjects:Astro, Beretta, Blazer, Camaro, Caprice, Cavalier, Celebrity, ChevyVan, Corsica, Corvette, ForwardControl, HiDashCube, Pickup, S10Blazer, S10Pickup, Sportvan, Sprint, StepVan, Suburban, Tracker, nil], Chevrolet,
        [NSArray arrayWithObjects:Conquest, Daytona, Dynasty, FifthAvenue, LeBaron, NewYorker, TC, nil], Chrysler,
        [NSArray arrayWithObjects:Two000, Aries, Caravan, Colt, Colt100, Colt200, ColtVista, Dakota, Daytona, Diplomat, Dynasty, GrandCaravan, Lancer, Omni, Pickup, Raider, Ram50, RamVan, RamWagon, Ramcharger, Shadow, Spirit, nil], Dodge,
        [NSArray arrayWithObjects:Medallion, Premier, Summit, Vista, VistaWagon, nil], Eagle,
        [NSArray arrayWithObjects:Aerostar, Bronco, BroncoII, ClubWagon, Econoline, Escort, FDashSuperDuty, Festiva, LTDCrownVictoria, Mustang, Pickup, Probe, Ranger, Taurus, Tempo, Thunderbird, nil], Ford,
        [NSArray arrayWithObjects:Metro, Prizm, Spectrum, Tracker, nil], Geo,
        [NSArray arrayWithObjects:ForwardControl, Jimmy, Magnavan, Pickup, Rally, RallyCamperSpecial, S15Jimmy, S15Pickup, Safari, Suburban, Tracker, ValueVan, Vandura, VanduraSpecial, nil], GMC,
        [NSArray arrayWithObjects:Accord, Civic, Prelude, nil], Honda,
        [NSArray arrayWithObjects:Excel, Sonata, nil], Hyundai,
        [NSArray arrayWithObjects:Amigo, IDashMark, Impulse, Pickup, Trooper, TrooperII, nil], Isuzu,
        [NSArray arrayWithObjects:Cherokee, Comanche, GrandWagoneer, Wagoneer, Wrangler, nil], Jeep,
        [NSArray arrayWithObjects:Continental, MarkVII, TownCar, nil], Lincoln,
        [NSArray arrayWithObjects:Three23, Six26, Nine29, B2200, B2600i, MPV, MXDash6, RXDash7, nil], Mazda,
        [NSArray arrayWithObjects:Cougar, GrandMarquis, Sable, Topaz, Tracer, nil], Mercury,
        [NSArray arrayWithObjects:Galant, Mirage, Montero, Pickup, Precis, Sigma, Starion, Van, nil], Mitsubishi,
        [NSArray arrayWithObjects:Two40SX, Three00ZX, Maxima, Micra, Pathfinder, Pickup, PulsarNX, Sentra, Stanza, nil], Nissan,
        [NSArray arrayWithObjects:CustomCruiser, CutlassCalais, CutlassCiera, CutlassCruiser, CutlassSupreme, Delta88, EightyDashEight, NinetyDashEight, Toronado, nil], Oldsmobile,
        [NSArray arrayWithObjects:Acclaim, Caravelle, Colt, Colt100, Colt200, ColtVista, Expo, GranFury, GrandVoyager, Horizon, Reliant, Sundance, Voyager, nil], Plymouth,
        [NSArray arrayWithObjects:Six000, Bonneville, Firebird, Firefly, GrandAm, GrandPrix, LeMans, Safari, Sunbird, Tempest, nil], Pontiac,
        [NSArray arrayWithObjects:Chaser, DL, GL, GLDash10, Justy, RX, XT, XT6, nil], Subaru,
        [NSArray arrayWithObjects:Samurai, Sidekick, Swift, nil], Suzuki,
        [NSArray arrayWithObjects:FourRunner, Camry, Celica, Corolla, Cressida, LandCruiser, MR2, Pickup, Supra, Tercel, Van, nil], Toyota,
        [NSArray arrayWithObjects:OTHER, nil], OTHER,
        nil], self._yearArray[VehicleYearIndex1989],

      [NSDictionary dictionaryWithObjectsAndKeys:
        [NSArray arrayWithObjects:Integra, Legend, nil], Acura,
        [NSArray arrayWithObjects:Century, Electra, LeSabre, Reatta, Regal, Riviera, Skyhawk, Skylark, nil], Buick,
        [NSArray arrayWithObjects:Allante, Brougham, Cimarron, DeVille, Eldorado, Fleetwood, Seville, nil], Cadillac,
        [NSArray arrayWithObjects:Astro, Beretta, Blazer, Camaro, Caprice, Cavalier, Celebrity, ChevyVan, Corsica, Corvette, ForwardControl, HiDashCube, MonteCarlo, Nova, Pickup, S10Blazer, S10Pickup, Spectrum, Sportvan, Sprint, StepVan, Suburban, nil], Chevrolet,
        [NSArray arrayWithObjects:Conquest, Daytona, Dynasty, FifthAvenue, LeBaron, LeBaronGTS, NewYorker, nil], Chrysler,
        [NSArray arrayWithObjects:Six00, Aries, Caravan, Colt, ColtVista, Dakota, Daytona, Diplomat, Dynasty, Expo, GrandCaravan, Lancer, MiniRamVan, Omni, Pickup, Raider, Ram50, RamVan, RamWagon, Ramcharger, Shadow, nil], Dodge,
        [NSArray arrayWithObjects:Medallion, Premier, nil], Eagle,
        [NSArray arrayWithObjects:Aerostar, Bronco, BroncoII, ClubWagon, Econoline, Escort, EscortEXP, FDashSuperDuty, Festiva, LTDCrownVictoria, Mustang, Pickup, Ranger, Taurus, Tempo, Thunderbird, nil], Ford,
        [NSArray arrayWithObjects:ForwardControl, Jimmy, Magnavan, Pickup, Rally, RallyCamperSpecial, S15Jimmy, S15Pickup, Safari, Suburban, ValueVan, Vandura, VanduraSpecial, nil], GMC,
        [NSArray arrayWithObjects:Accord, Civic, Prelude, nil], Honda,
        [NSArray arrayWithObjects:Excel, Stellar, nil], Hyundai,
        [NSArray arrayWithObjects:IDashMark, Impulse, Pickup, TrooperII, nil], Isuzu,
        [NSArray arrayWithObjects:Cherokee, Comanche, GrandWagoneer, Pickup, Wagoneer, Wrangler, nil], Jeep,
        [NSArray arrayWithObjects:Continental, MarkVII, TownCar, nil], Lincoln,
        [NSArray arrayWithObjects:Three23, Six26, Nine29, B2200, B2600, MXDash6, RXDash7, nil], Mazda,
        [NSArray arrayWithObjects:Cougar, GrandMarquis, Sable, Topaz, Tracer, nil], Mercury,
        [NSArray arrayWithObjects:Cordia, GalantSigma, Mirage, Montero, Pickup, Precis, Starion, Tredia, Van, nil], Mitsubishi,
        [NSArray arrayWithObjects:Two00SX, Three00ZX, Maxima, Micra, Multi, Pathfinder, Pickup, PulsarNX, Sentra, Stanza, Van, nil], Nissan,
        [NSArray arrayWithObjects:CustomCruiser, Cutlass, CutlassCalais, CutlassCiera, CutlassCruiser, CutlassSupreme, Delta88, Firenza, NinetyDashEight, Toronado, nil], Oldsmobile,
        [NSArray arrayWithObjects:Caravelle, Colt, ColtVista, Expo, GranFury, GrandVoyager, Horizon, Reliant, Sundance, Voyager, nil], Plymouth,
        [NSArray arrayWithObjects:Six000, Bonneville, Fiero, Firebird, Firefly, GrandAm, GrandPrix, LeMans, Safari, Sunbird, Tempest, nil], Pontiac,
        [NSArray arrayWithObjects:Chaser, DL, GL, GLDash10, Justy, RX, XT, XT6, nil], Subaru,
        [NSArray arrayWithObjects:Forsa, Samurai, nil], Suzuki,
        [NSArray arrayWithObjects:FourRunner, Camry, Celica, Corolla, Cressida, LandCruiser, MR2, Pickup, Supra, Tercel, Van, nil], Toyota,
        [NSArray arrayWithObjects:OTHER, nil], OTHER,
        nil], self._yearArray[VehicleYearIndex1988],

      [NSDictionary dictionaryWithObjectsAndKeys:
        [NSArray arrayWithObjects:Integra, Legend, nil], Acura,
        [NSArray arrayWithObjects:Century, Electra, LeSabre, Regal, Riviera, Skyhawk, Skylark, Somerset, SomersetRegal, nil], Buick,
        [NSArray arrayWithObjects:Allante, Brougham, Cimarron, DeVille, Eldorado, Fleetwood, Seville, nil], Cadillac,
        [NSArray arrayWithObjects:Astro, Beretta, Blazer, Camaro, Caprice, Cavalier, Celebrity, Chevette, ChevyVan, Corsica, Corvette, ElCamino, ForwardControl, HiDashCube, MonteCarlo, Nova, Pickup, S10Blazer, S10Pickup, Spectrum, Sportvan, Sprint, StepVan, Suburban, nil], Chevrolet,
        [NSArray arrayWithObjects:Conquest, Daytona, FifthAvenue, LeBaron, LeBaronGTS, NewYorker, nil], Chrysler,
        [NSArray arrayWithObjects:Six00, Aries, Caravan, Charger, Colt, ColtVista, Dakota, Daytona, Diplomat, Expo, GrandCaravan, Lancer, MiniRamVan, Omni, Pickup, Raider, Ram50, RamVan, RamWagon, Ramcharger, Shadow, nil], Dodge,
        [NSArray arrayWithObjects:Aerostar, Bronco, BroncoII, ClubWagon, Econoline, Escort, EscortEXP, LTDCrownVictoria, Mustang, Pickup, Ranger, Taurus, Tempo, Thunderbird, nil], Ford,
        [NSArray arrayWithObjects:Caballero, ForwardControl, Jimmy, Magnavan, Pickup, Rally, RallyCamperSpecial, S15Jimmy, S15Pickup, Safari, Suburban, ValueVan, Vandura, VanduraSpecial, nil], GMC,
        [NSArray arrayWithObjects:Accord, Civic, Prelude, nil], Honda,
        [NSArray arrayWithObjects:Excel, Pony, Stellar, nil], Hyundai,
        [NSArray arrayWithObjects:IDashMark, Impulse, Pickup, TrooperII, nil], Isuzu,
        [NSArray arrayWithObjects:Cherokee, Comanche, GrandWagoneer, Pickup, Wagoneer, Wrangler, nil], Jeep,
        [NSArray arrayWithObjects:Continental, MarkVII, TownCar, nil], Lincoln,
        [NSArray arrayWithObjects:Three23, Six26, B2000, B2200, B2600, RXDash7, nil], Mazda,
        [NSArray arrayWithObjects:Cougar, GrandMarquis, Lynx, Sable, Topaz, Tracer, nil], Mercury,
        [NSArray arrayWithObjects:Cordia, Galant, Mirage, Montero, Pickup, Precis, Starion, Tredia, Van, nil], Mitsubishi,
        [NSArray arrayWithObjects:Two00SX, Three00ZX, Maxima, Micra, Multi, Pathfinder, Pickup, PulsarNX, Sentra, Stanza, Van, nil], Nissan,
        [NSArray arrayWithObjects:Calais, CustomCruiser, Cutlass, CutlassCiera, CutlassCruiser, Delta88, Firenza, NinetyDashEight, Toronado, nil], Oldsmobile,
        [NSArray arrayWithObjects:Caravelle, Colt, ColtVista, Expo, GranFury, GrandVoyager, Horizon, Reliant, Sundance, Turismo, Voyager, nil], Plymouth,
        [NSArray arrayWithObjects:One000, Six000, Acadian, Bonneville, Fiero, Firebird, Firefly, GrandAm, GrandPrix, Safari, Sunbird, Sunburst, Tempest, nil], Pontiac,
        [NSArray arrayWithObjects:Brat, DL, GL, GLDash10, Justy, RX, Subaru, XT, nil], Subaru,
        [NSArray arrayWithObjects:Forsa, Samurai, nil], Suzuki,
        [NSArray arrayWithObjects:FourRunner, Camry, Celica, Corolla, Cressida, LandCruiser, MR2, Pickup, Supra, Tercel, Van, nil], Toyota,
        [NSArray arrayWithObjects:OTHER, nil], OTHER,
        nil], self._yearArray[VehicleYearIndex1987],

      [NSDictionary dictionaryWithObjectsAndKeys:
        [NSArray arrayWithObjects:Integra, Legend, nil], Acura,
        [NSArray arrayWithObjects:Century, Electra, LeSabre, Regal, Riviera, Skyhawk, Skylark, Somerset, SomersetRegal, nil], Buick,
        [NSArray arrayWithObjects:Cimarron, DeVille, Eldorado, Fleetwood, Seville, nil], Cadillac,
        [NSArray arrayWithObjects:Astro, Blazer, Camaro, Caprice, Cavalier, Celebrity, Chevette, ChevyVan, Corvette, ElCamino, ForwardControl, HiDashCube, MonteCarlo, Nova, Pickup, S10Blazer, S10Pickup, Spectrum, Sportvan, Sprint, StepVan, Suburban, nil], Chevrolet,
        [NSArray arrayWithObjects:Daytona, Executive, FifthAvenue, Laser, LeBaron, LeBaronGTS, NewYorker, nil], Chrysler,
        [NSArray arrayWithObjects:Six00, Aries, Caravan, Charger, Colt, ColtVista, Conquest, Daytona, Diplomat, Lancer, MiniRamVan, Omni, Pickup, Ram50, RamVan, RamWagon, Ramcharger, nil], Dodge,
        [NSArray arrayWithObjects:Aerostar, Bronco, BroncoII, ClubWagon, Econoline, Escort, EscortEXP, LTD, LTDCrownVictoria, Mustang, Pickup, Ranger, Taurus, Tempo, Thunderbird, nil], Ford,
        [NSArray arrayWithObjects:Caballero, ForwardControl, Jimmy, Magnavan, Pickup, Rally, RallyCamperSpecial, S15Jimmy, S15Pickup, Safari, Suburban, ValueVan, Vandura, VanduraSpecial, nil], GMC,
        [NSArray arrayWithObjects:Accord, Civic, Prelude, nil], Honda,
        [NSArray arrayWithObjects:Excel, Pony, Stellar, nil], Hyundai,
        [NSArray arrayWithObjects:IDashMark, Impulse, Pickup, TrooperII, nil], Isuzu,
        [NSArray arrayWithObjects:Cherokee, CJ7, Comanche, GrandWagoneer, Pickup, Wagoneer, nil], Jeep,
        [NSArray arrayWithObjects:Continental, MarkVII, TownCar, nil], Lincoln,
        [NSArray arrayWithObjects:Three23, Six26, B2000, GLC, RXDash7, nil], Mazda,
        [NSArray arrayWithObjects:Capri, Cougar, GrandMarquis, Lynx, Marquis, Sable, Topaz, nil], Mercury,
        [NSArray arrayWithObjects:Cordia, Galant, Mirage, Montero, Pickup, Starion, Tredia, nil], Mitsubishi,
        [NSArray arrayWithObjects:Two00SX, Three00ZX, Maxima, Micra, Multi, Pickup, PulsarNX, Sentra, Stanza, nil], Nissan,
        [NSArray arrayWithObjects:Calais, CustomCruiser, Cutlass, CutlassCiera, CutlassCruiser, Delta88, Firenza, NinetyDashEight, Toronado, nil], Oldsmobile,
        [NSArray arrayWithObjects:Caravelle, Colt, ColtVista, Conquest, GranFury, Horizon, Reliant, Turismo, Voyager, nil], Plymouth,
        [NSArray arrayWithObjects:One000, Six000, Acadian, Bonneville, Fiero, Firebird, Firefly, GrandAm, GrandPrix, Parisienne, Sunbird, Sunburst, nil], Pontiac,
        [NSArray arrayWithObjects:Brat, DL, GL, GLDash10, RX, Subaru, XT, nil], Subaru,
        [NSArray arrayWithObjects:Forsa, Samurai, nil], Suzuki,
        [NSArray arrayWithObjects:FourRunner, Camry, Celica, Corolla, Cressida, LandCruiser, MR2, Pickup, Supra, Tercel, Van, nil], Toyota,
        [NSArray arrayWithObjects:OTHER, nil], OTHER,
        nil], self._yearArray[VehicleYearIndex1986],

      [NSDictionary dictionaryWithObjectsAndKeys:
        [NSArray arrayWithObjects:Century, Electra, LeSabre, Regal, Riviera, Skyhawk, Skylark, SomersetRegal, nil], Buick,
        [NSArray arrayWithObjects:Cimarron, DeVille, Eldorado, Fleetwood, Seville, nil], Cadillac,
        [NSArray arrayWithObjects:Astro, Blazer, Camaro, Caprice, Cavalier, Celebrity, Chevette, ChevyVan, CitationII, Corvette, ElCamino, ForwardControl, HiDashCube, Impala, MonteCarlo, Nova, Pickup, S10Blazer, S10Pickup, Spectrum, Sportvan, Sprint, StepVan, Suburban, nil], Chevrolet,
        [NSArray arrayWithObjects:Daytona, Executive, FifthAvenue, Laser, LeBaron, LeBaronGTS, NewYorker, nil], Chrysler,
        [NSArray arrayWithObjects:Six00, Aries, Caravan, Charger, Colt, ColtVista, Conquest, Daytona, Diplomat, Lancer, MiniRamVan, Omni, Pickup, Ram50, RamVan, RamWagon, Ramcharger, nil], Dodge,
        [NSArray arrayWithObjects:Bronco, BroncoII, ClubWagon, Econoline, Escort, EXP, LTD, LTDCrownVictoria, Mustang, Pickup, Ranger, Tempo, Thunderbird, nil], Ford,
        [NSArray arrayWithObjects:Caballero, ForwardControl, Jimmy, Magnavan, Pickup, Rally, RallyCamperSpecial, S15Jimmy, S15Pickup, Safari, Suburban, ValueVan, Vandura, VanduraSpecial, nil], GMC,
        [NSArray arrayWithObjects:Accord, Civic, Prelude, nil], Honda,
        [NSArray arrayWithObjects:Pony, Stellar, nil], Hyundai,
        [NSArray arrayWithObjects:IDashMark, Impulse, Pickup, TrooperII, nil], Isuzu,
        [NSArray arrayWithObjects:Cherokee, CJ7, GrandWagoneer, Pickup, Scrambler, Wagoneer, nil], Jeep,
        [NSArray arrayWithObjects:Continental, MarkVII, TownCar, nil], Lincoln,
        [NSArray arrayWithObjects:Six26, GLC, RXDash7, nil], Mazda,
        [NSArray arrayWithObjects:Capri, Cougar, GrandMarquis, Lynx, Marquis, Topaz, nil], Mercury,
        [NSArray arrayWithObjects:Cordia, Galant, Mirage, Montero, Pickup, Starion, Tredia, nil], Mitsubishi,
        [NSArray arrayWithObjects:Two00SX, Three00ZX, Maxima, Micra, Pickup, PulsarNX, Sentra, Stanza, nil], Nissan,
        [NSArray arrayWithObjects:Calais, CustomCruiser, Cutlass, CutlassCiera, CutlassCruiser, Delta88, Firenza, NinetyDashEight, Toronado, nil], Oldsmobile,
        [NSArray arrayWithObjects:Caravelle, Colt, ColtVista, Conquest, GranFury, Horizon, Reliant, Turismo, Voyager, nil], Plymouth,
        [NSArray arrayWithObjects:One000, Six000, Acadian, Bonneville, Fiero, Firebird, Firefly, GrandAm, GrandPrix, Parisienne, Sunbird, Sunburst, nil], Pontiac,
        [NSArray arrayWithObjects:Brat, DL, GL, GLDash10, RX, Subaru, XT, nil], Subaru,
        [NSArray arrayWithObjects:Samurai, nil], Suzuki,
        [NSArray arrayWithObjects:FourRunner, Camry, Celica, CelicaSupra, Corolla, Cressida, LandCruiser, MR2, Pickup, Tercel, Van, nil], Toyota,
        [NSArray arrayWithObjects:OTHER, nil], OTHER,
        nil], self._yearArray[VehicleYearIndex1985],

      [NSDictionary dictionaryWithObjectsAndKeys:
        [NSArray arrayWithObjects:Century, Electra, LeSabre, Regal, Riviera, Skyhawk, Skylark, nil], Buick,
        [NSArray arrayWithObjects:Cimarron, DeVille, Eldorado, Fleetwood, Seville, nil], Cadillac,
        [NSArray arrayWithObjects:Blazer, Camaro, Caprice, Cavalier, Celebrity, Chevette, ChevyVan, CitationII, Corvette, ElCamino, ForwardControl, HiDashCube, Impala, MonteCarlo, Pickup, S10Blazer, S10Pickup, Sportvan, StepVan, Suburban, nil], Chevrolet,
        [NSArray arrayWithObjects:Daytona, EClass, Executive, FifthAvenue, Laser, LeBaron, NewYorker, nil], Chrysler,
        [NSArray arrayWithObjects:Six00, Aries, Caravan, Charger, Colt, ColtVista, Conquest, Daytona, Diplomat, MiniRamVan, Omni, Pickup, Ram50, RamVan, RamWagon, Ramcharger, Rampage, nil], Dodge,
        [NSArray arrayWithObjects:Bronco, BroncoII, ClubWagon, Econoline, Escort, EXP, LTD, LTDCrownVictoria, Mustang, Pickup, Ranger, Tempo, Thunderbird, nil], Ford,
        [NSArray arrayWithObjects:Caballero, ForwardControl, Jimmy, Magnavan, Pickup, Rally, RallyCamperSpecial, S15Jimmy, S15Pickup, Suburban, ValueVan, Vandura, VanduraSpecial, nil], GMC,
        [NSArray arrayWithObjects:Accord, Civic, Prelude, nil], Honda,
        [NSArray arrayWithObjects:Pony, nil], Hyundai,
        [NSArray arrayWithObjects:IDashMark, Impulse, Pickup, TrooperII, nil], Isuzu,
        [NSArray arrayWithObjects:Cherokee, CJ7, GrandWagoneer, Pickup, Scrambler, Wagoneer, nil], Jeep,
        [NSArray arrayWithObjects:Continental, MarkVII, TownCar, nil], Lincoln,
        [NSArray arrayWithObjects:Six26, B2000, B2200, GLC, RXDash7, nil], Mazda,
        [NSArray arrayWithObjects:Capri, Cougar, GrandMarquis, Lynx, Marquis, Topaz, nil], Mercury,
        [NSArray arrayWithObjects:Cordia, Montero, Pickup, Starion, Tredia, nil], Mitsubishi,
        [NSArray arrayWithObjects:Two00SX, Three00ZX, Maxima, Micra, Pickup, PulsarNX, Sentra, Stanza, nil], Nissan,
        [NSArray arrayWithObjects:CustomCruiser, Cutlass, CutlassCiera, CutlassCruiser, Delta88, Firenza, NinetyDashEight, Omega, Toronado, nil], Oldsmobile,
        [NSArray arrayWithObjects:Caravelle, Colt, ColtVista, Conquest, GranFury, Horizon, Reliant, Turismo, Voyager, nil], Plymouth,
        [NSArray arrayWithObjects:One000, Two000Sunbird, Six000, Acadian, Bonneville, Fiero, Firebird, GrandPrix, Parisienne, Phoenix, nil], Pontiac,
        [NSArray arrayWithObjects:Brat, DL, GL, Subaru, nil], Subaru,
        [NSArray arrayWithObjects:FourRunner, Camry, Celica, CelicaSupra, Corolla, Cressida, LandCruiser, Pickup, Starlet, Tercel, Van, nil], Toyota,
        [NSArray arrayWithObjects:OTHER, nil], OTHER,
        nil], self._yearArray[VehicleYearIndex1984],

      [NSDictionary dictionaryWithObjectsAndKeys:
        [NSArray arrayWithObjects:Century, Electra, LeSabre, Regal, Riviera, Skyhawk, Skylark, nil], Buick,
        [NSArray arrayWithObjects:Cimarron, DeVille, Eldorado, Fleetwood, Seville, nil], Cadillac,
        [NSArray arrayWithObjects:Blazer, Camaro, Caprice, Cavalier, Celebrity, Chevette, ChevyVan, Citation, ElCamino, ForwardControl, HiDashCube, Impala, Malibu, MonteCarlo, Pickup, S10Blazer, S10Pickup, Sportvan, StepVan, Suburban, nil], Chevrolet,
        [NSArray arrayWithObjects:Cordoba, EClass, Executive, FifthAvenue, Imperial, LeBaron, NewYorker, nil], Chrysler,
        [NSArray arrayWithObjects:Four00, Six00, Aries, Challenger, Charger, Colt, Diplomat, Mirada, Omni, Pickup, Ram50, RamVan, RamWagon, Ramcharger, Rampage, nil], Dodge,
        [NSArray arrayWithObjects:Bronco, ClubWagon, Econoline, Escort, EXP, Fairmont, LTD, LTDCrownVictoria, Mustang, Pickup, Ranger, Thunderbird, nil], Ford,
        [NSArray arrayWithObjects:Caballero, ForwardControl, Jimmy, Magnavan, Pickup, Rally, RallyCamperSpecial, S15Jimmy, S15Pickup, Suburban, ValueVan, Vandura, VanduraSpecial, nil], GMC,
        [NSArray arrayWithObjects:Accord, Civic, Prelude, nil], Honda,
        [NSArray arrayWithObjects:IDashMark, Impulse, Pickup, nil], Isuzu,
        [NSArray arrayWithObjects:Cherokee, CJ5, CJ7, Pickup, Scrambler, Wagoneer, nil], Jeep,
        [NSArray arrayWithObjects:Continental, MarkVI, TownCar, nil], Lincoln,
        [NSArray arrayWithObjects:Six26, B2000, B2200, GLC, RXDash7, nil], Mazda,
        [NSArray arrayWithObjects:Capri, Cougar, GrandMarquis, LN7, Lynx, Marquis, Zephyr, nil], Mercury,
        [NSArray arrayWithObjects:Cordia, Montero, Pickup, Starion, Tredia, nil], Mitsubishi,
        [NSArray arrayWithObjects:Two00SX, Two80ZX, Maxima, Pickup, Pulsar, PulsarNX, Sentra, Stanza, nil], Nissan,
        [NSArray arrayWithObjects:CustomCruiser, Cutlass, CutlassCiera, Delta88, Firenza, NinetyDashEight, Omega, Toronado, nil], Oldsmobile,
        [NSArray arrayWithObjects:Caravelle, Colt, GranFury, Horizon, Reliant, Sapporo, ScampPickup, Turismo, Voyager, nil], Plymouth,
        [NSArray arrayWithObjects:One000, Two000, Two000Sunbird, Six000, Acadian, Bonneville, Firebird, GrandLeMans, GrandPrix, Parisienne, Phoenix, nil], Pontiac,
        [NSArray arrayWithObjects:Brat, DL, GL, Subaru, nil], Subaru,
        [NSArray arrayWithObjects:Camry, Celica, CelicaSupra, Corolla, Cressida, LandCruiser, Pickup, Starlet, Tercel, nil], Toyota,
        [NSArray arrayWithObjects:OTHER, nil], OTHER,
        nil], self._yearArray[VehicleYearIndex1983],

      [NSDictionary dictionaryWithObjectsAndKeys:
        [NSArray arrayWithObjects:Century, Electra, LeSabre, Regal, Riviera, Skyhawk, Skylark, nil], Buick,
        [NSArray arrayWithObjects:Cimarron, DeVille, Eldorado, Fleetwood, Seville, nil], Cadillac,
        [NSArray arrayWithObjects:Blazer, Camaro, Caprice, Cavalier, Celebrity, Chevette, ChevyVan, Citation, Corvette, ElCamino, ForwardControl, HiDashCube, Impala, Luv, Malibu, MonteCarlo, Pickup, S10Pickup, Sportvan, StepVan, Suburban, nil], Chevrolet,
        [NSArray arrayWithObjects:Cordoba, Imperial, LeBaron, NewYorker, nil], Chrysler,
        [NSArray arrayWithObjects:Zero24, Four00, Aries, Challenger, Colt, Diplomat, Mirada, Omni, Pickup, Ram50, RamVan, RamWagon, Ramcharger, Rampage, nil], Dodge,
        [NSArray arrayWithObjects:Bronco, ClubWagon, Courier, Econoline, Escort, EXP, Fairmont, Granada, LTD, LTDCrownVictoria, Mustang, Pickup, Thunderbird, nil], Ford,
        [NSArray arrayWithObjects:Caballero, ForwardControl, Jimmy, Magnavan, Pickup, Rally, RallyCamperSpecial, S15Pickup, Suburban, ValueVan, Vandura, VanduraSpecial, nil], GMC,
        [NSArray arrayWithObjects:Accord, Civic, Prelude, nil], Honda,
        [NSArray arrayWithObjects:IDashMark, Pickup, nil], Isuzu,
        [NSArray arrayWithObjects:Cherokee, CJ5, CJ7, Pickup, Scrambler, Wagoneer, nil], Jeep,
        [NSArray arrayWithObjects:Continental, MarkVI, TownCar, nil], Lincoln,
        [NSArray arrayWithObjects:Six26, B2000, B2200, GLC, RXDash7, nil], Mazda,
        [NSArray arrayWithObjects:Capri, Cougar, CougarXR7, GrandMarquis, LN7, Lynx, Marquis, Zephyr, nil], Mercury,
        [NSArray arrayWithObjects:Two00SX, Two10, Two80ZX, Three10, Maxima, Pickup, Sentra, Stanza, nil], Nissan,
        [NSArray arrayWithObjects:CustomCruiser, Cutlass, CutlassCiera, Delta88, Firenza, NinetyDashEight, Omega, Toronado, nil], Oldsmobile,
        [NSArray arrayWithObjects:ArrowPickup, Caravelle, Champ, GranFury, Horizon, Reliant, Sapporo, TC3, Voyager, nil], Plymouth,
        [NSArray arrayWithObjects:Six000, Acadian, Bonneville, Firebird, GrandLeMans, GrandPrix, J2000, Parisienne, Phoenix, T1000, nil], Pontiac,
        [NSArray arrayWithObjects:Brat, DL, GL, GLF, Subaru, nil], Subaru,
        [NSArray arrayWithObjects:Celica, CelicaSupra, Corolla, CorollaTercel, Corona, Cressida, LandCruiser, Pickup, Starlet, nil], Toyota,
        [NSArray arrayWithObjects:OTHER, nil], OTHER,
        nil], self._yearArray[VehicleYearIndex1982],

      [NSDictionary dictionaryWithObjectsAndKeys:
        [NSArray arrayWithObjects:Century, Electra, LeSabre, Regal, Riviera, Skylark, nil], Buick,
        [NSArray arrayWithObjects:DeVille, Eldorado, Fleetwood, Seville, nil], Cadillac,
        [NSArray arrayWithObjects:BelAir, Blazer, Camaro, Caprice, Chevette, ChevyVan, Citation, Corvette, ElCamino, ForwardControl, HiDashCube, Impala, Luv, Malibu, MonteCarlo, Pickup, Sportvan, StepVan, Suburban, nil], Chevrolet,
        [NSArray arrayWithObjects:Cordoba, Imperial, LeBaron, NewYorker, Newport, nil], Chrysler,
        [NSArray arrayWithObjects:Zero24, Aries, Challenger, Colt, Diplomat, Mirada, Omni, Pickup, Ram50, RamVan, RamWagon, Ramcharger, StDotRegis, nil], Dodge,
        [NSArray arrayWithObjects:Bronco, ClubWagon, Courier, Econoline, Escort, Fairmont, Granada, LTD, LTDCrownVictoria, Mustang, Pickup, Thunderbird, nil], Ford,
        [NSArray arrayWithObjects:Caballero, ForwardControl, Jimmy, Magnavan, Pickup, Rally, RallyCamperSpecial, Suburban, ValueVan, Vandura, VanduraSpecial, nil], GMC,
        [NSArray arrayWithObjects:Accord, Civic, Prelude, nil], Honda,
        [NSArray arrayWithObjects:IDashMark, Pickup, nil], Isuzu,
        [NSArray arrayWithObjects:Cherokee, CJ5, CJ7, Pickup, Scrambler, Wagoneer, nil], Jeep,
        [NSArray arrayWithObjects:MarkVI, TownCar, nil], Lincoln,
        [NSArray arrayWithObjects:Six26, B2000, GLC, RXDash7, nil], Mazda,
        [NSArray arrayWithObjects:Capri, Cougar, CougarXR7, GrandMarquis, Lynx, Marquis, Zephyr, nil], Mercury,
        [NSArray arrayWithObjects:Two00SX, Two10, Two80ZX, Three10, Five10, Eight10, Pickup, nil], Nissan,
        [NSArray arrayWithObjects:CustomCruiser, Cutlass, Delta88, NinetyDashEight, Omega, Toronado, nil], Oldsmobile,
        [NSArray arrayWithObjects:ArrowPickup, Caravelle, Champ, GranFury, Horizon, Reliant, Sapporo, Trailduster, Voyager, nil], Plymouth,
        [NSArray arrayWithObjects:Acadian, Bonneville, Catalina, Firebird, GrandLeMans, GrandPrix, Laurentian, LeMans, Parisienne, Phoenix, T1000, nil], Pontiac,
        [NSArray arrayWithObjects:Brat, DL, GL, GLF, Subaru, nil], Subaru,
        [NSArray arrayWithObjects:Celica, CelicaSupra, Corolla, CorollaTercel, Corona, Cressida, LandCruiser, Pickup, Starlet, nil], Toyota,
        [NSArray arrayWithObjects:OTHER, nil], OTHER,
        nil], self._yearArray[VehicleYearIndex1981],

      [NSDictionary dictionaryWithObjectsAndKeys:
        [NSArray arrayWithObjects:Century, Electra, LeSabre, Regal, Riviera, Skyhawk, Skylark, nil], Buick,
        [NSArray arrayWithObjects:DeVille, Eldorado, Fleetwood, Seville, nil], Cadillac,
        [NSArray arrayWithObjects:BelAir, Blazer, Camaro, Caprice, Chevette, ChevyVan, Citation, Corvette, ElCamino, ForwardControl, HiDashCube, Impala, Luv, Malibu, MonteCarlo, Monza, Pickup, Sportvan, StepVan, Suburban, nil], Chevrolet,
        [NSArray arrayWithObjects:Cordoba, LeBaron, NewYorker, Newport, nil], Chrysler,
        [NSArray arrayWithObjects:Aspen, Challenger, Colt, Diplomat, Mirada, Omni, Omni024, Pickup, Ram50, RamVan, RamWagon, Ramcharger, StDotRegis, nil], Dodge,
        [NSArray arrayWithObjects:Bronco, ClubWagon, Courier, Econoline, Fairmont, Fiesta, Granada, LTD, LTDCrownVictoria, Mustang, Pickup, Pinto, Thunderbird, nil], Ford,
        [NSArray arrayWithObjects:Caballero, ForwardControl, Jimmy, Magnavan, Pickup, Rally, RallyCamperSpecial, Suburban, ValueVan, Vandura, VanduraSpecial, nil], GMC,
        [NSArray arrayWithObjects:Accord, Civic, Prelude, nil], Honda,
        [NSArray arrayWithObjects:Cherokee, CJ5, CJ7, Pickup, Wagoneer, nil], Jeep,
        [NSArray arrayWithObjects:Continental, MarkVI, Versailles, nil], Lincoln,
        [NSArray arrayWithObjects:Six26, B2000, GLC, RXDash7, nil], Mazda,
        [NSArray arrayWithObjects:Bobcat, Capri, CougarXR7, GrandMarquis, Marquis, Monarch, Zephyr, nil], Mercury,
        [NSArray arrayWithObjects:Two00SX, Two10, Two80ZX, Three10, Five10, Eight10, Pickup, nil], Nissan,
        [NSArray arrayWithObjects:CustomCruiser, Cutlass, Delta88, NinetyDashEight, Omega, Starfire, Toronado, nil], Oldsmobile,
        [NSArray arrayWithObjects:Arrow, ArrowPickup, Champ, GranFury, Horizon, Sapporo, Trailduster, Volare, Voyager, nil], Plymouth,
        [NSArray arrayWithObjects:Acadian, Bonneville, Catalina, Firebird, GrandAm, GrandLeMans, GrandPrix, Laurentian, LeMans, Parisienne, Phoenix, Sunbird, nil], Pontiac,
        [NSArray arrayWithObjects:Brat, DL, FE, GL, GLF, Subaru, nil], Subaru,
        [NSArray arrayWithObjects:Celica, CelicaSupra, Corolla, CorollaTercel, Corona, Cressida, LandCruiser, Pickup, nil], Toyota,
        [NSArray arrayWithObjects:OTHER, nil], OTHER,
        nil], self._yearArray[VehicleYearIndex1980],
      nil];
  }
  return self;
}

@end
