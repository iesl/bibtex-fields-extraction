%%
%% This is file `biometrics.bst',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% merlin.mbs  (with options: `head,ay,nat,vonx,nm-rev,jnrlst,aunm-semi,nmfted,keyxyr,dt-beg,yr-par,yrp-col,note-yr,atit-u,vol-bf,num-xser,jnm-x,edpar,in-x,xedn,jabr,amper,and-xcom,nfss,,{}')
%% ../biojour.mbs  (with options: `ay,nat,vonx,nm-rev,jnrlst,aunm-semi,nmfted,keyxyr,dt-beg,yr-par,yrp-col,note-yr,atit-u,vol-bf,num-xser,jnm-x,edpar,in-x,xedn,jabr,amper,and-xcom,nfss,,{}')
%% merlin.mbs  (with options: `tail,ay,nat,vonx,nm-rev,jnrlst,aunm-semi,nmfted,keyxyr,dt-beg,yr-par,yrp-col,note-yr,atit-u,vol-bf,num-xser,jnm-x,edpar,in-x,xedn,jabr,amper,and-xcom,nfss,,{}')
%% ----------------------------------------
%% *** This is PhD style ***
%% 
%% Copyright 1994-2004 Patrick W Daly
 % ===============================================================
 % IMPORTANT NOTICE:
 % This bibliographic style (bst) file has been generated from one or
 % more master bibliographic style (mbs) files, listed above.
 %
 % This generated file can be redistributed and/or modified under the terms
 % of the LaTeX Project Public License Distributed from CTAN
 % archives in directory macros/latex/base/lppl.txt; either
 % version 1 of the License, or any later version.
 % ===============================================================
 % Name and version information of the main mbs file:
 % \ProvidesFile{merlin.mbs}[2004/02/09 4.13 (PWD, AO, DPC)]
 %   For use with BibTeX version 0.99a or later
 %-------------------------------------------------------------------
 % This bibliography style file is intended for texts in ENGLISH
 % This is an author-year citation style bibliography. As such, it is
 % non-standard LaTeX, and requires a special package file to function properly.
 % Such a package is    natbib.sty   by Patrick W. Daly
 % The form of the \bibitem entries is
 %   \bibitem[Jones et al.(1990)]{key}...
 %   \bibitem[Jones et al.(1990)Jones, Baker, and Smith]{key}...
 % The essential feature is that the label (the part in brackets) consists
 % of the author names, as they should appear in the citation, with the year
 % in parentheses following. There must be no space before the opening
 % parenthesis!
 % With natbib v5.3, a full list of authors may also follow the year.
 % In natbib.sty, it is possible to define the type of enclosures that is
 % really wanted (brackets or parentheses), but in either case, there must
 % be parentheses in the label.
 % The \cite command functions as follows:
 %   \citet{key} ==>>                Jones et al. (1990)
 %   \citet*{key} ==>>               Jones, Baker, and Smith (1990)
 %   \citep{key} ==>>                (Jones et al., 1990)
 %   \citep*{key} ==>>               (Jones, Baker, and Smith, 1990)
 %   \citep[chap. 2]{key} ==>>       (Jones et al., 1990, chap. 2)
 %   \citep[e.g.][]{key} ==>>        (e.g. Jones et al., 1990)
 %   \citep[e.g.][p. 32]{key} ==>>   (e.g. Jones et al., p. 32)
 %   \citeauthor{key} ==>>           Jones et al.
 %   \citeauthor*{key} ==>>          Jones, Baker, and Smith
 %   \citeyear{key} ==>>             1990
 %---------------------------------------------------------------------

ENTRY
  { address
    author
    booktitle
    chapter
    edition
    editor
    eid
    howpublished
    institution
    journal
    key
    month
    note
    number
    organization
    pages
    publisher
    school
    series
    title
    type
    volume
    year
  }
  {}
  { label extra.label sort.label short.list }
INTEGERS { output.state before.all mid.sentence after.sentence after.block }
FUNCTION {init.state.consts}
{ #0 'before.all :=
  #1 'mid.sentence :=
  #2 'after.sentence :=
  #3 'after.block :=
}
STRINGS { s t}
FUNCTION {output.nonnull}
{ 's :=
  output.state mid.sentence =
    { ", " * write$ }
    { output.state after.block =
        { add.period$ write$
          newline$
          "\newblock " write$
        }
        { output.state before.all =
            'write$
            { add.period$ " " * write$ }
          if$
        }
      if$
      mid.sentence 'output.state :=
    }
  if$
  s
}
FUNCTION {output}
{ duplicate$ empty$
    'pop$
    'output.nonnull
  if$
}
FUNCTION {output.check}
{ 't :=
  duplicate$ empty$
    { pop$ "empty " t * " in " * cite$ * warning$ }
    'output.nonnull
  if$
}
FUNCTION {fin.entry}
{ add.period$
  write$
  newline$
}

FUNCTION {new.block}
{ output.state before.all =
    'skip$
    { after.block 'output.state := }
  if$
}
FUNCTION {new.sentence}
{ output.state after.block =
    'skip$
    { output.state before.all =
        'skip$
        { after.sentence 'output.state := }
      if$
    }
  if$
}
FUNCTION {add.blank}
{  " " * before.all 'output.state :=
}

FUNCTION {date.block}
{
  ":" *
  add.blank
}

FUNCTION {not}
{   { #0 }
    { #1 }
  if$
}
FUNCTION {and}
{   'skip$
    { pop$ #0 }
  if$
}
FUNCTION {or}
{   { pop$ #1 }
    'skip$
  if$
}
FUNCTION {new.block.checkb}
{ empty$
  swap$ empty$
  and
    'skip$
    'new.block
  if$
}
FUNCTION {field.or.null}
{ duplicate$ empty$
    { pop$ "" }
    'skip$
  if$
}
FUNCTION {emphasize}
{ duplicate$ empty$
    { pop$ "" }
    { "\emph{" swap$ * "}" * }
  if$
}
FUNCTION {bolden}
{ duplicate$ empty$
    { pop$ "" }
    { "\textbf{" swap$ * "}" * }
  if$
}
FUNCTION {tie.or.space.prefix}
{ duplicate$ text.length$ #3 <
    { "~" }
    { " " }
  if$
  swap$
}

FUNCTION {capitalize}
{ "u" change.case$ "t" change.case$ }

FUNCTION {space.word}
{ " " swap$ * " " * }
 % Here are the language-specific definitions for explicit words.
 % Each function has a name bbl.xxx where xxx is the English word.
 % The language selected here is ENGLISH
FUNCTION {bbl.and}
{ "and"}

FUNCTION {bbl.etal}
{ "et~al." }

FUNCTION {bbl.editors}
{ "editors" }

FUNCTION {bbl.editor}
{ "editor" }

FUNCTION {bbl.edby}
{ "edited by" }

FUNCTION {bbl.edition}
{ "edition" }

FUNCTION {bbl.volume}
{ "volume" }

FUNCTION {bbl.of}
{ "of" }

FUNCTION {bbl.number}
{ "number" }

FUNCTION {bbl.nr}
{ "no." }

FUNCTION {bbl.in}
{ "in" }

FUNCTION {bbl.pages}
{ "pages" }

FUNCTION {bbl.page}
{ "page" }

FUNCTION {bbl.chapter}
{ "chapter" }

FUNCTION {bbl.techrep}
{ "Technical Report" }

FUNCTION {bbl.mthesis}
{ "Master's thesis" }

FUNCTION {bbl.phdthesis}
{ "Ph.D. thesis" }

MACRO {jan} {"January"}

MACRO {feb} {"February"}

MACRO {mar} {"March"}

MACRO {apr} {"April"}

MACRO {may} {"May"}

MACRO {jun} {"June"}

MACRO {jul} {"July"}

MACRO {aug} {"August"}

MACRO {sep} {"September"}

MACRO {oct} {"October"}

MACRO {nov} {"November"}

MACRO {dec} {"December"}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
MACRO {TrendsGuide} {"Trends Guide"}
MACRO {AAOHNJ} {"AAOHN J."}
MACRO {AAPGBull} {"AAPG Bull."}
MACRO {AarsberetNorFisk} {"Aarsberet. Nor. Fisk."}
MACRO {AarsberetNORCONSRV} {"Aarsberet. NORCONS-RV"}
MACRO {AarsberetNorskSjoefartsmus} {"Aarsberet. Norsk Sjoefartsmus."}
MACRO {AarsberetSSF} {"Aarsberet. SSF"}
MACRO {AarsberetStatensKartverk} {"Aarsberet. Statens Kartverk"}
MACRO {AarsmeldingEksportFisk} {"Aarsmelding Eksport. Fisk"}
MACRO {AarsmeldingFiskeriforsk} {"Aarsmelding Fiskeriforsk."}
MACRO {AarsmeldingHavforskingsinst} {"Aarsmelding. Havforskingsinst."}
MACRO {AarsmeldingNordlandsForsk} {"Aarsmelding Nordlands Forsk."}
MACRO {AarsmeldingNorgesLandbrukshoegsk} {"Aarsmelding Norges Landbrukshoegsk."}
MACRO {AarsmeldingNorgesSildesalgslag} {"Aarsmelding Norges Sildesalgslag"}
MACRO {AarsrappFiskeriforsk} {"Aarsrapp. Fiskeriforsk."}
MACRO {AbhAkadWissLitMainzMathNaturwissKl} {"Abh. Akad. Wiss. Lit. Mainz Math.-Naturwiss. Kl."}
MACRO {AbhNaturwissVerBremen} {"Abh. Naturwiss. Ver. Bremen"}
MACRO {ABSActaBiolSlov} {"ABS Acta Biol. Slov."}
MACRO {Abysses} {"Abysses"}
MACRO {AcadEstAcadSci} {"Acad. Est. Acad. Sci."}
MACRO {AcadMed} {"Acad. Med."}
MACRO {AcadRadiol} {"Acad. Radiol."}
MACRO {Acarologia} {"Acarologia"}
MACRO {AccidAnalPrev} {"Accid. Anal. Prev."}
MACRO {ACIMaterJ} {"ACI Mater. J."}
MACRO {ACIStructJ} {"ACI Struct. J."}
MACRO {ACIARProc} {"ACIAR Proc."}
MACRO {AcoustPhys} {"Acoust. Phys."}
MACRO {Acrocephalus} {"Acrocephalus"}
MACRO {ActaAcadAgricTechOlstProtAquarumPiscatoria} {"Acta Acad. Agric. Tech. Olst. Prot. Aquarum Piscatoria"}
MACRO {ActaAdriat} {"Acta Adriat."}
MACRO {ActaAmazon} {"Acta Amazon."}
MACRO {ActaAnat} {"Acta Anat."}
MACRO {ActaArct} {"Acta Arct."}
MACRO {ActaAstronaut} {"Acta Astronaut."}
MACRO {ActaBiochimPol} {"Acta Biochim. Pol."}
MACRO {ActaBiolHung} {"Acta Biol. Hung."}
MACRO {ActaBiolIugoslBMikrobiol} {"Acta Biol. Iugosl. (B Mikrobiol.)"}
MACRO {ActaBiolUnivDaugavpiliensis} {"Acta Biol. Univ. Daugavpiliensis"}
MACRO {ActaBiolVenez} {"Acta Biol. Venez."}
MACRO {ActaBiotechnol} {"Acta Biotechnol."}
MACRO {ActaBotBorealiOccidentialSinica} {"Acta Bot. Boreali-Occidential Sinica"}
MACRO {ActaBotCroat} {"Acta Bot. Croat."}
MACRO {ActaBotFenn} {"Acta Bot. Fenn."}
MACRO {ActaBotGallica} {"Acta Bot. Gallica"}
MACRO {ActaBotNeerl} {"Acta Bot. Neerl."}
MACRO {ActaCientVenez} {"Acta Cient. Venez."}
MACRO {ActaEcolSinShengtaiXuebao} {"Acta Ecol. Sin./Shengtai Xuebao"}
MACRO {ActaEntomolPragueSuppl} {"Acta Entomol. (Prague) (Suppl.)"}
MACRO {ActaEntomolChilena} {"Acta Entomol. Chilena"}
MACRO {ActaEntomolIbericaMacarones} {"Acta Entomol. Iberica Macarones."}
MACRO {ActaEntomolSerbica} {"Acta Entomol. Serbica"}
MACRO {ActaEntomolSiles} {"Acta Entomol. Siles."}
MACRO {ActaEntomolSin} {"Acta Entomol. Sin."}
MACRO {ActaEntomolSloven} {"Acta Entomol. Sloven."}
MACRO {ActaGeogrSinDiliXuebao} {"Acta Geogr. Sin./Dili Xuebao"}
MACRO {ActaGeolLeopold} {"Acta Geol. Leopold."}
MACRO {ActaGeolPol} {"Acta Geol. Pol."}
MACRO {ActaHistochemCytochem} {"Acta Histochem. Cytochem."}
MACRO {ActaHydrobiolCracow} {"Acta Hydrobiol. (Cracow)"}
MACRO {ActaHydrobiolLitu} {"Acta Hydrobiol. Litu."}
MACRO {ActaHydrobiolSinShuishengShengwuXuebao} {"Acta Hydrobiol. Sin./Shuisheng Shengwu Xuebao"}
MACRO {ActaHydrochimHydrobiol} {"Acta Hydrochim. Hydrobiol."}
MACRO {ActaIchthyolPisc} {"Acta Ichthyol. Pisc."}
MACRO {ActaLimnolBrasil} {"Acta Limnol. Brasil."}
MACRO {ActaMicrobiolHung} {"Acta Microbiol. Hung."}
MACRO {ActaMicrobiolPol} {"Acta Microbiol. Pol."}
MACRO {ActaMicrobiolSin} {"Acta Microbiol. Sin."}
MACRO {ActaMorpholHung} {"Acta Morphol. Hung."}
MACRO {ActaMusMoravCasMoravMusBrne} {"Acta Mus. Morav./Cas. Morav. Mus. Brne"}
MACRO {ActaMycol} {"Acta Mycol."}
MACRO {ActaNeurobiolExp} {"Acta Neurobiol. Exp."}
MACRO {ActaOceanogrPac} {"Acta Oceanogr. Pac."}
MACRO {ActaOceanogrTaiwan} {"Acta Oceanogr. Taiwan."}
MACRO {ActaOceanolSinChinEdHaiyangXuebao} {"Acta Oceanol. Sin. (Chin. Ed.)/Haiyang Xuebao"}
MACRO {ActaOceanolSinHaiyangXuebao} {"Acta Oceanol. Sin./Haiyang Xuebao"}
MACRO {ActaOecol} {"Acta Oecol."}
MACRO {ActaOphthalmolScand} {"Acta Ophthalmol. Scand."}
MACRO {ActaOrnitholWarszawa} {"Acta Ornithol. (Warszawa)"}
MACRO {ActaPalaeontolPol} {"Acta Palaeontol. Pol."}
MACRO {ActaParasitolPort} {"Acta Parasitol. Port."}
MACRO {ActaPharmHung} {"Acta Pharm. Hung."}
MACRO {ActaPhysiolScand} {"Acta Physiol. Scand."}
MACRO {ActaPhytogeogrSuec} {"Acta Phytogeogr. Suec."}
MACRO {ActaPhytopatholAcadSciHung} {"Acta Phytopathol. Acad. Sci. Hung."}
MACRO {ActaPhytopatholEntomolHung} {"Acta Phytopathol. Entomol. Hung."}
MACRO {ActaPolytechScand} {"Acta Polytech. Scand."}
MACRO {ActaProtozool} {"Acta Protozool."}
MACRO {ActaRSocSciLittGothobZool} {"Acta R. Soc. Sci. Litt. Gothob. (Zool.)"}
MACRO {ActaSciCircumstantHuanjingKexueXuebao} {"Acta Sci. Circumstant./Huanjing Kexue Xuebao"}
MACRO {ActaSci} {"Acta Sci."}
MACRO {ActaSciNatUnivSunyatseniZhongshanDaxueXuebao} {"Acta Sci. Nat. Univ. Sunyatseni/Zhongshan Daxue Xuebao"}
MACRO {ActaSedimentolSinChenjiXuebao} {"Acta Sedimentol. Sin./Chenji Xuebao"}
MACRO {ActaSocZoolBohem} {"Acta Soc. Zool. Bohem."}
MACRO {ActaTrop} {"Acta Trop."}
MACRO {ActaUnivCarolBiol} {"Acta Univ. Carol. Biol."}
MACRO {ActaVetBrno} {"Acta Vet. (Brno)"}
MACRO {ActaVirol} {"Acta Virol."}
MACRO {ActaZoolStockh} {"Acta Zool. (Stockh.)"}
MACRO {ActaZoolAcadSciHung} {"Acta Zool. Acad. Sci. Hung."}
MACRO {ActaZoolCracov} {"Acta Zool. Cracov."}
MACRO {ActaZoolFenn} {"Acta Zool. Fenn."}
MACRO {ActaZoolLilloana} {"Acta Zool. Lilloana"}
MACRO {ActaZoolMex} {"Acta Zool. Mex."}
MACRO {ActaZoolSinDongwuXuebao} {"Acta Zool. Sin./Dongwu Xuebao"}
MACRO {ActaZoolTaiwan} {"Acta Zool. Taiwan."}
MACRO {ActesColloqIFREMER} {"Actes Colloq. IFREMER"}
MACRO {ActCientInstAntartUrug} {"Act. Cient. Inst. Antart. Urug."}
MACRO {ActDirRechSciTechQueProv} {"Act. Dir. Rech. Sci. Tech. (Que. Prov.)"}
MACRO {ActualBiol} {"Actual. Biol."}
MACRO {AcuarismoDia} {"Acuarismo Dia"}
MACRO {AdaptBehav} {"Adapt. Behav."}
MACRO {Addiction} {"Addiction"}
MACRO {AddictBiol} {"Addict. Biol."}
MACRO {AddictBehav} {"Addict. Behav."}
MACRO {AdmLawRev} {"Adm. Law Rev."}
MACRO {AdminRepSouthwestFishSciCent} {"Admin. Rep. Southwest Fish. Sci. Cent."}
MACRO {Adolescence} {"Adolescence"}
MACRO {ADRIAMEDOccasPap} {"ADRIAMED Occas. Pap."}
MACRO {ADRIAMEDTechDoc} {"ADRIAMED Tech. Doc."}
MACRO {AdvDrugDelRev} {"Adv. Drug Del. Rev."}
MACRO {AdvApplMicrobiol} {"Adv. Appl. Microbiol."}
MACRO {AdvBioeng} {"Adv. Bioeng."}
MACRO {AdvBotRes} {"Adv. Bot. Res."}
MACRO {AdvCancerRes} {"Adv. Cancer Res."}
MACRO {AdvComplexSyst} {"Adv. Complex Syst."}
MACRO {AdvComputBioeng} {"Adv. Comput. Bioeng."}
MACRO {AdvDentalRes} {"Adv. Dental Res."}
MACRO {AdvDrugRes} {"Adv. Drug Res."}
MACRO {AdvEcolRes} {"Adv. Ecol. Res."}
MACRO {AdvEngSoftware} {"Adv. Eng. Software"}
MACRO {AdvEnvironRes} {"Adv. Environ. Res."}
MACRO {AdvEthol} {"Adv. Ethol."}
MACRO {AdvExpMedBiol} {"Adv. Exp. Med. Biol."}
MACRO {AdvFluidMech} {"Adv. Fluid Mech."}
MACRO {AdvFoodResSuppl} {"Adv. Food Res. Suppl."}
MACRO {AdvFoodSci} {"Adv. Food Sci."}
MACRO {AdvGenet} {"Adv. Genet."}
MACRO {AdvHostDefMech} {"Adv. Host Def. Mech."}
MACRO {AdvImmunol} {"Adv. Immunol."}
MACRO {AdvInsectPhysiol} {"Adv. Insect Physiol."}
MACRO {AdvLimnol} {"Adv. Limnol."}
MACRO {AdvMarBiol} {"Adv. Mar. Biol."}
MACRO {AdvMarSciHaiyangKexueJinzhan} {"Adv. Mar. Sci./Haiyang Kexue Jinzhan"}
MACRO {AdvMicrobEcol} {"Adv. Microb. Ecol."}
MACRO {AdvMicrobPhysiol} {"Adv. Microb. Physiol."}
MACRO {AdvMolCellMicrobiol} {"Adv. Mol. Cell. Microbiol."}
MACRO {AdvMRIContrast} {"Adv. MRI Contrast"}
MACRO {AdvParasitol} {"Adv. Parasitol."}
MACRO {AdvStructEng} {"Adv. Struct. Eng"}
MACRO {AdvVirusRes} {"Adv. Virus Res."}
MACRO {AdvWaterResour} {"Adv. Water Resour."}
MACRO {AdvXRayContrast} {"Adv. X-Ray Contrast"}
MACRO {AdverseDrugReactBull} {"Adverse Drug React. Bull."}
MACRO {AdverseDrugReactToxicolRev} {"Adverse Drug React. Toxicol. Rev."}
MACRO {AdvisCommPapFishDepWestAust} {"Advis. Comm. Pap. Fish. Dep. West. Aust."}
MACRO {AdvisServSeaGrantProgramSouthCalifUniv} {"Advis. Serv. Sea Grant Program South. Calif. Univ."}
MACRO {AegirSea} {"Aegir/Sea"}
MACRO {Aerobiologia} {"Aerobiologia"}
MACRO {AfrGeosciRev} {"Afr. Geosci. Rev."}
MACRO {AfrEntomol} {"Afr. Entomol."}
MACRO {AfrJAIDSRes} {"Afr. J. AIDS Res."}
MACRO {AfrJAquatSci} {"Afr. J. Aquat. Sci."}
MACRO {AfrJEcol} {"Afr. J. Ecol."}
MACRO {AfrJEnvironAssessManagRevAfrGestEvalEnviron} {"Afr. J. Environ. Assess. Manag./Rev. Afr. Gest. Eval. Environ."}
MACRO {AfrJMarSci} {"Afr. J. Mar. Sci."}
MACRO {AfrJTropHydrobiolFish} {"Afr. J. Trop. Hydrobiol. Fish."}
MACRO {AfrPlantProt} {"Afr. Plant Prot."}
MACRO {AfrWildl} {"Afr. Wildl."}
MACRO {AfrZool} {"Afr. Zool."}
MACRO {AgeAgeing} {"Age Ageing"}
MACRO {AggrViolentBehav} {"Aggr. Violent Behav."}
MACRO {AggressiveBehav} {"Aggressive Behav."}
MACRO {AgraUnivJResSci} {"Agra Univ. J. Res. (Sci.)"}
MACRO {Agraroekologie} {"Agraroekologie"}
MACRO {AgribiolRes} {"Agribiol. Res."}
MACRO {AgricPescaAlimentEsp} {"Agric. Pesca Aliment. Esp."}
MACRO {AgricConspecSci} {"Agric. Conspec. Sci."}
MACRO {AgricBiolChem} {"Agric. Biol. Chem."}
MACRO {AgricFoodSciFinland} {"Agric. Food Sci. Finland"}
MACRO {AgricForEntomol} {"Agric. For. Entomol."}
MACRO {AgricEconRep} {"Agric. Econ. Rep."}
MACRO {AgricEconRes} {"Agric. Econ. Res."}
MACRO {AgricWaterManage} {"Agric. Water Manage."}
MACRO {AgricHanbook} {"Agric. Hanbook"}
MACRO {AgricNorthIrel} {"Agric. North. Irel."}
MACRO {AgricInformBull} {"Agric. Inform. Bull."}
MACRO {AgricEcosystEnviron} {"Agric., Ecosyst. Environ."}
MACRO {AgroCiec} {"Agro Ciec."}
MACRO {AgroSur} {"Agro Sur"}
MACRO {AgroEnvironSciProt} {"Agro-Environ. Sci. Prot."}
MACRO {Agroalimentaria} {"Agroalimentaria"}
MACRO {Agrochimica} {"Agrochimica"}
MACRO {AgronColombiana} {"Agron. Colombiana"}
MACRO {AgronLusit} {"Agron. Lusit."}
MACRO {Agronomie} {"Agronomie"}
MACRO {AgronAfr} {"Agron. Afr."}
MACRO {AgronJ} {"Agron. J."}
MACRO {AgronRes} {"Agron. Res."}
MACRO {AICommun} {"AI Commun."}
MACRO {AIAAJ} {"AIAA J."}
MACRO {AICHEJ} {"AICHE J."}
MACRO {AICHESympSer} {"AICHE Symp. Ser."}
MACRO {AIDS} {"AIDS"}
MACRO {AIDSBehav} {"AIDS Behav."}
MACRO {AIDSCare} {"AIDS Care"}
MACRO {AIDSEducPrev} {"AIDS Educ. Prev."}
MACRO {AIDSPatientCareSTDs} {"AIDS Patient Care STDs"}
MACRO {AIDSResHumRetroviruses} {"AIDS Res. Hum. Retroviruses"}
MACRO {AircraftEngAerospaceTechnol} {"Aircraft Eng. Aerospace Technol."}
MACRO {AISESteelTechnol} {"A I S E Steel Technol."}
MACRO {Algologiya} {"Algologiya"}
MACRO {AlSamboukNewsl} {"Al-Sambouk Newsl."}
MACRO {AlaskaFishResBull} {"Alaska Fish. Res. Bull."}
MACRO {AlaskaSeaGrantRepAlaskaSeaGrantProgramUnivAlaska} {"Alaska Sea Grant Rep. Alaska Sea Grant Program Univ. Alaska"}
MACRO {Alauda} {"Alauda"}
MACRO {Albertoa} {"Albertoa"}
MACRO {Alcohol} {"Alcohol"}
MACRO {AlcoholAlcohol} {"Alcohol Alcohol."}
MACRO {AlcoholTreatQuart} {"Alcohol. Treat. Quart."}
MACRO {ALCOMRep} {"ALCOM Rep."}
MACRO {Alexanor} {"Alexanor"}
MACRO {Algae} {"Algae"}
MACRO {AlieftNeaFishNews} {"Alieft. Nea/Fish. News"}
MACRO {Allergy} {"Allergy"}
MACRO {Alternatives} {"Alternatives"}
MACRO {Alytes} {"Alytes"}
MACRO {AlzheimersDisRev} {"Alzheimers Dis. Rev."}
MACRO {Amazoniana} {"Amazoniana"}
MACRO {Ambiente} {"Ambiente"}
MACRO {Ambio} {"Ambio"}
MACRO {AmbioSpecRep} {"Ambio Spec. Rep."}
MACRO {AmbiosCultAmbient} {"Ambios Cult. Ambient."}
MACRO {AmEntomol} {"Am. Entomol."}
MACRO {AmFamPhysician} {"Am. Fam. Physician"}
MACRO {AmFernJ} {"Am. Fern J."}
MACRO {AmFishSocMonograph} {"Am. Fish. Soc. Monograph"}
MACRO {AmFishSocSpecialPub} {"Am. Fish. Soc. Special Pub."}
MACRO {AmFishSocSymp} {"Am. Fish. Soc. Symp."}
MACRO {AmIndHygAssocJ} {"Am. Ind. Hyg. Assoc. J."}
MACRO {AmJAgricEcon} {"Am. J. Agric. Econ."}
MACRO {AmJAlternativeAgric} {"Am. J. Alternative Agric."}
MACRO {AmJAlzheimersDisOtherDementias} {"Am. J. Alzheimer's Dis. Other Dementias"}
MACRO {AmJBot} {"Am. J. Bot."}
MACRO {AmJChinMed} {"Am. J. Chin. Med."}
MACRO {AmJClinNutr} {"Am. J. Clin. Nutr."}
MACRO {AmJCommunityPsychol} {"Am. J. Community Psychol."}
MACRO {AmJDrugAlcoholAbuse} {"Am. J. Drug Alcohol Abuse"}
MACRO {AmJEpidemiol} {"Am. J. Epidemiol."}
MACRO {AmJForensicMedPathol} {"Am. J. Forensic Med. Pathol."}
MACRO {AmJHealthEd} {"Am. J. Health Ed."}
MACRO {AmJHealthPromot} {"Am. J. Health Promot."}
MACRO {AmJHealthStud} {"Am. J. Health Stud."}
MACRO {AmJHumBiol} {"Am. J. Hum. Biol."}
MACRO {AmJHumGenet} {"Am. J. Hum. Genet."}
MACRO {AmJIndMed} {"Am. J. Ind. Med."}
MACRO {AmJIntLaw} {"Am. J. Int. Law"}
MACRO {AmJLawMed} {"Am. J. Law Med."}
MACRO {AmJMedGenetB} {"Am. J. Med. Genet. B."}
MACRO {AmJMedGenetA} {"Am. J. Med. Genet. A"}
MACRO {AmJMed} {"Am. J. Med."}
MACRO {AmJNeuroradiol} {"Am. J. Neuroradiol."}
MACRO {AmJNurs} {"Am. J. Nurs."}
MACRO {AmJOphthalmol} {"Am. J. Ophthalmol."}
MACRO {AmJOrthopsychiatry} {"Am. J. Orthopsychiatry"}
MACRO {AmJPhysAnthropol} {"Am. J. Phys. Anthropol."}
MACRO {AmJPhysMedRehabil} {"Am. J. Phys. Med. Rehabil."}
MACRO {AmJPhysiolCellPhysiol} {"Am. J. Physiol. Cell Physiol."}
MACRO {AmJPhysiolEndocrinolMetabol} {"Am. J. Physiol. Endocrinol. Metabol."}
MACRO {AmJPhysiolHeartCircPhysiol} {"Am. J. Physiol. Heart Circ. Physiol."}
MACRO {AmJPhysiolRegulIntegrCompPhysiol} {"Am. J. Physiol. Regul. Integr. Comp. Physiol."}
MACRO {AmJPolitSci} {"Am. J. Polit. Sci."}
MACRO {AmJPrevMed} {"Am. J. Prev. Med."}
MACRO {AmJPrimatol} {"Am. J. Primatol."}
MACRO {AmJPsychiatry} {"Am. J. Psychiatry"}
MACRO {AmJPublicHealth} {"Am. J. Public Health"}
MACRO {AmJReprodImmunol} {"Am. J. Reprod. Immunol."}
MACRO {AmJRespirCritCareMed} {"Am. J. Respir. Crit. Care Med."}
MACRO {AmJRoentgenol} {"Am. J. Roentgenol."}
MACRO {AmJSci} {"Am. J. Sci."}
MACRO {AmJSportsMed} {"Am. J. Sports Med."}
MACRO {AmJTransplantation} {"Am. J. Transplantation"}
MACRO {AmJTropMedHyg} {"Am. J. Trop. Med. Hyg."}
MACRO {AmJVetRes} {"Am. J. Vet. Res."}
MACRO {AmMalacolBull} {"Am. Malacol. Bull."}
MACRO {AmMidlNat} {"Am. Midl. Nat."}
MACRO {AmMusNovit} {"Am. Mus. Novit."}
MACRO {AmNat} {"Am. Nat."}
MACRO {AmSci} {"Am. Sci."}
MACRO {AmZool} {"Am. Zool."}
MACRO {AminoAcids} {"Amino Acids"}
MACRO {AmphibiaReptilia} {"Amphibia-Reptilia"}
MACRO {Amphipacifica} {"Amphipacifica"}
MACRO {AmyotrophicLatScler} {"Amyotrophic Lat. Scler."}
MACRO {Anaerobe} {"Anaerobe"}
MACRO {Anaesthesia} {"Anaesthesia"}
MACRO {AnFacMedVetLisb} {"An. Fac. Med. Vet. Lisb."}
MACRO {AnSocEntomolBras} {"An. Soc. Entomol. Bras."}
MACRO {AnClubeMilNavLisb} {"An. Clube Mil. Nav. Lisb."}
MACRO {AnInstHigMedTropLisb} {"An. Inst. Hig. Med. Trop. Lisb."}
MACRO {AnInstHidrogrLisb} {"An. Inst. Hidrogr. Lisb."}
MACRO {AnInstCiencMarLimnolUnivNacAutonMex} {"An. Inst. Cienc. Mar Limnol. Univ. Nac. Auton. Mex."}
MACRO {AnInstPatagonia} {"An. Inst. Patagonia"}
MACRO {AnMusHistNatValparaiso} {"An. Mus. Hist. Nat. Valparaiso"}
MACRO {AnalystCambridgeUK} {"Analyst (Cambridge UK)"}
MACRO {AnalChimActa} {"Anal. Chim. Acta"}
MACRO {AnalBioanalChem} {"Anal. Bioanal. Chem"}
MACRO {AnalBiochem} {"Anal. Biochem."}
MACRO {AnalChemWash} {"Anal. Chem. (Wash.)"}
MACRO {AnalLett} {"Anal. Lett."}
MACRO {Anartia} {"Anartia"}
MACRO {AnatRecADiscovMolCellEvolBiol} {"Anat. Rec. A. Discov. Mol. Cell. Evol. Biol."}
MACRO {AndamentoIndConservItticaItal} {"Andamento Ind. Conserv. Ittica Ital."}
MACRO {AnesthAnalg} {"Anesth. Analg."}
MACRO {Anesthesiology} {"Anesthesiology"}
MACRO {AngewBot} {"Angew. Bot."}
MACRO {AngewChem} {"Angew. Chem."}
MACRO {Angiogenesis} {"Angiogenesis"}
MACRO {AnimBehav} {"Anim. Behav."}
MACRO {AnimBiodiversConserv} {"Anim. Biodivers. Conserv."}
MACRO {AnimBiol} {"Anim. Biol."}
MACRO {AnimBiotechnol} {"Anim. Biotechnol."}
MACRO {AnimConserv} {"Anim. Conserv."}
MACRO {AnimGenet} {"Anim. Genet."}
MACRO {AnimLearnBehav} {"Anim. Learn. Behav."}
MACRO {AnimProd} {"Anim. Prod."}
MACRO {AnimReprodSci} {"Anim. Reprod. Sci."}
MACRO {AnimRes} {"Anim. Res."}
MACRO {AnimResDev} {"Anim. Res. Dev."}
MACRO {AnimSciTechnol} {"Anim. Sci. Technol."}
MACRO {AnimSciPapRep} {"Anim. Sci. Pap. Rep."}
MACRO {AnimWelfare} {"Anim. Welfare"}
MACRO {Animalia} {"Animalia"}
MACRO {AnnMeteorolNeueFolge} {"Ann. Meteorol. (Neue Folge)"}
MACRO {AnnNaturhistMusWienAMineralPetrogrGeolPalaeontolAnthropolPraehist} {"Ann. Naturhist. Mus. Wien (A Mineral. Petrogr. Geol. Palaeontol. Anthropol. Praehist.)"}
MACRO {AnnNaturhistMusWienBBotZool} {"Ann. Naturhist. Mus. Wien (B Bot. Zool.)"}
MACRO {AnnNaturhistMusWienCJahresber} {"Ann. Naturhist. Mus. Wien (C Jahresber.)"}
MACRO {Annales} {"Annales"}
MACRO {AnnBotFenn} {"Ann. Bot. Fenn."}
MACRO {AnnUnivAbidjanEEcol} {"Ann. Univ. Abidjan (E Ecol.)"}
MACRO {AnnUnivAbidjanGGeogr} {"Ann. Univ. Abidjan (G Geogr.)"}
MACRO {AnnINRAT} {"Ann. INRAT"}
MACRO {AnnInstOceanogrParisNouvSer} {"Ann. Inst. Oceanogr. Paris (Nouv. Ser.)"}
MACRO {AnnUnivAbidjanCSciNatBiol} {"Ann. Univ. Abidjan (C Sci. Nat. Biol.)"}
MACRO {AnnSocSciNatCharenteMarit} {"Ann. Soc. Sci. Nat. Charente-Marit."}
MACRO {AnnLimnol} {"Ann. Limnol."}
MACRO {AnnMedVet} {"Ann. Med. Vet."}
MACRO {AnnPaleontol} {"Ann. Paleontol."}
MACRO {AnnPathol} {"Ann. Pathol."}
MACRO {AnnZootech} {"Ann. Zootech."}
MACRO {AnnGeolPaysHellGeolChronEllChoron} {"Ann. Geol. Pays Hell./Geol. Chron. Ell. Choron"}
MACRO {AnnGeophys} {"Ann. Geophys"}
MACRO {AnnHydrogr6emeSer} {"Ann. Hydrogr. (6eme Ser.)"}
MACRO {AnnMusGoulandris} {"Ann. Mus. Goulandris"}
MACRO {AnnNatlInstHygRoczPanstwZakHig} {"Ann. Natl. Inst. Hyg./Rocz. Panstw. Zak. Hig."}
MACRO {AnnZoolWarsaw} {"Ann. Zool. (Warsaw)"}
MACRO {AnnZoolFenn} {"Ann. Zool. Fenn."}
MACRO {AnnAnIstrskeMediterStudHistNat} {"Ann. An. Istrske Mediter. Stud. (Hist. Nat.)"}
MACRO {AnnFacSciNautIstUnivNavNapoli} {"Ann. Fac. Sci. Naut. Ist. Univ. Nav. Napoli"}
MACRO {AnnGeofis} {"Ann. Geofis."}
MACRO {AnnAgriBioRes} {"Ann. Agri Bio Res."}
MACRO {AnnAgricEnvironMed} {"Ann. Agric. Environ. Med."}
MACRO {AnnAgricSciMoshtohor} {"Ann. Agric. Sci., Moshtohor"}
MACRO {AnnAllergyAsthmaImmunol} {"Ann. Allergy, Asthma Immunol."}
MACRO {AnnApplBiol} {"Ann. Appl. Biol."}
MACRO {AnnBiol} {"Ann. Biol."}
MACRO {AnnBiomedEng} {"Ann. Biomed. Eng."}
MACRO {AnnBot} {"Ann. Bot."}
MACRO {AnnEmergencyMed} {"Ann. Emergency Med."}
MACRO {AnnEpidemiol} {"Ann. Epidemiol."}
MACRO {AnnMedEntomol} {"Ann. Med. Entomol."}
MACRO {AnnMed} {"Ann. Med."}
MACRO {AnnNeurol} {"Ann. Neurol."}
MACRO {AnnNuclEnergy} {"Ann. Nucl. Energy"}
MACRO {AnnOccupHyg} {"Ann. Occup. Hyg."}
MACRO {AnnOncol} {"Ann. Oncol."}
MACRO {AnnCapeProvMusNatHist} {"Ann. Cape Prov. Mus. Nat. Hist."}
MACRO {AnnEastCapeMus} {"Ann. East. Cape Mus."}
MACRO {AnnEntomolSocAm} {"Ann. Entomol. Soc. Am."}
MACRO {AnnNYAcadSci} {"Ann. N. Y. Acad. Sci."}
MACRO {AnnPhytopatholSocJapan} {"Ann. Phytopathol. Soc. Japan"}
MACRO {AnnRheumDis} {"Ann. Rheum. Dis."}
MACRO {AnnSAfrMus} {"Ann. S. Afr. Mus."}
MACRO {AnnUpperSilesianMusBytomEntomol} {"Ann. Upper Silesian Mus. Bytom, Entomol."}
MACRO {AnnTropMedParasitol} {"Ann. Trop. Med. Parasitol."}
MACRO {AnnTropPaediatrIntChildHealth} {"Ann. Trop. Paediatr. Int. Child Health"}
MACRO {AnneeBiol} {"Annee Biol."}
MACRO {AnnuStatPechesTunis} {"Annu. Stat. Peches Tunis."}
MACRO {AnnuDroitMer} {"Annu. Droit Mer"}
MACRO {AnnuDepRepDirAgricFishHongKong} {"Annu. Dep. Rep. Dir. Agric. Fish. (Hong Kong)"}
MACRO {AnnuHighlightsMarFishResDepSoutheastAsianFishDevCent} {"Annu. Highlights Mar. Fish. Res. Dep. Southeast Asian Fish. Dev. Cent."}
MACRO {AnnuRepAccEnvironAgencyGB} {"Annu. Rep. Acc. Environ. Agency (G.B.)"}
MACRO {AnnuRepAccIrSeaFishBoard} {"Annu. Rep. Acc. Ir. Sea Fish. Board"}
MACRO {AnnuRepAccSeaFishIndAuth} {"Annu. Rep. Acc. Sea Fish Ind. Auth."}
MACRO {AnnuRepKORDI} {"Annu. Rep. KORDI"}
MACRO {AnnuRepNatlInstGenetJap} {"Annu. Rep., Natl. Inst. Genet., Jap."}
MACRO {AnnuRepNethInstSeaRes} {"Annu. Rep. Neth. Inst. Sea Res."}
MACRO {AnnuRepActDirFishBahrain} {"Annu. Rep. Act. Dir. Fish. (Bahrain)"}
MACRO {AnnuRepOceanogrObsNatlFishResDevInstKorea} {"Annu. Rep. Oceanogr. Obs. Natl. Fish. Res. Dev. Inst. (Korea)"}
MACRO {AnnuRepDirFishIndResInstUnivCapeTownJaarverslDirVisnywerheidnavorsingsinstUnivKaapstad} {"Annu. Rep. Dir. Fish. Ind. Res. Inst. Univ. Cape Town/Jaarversl. Dir. Visnywerheid- navorsingsinst. Univ. Kaapstad"}
MACRO {AnnuRepIATTCInfAnuCIAT} {"Annu. Rep. IATTC/Inf. Anu. CIAT"}
MACRO {AnnuRepNatlInstGenetJapan} {"Annu. Rep. Natl. Inst. Genet. (Japan)"}
MACRO {AnnuRepFishDepWestAust} {"Annu. Rep. Fish. Dep. West. Aust."}
MACRO {AnnuRepAtlFishRestructActRappAnnuLoiRestructSectPechesAtl} {"Annu. Rep. Atl. Fish. Restruct. Act/Rapp. Annu. Loi Restruct. Sect. Peches Atl."}
MACRO {AnnuRepAtlSalmFed} {"Annu. Rep. Atl. Salm. Fed."}
MACRO {AnnuRepAustFishManagAuth} {"Annu. Rep. Aust. Fish. Manag. Auth."}
MACRO {AnnuRepAustInstMarSci} {"Annu. Rep. Aust. Inst. Mar. Sci."}
MACRO {AnnuRepBermudaBiolStnRes} {"Annu.Rep. Bermuda Biol. Stn. Res."}
MACRO {AnnuRepCanInstSciTechInfRappAnnuInstCanInfSciTech} {"Annu. Rep. Can. Inst. Sci. Tech. Inf./Rapp. Annu. Inst. Can. Inf. Sci. Tech."}
MACRO {AnnuRepCanWaterActRappAnnuLoiRessourEauCan} {"Annu. Rep. Can. Water Act/Rapp. Annu. Loi Ressour. Eau Can."}
MACRO {AnnuRepCanInstFishTechnol} {"Annu. Rep. Can. Inst. Fish. Technol."}
MACRO {AnnuRepCentInlandCaptureFishResInstBarrackpore} {"Annu. Rep. Cent. Inland Capture Fish. Res. Inst. Barrackpore"}
MACRO {AnnuRepCentInstFishEducBombay} {"Annu. Rep. Cent. Inst. Fish. Educ. Bombay"}
MACRO {AnnuRepCentInstFishTechnolCochin} {"Annu. Rep. Cent. Inst. Fish. Technol. Cochin"}
MACRO {AnnuRepCentMarFishResInstCochin} {"Annu. Rep. Cent. Mar. Fish. Res. Inst. Cochin"}
MACRO {AnnuRepChesapeakeBayFound} {"Annu. Rep. Chesapeake Bay Found."}
MACRO {AnnuRepDepFishZambia} {"Annu. Rep. Dep. Fish. (Zambia)"}
MACRO {AnnuRepDepFishOceansCanRappAnnuMinistPechesOceansCan} {"Annu. Rep. Dep. Fish. Oceans (Can.)/Rapp. Annu. Minist. Peches Oceans (Can.)"}
MACRO {AnnuRepDepOceanogrUnivBC} {"Annu. Rep. Dep. Oceanogr. Univ. B.C."}
MACRO {AnnuRepEnvironCanRappAnnuEnvironCan} {"Annu. Rep. Environ. Can./Rapp. Annu. Environ. Can."}
MACRO {AnnuRepERLNOAA} {"Annu. Rep. ERL/NOAA"}
MACRO {AnnuRepEMAPS} {"Annu. Rep. EMAPS"}
MACRO {AnnuRepFishHealthUnitFacVetMedUnivPEI} {"Annu. Rep. Fish Health Unit Fac. Vet. Med. Univ. P.E.I."}
MACRO {AnnuRepFishMarkOrganHongKong} {"Annu. Rep. Fish Mark. Organ. Hong Kong"}
MACRO {AnnuRepFishAquacultNBRappAnnuPechesAquacultNB} {"Annu. Rep. Fish. Aquacult. (N.B.)/Rapp. Annu. Peches Aquacult. (N.-B.)"}
MACRO {AnnuRepFishDevActDepFishOceansCanRappAnnuLoiDevPecheMinistPechesOceansCan} {"Annu. Rep. Fish. Dev. Act Dep. Fish. Oceans (Can.)/Rapp. Annu. Loi Dev. Peche Minist. Peches Oceans (Can.)"}
MACRO {AnnuRepFishDivFiji} {"Annu. Rep. Fish. Div. (Fiji)"}
MACRO {AnnuRepFishDivSamoa} {"Annu. Rep. Fish. Div. (Samoa)"}
MACRO {AnnuRepFishImprovLoansActDepFishOceansCanRappAnnuLoiPretsAidantOperPecheMinistPechesOceansCan} {"Annu. Rep. Fish. Improv. Loans Act Dep. Fish. Oceans (Can.)/Rapp. Annu. Loi Prets Aidant Oper. Peche Minist. Peches Oceans (Can.)"}
MACRO {AnnuRepFishPricesSupportBoardCanRappAnnuOffPrixProdPecheCan} {"Annu. Rep. Fish. Prices Support Board Can./Rapp. Annu. Off. Prix Prod. Peche Can."}
MACRO {AnnuRepFishSurvIndia} {"Annu. Rep. Fish. Surv. India"}
MACRO {AnnuRepFreshwatFishCentChristchurch} {"Annu. Rep. Freshwat. Fish. Cent. Christchurch"}
MACRO {AnnuRepGreatBarrierReefMarParkAuth} {"Annu. Rep. Great Barrier Reef Mar. Park Auth."}
MACRO {AnnuRepGLFC} {"Annu. Rep. GLFC"}
MACRO {AnnuRepHuntsmanMarSciCent} {"Annu. Rep. Huntsman Mar. Sci.Cent."}
MACRO {AnnuRepInshoreFishStatMinistFishTonga} {"Annu. Rep. Inshore Fish. Stat. Minist. Fish. (Tonga)"}
MACRO {AnnuRepIPHC} {"Annu. Rep. IPHC"}
MACRO {AnnuRepIranFishResTrainOrgan} {"Annu. Rep. Iran. Fish. Res. Train. Organ."}
MACRO {AnnuRepIranFishResOrg} {"Annu. Rep. Iran. Fish. Res. Org."}
MACRO {AnnuRepKenyaMarFishResInst} {"Annu. Rep. Kenya Mar. Fish. Res. Inst."}
MACRO {AnnuRepMarFreshwResourInst} {"Annu. Rep. Mar. Freshw. Resour. Inst."}
MACRO {AnnuRepMarBiolAssocUK} {"Annu. Rep. Mar. Biol. Assoc. U.K."}
MACRO {AnnuRepMarInstDublin} {"Annu. Rep. Mar. Inst. Dublin"}
MACRO {AnnuRepMarMammComm} {"Annu. Rep. Mar. Mamm. Comm."}
MACRO {AnnuRepMarProdExportDevAuthIndia} {"Annu. Rep. Mar. Prod. Export Dev. Auth. India"}
MACRO {AnnuRepMinistAgricFishForestsFiji} {"Annu. Rep. Minist. Agric. Fish. Forests (Fiji)"}
MACRO {AnnuRepMBARI} {"Annu. Rep. MBARI"}
MACRO {AnnuRepMurrayDarlingFreshwatResCent} {"Annu. Rep. Murray-Darling Freshwat. Res. Cent."}
MACRO {AnnuRepNatlBurFishGenetResourIndia} {"Annu. Rep. Natl. Bur. Fish Genet. Resour. (India)"}
MACRO {AnnuRepNatlCentAtmosResUS} {"Annu. Rep. Natl. Cent. Atmos. Res. (U.S.)"}
MACRO {AnnuRepNatlInstFreshwatFishResNiger} {"Annu. Rep. Natl. Inst. Freshwat. Fish. Res. (Niger.)"}
MACRO {AnnuRepNatlInstOceanogrIndia} {"Annu. Rep. Natl. Inst. Oceanogr. (India)"}
MACRO {AnnuRepNOAAERLGLEL} {"Annu. Rep. NOAA/ERL/GLEL"}
MACRO {AnnuRepNOAAERLPMEL} {"Annu. Rep. NOAA/ERL/PMEL"}
MACRO {AnnuRepNethInstLawSea} {"Annu. Rep. Neth. Inst. Law Sea"}
MACRO {AnnuRepNigerInstOceanogrMarRes} {"Annu. Rep. Niger. Inst. Oceanogr. Mar. Res."}
MACRO {AnnRepNorad} {"Ann. Rep. Norad"}
MACRO {AnnuRepNAMMCO} {"Annu. Rep. NAMMCO"}
MACRO {AnnuRepNPAFC} {"Annu. Rep. NPAFC"}
MACRO {AnnuRepNorthPacMarSciOrgan} {"Annu. Rep. North Pac. Mar. Sci. Organ."}
MACRO {AnnuRepNAFO} {"Annu. Rep. NAFO"}
MACRO {AnuRepOceanInstHonolulu} {"Anu. Rep. Ocean. Inst. Honolulu"}
MACRO {AnnuRepPacSalmComm} {"Annu. Rep. Pac. Salm. Comm."}
MACRO {AnnuRepPacStatesMarFishComm} {"Annu. Rep. Pac. States Mar. Fish. Comm."}
MACRO {AnnuRepROntMusRappAnnuMusROnt} {"Annu. Rep. R. Ont. Mus./Rapp. Annu. Mus. R. Ont."}
MACRO {AnnuRepSalmGenetResProgramCan} {"Annu. Rep. Salm. Genet. Res. Program (Can.)"}
MACRO {AnnuRepSalmonResAgencyIrelInc} {"Annu. Rep. Salmon Res. Agency Irel. Inc."}
MACRO {AnnuRepSeychellesFishAuth} {"Annu. Rep. Seychelles Fish. Auth."}
MACRO {AnnuRepSirAlisterHardyFoundOceanSci} {"Annu. Rep. Sir Alister Hardy Found. Ocean Sci."}
MACRO {AnnuRepSouthCalifCoastWaterResProj} {"Annu. Rep. South. Calif. Coast. Water. Res. Proj."}
MACRO {AnnRepTasmanianAquacultFishInst} {"Ann. Rep. Tasmanian Aquacult. Fish. Inst."}
MACRO {AnnRepUSBureauReclam} {"Ann. Rep. U.S. Bureau Reclam."}
MACRO {AnnuRepUnivMarBiolStnMillport} {"Annu. Rep. Univ. Mar. Biol. Stn. Millport"}
MACRO {AnnuRepUnivSouthCalifInstMarCoastStud} {"Annu. Rep. Univ. South. Calif. Inst. Mar. Coast. Stud."}
MACRO {AnnuRepSerIOC} {"Annu. Rep. Ser. IOC"}
MACRO {AnnuResRepKuwaitInstSciRes} {"Annu. Res. Rep. Kuwait Inst. Sci. Res."}
MACRO {AnnuResSummAlligatorRiversRegResInst} {"Annu. Res. Summ. Alligator Rivers Reg. Res. Inst."}
MACRO {AnnuRevBiochem} {"Annu. Rev. Biochem."}
MACRO {AnnuRevBiomedEng} {"Annu. Rev. Biomed. Eng."}
MACRO {AnnuRevBiomedSci} {"Annu. Rev. Biomed. Sci."}
MACRO {AnnuRevBiophysBiomolStruct} {"Annu. Rev. Biophys. Biomol. Struct."}
MACRO {AnnuRevCellDevBiol} {"Annu. Rev. Cell. Dev. Biol."}
MACRO {AnnRevClinPsych} {"Ann. Rev. Clin. Psych."}
MACRO {AnnuRevEarthPlanetSci} {"Annu. Rev. Earth Planet. Sci."}
MACRO {AnnuRevEcolSyst} {"Annu. Rev. Ecol. Syst."}
MACRO {AnnuRevEcolEvolSyst} {"Annu. Rev. Ecol., Evol. Syst."}
MACRO {AnnuRevEntomol} {"Annu. Rev. Entomol."}
MACRO {AnnuRevFishDis} {"Annu. Rev. Fish Dis."}
MACRO {AnnuRevFluidMech} {"Annu. Rev. Fluid Mech."}
MACRO {AnnuRevGenet} {"Annu. Rev. Genet."}
MACRO {AnnuRevGenomHumGenet} {"Annu. Rev. Genom. Hum. Genet."}
MACRO {AnnuRevImmunol} {"Annu. Rev. Immunol."}
MACRO {AnnuRevMed} {"Annu. Rev. Med."}
MACRO {AnnuRevMicrobiol} {"Annu. Rev. Microbiol."}
MACRO {AnnuRevNeurosci} {"Annu. Rev. Neurosci."}
MACRO {AnnuRevNutr} {"Annu. Rev. Nutr."}
MACRO {AnnuRevPharmacolToxicol} {"Annu. Rev. Pharmacol. Toxicol."}
MACRO {AnnuRevPhysiol} {"Annu. Rev. Physiol."}
MACRO {AnnuRevPhytopathol} {"Annu. Rev. Phytopathol."}
MACRO {AnnuRevPlantBiol} {"Annu. Rev. Plant Biol."}
MACRO {AnnuRevPlantPhysiolPlantMolBiol} {"Annu. Rev. Plant Physiol. Plant Mol. Biol."}
MACRO {AnnuRevPublicHealth} {"Annu. Rev. Public Health"}
MACRO {AnnuRevGreatLakesFishResBranchCan} {"Annu. Rev. Great Lakes Fish. Res. Branch (Can.)"}
MACRO {AnnuSummFishMarMammHarvestDataNorthwestTerrit} {"Annu. Summ. Fish Mar. Mamm. Harvest Data Northwest Territ."}
MACRO {AnnuSummFishHarvestActWestCanFreshwatFish} {"Annu. Summ. Fish Harvest. Act. West. Can. Freshwat. Fish."}
MACRO {AnnuPescePesca} {"Annu. Pesce Pesca"}
MACRO {Antarctic} {"Antarctic"}
MACRO {AntarctCRCResRep} {"Antarct. CRC Res. Rep."}
MACRO {AntarctJUS} {"Antarct. J. U.S."}
MACRO {AntarctRecChristchurch} {"Antarct. Rec. (Christchurch)"}
MACRO {AntarctRecTokyo} {"Antarct. Rec. (Tokyo)"}
MACRO {AntarctResBookSer} {"Antarct. Res. Book Ser."}
MACRO {AntarctSci} {"Antarct. Sci."}
MACRO {AntarktikaAntarctic} {"Antarktika/Antarctic"}
MACRO {AnthropolToday} {"Anthropol. Today"}
MACRO {AntiCancerDrugs} {"Anti-Cancer Drugs"}
MACRO {AnticancerRes} {"Anticancer Res."}
MACRO {AntimicrobAgentsChemother} {"Antimicrob. Agents Chemother."}
MACRO {AntioxidRedoxSignal} {"Antioxid. Redox Signal."}
MACRO {Antipode} {"Antipode"}
MACRO {AntisenseNucleicAcidDrugDev} {"Antisense Nucleic Acid Drug Dev."}
MACRO {AntiviralChemChemother} {"Antiviral Chem. Chemother."}
MACRO {AntiviralRes} {"Antiviral Res."}
MACRO {AntonieVanLeeuwenhoek} {"Antonie Van Leeuwenhoek"}
MACRO {AnuEstadPescaSecrMedioAmbienteRecurNatPesca} {"Anu. Estad. Pesca Secr. Medio Ambiente Recur. Nat. Pesca"}
MACRO {AnuEstadPescaServNacPescaChile} {"Anu. Estad. Pesca Serv. Nac. Pesca (Chile)"}
MACRO {AnuEstadPesqMinistPesqPeru} {"Anu. Estad. Pesq. Minist. Pesq. (Peru)"}
MACRO {AnuPesqAcuicolaNicar} {"Anu. Pesq. Acuicola Nicar."}
MACRO {AnzSchaedlingskdJPestSci} {"Anz. Schaedlingskd./J. Pest Sci."}
MACRO {Apidologie} {"Apidologie"}
MACRO {APMISActaPatholMicrobiolImmunolScand} {"APMIS: Acta Pathol. Microbiol. Immunol. Scand."}
MACRO {Appetite} {"Appetite"}
MACRO {ApplEnvironMicrobiol} {"Appl. Environ. Microbiol."}
MACRO {ApplAnimBehavSci} {"Appl. Anim. Behav. Sci."}
MACRO {ApplBiochemBiotechnol} {"Appl. Biochem. Biotechnol."}
MACRO {ApplBiochemMicrobiol} {"Appl. Biochem. Microbiol."}
MACRO {ApplBiolSciSeibutsuSeisangakuKenkyu} {"Appl. Biol. Sci./Seibutsu Seisangaku Kenkyu"}
MACRO {ApplEcolEnvironRes} {"Appl. Ecol. Environ. Res."}
MACRO {ApplEngAgric} {"Appl. Eng. Agric."}
MACRO {ApplEntomolZool} {"Appl. Entomol. Zool."}
MACRO {ApplErgonomics} {"Appl. Ergonomics"}
MACRO {ApplFishAquac} {"Appl. Fish. Aquac."}
MACRO {ApplGeochem} {"Appl. Geochem."}
MACRO {ApplIntell} {"Appl Intell"}
MACRO {ApplMathModel} {"Appl. Math. Model."}
MACRO {ApplMicrobiolBiotechnol} {"Appl. Microbiol. Biotechnol."}
MACRO {ApplOccupEnvironHyg} {"Appl. Occup. Environ. Hyg."}
MACRO {ApplOceanRes} {"Appl. Ocean Res."}
MACRO {ApplOpt} {"Appl. Opt."}
MACRO {ApplPlantSciToegePlantwet} {"Appl. Plant Sci./Toege. Plantwet."}
MACRO {ApplPsychol} {"Appl. Psychol."}
MACRO {ApplRadiatIsot} {"Appl. Radiat. Isot."}
MACRO {ApplSciRes} {"Appl. Sci. Res."}
MACRO {ApuntesUnivUnivAutonBajaCalifSurDidct} {"Apuntes Univ. Univ. Auton. Baja Calif. Sur (Didct.)"}
MACRO {AquaJIchthyolAquatBiol} {"Aqua J. Ichthyol. Aquat. Biol."}
MACRO {AquaFenn} {"Aqua Fenn."}
MACRO {Aquacult} {"Aquacult"}
MACRO {AquacultEng} {"Aquacult. Eng."}
MACRO {Aquaculture} {"Aquaculture"}
MACRO {AquacAsia} {"Aquac. Asia"}
MACRO {AquacultEconManage} {"Aquacult. Econ. Manage."}
MACRO {AquacultExtManAquacultDepSoutheastAsianFishDevCent} {"Aquacult. Ext. Man. Aquacult. Dep. Southeast Asian Fish. Dev. Cent."}
MACRO {AquacultInt} {"Aquacult. Int."}
MACRO {AquacultMag} {"Aquacult. Mag."}
MACRO {AquacultNews} {"Aquacult. News"}
MACRO {AquacultNutr} {"Aquacult. Nutr."}
MACRO {AquacultOutlook} {"Aquacult. Outlook"}
MACRO {AquacultureOutlook} {"Aquaculture Outlook"}
MACRO {AquacultRes} {"Aquacult. Res."}
MACRO {AquacultSituOutlookRep} {"Aquacult. Situ. Outlook Rep."}
MACRO {AquanotInt} {"Aquanot. Int."}
MACRO {Aquaphyte} {"Aquaphyte"}
MACRO {AquarPondkeep} {"Aquar. Pondkeep."}
MACRO {AquariumSciConserv} {"Aquarium Sci. Conserv."}
MACRO {Aquarius} {"Aquarius"}
MACRO {AquatBot} {"Aquat. Bot."}
MACRO {AquatConservMarFreshwatEcosyst} {"Aquat. Conserv.: Mar. Freshwat. Ecosyst."}
MACRO {AquatEcol} {"Aquat. Ecol."}
MACRO {AquatEcosystHealthManage} {"Aquat. Ecosyst. Health Manage."}
MACRO {AquatGeochem} {"Aquat. Geochem."}
MACRO {AquatInsects} {"Aquat. Insects"}
MACRO {AquatLivingResour} {"Aquat. Living Resour."}
MACRO {AquatMamm} {"Aquat. Mamm."}
MACRO {AquatMicrobEcol} {"Aquat. Microb. Ecol."}
MACRO {AquatResourCultDev} {"Aquat. Resour. Cult. Dev."}
MACRO {AquatSci} {"Aquat. Sci."}
MACRO {AquatSurvival} {"Aquat. Survival"}
MACRO {AquatToxicol} {"Aquat. Toxicol."}
MACRO {AquiloSerBot} {"Aquilo, Ser. Bot."}
MACRO {AquiloSerZool} {"Aquilo, Ser. Zool."}
MACRO {ArabGulfJSciRes} {"Arab Gulf J. Sci. Res."}
MACRO {ArachnolMitt} {"Arachnol. Mitt."}
MACRO {ArbStiftSamfNaeringslivsforskWorkPapCentResEconBusAdm} {"Arb. Stift. Samf. Naeringslivsforsk./Work. Pap. Cent. Res. Econ. Bus. Adm."}
MACRO {ArbDtschFischVerb} {"Arb. Dtsch. Fisch.-Verb."}
MACRO {ArchFreundeNaturgeschMecklenbg} {"Arch. Freunde Naturgesch. Mecklenbg."}
MACRO {ArchHydrobiol} {"Arch. Hydrobiol."}
MACRO {ArchHydrobiolSupplAlgolStud} {"Arch. Hydrobiol. (Suppl.) (Algol. Stud.)"}
MACRO {ArchHydrobiolSupplArbLimnolInstUnivKonstanz} {"Arch. Hydrobiol. (Suppl.) (Arb. Limnol. Inst. Univ. Konstanz)"}
MACRO {ArchHydrobiolSupplLargeRivers} {"Arch. Hydrobiol. (Suppl.) (Large Rivers)"}
MACRO {ArchHydrobiolSupplMonogrStud} {"Arch. Hydrobiol. (Suppl.) (Monogr. Stud.)"}
MACRO {ArchHydrobiolSupplUntersElbeAestuars} {"Arch. Hydrobiol. (Suppl.) (Unters. Elbe-Aestuars)"}
MACRO {ArchLebensmittelhyg} {"Arch. Lebensmittelhyg."}
MACRO {ArchMolluskenkd} {"Arch. Molluskenkd."}
MACRO {ArchProtistenkd} {"Arch. Protistenkd."}
MACRO {ArchFishMarineResArchFischMeeresforsch} {"Arch. Fish. Marine Res./Arch. Fisch. Meeresforsch."}
MACRO {ArchInstPasteurTunis} {"Arch. Inst. Pasteur Tunis"}
MACRO {ArchSciGeneve} {"Arch. Sci. (Geneve)"}
MACRO {ArchIntPharmacodynTher} {"Arch. Int. Pharmacodyn. Ther."}
MACRO {ArchIntPhysiolBiochimBiophys} {"Arch. Int. Physiol. Biochim. Biophys."}
MACRO {ArchItalBiol} {"Arch. Ital. Biol."}
MACRO {ArchDermatol} {"Arch. Dermatol."}
MACRO {ArchDisChild} {"Arch. Dis. Child."}
MACRO {ArchDisChildFetNeonatEd} {"Arch. Dis. Child. Fet. Neonat. Ed."}
MACRO {ArchEnvironContamToxicol} {"Arch. Environ. Contam. Toxicol."}
MACRO {ArchEnvironHealth} {"Arch. Environ. Health"}
MACRO {ArchFacialPlastSurg} {"Arch. Facial Plast. Surg."}
MACRO {ArchHistolCytol} {"Arch. Histol. Cytol."}
MACRO {ArchInsectBiochemPhysiol} {"Arch. Insect Biochem. Physiol."}
MACRO {ArchMicrobiol} {"Arch. Microbiol."}
MACRO {ArchNeurol} {"Arch. Neurol."}
MACRO {ArchPediatrAdolescMed} {"Arch. Pediatr. Adolesc. Med."}
MACRO {ArchPhysiolBiochem} {"Arch. Physiol. Biochem."}
MACRO {ArchPolFishArchRybPol} {"Arch. Pol. Fish./Arch. Ryb. Pol."}
MACRO {ArchSexBehav} {"Arch. Sex. Behav."}
MACRO {ArchToxicol} {"Arch. Toxicol."}
MACRO {ArchVirol} {"Arch. Virol."}
MACRO {ArchSciCentRechOceanol} {"Arch. Sci. Cent. Rech. Oceanol."}
MACRO {ArchOceanogrLimnol} {"Arch. Oceanogr. Limnol."}
MACRO {ArchBiolMedExp} {"Arch. Biol. Med. Exp."}
MACRO {ArchZootec} {"Arch. Zootec."}
MACRO {Arctic} {"Arctic"}
MACRO {ArctAlpRes} {"Arct. Alp. Res."}
MACRO {ArctAntarctAlpRes} {"Arct. Antarct. Alp. Res."}
MACRO {Ardea} {"Ardea"}
MACRO {ArhHigRadaToksikolArchIndHygToxicol} {"Arh. Hig. Rada Toksikol./Arch. Ind. Hyg. Toxicol."}
MACRO {AridLandResManage} {"Arid Land Res. Manage."}
MACRO {ArkhAnatGistolEhmbriol} {"Arkh. Anat. Gistol. Ehmbriol."}
MACRO {ArnoldiaZimbabwe} {"Arnoldia Zimbabwe"}
MACRO {ArquipelagoCiencBiolMarLifeMarSci} {"Arquipelago (Cienc. Biol. Mar./Life Mar. Sci.)"}
MACRO {ArqBiolTecnol} {"Arq. Biol. Tecnol."}
MACRO {ArqBiolTecnolBrazArchBiolTechnol} {"Arq. Biol. Tecnol./Braz. Arch. Biol. Technol."}
MACRO {ArqCiencMar} {"Arq. Cienc. Mar"}
MACRO {ArqMusBocageNovaSer} {"Arq. Mus. Bocage (Nova Ser.)"}
MACRO {ArsPharm} {"Ars Pharm."}
MACRO {ArtenschutzRep} {"Artenschutz Rep."}
MACRO {AtertioThrombVascBiol} {"Atertio. Thromb. Vasc. Biol."}
MACRO {ArthritisRheum} {"Arthritis Rheum."}
MACRO {ArthritResTher} {"Arthrit. Res. Ther."}
MACRO {ArthropodStructDev} {"Arthropod Struct. Dev."}
MACRO {ArtifCellsBloodSubstitBiotechnol} {"Artif. Cells Blood Substit. Biotechnol."}
MACRO {ArtifIntell} {"Artif. Intell."}
MACRO {ArtifIntellMed} {"Artif. Intell. Med."}
MACRO {ArtifOrgans} {"Artif. Organs"}
MACRO {ArtsrapPUSHProgrammet} {"Artsrap. PUSH-Programmet"}
MACRO {ASEANFoodJ} {"ASEAN Food J."}
MACRO {ASHRAEJ} {"ASHRAE J."}
MACRO {AsiaPacViewpoint} {"Asia Pac Viewpoint"}
MACRO {AsiaPacificJMolBiolBiotechnol} {"Asia-Pacific J. Mol. Biol. Biotechnol."}
MACRO {AsinCommun} {"Asin Commun."}
MACRO {AsianFishSci} {"Asian Fish. Sci."}
MACRO {AsianJExpSci} {"Asian J. Exp. Sci."}
MACRO {AsianJMicrobiolBiotechnolEnvironSci} {"Asian J. Microbiol., Biotechnol. Environ. Sci."}
MACRO {AsianJSurg} {"Asian J. Surg."}
MACRO {AsianMedJ} {"Asian Med. J."}
MACRO {AsianPacJAllergyImmunol} {"Asian Pac. J. Allergy Immunol."}
MACRO {ASRAJ} {"ASRA J."}
MACRO {AssayDrugDevTechnol} {"Assay Drug Dev. Technol."}
MACRO {Astrobiology} {"Astrobiology"}
MACRO {AthleticTherToday} {"Athletic Ther. Today"}
MACRO {AtlGeol} {"Atl. Geol."}
MACRO {AtlSalmJ} {"Atl. Salm. J."}
MACRO {AtlSeabirds} {"Atl. Seabirds"}
MACRO {Atlantica} {"Atlantica"}
MACRO {Atmosfera} {"Atmosfera"}
MACRO {AtmosphereOcean} {"Atmosphere-Ocean"}
MACRO {AtmosEnviron} {"Atmos. Environ."}
MACRO {AtollResBull} {"Atoll Res. Bull."}
MACRO {AtEnergy} {"At. Energy"}
MACRO {AttiAccadNazLinceiClSciFisMatNatMemSez3} {"Atti Accad. Naz. Lincei Cl. Sci. Fis. Mat. Nat. Mem. (Sez. 3)"}
MACRO {AttiSocToscanaSciNat} {"Atti Soc. Toscana Sci. Nat."}
MACRO {Audiology} {"Audiology"}
MACRO {Audubon} {"Audubon"}
MACRO {Auk} {"Auk"}
MACRO {AustasiaAquacult} {"Austasia Aquacult."}
MACRO {AustralEcol} {"Austral Ecol."}
MACRO {AustralasJDermatol} {"Australas. J. Dermatol."}
MACRO {AustralasJDisasterTraumaStud} {"Australas. J. Disaster Trauma Stud."}
MACRO {AustralasJEcotoxicol} {"Australas. J. Ecotoxicol."}
MACRO {AustralasRadiol} {"Australas. Radiol."}
MACRO {AustralasSciIncSearch} {"Australas. Sci. Inc. Search"}
MACRO {AustNZJMed} {"Aust. N. Z. J. Med."}
MACRO {AustNZJPsychiatry} {"Aust. N. Z. J. Psychiatry"}
MACRO {AustBirdWatch} {"Aust. Bird Watch."}
MACRO {AustCommod} {"Aust. Commod."}
MACRO {AustCommodStat} {"Aust. Commod. Stat."}
MACRO {AustDentJ} {"Aust. Dent. J."}
MACRO {AustEconPap} {"Aust. Econ. Pap."}
MACRO {AustEntomol} {"Aust. Entomol."}
MACRO {AustFish} {"Aust. Fish."}
MACRO {AustFishStat} {"Aust. Fish. Stat."}
MACRO {AustGeogr} {"Aust. Geogr."}
MACRO {AustGeogrStud} {"Aust Geogr Stud"}
MACRO {AustInstMarSciCOTSRep} {"Aust. Inst. Mar. Sci. COTS Rep."}
MACRO {AustInstMarSciRep} {"Aust. Inst. Mar. Sci. Rep."}
MACRO {AustInstMarSciStandOperProced} {"Aust. Inst. Mar. Sci. Stand. Oper. Proced."}
MACRO {AustInstMarSciStatusRep} {"Aust. Inst. Mar. Sci. Status Rep."}
MACRO {AustJAgricResourEcon} {"Aust. J. Agric. Resour. Econ."}
MACRO {AustJAgricEcon} {"Aust. J. Agric. Econ."}
MACRO {AustJAgricRes} {"Aust. J. Agric. Res."}
MACRO {AustJBot} {"Aust. J. Bot."}
MACRO {AustJChem} {"Aust. J. Chem."}
MACRO {AustJEarthSci} {"Aust. J. Earth Sci."}
MACRO {AustJEcol} {"Aust. J. Ecol."}
MACRO {AustJEmergManage} {"Aust. J. Emerg. Manage."}
MACRO {AustJEntomol} {"Aust. J. Entomol."}
MACRO {AustJEnvironManage} {"Aust. J. Environ. Manage."}
MACRO {AustJMarFreshwRes} {"Aust. J. Mar. Freshw. Res."}
MACRO {AustJPlantPhysiol} {"Aust. J. Plant Physiol."}
MACRO {AustJRuralHealth} {"Aust. J. Rural Health"}
MACRO {AustJSciMedSport} {"Aust. J. Sci. Med. Sport"}
MACRO {AustJSoilRes} {"Aust. J. Soil Res."}
MACRO {AustJZool} {"Aust. J. Zool."}
MACRO {AustLandcare} {"Aust. Landcare"}
MACRO {AustMammal} {"Aust. Mammal."}
MACRO {AustMarEcol} {"Aust. Mar. Ecol."}
MACRO {AustMarSciBull} {"Aust. Mar. Sci. Bull."}
MACRO {AustOccupTherJ} {"Aust. Occup. Ther. J."}
MACRO {AustSystBot} {"Aust. Syst. Bot."}
MACRO {AustVetJ} {"Aust. Vet. J."}
MACRO {AustZool} {"Aust. Zool."}
MACRO {Austrobaileya} {"Austrobaileya"}
MACRO {Autoimmunity} {"Autoimmunity"}
MACRO {AutoimmunRev} {"Autoimmun. Rev."}
MACRO {AutomotiveEngineer} {"Automotive Engineer"}
MACRO {AutomotiveEng} {"Automotive Eng."}
MACRO {AvianDis} {"Avian Dis."}
MACRO {AvianPathol} {"Avian Pathol."}
MACRO {AviatSpaceEnvironMed} {"Aviat. Space Environ. Med."}
MACRO {AVICENNIARevEcolOceanolBiodiversTrop} {"AVICENNIA Rev. Ecol. Oceanol. Biodivers. Trop."}
MACRO {Avocetta} {"Avocetta"}
MACRO {BahamasJSci} {"Bahamas J. Sci."}
MACRO {BaltCoastZone} {"Balt. Coast. Zone"}
MACRO {BaltJColeopterol} {"Balt. J. Coleopterol."}
MACRO {BaltSeaEnvironProc} {"Balt. Sea Environ. Proc."}
MACRO {BanadosEste} {"Banados Este"}
MACRO {BangladeshJEntomol} {"Bangladesh J. Entomol."}
MACRO {BangladeshJFishRes} {"Bangladesh J. Fish. Res."}
MACRO {Banmar} {"Banmar"}
MACRO {BasicClinPharmacolToxicol} {"Basic Clin. Pharmacol. Toxicol."}
MACRO {BasicApplEcol} {"Basic Appl. Ecol."}
MACRO {BasicFishStatMinistFishAgricMarResourMaldives} {"Basic Fish. Stat. Minist. Fish. Agric. Mar. Resour. (Maldives)"}
MACRO {Batalleria} {"Batalleria"}
MACRO {BayBengalMimeoSer} {"Bay Bengal Mimeo Ser."}
MACRO {BayBengalNews} {"Bay Bengal News"}
MACRO {Beagle} {"Beagle"}
MACRO {Beaufortia} {"Beaufortia"}
MACRO {BechedeMerInfBull} {"Beche-de-Mer Inf. Bull."}
MACRO {BeeWorld} {"Bee World"}
MACRO {BehavGenet} {"Behav. Genet."}
MACRO {BehavResMethodsInstrumComput} {"Behav. Res. Methods Instrum. Comput."}
MACRO {BehavCognNeurosciRev} {"Behav. Cogn. Neurosci. Rev."}
MACRO {BehavNeuralBiol} {"Behav. Neural Biol."}
MACRO {BehavEcol} {"Behav. Ecol."}
MACRO {BehavEcolSociobiol} {"Behav. Ecol. Sociobiol."}
MACRO {BehavNeurosci} {"Behav. Neurosci."}
MACRO {BehavSci} {"Behav. Sci."}
MACRO {Behaviour} {"Behaviour"}
MACRO {BehavResTher} {"Behav. Res. Ther."}
MACRO {BehavBrainRes} {"Behav. Brain Res."}
MACRO {BehavProcesses} {"Behav. Processes"}
MACRO {BeitrEntomol} {"Beitr. Entomol."}
MACRO {BeitrBiolPflanz} {"Beitr. Biol. Pflanz."}
MACRO {BelgJEntomol} {"Belg. J. Entomol."}
MACRO {BelgJZool} {"Belg. J. Zool."}
MACRO {BelgZeeviss} {"Belg. Zeeviss."}
MACRO {BerInstMeereskdChristianAlbrechtsUnivKiel} {"Ber. Inst. Meereskd. Christian-Albrechts-Univ. Kiel"}
MACRO {BerForschungsstelleKueste} {"Ber. Forschungsstelle Kueste"}
MACRO {BerIGB} {"Ber. IGB"}
MACRO {BerNaturwissMedVerInnsbruck} {"Ber. Naturwiss.-Med. Ver. Innsbruck"}
MACRO {BerLandwirtsch} {"Ber. Landwirtsch."}
MACRO {BerPolarMeeresforschRepPolarMarRes} {"Ber. Polar Meeresforsch./Rep. Polar Mar. Res."}
MACRO {BerForschTechnologiezentWestkueste} {"Ber. Forsch.-Technologiezent. Westkueste"}
MACRO {BerForschungszentTerramare} {"Ber. Forschungszent. Terramare"}
MACRO {BerlMuenchTieraerztlWochenschr} {"Berl. Muench. Tieraerztl. Wochenschr."}
MACRO {BiannRepStateIllSect319} {"Biann. Rep. State Ill. Sect. 319"}
MACRO {BibliogrSerDepPrimIndQueensl} {"Bibliogr. Ser. Dep. Prim. Ind. (Queensl.)"}
MACRO {BiennRepKeikyuAburatsuboMarParkAquar} {"Bienn. Rep. Keikyu Aburatsubo Mar. Park Aquar."}
MACRO {BiennRepAlfredWegenerInstPolarMarRes} {"Bienn. Rep. Alfred Wegener Inst. Polar Mar. Res."}
MACRO {BiennRepAquatronLabDalhousieUniv} {"Bienn. Rep. Aquatron Lab. Dalhousie Univ."}
MACRO {BiennRepDepOceanogrDalhousieUniv} {"Bienn. Rep. Dep. Oceanogr. Dalhousie Univ."}
MACRO {BiennRepIAEAMarEnvironLab} {"Bienn. Rep. IAEA Mar. Environ. Lab."}
MACRO {BiennRepWashUnivApplPhysLab} {"Bienn. Rep. Wash. Univ. Appl. Phys. Lab."}
MACRO {BifidobactMicroflora} {"Bifidobact. Microflora"}
MACRO {BijdrDierkd} {"Bijdr. Dierkd."}
MACRO {BilansProspectIFREMER} {"Bilans Prospect. IFREMER"}
MACRO {BiljNotesInstOceanogrRibarSplit} {"Bilj.-Notes Inst. Oceanogr. Ribar. Split"}
MACRO {BiljeskeNotes} {"Biljeske/Notes"}
MACRO {BinnenfischNiedersachs} {"Binnenfisch. Niedersachs."}
MACRO {BioMedMaterEng} {"Bio-Med. Mater. Eng."}
MACRO {Bioacoustics} {"Bioacoustics"}
MACRO {BiocatalysisBiotransformation} {"Biocatalysis Biotransformation"}
MACRO {Biocenosis} {"Biocenosis"}
MACRO {BiochemBiophysResCommun} {"Biochem. Biophys. Res. Commun."}
MACRO {BiochemEngJ} {"Biochem. Eng. J."}
MACRO {BiochemGenet} {"Biochem. Genet."}
MACRO {BiochemJ} {"Biochem. J."}
MACRO {BiochemPharmacol} {"Biochem. Pharmacol."}
MACRO {BiochemSocTrans} {"Biochem. Soc. Trans."}
MACRO {BiochemSystEcol} {"Biochem. Syst. Ecol."}
MACRO {BiochemistryWash} {"Biochemistry (Wash.)"}
MACRO {BiochemCellBiol} {"Biochem. Cell Biol."}
MACRO {BiochemMolBiolInt} {"Biochem. Mol. Biol. Int."}
MACRO {BiochimBiophysActaGeneStructExpression} {"Biochim. Biophys. Acta Gene Struct. Expression"}
MACRO {BiochimBiophysActa} {"Biochim. Biophys. Acta"}
MACRO {BiochimBiophysActaProteinsProteomics} {"Biochim. Biophys. Acta: Proteins Proteomics"}
MACRO {Biochimie} {"Biochimie"}
MACRO {Biociencias} {"Biociencias"}
MACRO {BioconjChem} {"Bioconj. Chem."}
MACRO {BioControl} {"BioControl"}
MACRO {BiocontrolSci} {"Biocontrol Sci."}
MACRO {BiocontrolSciTechnol} {"Biocontrol Sci. Technol."}
MACRO {BiocosmeMesogeen} {"Biocosme Mesogeen"}
MACRO {Biocycle} {"Biocycle"}
MACRO {Biodegradation} {"Biodegradation"}
MACRO {Biodiversity} {"Biodiversity"}
MACRO {BiodiversConserv} {"Biodivers. Conserv."}
MACRO {BiodiversLett} {"Biodivers. Lett."}
MACRO {BioelectrochemBioenerget} {"Bioelectrochem. Bioenerget."}
MACRO {Bioelectromagnetics} {"Bioelectromagnetics"}
MACRO {Bioessays} {"Bioessays"}
MACRO {BioFactors} {"BioFactors"}
MACRO {Biofouling} {"Biofouling"}
MACRO {Biofutur} {"Biofutur"}
MACRO {Biogeochemistry} {"Biogeochemistry"}
MACRO {Biogeosciences} {"Biogeosciences"}
MACRO {BiogeosciDisc} {"Biogeosci. Disc."}
MACRO {Bioikos} {"Bioikos"}
MACRO {Bioinformatics} {"Bioinformatics"}
MACRO {BiokhimiyaBiochemistry} {"Biokhimiya/Biochemistry"}
MACRO {BiologiaLahore} {"Biologia (Lahore)"}
MACRO {BiolAcuat} {"Biol. Acuat."}
MACRO {BiolMarMediterr} {"Biol. Mar. Mediterr."}
MACRO {BiolPesq} {"Biol. Pesq."}
MACRO {BiolPlant} {"Biol. Plant."}
MACRO {BiologiaABot} {"Biologia (A Bot.)"}
MACRO {BiologiaBZool} {"Biologia (B Zool.)"}
MACRO {BiologiaCVseobecBiol} {"Biologia (C Vseobec. Biol.)"}
MACRO {BiolPharmBull} {"Biol. Pharm. Bull."}
MACRO {BiolAgricHortic} {"Biol. Agric. Hortic."}
MACRO {BiolBullMarBiolLabWoodsHole} {"Biol. Bull. Mar. Biol. Lab. Woods Hole"}
MACRO {BiolChem} {"Biol. Chem."}
MACRO {BiolConserv} {"Biol. Conserv."}
MACRO {BiolCybern} {"Biol. Cybern."}
MACRO {BiolInvasions} {"Biol. Invasions"}
MACRO {BiolJLinnSoc} {"Biol. J. Linn. Soc."}
MACRO {BiolLettWarsaw} {"Biol. Lett. (Warsaw)"}
MACRO {BiolNotesIllNatHistSurv} {"Biol. Notes Ill. Nat. Hist. Surv."}
MACRO {BiolRepNatlBiolServ} {"Biol. Rep. Natl. Biol. Serv."}
MACRO {BiolRepUSFishWildlServ} {"Biol. Rep. U.S. Fish Wildl. Serv."}
MACRO {BiolRevCambPhilosSoc} {"Biol. Rev. Camb. Philos. Soc."}
MACRO {BiolRhythmRes} {"Biol. Rhythm Res."}
MACRO {BiolSciRepNatlBiolServ} {"Biol. Sci. Rep. Natl. Biol. Serv."}
MACRO {BiolServProgramUSFishWildlServ} {"Biol. Serv. Program U.S. Fish Wildl. Serv."}
MACRO {BiolTraceElemRes} {"Biol. Trace Elem. Res."}
MACRO {Biologicals} {"Biologicals"}
MACRO {BiolNauki} {"Biol. Nauki"}
MACRO {BiolResurGidrosIspolz} {"Biol. Resur. Gidros. Ispol'z."}
MACRO {BiologijaBiologiyaBiology} {"Biologija/Biologiya/Biology"}
MACRO {BiolZentralbl} {"Biol. Zentralbl."}
MACRO {BiolSkr} {"Biol. Skr."}
MACRO {Biologist} {"Biologist"}
MACRO {BiolMoryaMarBiol} {"Biol. Morya/Mar. Biol."}
MACRO {BiolVnutrVodBiolInlandWater} {"Biol. Vnutr. Vod/Biol. Inland Water"}
MACRO {BiolEnvironProcRIrAcadB} {"Biol. Environ. Proc. R. Ir. Acad. (B)"}
MACRO {BiolFertilitySoils} {"Biol. Fertility Soils"}
MACRO {BiolBull} {"Biol. Bull."}
MACRO {BiolLett} {"Biol. Lett."}
MACRO {BiolMag} {"Biol. Mag."}
MACRO {BiolReprod} {"Biol. Reprod."}
MACRO {BiolCell} {"Biol. Cell"}
MACRO {Biomacromolecules} {"Biomacromolecules"}
MACRO {Biomarkers} {"Biomarkers"}
MACRO {BiomassBioenergy} {"Biomass Bioenergy"}
MACRO {Biomaterials} {"Biomaterials"}
MACRO {BiomedChromatogr} {"Biomed. Chromatogr."}
MACRO {BiomedEng} {"Biomed. Eng."}
MACRO {BiomedInstrumTechnol} {"Biomed. Instrum. Technol."}
MACRO {BiomedLett} {"Biomed. Lett."}
MACRO {BiomedMicrodevices} {"Biomed. Microdevices"}
MACRO {BiomedTechBiomedEng} {"Biomed. Tech./Biomed. Eng."}
MACRO {BioMetals} {"BioMetals"}
MACRO {Biometrics} {"Biometrics"}
MACRO {Biometrika} {"Biometrika"}
MACRO {Biomimetics} {"Biomimetics"}
MACRO {BiomolEng} {"Biomol. Eng."}
MACRO {BioorgChem} {"Bioorg. Chem."}
MACRO {BioPharm} {"BioPharm"}
MACRO {BioPharmInt} {"BioPharm Int."}
MACRO {BiopharmDrugDisposition} {"Biopharm. Drug Disposition"}
MACRO {BiophysChem} {"Biophys. Chem."}
MACRO {BiophysJ} {"Biophys. J."}
MACRO {Biophysics} {"Biophysics"}
MACRO {Biopolymers} {"Biopolymers"}
MACRO {BiopolymersBiospectrosc} {"Biopolymers (Biospectrosc.)"}
MACRO {BiopolymersNucleicAcidSci} {"Biopolymers (Nucleic Acid Sci.)"}
MACRO {BiopolymersPeptideSci} {"Biopolymers (Peptide Sci.)"}
MACRO {BioprocessBiosystemsEng} {"Bioprocess Biosystems Eng."}
MACRO {BioprocessEng} {"Bioprocess Eng."}
MACRO {BioremediationJ} {"Bioremediation J."}
MACRO {BioresourTechnol} {"Bioresour. Technol."}
MACRO {BIOSBrazil} {"BIOS (Brazil)"}
MACRO {BIOSFlorenceAL} {"BIOS (Florence, AL)"}
MACRO {BIOSMacedGreeceSciAnnSchBiol} {"BIOS (Maced. Greece) Sci. Ann. Sch. Biol."}
MACRO {Bioscience} {"Bioscience"}
MACRO {BiosciMicroflora} {"Biosci. Microflora"}
MACRO {BiosciBiotechnolBiochem} {"Biosci., Biotechnol., Biochem."}
MACRO {BiosecurBioterrorism} {"Biosecur. Bioterrorism"}
MACRO {BiosensorsBioelectron} {"Biosensors Bioelectron."}
MACRO {Bioseparation} {"Bioseparation"}
MACRO {Biospectroscopy} {"Biospectroscopy"}
MACRO {BioSyst} {"BioSyst."}
MACRO {BiosysEng} {"Biosys. Eng."}
MACRO {Biota} {"Biota"}
MACRO {BiotaSlovenia} {"Biota (Slovenia)"}
MACRO {BioTechniques} {"BioTechniques"}
MACRO {BiotechnolAdv} {"Biotechnol. Adv."}
MACRO {BiotechnolApplBiochem} {"Biotechnol. Appl. Biochem."}
MACRO {BiotechnolBioeng} {"Biotechnol. Bioeng."}
MACRO {BiotechnolAnnRev} {"Biotechnol. Ann. Rev."}
MACRO {BiotechnolLett} {"Biotechnol. Lett."}
MACRO {BiotechnolProg} {"Biotechnol. Prog."}
MACRO {BiotechnolTech} {"Biotechnol. Tech."}
MACRO {BiotechnolAgronSocEnviron} {"Biotechnol. Agron. Soc. Environ."}
MACRO {BiotecnolApl} {"Biotecnol. Apl."}
MACRO {Biotherapy} {"Biotherapy"}
MACRO {Biotropica} {"Biotropica"}
MACRO {BipolarDisorders} {"Bipolar Disorders"}
MACRO {BirdBehav} {"Bird Behav."}
MACRO {BirdStudy} {"Bird Study"}
MACRO {TheBirdsofNorthAmerica} {"The Birds of North America"}
MACRO {Birth} {"Birth"}
MACRO {BirthDefectsResPartAClinMolTeratol} {"Birth Defects Res. Part A: Clin. Mol. Teratol."}
MACRO {BirthDefectsResBDevReprodToxicol} {"Birth Defects Res. B: Dev. Reprod. Toxicol."}
MACRO {BirthDefectsResCEmbryoTodayRev} {"Birth Defects Res. C. Embryo Today Rev."}
MACRO {BishopMusOccPap} {"Bishop Mus. Occ. Pap."}
MACRO {BiulMorskInstRyback} {"Biul. Morsk. Inst. Ryback."}
MACRO {BlattNaumannMus} {"Blatt. Naumann-Mus."}
MACRO {Blumea} {"Blumea"}
MACRO {Blyttia} {"Blyttia"}
MACRO {BMCBiochem} {"BMC Biochem."}
MACRO {BMCBioinformatics} {"BMC Bioinformatics"}
MACRO {BMCBiol} {"BMC Biol."}
MACRO {BMCBiotechnol} {"BMC Biotechnol."}
MACRO {BMCCancer} {"BMC Cancer"}
MACRO {BMCCellBiol} {"BMC Cell Biol."}
MACRO {BMCChemBiol} {"BMC Chem. Biol."}
MACRO {BMCClinPharmacol} {"BMC Clin. Pharmacol."}
MACRO {BMCDermatol} {"BMC Dermatol."}
MACRO {BMCDevBiol} {"BMC Dev. Biol."}
MACRO {BMCEcol} {"BMC Ecol."}
MACRO {BMCEmergMed} {"BMC Emerg. Med."}
MACRO {BMCEndoDis} {"BMC Endo. Dis."}
MACRO {BMCEvolBiol} {"BMC Evol. Biol."}
MACRO {BMCGenet} {"BMC Genet."}
MACRO {BMCGenomics} {"BMC Genomics"}
MACRO {BMCGeriatr} {"BMC Geriatr."}
MACRO {BMCImmunol} {"BMC Immunol."}
MACRO {BMCInfectDis} {"BMC Infect. Dis."}
MACRO {BMCIntHealthHumRights} {"BMC Int. Health Hum. Rights"}
MACRO {BMCMedImaging} {"BMC Med. Imaging"}
MACRO {BMCMedInfDecisMaking} {"BMC Med. Inf. Decis. Making"}
MACRO {BMCMicrobiol} {"BMC Microbiol."}
MACRO {BMCMolBiol} {"BMC Mol. Biol."}
MACRO {BMCMusculoskelDisord} {"BMC Musculoskel. Disord."}
MACRO {BMCNephrol} {"BMC Nephrol."}
MACRO {BMCNeurol} {"BMC Neurol."}
MACRO {BMCNeurosci} {"BMC Neurosci."}
MACRO {BMCOralHealth} {"BMC Oral Health"}
MACRO {BMCPharmacol} {"BMC Pharmacol."}
MACRO {BMCPhysiol} {"BMC Physiol."}
MACRO {BMCPlantBiol} {"BMC Plant Biol."}
MACRO {BMCPublicHealth} {"BMC Public Health"}
MACRO {BMCStructBiol} {"BMC Struct. Biol."}
MACRO {BMCWomensHealth} {"BMC Womens Health"}
MACRO {Bocagiana} {"Bocagiana"}
MACRO {Bodenkultur} {"Bodenkultur"}
MACRO {BolSocPortCiencNat} {"Bol. Soc. Port. Cienc. Nat."}
MACRO {BolSocPortEntomol} {"Bol. Soc. Port. Entomol."}
MACRO {BolSocPortEntomolSuppl} {"Bol. Soc. Port. Entomol. Suppl."}
MACRO {BolCiencMar} {"Bol. Cienc. Mar."}
MACRO {BolDivulgInstInvestPesqMaputo} {"Bol. Divulg. Inst. Invest. Pesq. Maputo"}
MACRO {BolDepOceanogrLimnolCentBiociencUnivFedRioGrandedoNorte} {"Bol. Dep. Oceanogr. Limnol. Cent. Biocienc. Univ. Fed. Rio Grande do Norte"}
MACRO {BolInstPescaSaoPaulo} {"Bol. Inst. Pesca Sao Paulo"}
MACRO {BolInstPortInvestMarit} {"Bol. Inst. Port. Invest. Marit."}
MACRO {BolMusBiolMelloLeitao} {"Bol. Mus. Biol. Mello Leitao"}
MACRO {BolMusMunicFunchal} {"Bol. Mus. Munic. Funchal"}
MACRO {BolMusNacRiodeJZool} {"Bol. Mus. Nac. Rio de J. Zool."}
MACRO {BolFEPAGRO} {"Bol. FEPAGRO"}
MACRO {BolTecCientCEPENE} {"Bol. Tec. Cient. CEPENE"}
MACRO {BolTecPETROBRAS} {"Bol. Tec. PETROBRAS"}
MACRO {BolTecCEPTA} {"Bol. Tec. CEPTA"}
MACRO {BolTecInstPescaSaoPaulo} {"Bol. Tec. Inst. Pesca Sao Paulo"}
MACRO {BolTecCientCEPNOR} {"Bol. Tec. Cient. CEPNOR"}
MACRO {BolTecCientINDP} {"Bol. Tec. Cient. INDP"}
MACRO {BolAntartChil} {"Bol. Antart. Chil."}
MACRO {BolCientINPA} {"Bol. Cient. INPA"}
MACRO {BolCientTecInstNacPescaEcuad} {"Bol. Cient. Tec. Inst. Nac. Pesca Ecuad."}
MACRO {BolCientCentInvestOceanogrHidrogrCartagena} {"Bol. Cient. Cent. Invest. Oceanogr. Hidrogr. Cartagena"}
MACRO {BolComerInstNacPescaUrug} {"Bol. Comer. Inst. Nac. Pesca (Urug.)"}
MACRO {BolAlertaClimComPermPacSur} {"Bol. Alerta Clim. Com. Perm. Pac. Sur"}
MACRO {BolComerExterSectPesqMinistAgricChile} {"Bol. Comer. Exter. Sect. Pesq. Minist. Agric. (Chile)"}
MACRO {BolEntomolVenez} {"Bol. Entomol. Venez."}
MACRO {BolEstadPesqPacSudesteFishStatSouthEastPac} {"Bol. Estad. Pesq. Pac. Sudeste/Fish. Stat. South East Pac."}
MACRO {BolEstadSistInfPesqSantiago} {"Bol. Estad. Sist. Inf. Pesq. Santiago"}
MACRO {BolInvestMarCost} {"Bol. Invest. Mar. Cost."}
MACRO {BolAcadNacCiencCordobaArgent} {"Bol. Acad. Nac. Cienc. Cordoba (Argent.)"}
MACRO {BolAsocEspEntomol} {"Bol. Asoc. Esp. Entomol."}
MACRO {BolRSocEspHistNatSeccBiol} {"Bol. R. Soc. Esp. Hist. Nat. (Secc. Biol.)"}
MACRO {BolRSocEspHistNatBiol} {"Bol. R. Soc. Esp. Hist. Nat. (Biol.)"}
MACRO {BolSocBiolConcepcion} {"Bol. Soc. Biol. Concepcion"}
MACRO {BolSocEntomolArgent} {"Bol. Soc. Entomol. Argent."}
MACRO {BolSocZoolUrug} {"Bol. Soc. Zool. Urug."}
MACRO {BolCentInvestBiolMaracaibo} {"Bol. Cent. Invest. Biol. (Maracaibo)"}
MACRO {BolIIP} {"Bol. IIP"}
MACRO {BolInstEspOceanogr} {"Bol. Inst. Esp. Oceanogr."}
MACRO {BolInstOceanogrVenez} {"Bol. Inst. Oceanogr. Venez."}
MACRO {BolEcotropEcosistTrop} {"Bol. Ecotrop.: Ecosist. Trop."}
MACRO {BolERFEN} {"Bol. ERFEN"}
MACRO {BolRedAcuicult} {"Bol. Red Acuicult."}
MACRO {BolFacBiolMarUnivBogotJorgeTadeoLozano} {"Bol. Fac. Biol. Mar. Univ. Bogot Jorge Tadeo Lozano"}
MACRO {BolFacPesqUnivNacAgrarLaMolina} {"Bol. Fac. Pesq. Univ. Nac. Agrar. (La Molina)"}
MACRO {BolInstGeogrUnivNacAutonMex} {"Bol. Inst. Geogr. Univ. Nac. Auton. Mex."}
MACRO {BolInstMarPeru} {"Bol. Inst. Mar Peru"}
MACRO {BolMusNacHistNatChile} {"Bol. Mus. Nac. Hist. Nat. (Chile)"}
MACRO {BollMusIstBiolUnivGenova} {"Boll. Mus. Ist. Biol. Univ Genova"}
MACRO {BollLabEntomolAgrarFilippoSilvestriPortici} {"Boll. Lab. Entomol. Agrar. Filippo Silvestri, Portici"}
MACRO {BollAssocRomEntomol} {"Boll. Assoc. Rom. Entomol."}
MACRO {BollSocEntomolItal} {"Boll. Soc. Entomol. Ital."}
MACRO {BollZool} {"Boll. Zool."}
MACRO {BollSocItalPatolIttica} {"Boll. Soc. Ital. Patol. Ittica"}
MACRO {Bone} {"Bone"}
MACRO {BoneMarrowTransplant} {"Bone Marrow Transplant."}
MACRO {Bonga} {"Bonga"}
MACRO {BonnZoolBeitr} {"Bonn. Zool. Beitr."}
MACRO {BonnZoolMonogr} {"Bonn. Zool. Monogr."}
MACRO {BookSerPhilippCouncAquatMarResDev} {"Book Ser. Philipp. Counc. Aquat. Mar. Res. Dev."}
MACRO {BookletNYSeaGrantInst} {"Booklet N.Y. Sea Grant Inst."}
MACRO {BorealEnvironRes} {"Boreal Environ. Res."}
MACRO {Boreas} {"Boreas"}
MACRO {BotActa} {"Bot. Acta"}
MACRO {BotMar} {"Bot. Mar."}
MACRO {BotJLinnSoc} {"Bot. J. Linn. Soc."}
MACRO {BotRev} {"Bot. Rev."}
MACRO {BotZh} {"Bot. Zh."}
MACRO {BotKoezlBotPubl} {"Bot. Koezl./Bot. Publ."}
MACRO {Brachytron} {"Brachytron"}
MACRO {Brain} {"Brain"}
MACRO {BrainMind} {"Brain Mind"}
MACRO {BrainRes} {"Brain Res."}
MACRO {BrainResBull} {"Brain Res. Bull."}
MACRO {BrainResRev} {"Brain Res. Rev."}
MACRO {BrainBehavEvol} {"Brain Behav. Evol."}
MACRO {BrainBehavImmun} {"Brain, Behav., Immun."}
MACRO {BraunschwNaturkdlSchr} {"Braunschw. Naturkdl. Schr."}
MACRO {BraunschwNaturkdSchr} {"Braunschw. Naturkd. Schr."}
MACRO {BrazJBiol} {"Braz. J. Biol."}
MACRO {BrazJMedBiolRes} {"Braz. J. Med. Biol. Res."}
MACRO {BrazJMicrobiol} {"Braz. J. Microbiol."}
MACRO {Brenesia} {"Brenesia"}
MACRO {Breviora} {"Breviora"}
MACRO {BrBirds} {"Br. Birds"}
MACRO {BrDentJ} {"Br. Dent. J."}
MACRO {BrFoodJ} {"Br. Food J."}
MACRO {BrJBiomedSci} {"Br. J. Biomed. Sci."}
MACRO {BrJCancer} {"Br. J. Cancer"}
MACRO {BrJClinPharmacol} {"Br. J. Clin. Pharmacol."}
MACRO {BrJClinPract} {"Br. J. Clin. Pract."}
MACRO {BrJDermatol} {"Br. J. Dermatol."}
MACRO {BrJEntomolNatHist} {"Br. J. Entomol. Nat. Hist."}
MACRO {BrJIndRelat} {"Br. J. Ind. Relat."}
MACRO {BrJOphthalmol} {"Br. J. Ophthalmol."}
MACRO {BrJOralMaxillofacSurg} {"Br. J. Oral Maxillofac. Surg."}
MACRO {BrJPharmacol} {"Br. J. Pharmacol."}
MACRO {BrJPlastSurg} {"Br. J. Plast. Surg."}
MACRO {BrJPolIntRel} {"Br. J. Pol. Int. Rel."}
MACRO {BrJPsychiatry} {"Br. J. Psychiatry"}
MACRO {BrJRadiol} {"Br. J. Radiol."}
MACRO {BrJSportsMed} {"Br. J. Sports Med."}
MACRO {BrJUrol} {"Br. J. Urol."}
MACRO {BrMedBull} {"Br. Med. Bull."}
MACRO {BrMedJ} {"Br. Med. J."}
MACRO {BrVetJ} {"Br. Vet. J."}
MACRO {BrWildl} {"Br. Wildl."}
MACRO {BrYearbIntLaw} {"Br. Yearb. Int. Law"}
MACRO {Brittonia} {"Brittonia"}
MACRO {BromatolChemToksykol} {"Bromatol. Chem. Toksykol."}
MACRO {Bryologist} {"Bryologist"}
MACRO {BudsjettnemdaFiskenaeringen} {"Budsjettnemda Fiskenaeringen"}
MACRO {BuffaloLawRev} {"Buffalo Law Rev."}
MACRO {BuildEnviron} {"Build. Environ."}
MACRO {BuildResInf} {"Build. Res. Inf."}
MACRO {BulPerikananJabatanPerikananMalaysFishBullDepFishMalays} {"Bul. Perikanan Jabatan Perikanan (Malays.)/Fish. Bull. Dep. Fish. (Malays.)"}
MACRO {BulShkBujq} {"Bul. Shk. Bujq."}
MACRO {BulCercetPiscicSerNoua} {"Bul. Cercet. Piscic. (Ser. Noua)"}
MACRO {BullACCOBAMS} {"Bull. ACCOBAMS"}
MACRO {BullAssocGeogrFr} {"Bull. Assoc. Geogr. Fr."}
MACRO {BullInstNatlSciTechnolMer} {"Bull. Inst. Natl. Sci. Technol. Mer"}
MACRO {BullInstOceanogrMonaco} {"Bull. Inst. Oceanogr. Monaco"}
MACRO {BullInstRSciNatBelgEntomol} {"Bull. Inst. R. Sci. Nat. Belg. Entomol."}
MACRO {BullInstRSciNatBelgiqueBiolBullKBelgischInstNatBiol} {"Bull. Inst. R. Sci. Nat. Belgique Biol./Bull. K. Belgisch Inst. Nat. Biol."}
MACRO {BullSocSciNatTunis} {"Bull. Soc. Sci. Nat. Tunis."}
MACRO {BullSocEntomolFr} {"Bull. Soc. Entomol. Fr."}
MACRO {BullSocGeolFr} {"Bull. Soc. Geol. Fr."}
MACRO {BullSocRBelgeEntomolBullKBelgVerEntomol} {"Bull. Soc. R. Belge Entomol./Bull. K. Belg. Ver. Entomol."}
MACRO {BullSocVaudSciNat} {"Bull. Soc. Vaud. Sci. Nat."}
MACRO {BullSocZoolFr} {"Bull. Soc. Zool. Fr."}
MACRO {BullLiaisonCOIPM} {"Bull. Liaison COIPM"}
MACRO {BullMedSubaquatHyperb} {"Bull. Med. Subaquat. Hyperb."}
MACRO {BullRechAgronGembloux} {"Bull. Rech. Agron. Gembloux"}
MACRO {BullCentRechElfExplorProd} {"Bull. Cent. Rech. Elf Explor. Prod."}
MACRO {BullMusNatlHistNatSectCSciTerrPaleontolG} {"Bull. Mus. Natl. Hist. Nat. Sect. C: Sci. Terr. Paleontol. G"}
MACRO {BullSectMerServMerAquacultFrPolyn} {"Bull. Sect. Mer Serv. Mer Aquacult. (Fr. Polyn.)"}
MACRO {BullAnnSocRBelgeEntomol} {"Bull. Ann. Soc. R. Belge Entomol."}
MACRO {BullFrPechePiscic} {"Bull. Fr. Peche Piscic."}
MACRO {BullMensSocLinnLyon} {"Bull. Mens. Soc. Linn. Lyon"}
MACRO {BullCanPetGeol} {"Bull. Can. Pet. Geol."}
MACRO {BullEarthquakeEng} {"Bull. Earthquake Eng."}
MACRO {BullElectrochem} {"Bull. Electrochem."}
MACRO {BullEntomolRes} {"Bull. Entomol. Res."}
MACRO {BullEnvironContamToxicol} {"Bull. Environ. Contam. Toxicol."}
MACRO {BullFishResAgencyJapan} {"Bull. Fish. Res. Agency (Japan)"}
MACRO {BullFishResDivMiePrefectSciTechnolPromotCent} {"Bull. Fish. Res. Div. Mie Prefect. Sci. Technol. Promot. Cent."}
MACRO {BullFishSciHokkaidoUniv} {"Bull. Fish. Sci. Hokkaido Univ."}
MACRO {BullFishStatBullStatPechesBolEstadPesca} {"Bull. Fish. Stat./Bull. Stat. Peches/Bol. Estad. Pesca"}
MACRO {BullFishSurvIndia} {"Bull. Fish. Surv. India"}
MACRO {BullIbarakiPrefectFreshwFishExpStn} {"Bull. Ibaraki Prefect. Freshw. Fish. Exp. Stn"}
MACRO {BullInsectol} {"Bull. Insectol."}
MACRO {BullMarSci} {"Bull. Mar. Sci."}
MACRO {BullMarSciFishKochiUniv} {"Bull. Mar. Sci. Fish. Kochi Univ."}
MACRO {BullMathBiol} {"Bull. Math. Biol."}
MACRO {BullNagasakiPrefectInstFish} {"Bull. Nagasaki Prefect. Inst. Fish."}
MACRO {BullNatlFishResDevInstKorea} {"Bull. Natl. Fish. Res. Dev. Inst. (Korea)"}
MACRO {BullNatlFishUnivPusanNatSci} {"Bull. Natl. Fish. Univ. Pusan (Nat.Sci.)"}
MACRO {BullNiigataPrefectFishMarResInst} {"Bull. Niigata Prefect. Fish. Mar. Res. Inst."}
MACRO {BullAichiFishResInst} {"Bull. Aichi Fish. Res. Inst."}
MACRO {BullAmMusNatHistNY} {"Bull. Am. Mus. Nat. Hist. N. Y."}
MACRO {BullAomoriPrefectFishExpStn} {"Bull. Aomori Prefect. Fish. Exp. Stn."}
MACRO {BullAquacultAssocCan} {"Bull. Aquacult. Assoc. Can."}
MACRO {BullAtSci} {"Bull. At. Sci."}
MACRO {BullAustMeteorolOceanogrSoc} {"Bull. Aust. Meteorol. Oceanogr. Soc."}
MACRO {BullBiolSocWash} {"Bull. Biol. Soc. Wash."}
MACRO {BullBrackishwatAquacultDevCentJepara} {"Bull. Brackishwat. Aquacult. Dev. Cent. Jepara"}
MACRO {BullBrArachnolSoc} {"Bull. Br. Arachnol. Soc."}
MACRO {BullBrMusNatHistBotSer} {"Bull. Br. Mus. (Nat. Hist.) Bot. Ser."}
MACRO {BullBrMusNatHistEntomolSuppl} {"Bull. Br. Mus. (Nat. Hist.) (Entomol. Suppl.)"}
MACRO {BullBrMusNatHistZool} {"Bull. Br. Mus. (Nat. Hist.) (Zool.)"}
MACRO {BullCentInlandFishResInstBarrackpore} {"Bull. Cent. Inland Fish. Res. Inst. Barrackpore"}
MACRO {BullChemSocJapan} {"Bull. Chem. Soc. Japan"}
MACRO {BullCollAgricVetMedNihonUniv} {"Bull. Coll. Agric. Vet. Med. Nihon Univ."}
MACRO {BullCollSciUnivRyukyus} {"Bull. Coll. Sci. Univ. Ryukyus"}
MACRO {BullEastAfrNatHistSoc} {"Bull. East Afr. Nat. Hist. Soc."}
MACRO {BullEntomolSocEgypt} {"Bull. Entomol. Soc. Egypt"}
MACRO {BullEntomolSocEgyptEconSer} {"Bull. Entomol. Soc. Egypt, Econ. Ser."}
MACRO {BullEstuarCoastSciAssoc} {"Bull. Estuar. Coast. Sci. Assoc."}
MACRO {BullEurAssocFishPathol} {"Bull. Eur. Assoc. Fish Pathol."}
MACRO {BullFacBioresourMieUniver} {"Bull. Fac. Bioresour. Mie Univer."}
MACRO {BullFacFishHokkaidoUniv} {"Bull. Fac. Fish. Hokkaido Univ."}
MACRO {BullFacFishNagasakiUniv} {"Bull. Fac. Fish. Nagasaki Univ."}
MACRO {BullFishExpStnOkayamaPrefect} {"Bull. Fish. Exp. Stn. Okayama Prefect."}
MACRO {BullFlaMusNatHist} {"Bull. Fla. Mus. Nat. Hist."}
MACRO {BullFoodIndResInstTottoriPrefect} {"Bull. Food Ind. Res. Inst. Tottori Prefect."}
MACRO {BullGeobotInstETH} {"Bull. Geobot. Inst. ETH"}
MACRO {BullGeolSocAm} {"Bull. Geol. Soc. Am."}
MACRO {BullHiroshimaFishExpStn} {"Bull. Hiroshima Fish. Exp. Stn."}
MACRO {BullHyogoPrefectFishExpStn} {"Bull. Hyogo Prefect. Fish. Exp. Stn."}
MACRO {BullIbarakiPrefectFishExpStn} {"Bull. Ibaraki Prefect. Fish. Exp. Stn."}
MACRO {BullInstFishSciTongYeongNatlFishColl} {"Bull. Inst. Fish. Sci. Tong-Yeong Natl. Fish. Coll."}
MACRO {BullInstMarBiolOceanogrFourahBayColl} {"Bull. Inst. Mar. Biol. Oceanogr. Fourah Bay Coll."}
MACRO {BullIrBiogeogrSoc} {"Bull. Ir. Biogeogr. Soc."}
MACRO {BullJapanSeaResInstKanazawaUniv} {"Bull. Japan Sea Res. Inst. Kanazawa Univ."}
MACRO {BullJapSocFishOceanogr} {"Bull. Jap. Soc. Fish. Oceanogr."}
MACRO {BullJapSocSciFish} {"Bull. Jap. Soc. Sci. Fish."}
MACRO {BullKanagawaPrefectFishExpStn} {"Bull. Kanagawa Prefect. Fish. Exp. Stn."}
MACRO {BullKesennumaMiyagiPrefectFishExpStn} {"Bull. Kesennuma Miyagi Prefect. Fish. Exp. Stn."}
MACRO {BullKobeMarObs} {"Bull. Kobe Mar. Obs."}
MACRO {BullKyotoInstOceanFishSci} {"Bull. Kyoto Inst. Ocean. Fish. Sci."}
MACRO {BullMarBiolStnAsamushiTohokuUniv} {"Bull. Mar. Biol. Stn. Asamushi Tohoku Univ."}
MACRO {BullMarBiolResCentTajura} {"Bull. Mar. Biol. Res. Cent. Tajura"}
MACRO {BullMarResInstChejuNatlUniv} {"Bull. Mar. Res. Inst. Cheju Natl. Univ."}
MACRO {BullMtDesertIslBiolLab} {"Bull. Mt. Desert Isl. Biol. Lab."}
MACRO {BullNatlInstOceanogrFishEgypt} {"Bull. Natl. Inst. Oceanogr. Fish. (Egypt)"}
MACRO {BullNatlSalmonResourCentJapan} {"Bull. Natl. Salmon Resour. Cent. (Japan)"}
MACRO {KokuritsuKagakuHakubutsukanKenkyuHokokuAruiBullNat} {"Kokuritsu Kagaku Hakubutsukan Kenkyu Hokoku (A-rui)/Bull Nat"}
MACRO {BullNatlSciMusJapanBBot} {"Bull. Natl. Sci. Mus. (Japan) (B Bot.)"}
MACRO {BullNYAcadMed} {"Bull. N. Y. Acad. Med."}
MACRO {BullNAmBentholSoc} {"Bull. N. Am. Benthol. Soc."}
MACRO {BullOceanResInstUnivTokyo} {"Bull. Ocean Res. Inst. Univ. Tokyo"}
MACRO {BullOsakaPrefectFishExpStn} {"Bull. Osaka Prefect. Fish. Exp. Stn."}
MACRO {BullPanAmHealthOrgan} {"Bull. Pan Am. Health Organ."}
MACRO {BullPermIntAssocNavigCongrBullAssocIntPermCongrNavig} {"Bull. Perm. Int. Assoc. Navig. Congr./Bull. Assoc. Int. Perm. Congr. Navig."}
MACRO {BullPlanktonSocJapan} {"Bull. Plankton Soc. Japan"}
MACRO {BullResInstFoodSciKyotoUniv} {"Bull. Res. Inst. Food Sci., Kyoto Univ."}
MACRO {BullSagaPrefectSeaFarmingCent} {"Bull. Saga Prefect. Sea Farming Cent."}
MACRO {BullScandSocParasitol} {"Bull. Scand. Soc. Parasitol."}
MACRO {BullSeaFishInstGdynia} {"Bull. Sea Fish. Inst. Gdynia"}
MACRO {BullSeismolSocAm} {"Bull. Seismol. Soc. Am."}
MACRO {BullShizuokaPrefectFishExpStn} {"Bull. Shizuoka Prefect. Fish. Exp. Stn."}
MACRO {BullSocSeaWaterSciJapan} {"Bull. Soc. Sea Water Sci. (Japan)"}
MACRO {BullSocWetlandSci} {"Bull. Soc. Wetland Sci."}
MACRO {BullSouthCalifAcadSci} {"Bull. South. Calif. Acad. Sci."}
MACRO {BullTochigiPrefectFishExpStn} {"Bull. Tochigi Prefect. Fish. Exp. Stn."}
MACRO {BullTokushimaPrefectMus} {"Bull. Tokushima Prefect. Mus."}
MACRO {BullWHO} {"Bull. W.H.O."}
MACRO {BullYamaguchiPrefectGaikaiFishExpStn} {"Bull. Yamaguchi Prefect. Gaikai Fish. Exp. Stn."}
MACRO {BullTongYeongNatlFishColl} {"Bull. Tong-Yeong Natl. Fish. Coll."}
MACRO {BullToyamaPrefectFishExpInst} {"Bull. Toyama Prefect. Fish. Exp. Inst."}
MACRO {BullZoolNomencl} {"Bull. Zool. Nomencl."}
MACRO {BullPotravinarskVyskumuBullFoodRes} {"Bull. Potravinarsk. Vyskumu/Bull. Food Res."}
MACRO {BullStatPechesCentNatlSciHalieutBoussoura} {"Bull. Stat. Peches Cent. Natl. Sci. Halieut. Boussoura"}
MACRO {BullBurResourSciAust} {"Bull. Bur. Resour. Sci. (Aust.)"}
MACRO {BullCurtinUnivTechnolDeptEnvironBiol} {"Bull. Curtin Univ. Technol. Dept. Environ. Biol."}
MACRO {BullDepPrimIndQueensl} {"Bull. Dep. Prim. Ind. (Queensl.)"}
MACRO {BullECFishCoopBullCECoopPeche} {"Bull. EC Fish. Coop./Bull. CE Coop. Peche"}
MACRO {BulInstZoolAcadSin} {"Bul. Inst. Zool. Acad. Sin."}
MACRO {BullIATTCBolCIAT} {"Bull. IATTC/Bol. CIAT"}
MACRO {BullMarParkResStn} {"Bull. Mar. Park Res. Stn."}
MACRO {BullSAfrAssocMarBiolRes} {"Bull. S. Afr. Assoc. Mar. Biol. Res."}
MACRO {BullUSGeolSurv} {"Bull. U.S. Geol. Surv."}
MACRO {BullZoolMusUnivAmst} {"Bull. Zool. Mus., Univ. Amst."}
MACRO {Burns} {"Burns"}
MACRO {BusSocRev} {"Bus. Soc. Rev."}
MACRO {ByullEhkspBiolMed} {"Byull. Ehksp. Biol. Med."}
MACRO {ByullMOIPBiolBullMoscSocNatBiol} {"Byull. MOIP. (Biol.)/Bull. Mosc. Soc. Nat. (Biol.)"}
MACRO {C&ACarnesAliment} {"C&A Carnes Aliment."}
MACRO {CCOREPubl} {"C-CORE Publ."}
MACRO {CahInfDirRechSciTechQueProv} {"Cah. Inf. Dir. Rech. Sci. Tech. (Que. Prov.)"}
MACRO {CahGeogrTrop} {"Cah. Geogr. Trop."}
MACRO {CahBiolMar} {"Cah. Biol. Mar."}
MACRO {CahOptionsMediterr} {"Cah. Options Mediterr."}
MACRO {Calanus} {"Calanus"}
MACRO {CalcifTissueInt} {"Calcif. Tissue Int."}
MACRO {CalifAgric} {"Calif. Agric."}
MACRO {CalifCoastOcean} {"Calif. Coast Ocean"}
MACRO {CalifFishGame} {"Calif. Fish Game"}
MACRO {CalmScience} {"CalmScience"}
MACRO {CambStudBiolEvolAnthropol} {"Camb. Stud. Biol. Evol. Anthropol."}
MACRO {CanAcoustics} {"Can. Acoustics"}
MACRO {CanAeronautJ} {"Can. Aeronaut. J."}
MACRO {CanAeronautSpaceJ} {"Can. Aeronaut. Space J."}
MACRO {CanBullFishAquatSciBullCanSciHalieutAquat} {"Can. Bull. Fish. Aquat. Sci./Bull. Can. Sci. Halieut. Aquat."}
MACRO {CanContractRepHydrogrOceanSciRappCanEntreprHydrogrSciOcean} {"Can. Contract. Rep. Hydrogr. Ocean Sci./Rapp. Can. Entrepr. Hydrogr. Sci. Ocean."}
MACRO {CanDataRepFishAquatSciRappStatCanSciHalieutAquat} {"Can. Data Rep. Fish. Aquat. Sci./Rapp. Stat. Can. Sci. Halieut. Aquat."}
MACRO {CanDataRepHydrogrOceanSciRappStatCanHydrogrSciOcean} {"Can. Data Rep. Hydrogr. Ocean Sci./Rapp. Stat. Can. Hydrogr. Sci. Ocean."}
MACRO {CanEntomol} {"Can. Entomol."}
MACRO {CanFamPhysician} {"Can. Fam. Physician"}
MACRO {CanFieldNat} {"Can. Field-Nat."}
MACRO {CanFishAnnuStatRevPechesCanRevStatAnnu} {"Can. Fish. Annu. Stat. Rev./Peches Can. Rev. Stat. Annu."}
MACRO {CanFishIntTradePechesCanCommerInt} {"Can. Fish. Int. Trade/Peches Can. Commer. Int."}
MACRO {CanFishLandingsPechesCanDebarq} {"Can. Fish. Landings/Peches Can. Debarq."}
MACRO {CanFishProdInventoriesPechesCanProdStocks} {"Can. Fish. Prod. Inventories/Peches Can. Prod. Stocks"}
MACRO {CanFishStatHighlightsPechesCanSommStat} {"Can. Fish. Stat. Highlights/Peches Can. Somm. Stat."}
MACRO {CanIndRepFishAquatSciRappCanIndSciHalieutAquat} {"Can. Ind. Rep. Fish. Aquat. Sci./Rapp. Can. Ind. Sci. Halieut. Aquat."}
MACRO {CanJAgricEcon} {"Can. J. Agric. Econ."}
MACRO {CanJAnimSci} {"Can. J. Anim. Sci."}
MACRO {CanJApplPhysiolRevCanPhysiolAppl} {"Can. J. Appl. Physiol./Rev. Can. Physiol. Appl."}
MACRO {CanJApplSpectrosc} {"Can. J. Appl. Spectrosc."}
MACRO {CanJBotRevCanBot} {"Can. J. Bot./Rev. Can. Bot."}
MACRO {CanJChemRevCanChim} {"Can. J. Chem./Rev. Can. Chim."}
MACRO {CanJCivEngRevCanGenieCiv} {"Can. J. Civ. Eng./Rev. Can. Genie Civ."}
MACRO {CanJEarthSciRevCanSciTerre} {"Can. J. Earth Sci./Rev. Can. Sci. Terre"}
MACRO {CanJFishAquatSci} {"Can. J. Fish. Aquat. Sci."}
MACRO {CanJForResRevCanRechFor} {"Can. J. For. Res./Rev. Can. Rech. For."}
MACRO {CanJMicrobiolRevCanMicrobiol} {"Can. J. Microbiol./Rev. Can. Microbiol."}
MACRO {CanJNeurolSci} {"Can. J. Neurol. Sci."}
MACRO {CanJPlantSciRevCanPhytotech} {"Can. J. Plant Sci./Rev. Can. Phytotech."}
MACRO {CanJPublicHealth} {"Can. J. Public Health"}
MACRO {CanJRegSciRevCanSciReg} {"Can. J. Reg. Sci./Rev. Can. Sci. Reg."}
MACRO {CanJRemoteSensJCanTeledetect} {"Can. J. Remote Sens./J. Can. Teledetect."}
MACRO {CanJSoilSci} {"Can. J. Soil Sci."}
MACRO {CanJSurg} {"Can. J. Surg."}
MACRO {CanJZoolRevCanZool} {"Can. J. Zool./Rev. Can. Zool."}
MACRO {CanManuscrRepFishAquatSciRappManuscrCanSciHalieutAquat} {"Can. Manuscr. Rep. Fish. Aquat. Sci./Rapp. Manuscr. Can. Sci. Halieut. Aquat."}
MACRO {CanMusNatPublZool} {"Can. Mus. Nat. Publ. Zool."}
MACRO {CanPlantDisSurv} {"Can. Plant Dis. Surv."}
MACRO {CanSpecPublFishAquatSciPublSpecCanSciHalieutAquat} {"Can. Spec. Publ. Fish. Aquat. Sci./Publ. Spec. Can. Sci. Halieut. Aquat."}
MACRO {CanTechRepFishAquatSciRappTechCanSciHalieutAquat} {"Can. Tech. Rep. Fish. Aquat. Sci./Rapp. Tech. Can. Sci. Halieut. Aquat."}
MACRO {CanTechRepHydrogrOceanSciRappTechCanHydrogrSciOcean} {"Can. Tech. Rep. Hydrogr. Ocean Sci./Rapp. Tech. Can. Hydrogr. Sci. Ocean."}
MACRO {CanTranslFishAquatSciTraductCanSciHalieutAquat} {"Can. Transl. Fish. Aquat. Sci./Traduct. Can. Sci. Halieut. Aquat."}
MACRO {CanVetJ} {"Can. Vet. J."}
MACRO {CanYearbIntLaw} {"Can. Yearb. Int. Law"}
MACRO {Cancer} {"Cancer"}
MACRO {CancerBiotherRadiopharm} {"Cancer Biother. Radiopharm."}
MACRO {CancerCausesControl} {"Cancer Causes Control"}
MACRO {CancerCell} {"Cancer Cell"}
MACRO {CancerDetectPrev} {"Cancer Detect. Prev."}
MACRO {CancerDrugDiscDev} {"Cancer Drug Disc. Dev."}
MACRO {CancerEpidemiolBiomarkersPrev} {"Cancer Epidemiol. Biomarkers Prev."}
MACRO {CancerGeneTher} {"Cancer Gene Ther."}
MACRO {CancerGenetCytogenet} {"Cancer Genet. Cytogenet."}
MACRO {CancerGenomProteom} {"Cancer Genom. Proteom."}
MACRO {CancerImmunolImmunother} {"Cancer Immunol., Immunother."}
MACRO {CancerInvest} {"Cancer Invest."}
MACRO {CancerJ} {"Cancer J."}
MACRO {CancerLett} {"Cancer Lett."}
MACRO {CancerMolBiol} {"Cancer Mol. Biol."}
MACRO {CancerRes} {"Cancer Res."}
MACRO {CancerSci} {"Cancer Sci."}
MACRO {CancerSurv} {"Cancer Surv."}
MACRO {Carcinogenesis} {"Carcinogenesis"}
MACRO {CardiovascToxicol} {"Cardiovasc. Toxicol."}
MACRO {CaribbJSci} {"Caribb. J. Sci."}
MACRO {CaribbMarStud} {"Caribb. Mar. Stud."}
MACRO {CARICOMFishResDoc} {"CARICOM Fish. Res. Doc."}
MACRO {CariesRes} {"Caries Res."}
MACRO {CarolineaBeitrNaturkdForschSuedwestdeutschl} {"Carolinea Beitr. Naturkd. Forsch. Suedwestdeutschl."}
MACRO {Caryologia} {"Caryologia"}
MACRO {Castanea} {"Castanea"}
MACRO {CatchCult} {"Catch Cult."}
MACRO {CC&IINFOPESCA} {"CC&I INFOPESCA"}
MACRO {CCAMLRSci} {"CCAMLR Sci."}
MACRO {CECAFECAFSer} {"CECAF/ECAF Ser."}
MACRO {Cell} {"Cell"}
MACRO {CellAdhesCommun} {"Cell Adhes. Commun."}
MACRO {CellTissueBanking} {"Cell Tissue Banking"}
MACRO {CellTissueRes} {"Cell Tissue Res."}
MACRO {CellBiochemFunct} {"Cell Biochem. Funct."}
MACRO {CellBiolToxicol} {"Cell Biol. Toxicol."}
MACRO {CellBiolInt} {"Cell Biol. Int."}
MACRO {CellCalcium} {"Cell Calcium"}
MACRO {CellDeathDiffer} {"Cell Death Differ."}
MACRO {CellMotilCytoskeleton} {"Cell Motil. Cytoskeleton"}
MACRO {CellPreservTechnol} {"Cell Preserv. Technol."}
MACRO {CellRes} {"Cell Res."}
MACRO {CellStressChaperones} {"Cell Stress Chaperones"}
MACRO {CellStructFunct} {"Cell Struct. Funct."}
MACRO {CellsTissuesOrgans} {"Cells Tissues Organs"}
MACRO {CellMolBiolLett} {"Cell. Mol. Biol. Lett."}
MACRO {CellMolBiolRes} {"Cell. Mol. Biol. Res."}
MACRO {CellMolBiol} {"Cell. Mol. Biol."}
MACRO {CellMolLifeSci} {"Cell. Mol. Life Sci."}
MACRO {CellMolNeurobiol} {"Cell. Mol. Neurobiol."}
MACRO {CellImmunol} {"Cell. Immunol."}
MACRO {CellMicrobiol} {"Cell. Microbiol."}
MACRO {CellPharmacol} {"Cell. Pharmacol."}
MACRO {CellSignal} {"Cell. Signal."}
MACRO {CEMAREMiscPubl} {"CEMARE Misc. Publ."}
MACRO {CEMARERep} {"CEMARE Rep."}
MACRO {CEMAREResPap} {"CEMARE Res. Pap."}
MACRO {CemConcrCompos} {"Cem. Concr. Compos."}
MACRO {CemConcrRes} {"Cem. Concr. Res."}
MACRO {CICNewsletter} {"CIC Newsletter"}
MACRO {CEPTechRep} {"CEP Tech. Rep."}
MACRO {CercetMarRechMar} {"Cercet. Mar./Rech. Mar."}
MACRO {CerebCortex} {"Cereb. Cortex"}
MACRO {Cerevisia} {"Cerevisia"}
MACRO {CeylonJSciBiolSci} {"Ceylon J. Sci. (Biol. Sci.)"}
MACRO {CFFANewsl} {"CFFA Newsl."}
MACRO {ChelonianConservBiol} {"Chelonian Conserv. Biol."}
MACRO {ChelonianResMonogr} {"Chelonian Res. Monogr."}
MACRO {ChemBioInfJ} {"Chem-Bio Inf. J."}
MACRO {ChemBioChem} {"ChemBioChem"}
MACRO {ChemPharmBullTokyo} {"Chem. Pharm. Bull. (Tokyo)"}
MACRO {ChemEng} {"Chem. Eng."}
MACRO {ChemEngJ} {"Chem. Eng. J."}
MACRO {ChemEngProg} {"Chem. Eng. Prog."}
MACRO {ChemHealthSaf} {"Chem. Health Saf."}
MACRO {ChemProcess} {"Chem. Process."}
MACRO {ChemResToxicol} {"Chem. Res. Toxicol."}
MACRO {ChemSenses} {"Chem. Senses"}
MACRO {ChemSpecBioavail} {"Chem. Spec. Bioavail."}
MACRO {ChemBiolInteract} {"Chem.-Biol. Interact."}
MACRO {ChemBiodivers} {"Chem. Biodivers."}
MACRO {ChemBiol} {"Chem. Biol."}
MACRO {ChemEcol} {"Chem. Ecol."}
MACRO {ChemometricsIntelligLabSyst} {"Chemometrics Intellig. Lab. Syst."}
MACRO {Chemosphere} {"Chemosphere"}
MACRO {ChemosphereGlobalChangeSci} {"Chemosphere: Global Change Sci."}
MACRO {Chest} {"Chest"}
MACRO {ChildYouthServ} {"Child Youth Serv."}
MACRO {ChildAbuseNeglect} {"Child Abuse Neglect"}
MACRO {ChildDev} {"Child Dev."}
MACRO {ChildMaltreat} {"Child Maltreat."}
MACRO {ChildWelfare} {"Child Welfare"}
MACRO {ChildCareHealthDev} {"Child Care Health Dev."}
MACRO {ChildHealthCare} {"Child. Health Care"}
MACRO {ChilePesq} {"Chile Pesq."}
MACRO {ChinaEnvironSci} {"China Environ. Sci."}
MACRO {ChinaOceanEng} {"China Ocean Eng."}
MACRO {ChinaOffshoreOilGasGeolZhongguoHaishangYouqiDizhi} {"China Offshore Oil Gas (Geol.)/Zhongguo Haishang Youqi (Dizhi)"}
MACRO {ChinBullEntomol} {"Chin. Bull. Entomol."}
MACRO {ChinJApplEnvironBiol} {"Chin. J. Appl. Environ. Biol."}
MACRO {ChinJAtmosSciDaiqiKexue} {"Chin. J. Atmos. Sci./Daiqi Kexue"}
MACRO {ChinJBioprocEng} {"Chin. J. Bioproc. Eng."}
MACRO {ChinJBiotechnolShengwuGongchengXuebao} {"Chin. J. Biotechnol./Shengwu Gongcheng Xuebao"}
MACRO {ChinJEntomol} {"Chin. J. Entomol."}
MACRO {ChinJEpidemiol} {"Chin. J. Epidemiol."}
MACRO {ChinJGeochem} {"Chin. J. Geochem."}
MACRO {ChinJInternMed} {"Chin. J. Intern. Med."}
MACRO {ChinJMarDrugsZhongguoHaiyangYaowu} {"Chin. J. Mar. Drugs/Zhongguo Haiyang Yaowu"}
MACRO {ChinJOceanolLimnol} {"Chin. J. Oceanol. Limnol."}
MACRO {ChinJOtorhinolaryngologySkullBaseSurg} {"Chin. J. Otorhinolaryngology-Skull Base Surg."}
MACRO {ChinJPesticSci} {"Chin. J. Pestic. Sci."}
MACRO {ChinJPolarResJidiYanjiu} {"Chin. J. Polar Res./Jidi Yanjiu"}
MACRO {ChinJPolarSci} {"Chin. J. Polar Sci."}
MACRO {ChinJRiceSciZhongguoShuidaoKexue} {"Chin. J. Rice Sci./Zhongguo Shuidao Kexue"}
MACRO {ChinJZoonoses} {"Chin. J. Zoonoses"}
MACRO {ChinPharmJ} {"Chin. Pharm. J."}
MACRO {ChinSciBull} {"Chin. Sci. Bull."}
MACRO {Chirality} {"Chirality"}
MACRO {Chromosoma} {"Chromosoma"}
MACRO {ChronBenakeiouFytopatholInstNeaSeira} {"Chron. Benakeiou Fytopathol. Inst. (Nea Seira)"}
MACRO {ChronUGGIIUGGChron} {"Chron. UGGI/IUGG Chron."}
MACRO {Chronobiologia} {"Chronobiologia"}
MACRO {ChronobiolInt} {"Chronobiol. Int."}
MACRO {CIBABullCentInstBrackishwaterAquac} {"CIBA Bull. Cent. Inst. Brackishwater. Aquac."}
MACRO {CienciaMaracaibo} {"Ciencia (Maracaibo)"}
MACRO {CienciaMex} {"Ciencia (Mex.)"}
MACRO {CiencBiolEcolSyst} {"Cienc. Biol. (Ecol. Syst.)"}
MACRO {CiencBiolMolCellBiol} {"Cienc. Biol. (Mol. Cell. Biol.)"}
MACRO {CiencCultSaoPaulo} {"Cienc. Cult. (Sao Paulo)"}
MACRO {CiencInteram} {"Cienc. Interam."}
MACRO {CiencPesq} {"Cienc. Pesq."}
MACRO {CiencDesarr} {"Cienc. Desarr."}
MACRO {CiencTecnolAliment} {"Cienc. Tecnol Aliment."}
MACRO {CiencTecnolMarValparaiso} {"Cienc. Tecnol. Mar (Valparaiso)"}
MACRO {CiencTecnolDesarroUrug} {"Cienc. Tecnol. Desarro. Urug."}
MACRO {CiencTechnolFuturo} {"Cienc. Technol. Futuro"}
MACRO {CiencMarUAS} {"Cienc. Mar UAS"}
MACRO {CiencMar} {"Cienc. Mar."}
MACRO {Cientifica} {"Cientifica"}
MACRO {CIFAOccasPap} {"CIFA Occas. Pap."}
MACRO {CIFATechPap} {"CIFA Tech. Pap."}
MACRO {CIFNETAnnuRep} {"CIFNET Annu. Rep."}
MACRO {CiguateraInfBull} {"Ciguatera Inf. Bull."}
MACRO {CIMBull} {"CIM Bull."}
MACRO {CircPaStateUnivExtServ} {"Circ. Pa. State Univ. Ext. Serv."}
MACRO {CirculRes} {"Circul. Res."}
MACRO {CIRIATechNote} {"CIRIA Tech. Note"}
MACRO {CISTIOccasPap} {"CISTI Occas. Pap."}
MACRO {CivEngEnvironSyst} {"Civ. Eng. Environ. Syst."}
MACRO {CivEngPract} {"Civ. Eng. Pract."}
MACRO {CivEngSyst} {"Civ. Eng. Syst."}
MACRO {CivEngJSCE} {"Civ. Eng., JSCE"}
MACRO {CivEngSivIng} {"Civ. Eng./Siv. Ing."}
MACRO {Cladistics} {"Cladistics"}
MACRO {ClaysClayMiner} {"Clays Clay Miner."}
MACRO {ClimChangeDig} {"Clim. Change Dig."}
MACRO {ClimDyn} {"Clim. Dyn."}
MACRO {ClimMonit} {"Clim. Monit."}
MACRO {ClimRes} {"Clim. Res."}
MACRO {ClimChange} {"Clim. Change"}
MACRO {ClinExpMetastasis} {"Clin. Exp. Metastasis"}
MACRO {ClinAnat} {"Clin. Anat."}
MACRO {ClinApplImmunolRev} {"Clin. Appl. Immunol. Rev."}
MACRO {ClinDevImmunol} {"Clin. Dev. Immunol."}
MACRO {ClinDiagnLabImmunol} {"Clin. Diagn. Lab. Immunol."}
MACRO {ClinExpAllergy} {"Clin. Exp. Allergy"}
MACRO {ClinExpDermatol} {"Clin. Exp. Dermatol."}
MACRO {ClinExpImmunol} {"Clin. Exp. Immunol."}
MACRO {ClinExpPharmacolPhysiol} {"Clin. Exp. Pharmacol. Physiol."}
MACRO {ClinBiochem} {"Clin. Biochem."}
MACRO {ClinBiomech} {"Clin. Biomech."}
MACRO {ClinBullMyofascTher} {"Clin. Bull. Myofasc. Ther."}
MACRO {ClinCancerRes} {"Clin. Cancer. Res."}
MACRO {ClinChem} {"Clin. Chem."}
MACRO {ClinGenet} {"Clin. Genet."}
MACRO {ClinGovernIntJ} {"Clin. Govern. Int. J."}
MACRO {ClinImaging} {"Clin. Imaging"}
MACRO {ClinImmunol} {"Clin. Immunol."}
MACRO {ClinImmunolImmnopathol} {"Clin. Immunol. Immnopathol."}
MACRO {ClinInfectDis} {"Clin. Infect. Dis."}
MACRO {ClinJSportMed} {"Clin. J. Sport Med."}
MACRO {ClinMedRes} {"Clin. Med. Res."}
MACRO {ClinMicrobiolInfect} {"Clin. Microbiol. Infect."}
MACRO {ClinMicrobiolNewsl} {"Clin. Microbiol. Newsl."}
MACRO {ClinMicrobiolRev} {"Clin. Microbiol. Rev."}
MACRO {ClinNeurolNeurosurg} {"Clin. Neurol. Neurosurg."}
MACRO {ClinNutr} {"Clin. Nutr."}
MACRO {ClinNutrSuppl} {"Clin. Nutr. Suppl."}
MACRO {ClinOrthopRelatRes} {"Clin. Orthop. Relat. Res."}
MACRO {ClinPhysiolFunctImaging} {"Clin. Physiol. Funct. Imaging"}
MACRO {ClinRadiol} {"Clin. Radiol."}
MACRO {ClinResRegulAff} {"Clin. Res. Regul. Aff."}
MACRO {ClinRevAllergyImmunol} {"Clin. Rev. Allergy Immunol."}
MACRO {ClinRevBoneMinerMetab} {"Clin. Rev. Bone. Miner. Metab."}
MACRO {ClinRisk} {"Clin. Risk"}
MACRO {ClinToxicol} {"Clin. Toxicol."}
MACRO {CloningStemCells} {"Cloning Stem Cells"}
MACRO {CloningSciPolicy} {"Cloning Sci. Policy"}
MACRO {CanMedAssocJ} {"Can. Med. Assoc. J."}
MACRO {CMFRIBull} {"CMFRI Bull."}
MACRO {CMFRISpecPubl} {"CMFRI Spec. Publ."}
MACRO {CNSDrugs} {"CNS Drugs"}
MACRO {COAFishSer} {"COA Fish. Ser."}
MACRO {CoastEng} {"Coast. Eng."}
MACRO {CoastEngJ} {"Coast. Eng. J."}
MACRO {CoastEngTechAidUSArmyCoastEngResCent} {"Coast. Eng. Tech. Aid U.S. Army Coast. Eng. Res. Cent."}
MACRO {CoastEngHaianGongcheng} {"Coast. Eng./Haian Gongcheng"}
MACRO {CoastalHeritage} {"Coastal Heritage"}
MACRO {CoastManage} {"Coast. Manage."}
MACRO {CognitionTechnolWork} {"Cognition Technol. Work"}
MACRO {ColdSpringHarborMonogrSer} {"Cold Spring Harbor Monogr. Ser."}
MACRO {ColdSpringHarborSympQuantBiol} {"Cold Spring Harbor Symp. Quant. Biol."}
MACRO {ColeccNacManCapacitSecrPescaMex} {"Colecc. Nac. Man. Capacit. Secr. Pesca (Mex.)"}
MACRO {ColeoptBull} {"Coleopt. Bull."}
MACRO {CollectReprTongYeongFishJrColl} {"Collect. Repr. Tong-Yeong Fish. Jr. Coll."}
MACRO {CollectVolSciPapICCATReclDocSciCICTAColeccDocCientCICAA} {"Collect. Vol. Sci. Pap. ICCAT/Recl. Doc. Sci. CICTA/Colecc. Doc. Cient. CICAA"}
MACRO {ColloidsSurfPhysicochemEngAspects} {"Colloids Surf. Physicochem. Eng. Aspects"}
MACRO {ColloidsSurfBBiointerfaces} {"Colloids Surf. B. Biointerfaces"}
MACRO {ColloqSeminInstRechDev} {"Colloq. Semin. Inst. Rech. Dev."}
MACRO {ColonialWaterbirds} {"Colonial Waterbirds"}
MACRO {COWaterResourResInstCompletRep} {"CO Water Resour. Res. Inst. Complet. Rep."}
MACRO {CombinatorialChemHighThroughputScreening} {"Combinatorial Chem. High Throughput Screening"}
MACRO {CommentsAgricFoodChem} {"Comments Agric. Food Chem."}
MACRO {CommentsToxicol} {"Comments Toxicol."}
MACRO {CommunInstr} {"Commun. Instr."}
MACRO {CommunNonlinearSciNumerSim} {"Commun. Nonlinear Sci. Numer. Sim."}
MACRO {CommunSoilSciPlantAnal} {"Commun. Soil Sci. Plant Anal."}
MACRO {CommunityDentOralEpidemiol} {"Community Dent. Oral Epidemiol."}
MACRO {CommunityMentHealthJ} {"Community Ment. Health J."}
MACRO {CompFunctGenomics} {"Comp. Funct. Genomics"}
MACRO {CompBiochemPhysiolAMolIntegrPhysiol} {"Comp. Biochem. Physiol., A: Mol. Integr. Physiol."}
MACRO {CompBiochemPhysiolBBiochemMolBiol} {"Comp. Biochem. Physiol. B: Biochem. Mol. Biol."}
MACRO {CompBiochemPhysiolCToxicolPharmacol} {"Comp. Biochem. Physiol., C: Toxicol. Pharmacol."}
MACRO {CompImmunolMicrobiolInfectDis} {"Comp. Immunol., Microbiol. Infect. Dis."}
MACRO {CompParasitol} {"Comp. Parasitol."}
MACRO {CompPhysiolEcol} {"Comp. Physiol. Ecol."}
MACRO {ComplRepAlaDepConservNatResour} {"Compl. Rep. Ala. Dep. Conserv. Nat. Resour."}
MACRO {ComplRepArkansasGameFishComm} {"Compl. Rep. Arkansas Game Fish. Comm."}
MACRO {ComplRepConnDepEnvironProt} {"Compl. Rep. Conn. Dep. Environ. Prot."}
MACRO {CompRepCoordActivitiesProgGreatLakesFishCommiss} {"Comp. Rep. Coord. Activities Prog. Great Lakes Fish. Commiss."}
MACRO {ComplRepDepFishGameAlaska} {"Compl. Rep. Dep. Fish Game (Alaska)"}
MACRO {CompRepFishResProgGreatLakesFishCommis} {"Comp. Rep. Fish. Res. Prog. Great Lakes Fish. Commis."}
MACRO {ComplRepIowaConservComm} {"Compl. Rep. Iowa Conserv. Comm."}
MACRO {ComplRepKyDepFishWildlResour} {"Compl. Rep. Ky. Dep. Fish. Wildl. Resour."}
MACRO {ComplRepMassDivMarFish} {"Compl. Rep. Mass. Div. Mar. Fish."}
MACRO {ComplRepNYDivMarCoastResour} {"Compl. Rep. N.Y. Div. Mar. Coast. Resour."}
MACRO {ComplRepNCDivMarFish} {"Compl. Rep. N.C. Div. Mar. Fish."}
MACRO {ComplRepUSGeolSurv} {"Compl. Rep. U.S. Geol. Surv."}
MACRO {ComplRepUSNavCivEngLab} {"Compl. Rep. U.S. Nav. Civ. Eng. Lab."}
MACRO {ComplRepUSNavEnvironPredictResFacil} {"Compl. Rep. U.S. Nav. Environ. Predict. Res. Facil."}
MACRO {ComplRepWisDepNatResour} {"Compl. Rep. Wis. Dep. Nat. Resour."}
MACRO {CompRepSeaLampreyResProgGreatLakesFishCommiss} {"Comp. Rep. Sea Lamprey Res. Prog. Great Lakes Fish. Commiss."}
MACRO {ComplianceMag} {"Compliance Mag."}
MACRO {CompositesSciTechnol} {"Composites Sci. Technol."}
MACRO {CompostSciUtil} {"Compost Sci. Util."}
MACRO {CRSeancesSocBiolParis} {"C. R. Seances Soc. Biol. Paris"}
MACRO {CRHebdSeancesAcadSciParis} {"C. R. Hebd. Seances Acad. Sci. Paris"}
MACRO {CRDirRechSciTechQueProv} {"C. R. Dir. Rech. Sci. Tech. (Que. Prov.)"}
MACRO {CRBiol} {"C. R. Biol."}
MACRO {CRAcadSciSerIIISciVieLifeSci} {"C. R. Acad. Sci., Ser. III. Sci. Vie/Life Sci."}
MACRO {CRChim} {"C. R. Chim."}
MACRO {CRGeosci} {"C. R. Geosci."}
MACRO {CRMath} {"C. R. Math."}
MACRO {CRMec} {"C. R. Mec."}
MACRO {CRPalevol} {"C.R. Palevol"}
MACRO {ComputBiolChem} {"Comput. Biol. Chem."}
MACRO {ComputStatDataAnal} {"Comput. Stat. Data Anal."}
MACRO {ComputAidedSurg} {"Comput. Aided Surg."}
MACRO {ComputApplBiosci} {"Comput. Appl. Biosci."}
MACRO {ComputMethodsProgramsBiomed} {"Comput. Methods Programs Biomed."}
MACRO {ComputMethodsBiomechBiomedEng} {"Comput. Methods Biomech. Biomed. Eng."}
MACRO {ComputVisionImageUnderstanding} {"Comput. Vision Image Understanding"}
MACRO {ComputMedImagingGraphics} {"Comput. Med. Imaging Graphics"}
MACRO {ComputChemEng} {"Comput. Chem. Eng."}
MACRO {ComputElectronAgric} {"Comput. Electron. Agric."}
MACRO {ComputBiolMed} {"Comput. Biol. Med."}
MACRO {ComunBotMusHistNatMontev} {"Comun. Bot. Mus. Hist. Nat. Montev."}
MACRO {ComunSocMalacolUrug} {"Comun. Soc. Malacol. Urug."}
MACRO {ComunPaleontolMusHistNatMontev} {"Comun. Paleontol. Mus. Hist. Nat. Montev."}
MACRO {ComunZoolMusHistNatMontev} {"Comun. Zool. Mus. Hist. Nat. Montev."}
MACRO {ConcMagnResonA} {"Conc. Magn. Reson. A"}
MACRO {ConcMagnResonB} {"Conc. Magn. Reson. B"}
MACRO {Conchiglie} {"Conchiglie"}
MACRO {ConcurrComputPractExper} {"Concurr. Comput. Pract. Exper."}
MACRO {Condor} {"Condor"}
MACRO {ConfWorkshopSerDepPrimIndQueensl} {"Conf. Workshop Ser. Dep. Prim. Ind. (Queensl.)"}
MACRO {ConfProcTaiwanFishResInst} {"Conf. Proc. Taiwan Fish. Res. Inst."}
MACRO {ConnectSci} {"Connect. Sci."}
MACRO {ConnectTissueRes} {"Connect. Tissue Res."}
MACRO {ConservAdvNotesNZDeptConserv} {"Conserv. Adv. Notes. NZ Dept. Conserv."}
MACRO {ConservBiol} {"Conserv. Biol."}
MACRO {ConservBiolPract} {"Conserv. Biol. Pract."}
MACRO {ConservEcol} {"Conserv. Ecol."}
MACRO {ConservGenet} {"Conserv. Genet."}
MACRO {ConservPract} {"Conserv. Pract."}
MACRO {ContactDermatitis} {"Contact Dermatitis"}
MACRO {ContempCancerRes} {"Contemp. Cancer Res."}
MACRO {ContempTopicsLabAnimSci} {"Contemp. Topics Lab. Anim. Sci."}
MACRO {ContShelfRes} {"Cont. Shelf Res."}
MACRO {Contraception} {"Contraception"}
MACRO {ContribInstNacInvestDesarrPesqArgent} {"Contrib. Inst. Nac. Invest. Desarr. Pesq. (Argent.)"}
MACRO {ContribCientInstAntartArgent} {"Contrib. Cient. Inst. Antart. Argent."}
MACRO {ContribCientCentInvestCientUnivOrientePorlamar} {"Contrib. Cient. Cent. Invest. Cient. Univ. Oriente Porlamar"}
MACRO {ContribDepCiencMarUnivPRContribDepMarSciUnivPR} {"Contrib. Dep. Cienc. Mar. Univ. P.R./Contrib. Dep. Mar. Sci. Univ. P.R."}
MACRO {ContribMarSci} {"Contrib. Mar. Sci."}
MACRO {ContribKoreaInterUnivInstOceanSciPukyongNatlUniv} {"Contrib. Korea Inter-Univ. Inst. Ocean Sci. Pukyong Natl. Univ."}
MACRO {ContribNatlFishResDevInstKorea} {"Contrib. Natl. Fish. Res. Dev. Inst. (Korea)"}
MACRO {ContribAmEntomolInst} {"Contrib. Am. Entomol. Inst."}
MACRO {ContributionsAtmosPhys} {"Contributions Atmos. Phys."}
MACRO {ContribMinerPetrolBeitrMineralPetrol} {"Contrib. Miner. Petrol./Beitr. Mineral. Petrol."}
MACRO {ContribSedimentGeol} {"Contrib. Sediment. Geol."}
MACRO {ContribResFishEng} {"Contrib. Res. Fish. Eng."}
MACRO {ContribHawaiiInstGeophys} {"Contrib. Hawaii Inst. Geophys."}
MACRO {ContribWashUnivSchOceanogr} {"Contrib. Wash. Univ. Sch. Oceanogr."}
MACRO {ConvSciMerBiolMarCentNoumeaORSTOM} {"Conv. Sci. Mer Biol. Mar. Cent. Noumea ORSTOM"}
MACRO {ConvSciMerOceanogrPhysCentNoumeaORSTOM} {"Conv. Sci. Mer Oceanogr. Phys. Cent. Noumea ORSTOM"}
MACRO {Copeia} {"Copeia"}
MACRO {COPESCALDocOcas} {"COPESCAL Doc. Ocas."}
MACRO {COPESCALDocTec} {"COPESCAL Doc. Tec."}
MACRO {CoralReefs} {"Coral Reefs"}
MACRO {CornellIntLawJ} {"Cornell Int. Law J."}
MACRO {CornellLawRev} {"Cornell Law Rev."}
MACRO {CorrosionHouston} {"Corrosion (Houston)"}
MACRO {CorrosSci} {"Corros. Sci."}
MACRO {Cortex} {"Cortex"}
MACRO {CosmetToiletries} {"Cosmet. Toiletries"}
MACRO {CostsEarnSelFishEnterpNS} {"Costs Earn. Sel. Fish. Enterp. N.S."}
MACRO {CounsPsychol} {"Couns. Psychol."}
MACRO {CourForschungsinstSenckenb} {"Cour. Forschungsinst. Senckenb."}
MACRO {CrashPrevInjuryControl} {"Crash Prev. Injury Control"}
MACRO {CreelSurvSeasRep} {"Creel Surv. Seas. Rep."}
MACRO {CretaceousRes} {"Cretaceous Res."}
MACRO {Criminology} {"Criminology"}
MACRO {CritCareMed} {"Crit. Care Med."}
MACRO {CritRevAnalChem} {"Crit. Rev. Anal. Chem."}
MACRO {CritRevBiochemMolBiol} {"Crit. Rev. Biochem. Mol. Biol."}
MACRO {CritRevBiomedEng} {"Crit. Rev. Biomed. Eng."}
MACRO {CritRevBiotechnol} {"Crit. Rev. Biotechnol."}
MACRO {CritRevComputTomogr} {"Crit. Rev. Comput. Tomogr."}
MACRO {CritRevEnvironSciTechnol} {"Crit. Rev. Environ. Sci. Technol."}
MACRO {CritRevEukaryotGeneExpression} {"Crit. Rev. Eukaryot. Gene Expression"}
MACRO {CritRevFoodSciNutr} {"Crit. Rev. Food Sci. Nutr."}
MACRO {CritRevImmunol} {"Crit. Rev. Immunol."}
MACRO {CritRevMicrobiol} {"Crit. Rev. Microbiol."}
MACRO {CritRevNeurobiol} {"Crit. Rev. Neurobiol."}
MACRO {CritRevOncogen} {"Crit. Rev. Oncogen."}
MACRO {CritRevOncolHematol} {"Crit. Rev. Oncol./Hematol."}
MACRO {CritRevOralBiolMedicine} {"Crit. Rev. Oral Biol. Medicine"}
MACRO {CritRevPlantSci} {"Crit. Rev. Plant Sci."}
MACRO {CritRevToxicol} {"Crit. Rev. Toxicol."}
MACRO {CroatMedJ} {"Croat. Med. J."}
MACRO {CroatChemActa} {"Croat. Chem. Acta"}
MACRO {CropImprov} {"Crop Improv."}
MACRO {CropSci} {"Crop Sci."}
MACRO {CruiseRepProudmanOceanogrLabBidston} {"Cruise Rep. Proudman Oceanogr. Lab. Bidston"}
MACRO {CruiseRepGeolSurvJapan} {"Cruise Rep. Geol. Surv. Japan"}
MACRO {CrustacRes} {"Crustac. Res."}
MACRO {Crustaceana} {"Crustaceana"}
MACRO {Cryobiology} {"Cryobiology"}
MACRO {CryptogamieAlgol} {"Cryptogamie: Algol."}
MACRO {CryptogamieMycol} {"Cryptogamie: Mycol."}
MACRO {CuadHerpetol} {"Cuad. Herpetol."}
MACRO {CuadTecInstCiencMarLimnolUnivNacAutonMexBDatosOceanogr} {"Cuad. Tec. Inst. Cienc. Mar Limnol. Univ. Nac. Auton. Mex. (B Datos Oceanogr.)"}
MACRO {CuadUnivMar} {"Cuad. Univ. Mar"}
MACRO {CultAgron} {"Cult. Agron."}
MACRO {CurrBiol} {"Curr. Biol."}
MACRO {CurrCancerDrugTargets} {"Curr. Cancer Drug Targets"}
MACRO {CurrClinOncol} {"Curr. Clin. Oncol."}
MACRO {CurrClinTopInfectDis} {"Curr. Clin. Top. Infect. Dis."}
MACRO {CurrDrugDel} {"Curr. Drug Del."}
MACRO {CurrDrugDiscTechnol} {"Curr. Drug Disc. Technol."}
MACRO {CurrDrugMetab} {"Curr. Drug Metab."}
MACRO {CurrDrugTargets} {"Curr. Drug Targets"}
MACRO {CurrDrugTargetsCardiovascHematolDisord} {"Curr. Drug Targets: Cardiovasc. Hematol. Disord."}
MACRO {CurrDrugTargetsCNSNeurolDisorders} {"Curr. Drug Targets: CNS Neurol. Disorders"}
MACRO {CurrDrugTargetsImmuneEndocrMetabDisord} {"Curr. Drug Targets: Immune, Endocr. Metab. Disord."}
MACRO {CurrDrugTargetsInfectDisord} {"Curr. Drug Targets: Infect. Disord."}
MACRO {CurrDrugTargetsInflammationAllergy} {"Curr. Drug Targets: Inflammation Allergy"}
MACRO {CurrGeneTher} {"Curr. Gene Ther."}
MACRO {CurrGenet} {"Curr. Genet."}
MACRO {CurrGenomics} {"Curr. Genomics"}
MACRO {CurrHIVRes} {"Curr. HIV Res."}
MACRO {CurrIssuesIntestinalMicrobiol} {"Curr. Issues Intestinal Microbiol."}
MACRO {CurrIssuesMolBiol} {"Curr. Issues Mol. Biol."}
MACRO {CurrMedChem} {"Curr. Med. Chem."}
MACRO {CurrMedChemAntiCancerAgents} {"Curr. Med. Chem.: Anti-Cancer Agents"}
MACRO {CurrMedChemImmunolEndocrMetabAgents} {"Curr. Med. Chem.: Immunol., Endocr. Metab. Agents"}
MACRO {CurrMicrobiol} {"Curr. Microbiol."}
MACRO {CurrMolMed} {"Curr. Mol. Med."}
MACRO {CurrOpinBiotechnol} {"Curr. Opin. Biotechnol."}
MACRO {CurrOpinCellBiol} {"Curr. Opin. Cell Biol."}
MACRO {CurrOpinChemBiol} {"Curr. Opin. Chem. Biol."}
MACRO {CurrOpinDermatol} {"Curr. Opin. Dermatol."}
MACRO {CurrOpinEndocrinolDiabetes} {"Curr. Opin. Endocrinol. Diabetes"}
MACRO {CurrOpinGenetDev} {"Curr. Opin. Genet. Dev."}
MACRO {CurrOpinImmunol} {"Curr. Opin. Immunol."}
MACRO {CurrOpinInfectDis} {"Curr. Opin. Infect. Dis."}
MACRO {CurrOpinMicrobiol} {"Curr. Opin. Microbiol."}
MACRO {CurrOpinNeurobiol} {"Curr. Opin. Neurobiol."}
MACRO {CurrOpinOrthop} {"Curr. Opin. Orthop."}
MACRO {CurrOpinOtolaryngolHeadNeckSurg} {"Curr. Opin. Otolaryngol. Head Neck Surg."}
MACRO {CurrOpinPharm} {"Curr. Opin. Pharm."}
MACRO {CurrOpinPlantBiol} {"Curr. Opin. Plant Biol."}
MACRO {CurrOpinRheumatol} {"Curr. Opin. Rheumatol."}
MACRO {CurrOpinStructBiol} {"Curr. Opin. Struct. Biol."}
MACRO {CurrPharmBiotechnol} {"Curr. Pharm. Biotechnol."}
MACRO {CurrPharmDes} {"Curr. Pharm. Des."}
MACRO {CurrPharmacogen} {"Curr. Pharmacogen."}
MACRO {CurrProteinPeptideSci} {"Curr. Protein Peptide Sci."}
MACRO {CurrProteomics} {"Curr. Proteomics"}
MACRO {CurrResMedAromPlants} {"Curr. Res. Med. Arom. Plants"}
MACRO {CurrResNatlWaterResInstCan} {"Curr. Res. Natl. Water Res. Inst. (Can.)"}
MACRO {CurrSci} {"Curr. Sci."}
MACRO {CurrTopDevBiol} {"Curr. Top. Dev. Biol."}
MACRO {CurrTopMedChem} {"Curr. Top. Med. Chem."}
MACRO {CurrTopMicrobiolImmunol} {"Curr. Top. Microbiol. Immunol."}
MACRO {CurrTopNeurochem} {"Curr. Top. Neurochem."}
MACRO {CurrTopPlantBiol} {"Curr. Top. Plant Biol."}
MACRO {CurrTopVirol} {"Curr. Top. Virol."}
MACRO {CurrTopicsWetlandBiogeochem} {"Curr. Topics Wetland Biogeochem."}
MACRO {CurrTrendsImmunol} {"Curr. Trends Immunol."}
MACRO {CutanOculToxicol} {"Cutan. Ocul. Toxicol."}
MACRO {CuttingToolEng} {"Cutting Tool Eng."}
MACRO {Cybernetica} {"Cybernetica"}
MACRO {CyberPsycholBehav} {"CyberPsychol. Behav."}
MACRO {Cybium} {"Cybium"}
MACRO {Cytobios} {"Cytobios"}
MACRO {CytogenetGenomeRes} {"Cytogenet. Genome Res."}
MACRO {CytogenetCellGenet} {"Cytogenet. Cell Genet."}
MACRO {Cytokine} {"Cytokine"}
MACRO {CytokineGrowthFactorRev} {"Cytokine Growth Factor Rev."}
MACRO {CytokinesCellMolTher} {"Cytokines Cell. Mol. Ther."}
MACRO {Cytologia} {"Cytologia"}
MACRO {CytometryB} {"Cytometry B"}
MACRO {Cytotechnology} {"Cytotechnology"}
MACRO {Cytotherapy} {"Cytotherapy"}
MACRO {DalhousieLawJ} {"Dalhousie Law J."}
MACRO {DaltonTransJInorgChem} {"Dalton Trans. J. Inorg. Chem."}
MACRO {Dana} {"Dana"}
MACRO {DangProperIndMaterRep} {"Dang. Proper. Ind. Mater. Rep."}
MACRO {Darwiniana} {"Darwiniana"}
MACRO {DataRecICCATReclDonneesStatCICTAColeccDatosEstadCICAA} {"Data Rec. ICCAT/Recl. Donnees Stat. CICTA/Colecc. Datos Estad. CICAA"}
MACRO {DataRepInstOceanogrUnivBC} {"Data Rep. Inst. Oceanogr. Univ. B.C."}
MACRO {DataRepIATTCRepSpecCIAT} {"Data Rep. IATTC/Rep. Spec. CIAT"}
MACRO {DataRepSouthCarolinaMarineResourCent} {"Data Rep. South Carolina Marine Resour. Cent."}
MACRO {DatosGeofisAOceanogr} {"Datos Geofis. (A Oceanogr.)"}
MACRO {DBCPTechDoc} {"DBCP Tech. Doc."}
MACRO {Decheniana} {"Decheniana"}
MACRO {DeepSeaResIOceanogrResPap} {"Deep Sea Res. (I Oceanogr. Res. Pap.)"}
MACRO {DeepSeaResIITopStudOceanogr} {"Deep Sea Res. (II Top. Stud. Oceanogr.)"}
MACRO {DefSciJ} {"Def. Sci. J."}
MACRO {Defenders} {"Defenders"}
MACRO {DeltEllGeolEtairBullGeolSocGreece} {"Delt. Ell. Geol. Etair./Bull. Geol. Soc. Greece"}
MACRO {DentalBus} {"Dental Bus."}
MACRO {Desalination} {"Desalination"}
MACRO {DetKongeligeFiskeridepartementStortingsmelding} {"Det Kongelige Fiskeridepartement Stortingsmelding"}
MACRO {DtschEntomolZ} {"Dtsch. Entomol. Z."}
MACRO {DtschGewaesserkdMitt} {"Dtsch. Gewaesserkd. Mitt."}
MACRO {DtschHydrogrZ} {"Dtsch. Hydrogr. Z."}
MACRO {DtschHydrogrZSuppl} {"Dtsch. Hydrogr. Z. (Suppl.)"}
MACRO {Development} {"Development"}
MACRO {DevChange} {"Dev. Change"}
MACRO {DevGenesEvol} {"Dev. Genes Evol."}
MACRO {DevGrowthDiffer} {"Dev. Growth Differ."}
MACRO {DevCompImmunol} {"Dev. Comp. Immunol."}
MACRO {DevBiol} {"Dev. Biol."}
MACRO {DevBrainRes} {"Dev. Brain Res."}
MACRO {DevCell} {"Dev. Cell"}
MACRO {DevDyn} {"Dev. Dyn."}
MACRO {DevGenet} {"Dev. Genet."}
MACRO {DevImmunol} {"Dev. Immunol."}
MACRO {DevNeuropsychol} {"Dev. Neuropsychol."}
MACRO {DevNeurosci} {"Dev. Neurosci."}
MACRO {DevPsychobiol} {"Dev. Psychobiol."}
MACRO {DevAquacultFishSci} {"Dev. Aquacult. Fish. Sci."}
MACRO {DevBiolIABSSympSer} {"Dev. Biol. (IABS Symp. Ser.)"}
MACRO {DevFoodSci} {"Dev. Food Sci."}
MACRO {DevHydrobiol} {"Dev. Hydrobiol."}
MACRO {Diabetes} {"Diabetes"}
MACRO {DiagnCytopathol} {"Diagn. Cytopathol."}
MACRO {DiagnMicrobiolInfectDis} {"Diagn. Microbiol. Infect. Dis."}
MACRO {DiatomRes} {"Diatom Res."}
MACRO {Vogelwarte} {"Vogelwarte"}
MACRO {Differentiation} {"Differentiation"}
MACRO {DigDisSci} {"Dig. Dis. Sci."}
MACRO {DisasterManageResponse} {"Disaster Manage. Response"}
MACRO {DisasterPrevManage} {"Disaster Prev. Manage."}
MACRO {Disasters} {"Disasters"}
MACRO {DiscovInnov} {"Discov. Innov."}
MACRO {DiscussPapSerInstFishEconBergen} {"Discuss. Pap. Ser. Inst. Fish. Econ. Bergen"}
MACRO {DiscussNeurosci} {"Discuss. Neurosci."}
MACRO {DisMarkers} {"Dis. Markers"}
MACRO {DisAquatOrg} {"Dis. Aquat. Org."}
MACRO {DissAbstIntPtAHum&SocSci} {"Diss. Abst. Int. Pt. A - Hum. & Soc. Sci."}
MACRO {DissAbstIntPtBSci&Eng} {"Diss. Abst. Int. Pt. B - Sci. & Eng."}
MACRO {DissAbstIntPtCWorldwide} {"Diss. Abst. Int. Pt. C. Worldwide"}
MACRO {DissBiolUnivTartu} {"Diss. Biol. Univ. Tartu."}
MACRO {DissGeophysUnivTartu} {"Diss. Geophys. Univ. Tartu."}
MACRO {DiversDistrib} {"Divers. Distrib."}
MACRO {DNACellBiol} {"DNA Cell Biol."}
MACRO {DNARepair} {"DNA Repair"}
MACRO {DNARes} {"DNA Res."}
MACRO {DNASequence} {"DNA Sequence"}
MACRO {DOCSciInternalSerNZDeptConserv} {"DOC Sci. Internal Ser. NZ Dept. Conserv."}
MACRO {DocSciTechCentBretagneIRD} {"Doc. Sci. Tech. Cent. Bretagne IRD"}
MACRO {DocSciCentNatlSciHalieutBoussoura} {"Doc. Sci. Cent. Natl. Sci. Halieut. Boussoura"}
MACRO {DocTechPechesDakar} {"Doc. Tech. Peches (Dakar)"}
MACRO {DocCientCentInvestigPesqAplCIPA} {"Doc. Cient. Cent. Investig. Pesq. Apl. (CIPA)"}
MACRO {DocTecCentRegInvestPesqYucalpetenInstNacPescaMex} {"Doc. Tec. Cent. Reg. Invest. Pesq. Yucalpeten Inst. Nac. Pesca (Mex.)"}
MACRO {DocTrabPROBIDES} {"Doc. Trab. PROBIDES"}
MACRO {DocTecOceanogrFundUnivRioGrande} {"Doc. Tec. Oceanogr. Fund. Univ. Rio Grande"}
MACRO {DoklBotSciDoklAkadNauk} {"Dokl. Bot. Sci./Dokl. Akad. Nauk"}
MACRO {DoklEarthSci} {"Dokl. Earth Sci."}
MACRO {DoklRAN} {"Dokl. RAN"}
MACRO {DomestAnimEndocrinol} {"Domest. Anim. Endocrinol."}
MACRO {DonghaiMarSciDonghaiHaiyang} {"Donghai Mar. Sci./Donghai Haiyang"}
MACRO {DopovAkadNaukUkrDoklAkadNaukUkr} {"Dopov. Akad. Nauk Ukr./Dokl. Akad. Nauk Ukr."}
MACRO {Doriana} {"Doriana"}
MACRO {DroitMaritFr} {"Droit Marit. Fr."}
MACRO {Drosera} {"Drosera"}
MACRO {DrugAlcoholDepend} {"Drug Alcohol Depend."}
MACRO {DrugAlcoholRev} {"Drug Alcohol Rev."}
MACRO {DrugChemToxicol} {"Drug Chem. Toxicol."}
MACRO {DrugCosmeticInd} {"Drug Cosmetic Ind."}
MACRO {DrugDeliv} {"Drug Deliv."}
MACRO {DrugDesignDiscov} {"Drug Design Discov."}
MACRO {DrugDevIndPharm} {"Drug Dev. Ind. Pharm."}
MACRO {DrugDevRes} {"Drug Dev. Res."}
MACRO {DrugDiscovToday} {"Drug Discov. Today"}
MACRO {DrugDiscTodayTargets} {"Drug Disc. Today Targets"}
MACRO {DrugInfJ} {"Drug Inf. J."}
MACRO {DrugMetabDisposition} {"Drug Metab. Disposition"}
MACRO {DrugMetabRev} {"Drug Metab. Rev."}
MACRO {DrugSaf} {"Drug Saf."}
MACRO {Drugs} {"Drugs"}
MACRO {DrugsSoc} {"Drugs Soc."}
MACRO {DrugsExpClinRes} {"Drugs Exp. Clin. Res."}
MACRO {DrugsEducPrevPolicy} {"Drugs: Educ. Prev. Policy"}
MACRO {DSIRCropResSeafoodRep} {"DSIR Crop Res. Seafood Rep."}
MACRO {Dugesiana} {"Dugesiana"}
MACRO {Dumerilia} {"Dumerilia"}
MACRO {DurbanMusNovit} {"Durban Mus. Novit."}
MACRO {DynAtmosOceans} {"Dyn. Atmos. Oceans"}
MACRO {EBiomedJRegenMed} {"E-Biomed J. Regen. Med."}
MACRO {EarlyWarnAssessRepSer} {"Early Warn. Assess. Rep. Ser."}
MACRO {EarthPlanetSciLett} {"Earth Planet. Sci. Lett."}
MACRO {EarthSciFront} {"Earth Sci. Front."}
MACRO {EarthSciRev} {"Earth-Sci. Rev."}
MACRO {EarthquakeEngStructDyn} {"Earthquake Eng. Struct. Dyn."}
MACRO {EarthquakeSpectra} {"Earthquake Spectra"}
MACRO {EastAfrAgricForJ} {"East Afr. Agric. For. J."}
MACRO {EastAfrMedJ} {"East Afr. Med. J."}
MACRO {EastAfrRegSeasTechRepSer} {"East Afr. Reg. Seas Tech. Rep. Ser."}
MACRO {EastMediterrHealthJournal} {"East. Mediterr. Health Journal"}
MACRO {EchosCSRP} {"Echos CSRP"}
MACRO {Ecography} {"Ecography"}
MACRO {EcoHealth} {"EcoHealth"}
MACRO {EcolAustral} {"Ecol. Austral"}
MACRO {EcolAppl} {"Ecol. Appl."}
MACRO {EcolBull} {"Ecol. Bull."}
MACRO {EcolComplex} {"Ecol. Complex."}
MACRO {EcolEcon} {"Ecol. Econ."}
MACRO {EcolEng} {"Ecol. Eng."}
MACRO {EcolEntomol} {"Ecol. Entomol."}
MACRO {EcolIndicators} {"Ecol. Indicators"}
MACRO {EcolManageRestor} {"Ecol. Manage. Restor."}
MACRO {EcolModel} {"Ecol. Model."}
MACRO {EcolMonogr} {"Ecol. Monogr."}
MACRO {EcolRes} {"Ecol. Res."}
MACRO {EcolResSerUSEnvironProtAgency} {"Ecol. Res. Ser. U.S. Environ. Prot. Agency"}
MACRO {EcolRestor} {"Ecol. Restor."}
MACRO {EcolRev} {"Ecol. Rev."}
MACRO {EcolStudAnalSynth} {"Ecol. Stud. Anal. Synth."}
MACRO {Ecologie} {"Ecologie"}
MACRO {Ecologist} {"Ecologist"}
MACRO {Ecology} {"Ecology"}
MACRO {EcolSoc} {"Ecol. Soc."}
MACRO {EcolLett} {"Ecol. Lett."}
MACRO {EcolFoodNutr} {"Ecol. Food Nutr."}
MACRO {EcolFreshwatFish} {"Ecol. Freshwat. Fish"}
MACRO {EcolIndRegions} {"Ecol. Ind. Regions"}
MACRO {EcolEnvironConserv} {"Ecol., Environ. Conserv."}
MACRO {EconCommerAnalRepDepFishOceansCanRappAnalEconCommerMinistPechesOceansCan} {"Econ. Commer. Anal. Rep. Dep. Fish. Oceans (Can.)/Rapp. Anal. Econ. Commer. Minist. Peches Oceans (Can.)"}
MACRO {EconBot} {"Econ. Bot."}
MACRO {EconDevCultChange} {"Econ. Dev. Cult. Change"}
MACRO {EconPolicy} {"Econ. Policy"}
MACRO {EconPolit} {"Econ. Polit."}
MACRO {EcosCSIRO} {"Ecos (CSIRO)"}
MACRO {Ecoscience} {"Ecoscience"}
MACRO {Ecosystems} {"Ecosystems"}
MACRO {Ecotoxicology} {"Ecotoxicology"}
MACRO {EcotoxicolEnvironSaf} {"Ecotoxicol. Environ. Saf."}
MACRO {Ecotropicos} {"Ecotropicos"}
MACRO {EducPublAlaskaSeaGrant} {"Educ. Publ. Alaska Sea Grant"}
MACRO {EducationalRepSouthCarolinaMarineResourCent} {"Educational Rep. South Carolina Marine Resour. Cent."}
MACRO {EestiGeogrSeltsiAastaraamYearbEstGeogrSoc} {"Eesti Geogr. Seltsi Aastaraam./Yearb. Est. Geogr. Soc."}
MACRO {EestiLooduseuurSeltsiAastaraamYearbEstNatSoc} {"Eesti Looduseuur. Seltsi Aastaraam./Yearb. Est. Nat. Soc."}
MACRO {Efflatounia} {"Efflatounia"}
MACRO {EffluentWaterTreatJ} {"Effluent Water Treat. J."}
MACRO {Ehkologiya} {"Ehkologiya"}
MACRO {EhkolMorya} {"Ehkol. Morya"}
MACRO {EIFACOccasPap} {"EIFAC Occas. Pap."}
MACRO {EIFACTechPap} {"EIFAC Tech. Pap."}
MACRO {EkologiaBratislEcologyBratisl} {"Ekologia (Bratisl.)/Ecology (Bratisl.)"}
MACRO {EkolPolska} {"Ekol. Polska"}
MACRO {EkologijaEhkologiyaEcology} {"Ekologija/Ehkologiya/Ecology"}
MACRO {ElectronJBiotechnol} {"Electron. J. Biotechnol."}
MACRO {ElectronJStructEng} {"Electron. J. Struct. Eng."}
MACRO {Electrophoresis} {"Electrophoresis"}
MACRO {ElsevierOceanogrSer} {"Elsevier Oceanogr. Ser."}
MACRO {Elytron} {"Elytron"}
MACRO {EmbarcPesqOLDEPESCA} {"Embarc. Pesq. OLDEPESCA"}
MACRO {EMBOJ} {"EMBO J."}
MACRO {EmergencyMedAust} {"Emergency Med. Aust."}
MACRO {EmergingInfectDis} {"Emerging Infect. Dis."}
MACRO {EmiratesMedJ} {"Emirates Med. J."}
MACRO {Emu} {"Emu"}
MACRO {Endeavour} {"Endeavour"}
MACRO {EndocrJ} {"Endocr. J."}
MACRO {EndocrPathol} {"Endocr. Pathol."}
MACRO {EndocrRegul} {"Endocr. Regul."}
MACRO {EndocrRev} {"Endocr. Rev."}
MACRO {Endocrinology} {"Endocrinology"}
MACRO {EnergetikaEhnergetikaPowerEng} {"Energetika/Ehnergetika/Power Eng."}
MACRO {EngMinJ} {"Eng. Min. J."}
MACRO {EngFailureAnal} {"Eng. Failure Anal."}
MACRO {EngFractMech} {"Eng. Fract. Mech."}
MACRO {EngLifeSci} {"Eng. Life Sci."}
MACRO {EngIntellSyst} {"Eng. Intell. Syst."}
MACRO {EngJ} {"Eng. J."}
MACRO {EngJMontreal} {"Eng. J. (Montreal)"}
MACRO {EngStruct} {"Eng. Struct."}
MACRO {Entomofauna} {"Entomofauna"}
MACRO {EntomolExpAppl} {"Entomol. Exp. Appl."}
MACRO {EntomolGen} {"Entomol. Gen."}
MACRO {EntomolBasil} {"Entomol. Basil."}
MACRO {EntomolFenn} {"Entomol. Fenn."}
MACRO {EntomolRomanica} {"Entomol. Romanica"}
MACRO {EntomolScand} {"Entomol. Scand."}
MACRO {EntomolSinica} {"Entomol. Sinica"}
MACRO {EntomolKnowledgeKunchongZhishi} {"Entomol. Knowledge/Kunchong Zhishi"}
MACRO {EntomolNews} {"Entomol. News"}
MACRO {EntomolRev} {"Entomol. Rev."}
MACRO {EntomolSci} {"Entomol. Sci."}
MACRO {EntomolObozr} {"Entomol. Obozr."}
MACRO {EntomolBerLuzern} {"Entomol. Ber. (Luzern)"}
MACRO {EntomolBerAmst} {"Entomol. Ber. (Amst.)"}
MACRO {EntomolBl} {"Entomol. Bl."}
MACRO {EntomolMitt} {"Entomol. Mitt."}
MACRO {EntomolNachr} {"Entomol. Nachr."}
MACRO {EntomolZ} {"Entomol. Z."}
MACRO {EntomolTidskr} {"Entomol. Tidskr."}
MACRO {EntomolMedd} {"Entomol. Medd."}
MACRO {EntomolGaz} {"Entomol. Gaz."}
MACRO {EntomolMonMag} {"Entomol. Mon. Mag."}
MACRO {EntomolRecJVar} {"Entomol. Rec. J. Var."}
MACRO {Entomologiste} {"Entomologiste"}
MACRO {Entomon} {"Entomon"}
MACRO {Entomophaga} {"Entomophaga"}
MACRO {Entomotaxonomia} {"Entomotaxonomia"}
MACRO {Entomotropica} {"Entomotropica"}
MACRO {Enviro} {"Enviro"}
MACRO {EnvironBehav} {"Environ. Behav."}
MACRO {EnvironEcol} {"Environ. Ecol."}
MACRO {EnvironConservJ} {"Environ. Conserv. J."}
MACRO {EnvironInt} {"Environ. Int."}
MACRO {EnvironNewsl} {"Environ. Newsl."}
MACRO {EnvironRep} {"Environ. Rep."}
MACRO {EnvironDevSustainability} {"Environ. Dev. Sustainability"}
MACRO {EnvironNutrInteract} {"Environ. Nutr. Interact."}
MACRO {EnvironResourEcon} {"Environ. Resour. Econ."}
MACRO {EnvironEcolStat} {"Environ. Ecol. Stat."}
MACRO {EnvironExpBot} {"Environ. Exp. Bot."}
MACRO {EnvironMolMutag} {"Environ. Mol. Mutag."}
MACRO {EnvironPlanLawJ} {"Environ. Plan. Law J."}
MACRO {EnvironBiolFishes} {"Environ. Biol. Fishes"}
MACRO {EnvironBiosafetyRes} {"Environ. Biosafety Res."}
MACRO {EnvironConserv} {"Environ. Conserv."}
MACRO {EnvironEngSci} {"Environ. Eng. Sci."}
MACRO {EnvironEngWorld} {"Environ. Eng. World"}
MACRO {EnvironEntomol} {"Environ. Entomol."}
MACRO {EnvironFluidMech} {"Environ. Fluid Mech."}
MACRO {EnvironGeochemHealth} {"Environ. Geochem. Health"}
MACRO {EnvironGeol} {"Environ. Geol."}
MACRO {EnvironHealth} {"Environ. Health"}
MACRO {EnvironHealthPreventMed} {"Environ. Health Prevent. Med."}
MACRO {EnvironHealthPerspect} {"Environ. Health Perspect."}
MACRO {EnvironImpactAssessRev} {"Environ. Impact Assess. Rev."}
MACRO {EnvironLawPortland} {"Environ. Law (Portland)"}
MACRO {EnvironManage} {"Environ. Manage."}
MACRO {EnvironMicrobiol} {"Environ. Microbiol."}
MACRO {EnvironModelAssess} {"Environ. Model. Assess."}
MACRO {EnvironModelSoftware} {"Environ. Model. Software"}
MACRO {EnvironMonitAssess} {"Environ. Monit. Assess."}
MACRO {EnvironPollut} {"Environ. Pollut."}
MACRO {EnvironPollutControl} {"Environ. Pollut. Control"}
MACRO {EnvironProg} {"Environ. Prog."}
MACRO {EnvironProt} {"Environ. Prot."}
MACRO {EnvironProtSerEnvironCan} {"Environ. Prot. Ser. Environ. Can."}
MACRO {EnvironQualManage} {"Environ. Qual. Manage."}
MACRO {EnvironRes} {"Environ. Res."}
MACRO {EnvironRev} {"Environ. Rev."}
MACRO {EnvironSciTechnol} {"Environ. Sci. Technol."}
MACRO {EnvironTechnol} {"Environ. Technol."}
MACRO {EnvironTestAnal} {"Environ. Test. Anal."}
MACRO {EnvironToxicol} {"Environ. Toxicol."}
MACRO {EnvironToxicolChem} {"Environ. Toxicol. Chem."}
MACRO {EnvironToxicolPharmacol} {"Environ. Toxicol. Pharmacol."}
MACRO {EnvironToxicolWaterQual} {"Environ. Toxicol. Water Qual."}
MACRO {Environmetrics} {"Environmetrics"}
MACRO {EnzymeMicrobTechnol} {"Enzyme Microb. Technol."}
MACRO {EOSJImmunolImmunopharmacol} {"EOS, J. Immunol. Immunopharmacol."}
MACRO {EOSTransAmGeophysUnion} {"EOS Trans. Am. Geophys. Union"}
MACRO {EpidemiolRev} {"Epidemiol. Rev."}
MACRO {Epidemiology} {"Epidemiology"}
MACRO {EpidemiolInfect} {"Epidemiol. Infect."}
MACRO {Episteme} {"Episteme"}
MACRO {EPRIJ} {"EPRI J."}
MACRO {Ergonomics} {"Ergonomics"}
MACRO {ErgonomicsDes} {"Ergonomics Des."}
MACRO {Esakia} {"Esakia"}
MACRO {ESCAPStudTradeInvest} {"ESCAP Stud. Trade Invest."}
MACRO {EssenzeDerivAgrum} {"Essenze Deriv. Agrum."}
MACRO {EstMarInstRepSer} {"Est. Mar. Inst. Rep. Ser."}
MACRO {Estuaries} {"Estuaries"}
MACRO {EstuarCoastWatersBrIsles} {"Estuar. Coast. Waters Br. Isles"}
MACRO {EstuarCoastShelfSci} {"Estuar. Coast. Shelf Sci."}
MACRO {EstudOceanolFacRecursMarUnivAntofagasta} {"Estud. Oceanol. Fac. Recurs. Mar Univ. Antofagasta"}
MACRO {EstudBiolConservNat} {"Estud. Biol. Conserv. Nat."}
MACRO {EstudLeopold} {"Estud. Leopold."}
MACRO {EthnDis} {"Ethn. Dis."}
MACRO {EthnHealth} {"Ethn. Health"}
MACRO {Ethology} {"Ethology"}
MACRO {EtholEcolEvol} {"Ethol. Ecol. Evol."}
MACRO {Etologia} {"Etologia"}
MACRO {EukaryotCell} {"Eukaryot. Cell"}
MACRO {Euphytica} {"Euphytica"}
MACRO {EurasianSoilSciPochvovedenie} {"Eurasian Soil Sci./Pochvovedenie"}
MACRO {EUROFISHMagZhEVROFISH} {"EUROFISH Mag./Zh. EVROFISH"}
MACRO {Euroil} {"Euroil"}
MACRO {EurArchBiol} {"Eur. Arch. Biol."}
MACRO {EurBiophysJ} {"Eur. Biophys. J."}
MACRO {EurFoodResTechnol} {"Eur. Food Res. Technol."}
MACRO {EurJApplPhysiol} {"Eur. J. Appl. Physiol."}
MACRO {EurJBiochem} {"Eur. J. Biochem."}
MACRO {EurJCancer} {"Eur. J. Cancer"}
MACRO {EurJCancerSuppl} {"Eur. J. Cancer Suppl."}
MACRO {EurJCellBiol} {"Eur. J. Cell Biol."}
MACRO {EurJClinMicrobiolInfectDis} {"Eur. J. Clin. Microbiol. Infect. Dis."}
MACRO {EurJClinPharmacol} {"Eur. J. Clin. Pharmacol."}
MACRO {EurJEndocrinol} {"Eur. J. Endocrinol."}
MACRO {EurJEntomol} {"Eur. J. Entomol."}
MACRO {EurJEpidemiol} {"Eur. J. Epidemiol."}
MACRO {EurJForPathol} {"Eur. J. For. Pathol."}
MACRO {EurJHealthLaw} {"Eur. J. Health Law"}
MACRO {EuropJHumGenet} {"Europ. J. Hum. Genet."}
MACRO {EurJImmunogenet} {"Eur. J. Immunogenet."}
MACRO {EurJImmunol} {"Eur. J. Immunol."}
MACRO {EurJInflam} {"Eur. J. Inflam."}
MACRO {EurJIntLaw} {"Eur. J. Int. Law"}
MACRO {EurJMigrLaw} {"Eur. J. Migr. Law"}
MACRO {EurJMorphol} {"Eur. J. Morphol."}
MACRO {EurJNeurosci} {"Eur. J. Neurosci."}
MACRO {EurJNuclMedMolImag} {"Eur. J. Nucl. Med. Mol. Imag."}
MACRO {EurJPediatr} {"Eur. J. Pediatr."}
MACRO {EurJPharmSci} {"Eur. J. Pharm. Sci."}
MACRO {EurJPharmacol} {"Eur. J. Pharmacol."}
MACRO {EurJPharmacolMolPharmacolSect} {"Eur. J. Pharmacol. (Mol. Pharmacol. Sect.)"}
MACRO {EurJPharmacolEnvironToxicolPharmacolSect} {"Eur. J. Pharmacol. (Environ. Toxicol. Pharmacol. Sect.)"}
MACRO {EurJPhycol} {"Eur. J. Phycol."}
MACRO {EurJPhysMedRehabil} {"Eur. J. Phys. Med. Rehabil."}
MACRO {EurJPlantPathol} {"Eur. J. Plant Pathol."}
MACRO {EurJPolitRes} {"Eur. J. Polit. Res."}
MACRO {EurJProtistol} {"Eur. J. Protistol."}
MACRO {EurJPublicHealth} {"Eur. J. Public Health"}
MACRO {EurJSoilSci} {"Eur. J. Soil Sci."}
MACRO {EurJUltrasound} {"Eur. J. Ultrasound"}
MACRO {EurJWorkOrgPsychol} {"Eur. J. Work Org. Psychol."}
MACRO {EurRadiol} {"Eur. Radiol."}
MACRO {EurRespirJ} {"Eur. Respir. J."}
MACRO {EurUrol} {"Eur. Urol."}
MACRO {EVAAMRappAnnu} {"EVAAM Rapp. Annu."}
MACRO {EvidenceBasedMentalHealth} {"Evidence-Based Mental Health"}
MACRO {EvokPot} {"Evok. Pot."}
MACRO {Evolution} {"Evolution"}
MACRO {EvolDev} {"Evol. Dev."}
MACRO {EvolSectBelgePecheMarit} {"Evol. Sect. Belge Peche Marit."}
MACRO {EvolEcol} {"Evol. Ecol."}
MACRO {EvolEcolRes} {"Evol. Ecol. Res."}
MACRO {ExcellEcol} {"Excell. Ecol."}
MACRO {ExercSportSciRev} {"Exerc. Sport Sci. Rev."}
MACRO {Experientia} {"Experientia"}
MACRO {ExpAgric} {"Exp. Agric."}
MACRO {ExpApplAcarol} {"Exp. Appl. Acarol."}
MACRO {ExpToxicolPathol} {"Exp. Toxicol. Pathol."}
MACRO {ExpBiolMed} {"Exp. Biol. Med."}
MACRO {ExpBrainRes} {"Exp. Brain Res."}
MACRO {ExpCellRes} {"Exp. Cell Res."}
MACRO {ExpLungRes} {"Exp. Lung Res."}
MACRO {ExpNeurol} {"Exp. Neurol."}
MACRO {ExpParasitol} {"Exp. Parasitol."}
MACRO {ExpertOpinDrugSaf} {"Expert Opin. Drug Saf."}
MACRO {Exposure} {"Exposure"}
MACRO {ExtraNuevaSerMusArgentCiencNatBernardinoRivadaviaInstNacInvestCiencNatArgent} {"Extra (Nueva Ser.) Mus. Argent. Cienc. Nat. Bernardino Rivadavia Inst. Nac. Invest. Cienc. Nat. (Argent.)"}
MACRO {Extremes} {"Extremes"}
MACRO {Extremophiles} {"Extremophiles"}
MACRO {Exuviae} {"Exuviae"}
MACRO {Eye} {"Eye"}
MACRO {Fabreries} {"Fabreries"}
MACRO {FACESRevFacCiencEconSoc} {"FACES Rev. Fac. Cienc. Econ. Soc."}
MACRO {FADFishAggregDeviceInfBull} {"FAD Fish Aggreg. Device Inf. Bull."}
MACRO {Falco} {"Falco"}
MACRO {FamCancer} {"Fam. Cancer"}
MACRO {FamCommunityHealth} {"Fam. Community Health"}
MACRO {FamPract} {"Fam. Pract."}
MACRO {FAOAquacultNewsl} {"FAO Aquacult. Newsl."}
MACRO {FAOBetterFarmingSer} {"FAO Better Farming Ser."}
MACRO {FAOComputInfSerFish} {"FAO Comput. Inf. Ser. (Fish.)"}
MACRO {FAOEASTFISHFishInd} {"FAO EASTFISH Fish. Ind."}
MACRO {FAOFishCirc} {"FAO Fish. Circ."}
MACRO {FAOFishRep} {"FAO Fish. Rep."}
MACRO {FAOFishSer} {"FAO Fish. Ser."}
MACRO {FAOFishSynop} {"FAO Fish. Synop."}
MACRO {FAOFishTechPap} {"FAO Fish. Tech. Pap."}
MACRO {FAOGLOBEFISHSpecSer} {"FAO GLOBEFISH Spec. Ser."}
MACRO {FAOLegisStudy} {"FAO Legis. Study"}
MACRO {FAOPlantProtBull} {"FAO Plant Prot. Bull."}
MACRO {FAOSpeciesCatFishPurp} {"FAO Species Cat. Fish. Purp."}
MACRO {FAOSpeciesIdentifGuideFishPurp} {"FAO Species Identif. Guide Fish. Purp."}
MACRO {FAOStatDevSer} {"FAO Stat. Dev. Ser."}
MACRO {FAOTrainSer} {"FAO Train. Ser."}
MACRO {FAOYearbFishStatAquacProdAnnuStatPechesProdAquacAnuEstadPescaProdAcuic} {"FAO Yearb. Fish. Stat. Aquac. Prod./Annu Stat. Peches Prod. Aquac./Anu. Estad. Pesca Prod. Acuic."}
MACRO {FAOYearbFishStatCaptureProdAnnuStatPechesCapturesAnuEstadPescaCapturas} {"FAO Yearb. Fish. Stat. Capture Prod./Annu. Stat. Peches Captures/Anu. Estad. Pesca Capturas"}
MACRO {FAOYearbFishStatCommodAnnuStatPechesProdAnuEstadPescaProd} {"FAO Yearb. Fish. Stat. Commod./Annu. Stat. Peches Prod./Anu. Estad. Pesca Prod."}
MACRO {FAOFishCodeRev} {"FAO FishCode Rev."}
MACRO {Farmaco} {"Farmaco"}
MACRO {FASEBJ} {"FASEB J."}
MACRO {FastFerryInt} {"Fast Ferry Int."}
MACRO {FatigueFractEngMaterStruct} {"Fatigue Fract. Eng. Mater. Struct."}
MACRO {FaunaBlindern} {"Fauna (Blindern)"}
MACRO {FaunaBajkala} {"Fauna Bajkala"}
MACRO {FaunaEntomolPort} {"Fauna Entomol. Port."}
MACRO {FaunaEntomolScand} {"Fauna Entomol. Scand."}
MACRO {FaunaGraeciae} {"Fauna Graeciae"}
MACRO {FaunaNorv} {"Fauna Norv."}
MACRO {FaunaNorvSerA} {"Fauna Norv., Ser. A"}
MACRO {FaunaNorvSerB} {"Fauna Norv., Ser. B"}
MACRO {FaunaNorvSerC} {"Fauna Norv., Ser. C"}
MACRO {FaunaNZ} {"Fauna N. Z."}
MACRO {FauneMadagas} {"Faune Madagas."}
MACRO {FauneFloreTrop} {"Faune Flore Trop."}
MACRO {FaunOekolMitt} {"Faun.-Oekol. Mitt."}
MACRO {FEBSJ} {"FEBS J."}
MACRO {FEBSLett} {"FEBS Lett."}
MACRO {FEMSImmunolMedMicrobiol} {"FEMS Immunol. Med. Microbiol."}
MACRO {FEMSMicrobiolEcol} {"FEMS Microbiol. Ecol."}
MACRO {FEMSMicrobiolLett} {"FEMS Microbiol. Lett."}
MACRO {FEMSMicrobiolRev} {"FEMS Microbiol. Rev."}
MACRO {FEMSYeastRes} {"FEMS Yeast Res."}
MACRO {Festivus} {"Festivus"}
MACRO {FETTWissTechnolFATSciTechnol} {"FETT Wiss. Technol./FAT Sci. Technol."}
MACRO {FFANewsDigSPacForumFishAgency} {"FFA News Dig. S. Pac. Forum Fish. Agency"}
MACRO {FFARepSPacForumFishAgency} {"FFA Rep. S. Pac. Forum Fish. Agency"}
MACRO {FieldCropsRes} {"Field Crops Res."}
MACRO {FieldStud} {"Field Stud."}
MACRO {FieldianaBotNewSer} {"Fieldiana (Bot.) (New Ser.)"}
MACRO {FieldianaZool} {"Fieldiana (Zool.)"}
MACRO {FilieraPescaAquac} {"Filiera Pesca Aquac."}
MACRO {FireFlammabilBull} {"Fire Flammabil. Bull."}
MACRO {FireMater} {"Fire Mater."}
MACRO {FireEng} {"Fire Eng."}
MACRO {FirePrev} {"Fire Prev."}
MACRO {FireSafJ} {"Fire Saf. J."}
MACRO {FireTechnol} {"Fire Technol."}
MACRO {FirstBreak} {"First Break"}
MACRO {Fischoekologie} {"Fischoekologie"}
MACRO {FischTeichwirt} {"Fisch. Teichwirt"}
MACRO {Fischerblatt} {"Fischerblatt"}
MACRO {FischJahrbFishYearbPecheAnnuLuxemb} {"Fisch. Jahrb./Fish. Yearb./Peche Annu. (Luxemb.)"}
MACRO {Fischmagazin} {"Fischmagazin"}
MACRO {Fish} {"Fish"}
MACRO {FishShellfishImmunol} {"Fish Shellfish Immunol."}
MACRO {FishAquatResourSer} {"Fish Aquat. Resour. Ser."}
MACRO {FishFish} {"Fish Fish."}
MACRO {FishFishResResourFishManageSystRepSciNews} {"Fish Fish. Res. (Resour. Fish. Manage. Syst.: Rep. Sci. News)"}
MACRO {FishWildlLeafl} {"Fish Wildl. Leafl."}
MACRO {FishWildlRes} {"Fish Wildl. Res."}
MACRO {FishWildlifeServInstreamFlowInfPap} {"Fish Wildlife Serv. Instream Flow Inf. Pap."}
MACRO {FishBullCalifDepFishGame} {"Fish Bull. Calif. Dep. Fish Game"}
MACRO {FishFarmer} {"Fish Farmer"}
MACRO {FishFarmInt} {"Fish Farm. Int."}
MACRO {FishFarmNews} {"Fish Farm. News"}
MACRO {FishFarmsProdSurv} {"Fish Farms Prod. Surv."}
MACRO {FishHabitatCodePractSer} {"Fish Habitat Code Pract. Ser."}
MACRO {FishHabitatGuidelSer} {"Fish Habitat Guidel. Ser."}
MACRO {FishHabitatManagOperPolicySer} {"Fish Habitat Manag. Oper. Policy Ser."}
MACRO {FishInsp} {"Fish. Insp."}
MACRO {FishPathol} {"Fish Pathol."}
MACRO {FishPhysiolBiochem} {"Fish Physiol. Biochem."}
MACRO {Fisheries} {"Fisheries"}
MACRO {FishAquacultIsrFig} {"Fish. Aquacult. Isr. Fig."}
MACRO {FishFishbreedIsr} {"Fish. Fishbreed. Isr."}
MACRO {FishBullDepFishMalawi} {"Fish. Bull. Dep. Fish. (Malawi)"}
MACRO {FishBullMarInstDublin} {"Fish. Bull. Mar. Inst. Dublin"}
MACRO {FishCentResRep} {"Fish. Cent. Res. Rep."}
MACRO {FishDataCollectDepFishCambodia} {"Fish. Data Collect. Dep. Fish. (Cambodia)"}
MACRO {FishDraftPolicyFishDepWestAust} {"Fish. Draft Policy Fish. Dep. West. Aust."}
MACRO {FishEducTrainInfBull} {"Fish. Educ. Train. Inf. Bull."}
MACRO {FishEngJapanSuisanKogakuJapan} {"Fish. Eng. (Japan)/Suisan Kogaku (Japan)"}
MACRO {FishImportExportMag} {"Fish. Import-Export Mag."}
MACRO {FishInf} {"Fish. Inf."}
MACRO {FishInfSerFishDivTrinidadandTobago} {"Fish. Inf. Ser. Fish. Div. (Trinidad and Tobago)"}
MACRO {FishJCollFishUnivPhilippVisayas} {"Fish. J. Coll. Fish. Univ. Philipp. Visayas"}
MACRO {FishManageEcol} {"Fish. Manage. Ecol."}
MACRO {FishManagePapFishDepWestAust} {"Fish. Manage. Pap. Fish. Dep. West. Aust."}
MACRO {FishManageRepFishDepWestAust} {"Fish. Manage. Rep. Fish. Dep. West. Aust."}
MACRO {FishManageRepMinistEnvironLandsParksBC} {"Fish. Manage. Rep. Minist. Environ. Lands Parks (B.C.)"}
MACRO {FishNewslSecrPacCommunity} {"Fish. Newsl. Secr. Pac. Community"}
MACRO {FishNSW} {"Fish. N.S.W."}
MACRO {FishOccasPublFishDepWestAustralia} {"Fish. Occas. Publ. Fish. Dep. West. Australia"}
MACRO {FishOceanogr} {"Fish. Oceanogr."}
MACRO {FishRes} {"Fish. Res."}
MACRO {FishResBullTonga} {"Fish. Res. Bull. Tonga"}
MACRO {FishResBullFishWestAust} {"Fish. Res. Bull. Fish. West. Aust."}
MACRO {FishResBullKasetsartUniv} {"Fish. Res. Bull. Kasetsart Univ."}
MACRO {FishResRep} {"Fish. Res. Rep."}
MACRO {FishResRepSer} {"Fish. Res. Rep. Ser."}
MACRO {FishResRepFishWestAust} {"Fish. Res. Rep. Fish. West. Aust."}
MACRO {FishResSerCSIROMarRes} {"Fish. Res. Ser. CSIRO Mar. Res."}
MACRO {FishResourConservCouncFRCCRep} {"Fish. Resour. Conserv. Counc. (FRCC) Rep."}
MACRO {FishRev} {"Fish. Rev."}
MACRO {FishSci} {"Fish. Sci."}
MACRO {FishSciRes} {"Fish. Sci. Res."}
MACRO {FishSciShuichanKexue} {"Fish. Sci./Shuichan Kexue"}
MACRO {FishSciTechInfBullAbstr} {"Fish. Sci. Tech. Inf. Bull. Abstr."}
MACRO {FishStatDigest} {"Fish. Stat. Digest"}
MACRO {FishStatYearbTaiwanArea} {"Fish. Stat. Yearb. Taiwan Area"}
MACRO {FishStatKuwait} {"Fish. Stat. (Kuwait)"}
MACRO {FishStatJapan} {"Fish. Stat. Japan"}
MACRO {FishStatSaudiArab} {"Fish. Stat. Saudi Arab."}
MACRO {FishStatThail} {"Fish. Stat. Thail."}
MACRO {FishStatPhilipp} {"Fish. Stat. Philipp."}
MACRO {FishTechCircMinistEnvironLandsParksBC} {"Fish. Tech. Circ. Minist. Environ. Lands Parks (B.C.)"}
MACRO {FishTechMemo} {"Fish. Tech. Memo"}
MACRO {FishTechRepDepParksRenewResourSask} {"Fish. Tech. Rep. Dep. Parks Renew. Resour. (Sask.)"}
MACRO {FishTechnolManSer} {"Fish. Technol. Man. Ser."}
MACRO {FishTradingMag} {"Fish. Trading Mag."}
MACRO {FishVicAssessRepSer} {"Fish. Vic. Assess. Rep. Ser."}
MACRO {Fisherman} {"Fisherman"}
MACRO {FishAssessRepEastTunaBillfishFish} {"Fish. Assess. Rep. East. Tuna Billfish Fish."}
MACRO {FishBull} {"Fish. Bull."}
MACRO {FishLeaflMarInstIrelEire} {"Fish. Leafl. Mar. Inst. (Irel. (Eire))"}
MACRO {FishRepDepPrimIndFishNorthTerrit} {"Fish. Rep. Dep. Prim. Ind. Fish. (North. Territ.)"}
MACRO {FishStatBullSouthChinaSeaArea} {"Fish. Stat. Bull. South China Sea Area"}
MACRO {FishStatYearbDepFishQatar} {"Fish. Stat. Yearb. Dep. Fish. (Qatar)"}
MACRO {FishStatusRepInterAmTropTunaCommisInformeSitPesComInteramAtunTrop} {"Fish. Status Rep. Inter-Am. Trop. Tuna Commis./Informe Sit. Pes. Com. Interam. Atun Trop."}
MACRO {FishTechnolSocFishTechnolIndia} {"Fish. Technol. Soc. Fish. Technol. (India)"}
MACRO {Fishfacts} {"Fishfacts"}
MACRO {FishBusInt} {"Fish. Bus. Int."}
MACRO {FishChimes} {"Fish. Chimes"}
MACRO {FishCommunityProdSurv} {"Fish. Community Prod. Surv."}
MACRO {FishIndHandbSAfrNamibMocamb} {"Fish. Ind. Handb. S. Afr. Namib. Mocamb."}
MACRO {FishIndNewsSouthAfr} {"Fish. Ind. News South. Afr."}
MACRO {FishLinePNG} {"Fish. Line (P.N.G.)"}
MACRO {FishNews} {"Fish. News"}
MACRO {FishNewsInt} {"Fish. News Int."}
MACRO {FiskeOppdrettLaksFishRearingSalmon} {"Fiske Oppdrett Laks/Fish. Rearing Salmon"}
MACRO {FiskenHavet} {"Fisken Havet"}
MACRO {FiskenHavetSaernummer} {"Fisken Havet Saernummer"}
MACRO {Fiskeoppdrett} {"Fiskeoppdrett"}
MACRO {FiskeridirKontoretFiskerforsoekVeiledningRapp} {"Fiskeridir., Kontoret Fiskerforsoek Veiledning Rapp."}
MACRO {FiskeridirektoratetRappMeld} {"Fiskeridirektoratet. Rapp. Meld."}
MACRO {FiskeridirektSkrifterSerieErnaering} {"Fiskeridirekt. Skrifter. Serie Ernaering"}
MACRO {FiskeridirekSkrifterSerTeknolRepTechResConcerningNorwegianFishIndust} {"Fiskeridirek. Skrifter. Ser. Teknol./Rep. Tech. Res. Concerning Norwegian Fish Indust."}
MACRO {FiskerioekonSmaaSkrPapFishEcon} {"Fiskerioekon. Smaa-Skr./Pap. Fish. Econ."}
MACRO {FiskeristatFishStat} {"Fiskeristat./Fish. Stat."}
MACRO {FiskeriteknolForskningsinstRapp} {"Fiskeriteknol. Forskningsinst. Rapp."}
MACRO {FiskGang} {"Fisk. Gang"}
MACRO {Fitopatologia} {"Fitopatologia"}
MACRO {FitopatolVenezol} {"Fitopatol. Venezol."}
MACRO {Fitoterapia} {"Fitoterapia"}
MACRO {FlavourFragranceJ} {"Flavour Fragrance J."}
MACRO {FloedevigenMeldinger} {"Floedevigen Meldinger"}
MACRO {FloedevigenRapportser} {"Floedevigen Rapportser."}
MACRO {FloraJena} {"Flora (Jena)"}
MACRO {FloraFaunaJhansi} {"Flora Fauna (Jhansi)"}
MACRO {FloraFauna} {"Flora Fauna"}
MACRO {FloraFaunaAreasSilv} {"Flora Fauna Areas Silv."}
MACRO {FlaEntomol} {"Fla. Entomol."}
MACRO {FMRITechRep} {"FMRI Tech. Rep."}
MACRO {FlaMarResPubl} {"Fla. Mar. Res. Publ."}
MACRO {FlaSci} {"Fla. Sci."}
MACRO {FluidDyn} {"Fluid Dyn."}
MACRO {Fluoride} {"Fluoride"}
MACRO {FlyingSaf} {"Flying Saf."}
MACRO {Focus} {"Focus"}
MACRO {FocusMarRes} {"Focus Mar. Res."}
MACRO {FoliaBiolKrakow} {"Folia Biol. (Krakow)"}
MACRO {FoliaBiolPrague} {"Folia Biol. (Prague)"}
MACRO {FoliaEntomolHung} {"Folia Entomol. Hung."}
MACRO {FoliaEntomolMex} {"Folia Entomol. Mex."}
MACRO {FoliaGeobotPhytotaxon} {"Folia Geobot. Phytotaxon."}
MACRO {FoliaHeyrovskyana} {"Folia Heyrovskyana"}
MACRO {FoliaLimnolScand} {"Folia Limnol. Scand."}
MACRO {FoliaMicrobiol} {"Folia Microbiol."}
MACRO {FoliaParasitol} {"Folia Parasitol."}
MACRO {FoliaPrimatol} {"Folia Primatol."}
MACRO {FoliaZool} {"Folia Zool."}
MACRO {FoodAdditContam} {"Food Addit. Contam."}
MACRO {FoodAgricImmunol} {"Food Agric. Immunol."}
MACRO {FoodBioprodProcess} {"Food Bioprod. Process."}
MACRO {FoodChemToxicol} {"Food Chem. Toxicol."}
MACRO {FoodDrugLawJ} {"Food Drug Law J."}
MACRO {FoodAust} {"Food Aust."}
MACRO {FoodBiotechnol} {"Food Biotechnol."}
MACRO {FoodChem} {"Food Chem."}
MACRO {FoodDrugCosmetLawJ} {"Food Drug Cosmet. Law J."}
MACRO {FoodManuf} {"Food Manuf."}
MACRO {FoodMicrobiol} {"Food Microbiol."}
MACRO {FoodPolicy} {"Food Policy"}
MACRO {FoodProcess} {"Food Process."}
MACRO {FoodProtTrends} {"Food Prot. Trends"}
MACRO {FoodResInt} {"Food Res. Int."}
MACRO {FoodRev} {"Food Rev."}
MACRO {FoodRevInt} {"Food Rev. Int."}
MACRO {FoodSciTechnolInt} {"Food Sci. Technol. Int."}
MACRO {FoodSciTechnolLebensmWissTechnol} {"Food Sci. Technol./Lebensm.-Wiss. Technol."}
MACRO {FoodTechnol} {"Food Technol."}
MACRO {FoodTechnolBiotechnol} {"Food Technol. Biotechnol."}
MACRO {ForceFive} {"Force Five"}
MACRO {ForensicSciInt} {"Forensic Sci. Int."}
MACRO {ForensicSciRev} {"Forensic Sci. Rev."}
MACRO {Foresight} {"Foresight"}
MACRO {ForEcolManage} {"For. Ecol. Manage."}
MACRO {ForPathol} {"For. Pathol."}
MACRO {ForRes} {"For. Res."}
MACRO {ForSci} {"For. Sci."}
MACRO {ForTreesLivelihoods} {"For., Trees Livelihoods"}
MACRO {FFIRapp} {"FFI Rapp."}
MACRO {ForthNatHist} {"Forth Nat. Hist."}
MACRO {FortschrFischereiwissAdvFishSci} {"Fortschr. Fischereiwiss./Adv. Fish. Sci."}
MACRO {FossilsStrata} {"Fossils Strata"}
MACRO {FoundryManageTechnol} {"Foundry Manage. Technol."}
MACRO {Fractals} {"Fractals"}
MACRO {FragmEntomol} {"Fragm. Entomol."}
MACRO {FragmFaunPolANInstZool} {"Fragm. Faun. Pol. AN Inst. Zool."}
MACRO {FreeRadicalBiolMed} {"Free Radical Biol. Med."}
MACRO {FrenteMarit} {"Frente Marit."}
MACRO {FreseniusEnvironBull} {"Fresenius Environ. Bull."}
MACRO {FreseniusJAnalChem} {"Fresenius J. Anal. Chem."}
MACRO {FreshwatBiol} {"Freshwat. Biol."}
MACRO {FreshwatFishfarmProdDepFishThail} {"Freshwat. Fishfarm Prod. Dep. Fish. (Thail.)"}
MACRO {FreshwatForum} {"Freshwat. Forum"}
MACRO {FRINewsl} {"FRI Newsl."}
MACRO {FrontEcolEnviron} {"Front. Ecol. Environ."}
MACRO {Fruits} {"Fruits"}
MACRO {FrustulaEntomol} {"Frustula Entomol."}
MACRO {FunctEcol} {"Funct. Ecol."}
MACRO {FunctPlantBiol} {"Funct. Plant Biol."}
MACRO {FundamApplNematol} {"Fundam. Appl. Nematol."}
MACRO {FundamApplToxicol} {"Fundam. Appl. Toxicol."}
MACRO {FungalGenetBiol} {"Fungal Genet. Biol."}
MACRO {FusionEngDes} {"Fusion Eng. Des."}
MACRO {GAIA} {"GAIA"}
MACRO {GangtieYanjiuXuebaoJIronSteelRes} {"Gangtie Yanjiu Xuebao/J. Iron Steel Res."}
MACRO {GarciadeOrtaZool} {"Garcia de Orta (Zool.)"}
MACRO {GasUtilManager} {"Gas Util. Manager"}
MACRO {Gayana} {"Gayana"}
MACRO {GayanaBot} {"Gayana Bot."}
MACRO {GayanaOceanol} {"Gayana Oceanol."}
MACRO {GayanaZool} {"Gayana Zool."}
MACRO {GECRev} {"GEC Rev."}
MACRO {GegenbaursMorpholJahrb} {"Gegenbaurs Morphol. Jahrb."}
MACRO {Gene} {"Gene"}
MACRO {GeneExpression} {"Gene Expression"}
MACRO {GeneExpressionPatterns} {"Gene Expression Patterns"}
MACRO {GeneTher} {"Gene Ther."}
MACRO {GeneTherRegul} {"Gene Ther. Regul."}
MACRO {GenCompEndocrinol} {"Gen. Comp. Endocrinol."}
MACRO {GenEducSerDepFishOceansCanSerducMinistPechesOceansCan} {"Gen. Educ. Ser. Dep. Fish. Oceans (Can.)/Ser. duc. Minist. Peches Oceans (Can.)"}
MACRO {GenPharmacol} {"Gen. Pharmacol."}
MACRO {GenTechRepDepAgricUS} {"Gen. Tech. Rep. Dep. Agric. (U.S.)"}
MACRO {GenesDev} {"Genes Dev."}
MACRO {GenesGenetSyst} {"Genes Genet. Syst."}
MACRO {GenesImmun} {"Genes Immun."}
MACRO {GenesCells} {"Genes Cells"}
MACRO {GenesBrainandBehav} {"Genes, Brain and Behav."}
MACRO {GenesChromosomesCancer} {"Genes Chromosomes Cancer"}
MACRO {Genesis} {"Genesis"}
MACRO {GenetAnalTechAppl} {"Genet. Anal. Tech. Appl."}
MACRO {GenetAnalBiomolEng} {"Genet. Anal.: Biomol. Eng."}
MACRO {GenetEngBiotechnol} {"Genet. Eng. Biotechnol."}
MACRO {GenetEpidemiol} {"Genet. Epidemiol."}
MACRO {GenetProgramEvolvableMach} {"Genet. Program. Evolvable Mach."}
MACRO {GenetResourCropEvol} {"Genet. Resour. Crop Evol."}
MACRO {Genetica} {"Genetica"}
MACRO {GenetRes} {"Genet. Res."}
MACRO {Genetics} {"Genetics"}
MACRO {GenetMolBiol} {"Genet. Mol. Biol."}
MACRO {GenMolRes} {"Gen. Mol. Res."}
MACRO {GenetMed} {"Genet. Med."}
MACRO {GenetSelEvol} {"Genet. Sel. Evol."}
MACRO {Genetika} {"Genetika"}
MACRO {GenetSel} {"Genet. Sel."}
MACRO {Genome} {"Genome"}
MACRO {GenomeRes} {"Genome Res."}
MACRO {Genomics} {"Genomics"}
MACRO {Genus} {"Genus"}
MACRO {GEOAustralas} {"GEO Australas."}
MACRO {GeoMarLett} {"Geo-Mar. Lett."}
MACRO {GeoSpatialInfSciQDiqiuKongjianXinxiKexueXuebao} {"Geo-Spatial Inf. Sci. Q./Diqiu Kongjian Xinxi Kexue Xuebao"}
MACRO {GeoSpatialInfSciDiqiuKongjianXinxiKexueXuebao} {"Geo-Spatial Inf. Sci./Diqiu Kongjian Xinxi Kexue Xuebao"}
MACRO {GEOUNAM} {"GEO-UNAM"}
MACRO {Geoacta} {"Geoacta"}
MACRO {GeochimCosmochimActa} {"Geochim. Cosmochim. Acta"}
MACRO {Geodiversitas} {"Geodiversitas"}
MACRO {GeofisInt} {"Geofis. Int."}
MACRO {GeografijaGeografiyaGeography} {"Geografija/Geografiya/Geography"}
MACRO {GeogrMetrastGeogrYearb} {"Geogr. Metrast./Geogr. Yearb."}
MACRO {GeogrMirovOkeana} {"Geogr. Mirov. Okeana"}
MACRO {GeogrJ} {"Geogr. J."}
MACRO {Geokhimiya} {"Geokhimiya"}
MACRO {GeolPalaeontol} {"Geol. Palaeontol."}
MACRO {GeolBullTurkTurkJeolBul} {"Geol. Bull. Turk./Turk. Jeol. Bul."}
MACRO {GeolSocAmProgramsAbstracts} {"Geol. Soc. Am. Programs Abstracts"}
MACRO {GeolZh} {"Geol. Zh."}
MACRO {Geology} {"Geology"}
MACRO {GeolPacOceanTikhookeanGeol} {"Geol. Pac. Ocean/Tikhookean. Geol."}
MACRO {GeomicrobiolJ} {"Geomicrobiol. J."}
MACRO {Geophysica} {"Geophysica"}
MACRO {GeophysAstrophysFluidDyn} {"Geophys. Astrophys. Fluid Dyn."}
MACRO {GeophysBullHokkaidoUniv} {"Geophys. Bull. Hokkaido Univ."}
MACRO {GeophysResLett} {"Geophys. Res. Lett."}
MACRO {Geophytology} {"Geophytology"}
MACRO {GeorgeWrightForum} {"George Wright Forum"}
MACRO {GeorgetownIntEnvironLawRev} {"Georgetown Int. Environ. Law Rev."}
MACRO {GeorgiaJSci} {"Georgia J. Sci."}
MACRO {Geosphere} {"Geosphere"}
MACRO {GeotechEpistimThemataGeotechSciIssues} {"Geotech. Epistim. Themata/Geotech. Sci. Issues"}
MACRO {Geowissenschaften} {"Geowissenschaften"}
MACRO {GerlandsBeitrGeophys} {"Gerlands Beitr. Geophys."}
MACRO {GerYearbIntLaw} {"Ger. Yearb. Int. Law"}
MACRO {Gerontology} {"Gerontology"}
MACRO {GewaesserbeschaffenhBayern} {"Gewaesserbeschaffenh. Bayern"}
MACRO {GewaessergueteberLandesamtWasserAbfallNRW} {"Gewaessergueteber. Landesamt Wasser Abfall (NRW)"}
MACRO {GidrobiolZhHydrobiolJ} {"Gidrobiol. Zh./Hydrobiol. J."}
MACRO {GBotItal} {"G. Bot. Ital."}
MACRO {GItalEntomol} {"G. Ital. Entomol."}
MACRO {GItalSuicidol} {"G. Ital. Suicidol."}
MACRO {GISWorld} {"GIS World"}
MACRO {GlasgNat} {"Glasg. Nat."}
MACRO {Glia} {"Glia"}
MACRO {GlobalPlanetChange} {"Global Planet. Change"}
MACRO {GlobalAtmosOceanSyst} {"Global Atmos. Ocean Syst."}
MACRO {GlobalBiodivers} {"Global Biodivers."}
MACRO {GlobalChangeHumHealth} {"Global Change Hum. Health"}
MACRO {GlobalChangeBiol} {"Global Change Biol."}
MACRO {GlobalEcolBiogeogr} {"Global Ecol. Biogeogr."}
MACRO {GlobalEcolBiogeogrLett} {"Global Ecol. Biogeogr. Lett."}
MACRO {GlobalEnvironChange} {"Global Environ. Change"}
MACRO {GlobalEnvironChangeAHumPolicyDimens} {"Global Environ. Change (A Hum. Policy Dimens.)"}
MACRO {GlobalEnvironChangeBEnvironHazards} {"Global Environ. Change (B Environ. Hazards)"}
MACRO {GlobalNestIntJ} {"Global Nest Int J."}
MACRO {GLOBEFISHGuidelExtWorkSpecSer} {"GLOBEFISH Guidel. Ext. Work. (Spec. Ser)"}
MACRO {GLOBEFISHHighlights} {"GLOBEFISH Highlights"}
MACRO {GLOBEFISHMetropMarkSer} {"GLOBEFISH Metrop. Mark. Ser."}
MACRO {GLOBEFISHResProgramme} {"GLOBEFISH Res. Programme"}
MACRO {Glycobiology} {"Glycobiology"}
MACRO {GrasasAceites} {"Grasas Aceites"}
MACRO {GrassForageSci} {"Grass Forage Sci."}
MACRO {GreatBasinNat} {"Great Basin Nat."}
MACRO {GreatLakesEntomol} {"Great Lakes Entomol."}
MACRO {GreatLakesResRev} {"Great Lakes Res. Rev."}
MACRO {GreatPlainsRes} {"Great Plains Res."}
MACRO {GredlerianaActaBiol} {"Gredleriana (Acta Biol.)"}
MACRO {GroundWaterMonitRemediat} {"Ground Water Monit. Remediat."}
MACRO {GrowthChange} {"Growth Change"}
MACRO {GrowthFactors} {"Growth Factors"}
MACRO {GrowthDevAging} {"Growth Dev. Aging"}
MACRO {GuelphIchthyolRev} {"Guelph Ichthyol. Rev."}
MACRO {GuideSerOhioSeaGrant} {"Guide Ser. Ohio Sea Grant"}
MACRO {GulfCaribbRes} {"Gulf Caribb. Res."}
MACRO {GulfMexSci} {"Gulf Mex. Sci."}
MACRO {GulfResRep} {"Gulf Res. Rep."}
MACRO {Gunneria} {"Gunneria"}
MACRO {Gut} {"Gut"}
MACRO {GyogyoYoshokugyoSeisanTokeiNenpo} {"Gyogyo Yoshokugyo Seisan Tokei Nenpo"}
MACRO {HacettepeBullNatSciEngSerABiolChem} {"Hacettepe Bull. Nat. Sci. Eng. Ser. A Biol. Chem."}
MACRO {Haematologica} {"Haematologica"}
MACRO {HafrannsoknastofFjaelrit} {"Hafrannsoknastof. Fjaelrit"}
MACRO {Halszat} {"Hal szat"}
MACRO {Haliotis} {"Haliotis"}
MACRO {HandSurg} {"Hand Surg."}
MACRO {HandbCommFishProdStat} {"Handb. Comm. Fish. Prod. Stat."}
MACRO {HandbSPC} {"Handb. SPC"}
MACRO {Hansa} {"Hansa"}
MACRO {HarmfulAlgae} {"Harmful Algae"}
MACRO {HastingsLawJ} {"Hastings Law J."}
MACRO {Havbruk} {"Havbruk"}
MACRO {HavforskNYTT} {"Havforsk. NYTT"}
MACRO {HELP} {"HELP"}
MACRO {HawaiiShellNews} {"Hawaii. Shell News"}
MACRO {HazardPrev} {"Hazard Prev."}
MACRO {HazardWasteHazardMater} {"Hazard. Waste Hazard. Mater."}
MACRO {Headache} {"Headache"}
MACRO {HealthPlace} {"Health Place"}
MACRO {HealthAff} {"Health Aff."}
MACRO {HealthPopulPerspectIss} {"Health Popul. Perspect. Iss."}
MACRO {HealthSocWork} {"Health Soc. Work"}
MACRO {HealthCareAnal} {"Health Care Anal."}
MACRO {HealthCareManageRev} {"Health Care Manage. Rev."}
MACRO {HealthCareInternet} {"Health Care Internet"}
MACRO {HealthCommun} {"Health Commun."}
MACRO {HealthEducBehav} {"Health Educ. Behav."}
MACRO {HealthEducJ} {"Health Educ. J."}
MACRO {HealthEducRes} {"Health Educ. Res."}
MACRO {HealthPhys} {"Health Phys."}
MACRO {HealthPolicyPlann} {"Health Policy Plann."}
MACRO {HealthPromInt} {"Health Prom. Int."}
MACRO {HealthPsychol} {"Health Psychol."}
MACRO {HealthServRes} {"Health Serv. Res."}
MACRO {HealthRiskSoc} {"Health Risk Soc."}
MACRO {HealthyWeightJ} {"Healthy Weight J."}
MACRO {HearingRes} {"Hearing Res."}
MACRO {HeatPipingAirCond} {"Heat. Piping Air Cond."}
MACRO {HeavyVehSyst} {"Heavy Veh. Syst."}
MACRO {HelgolMarRes} {"Helgol. Mar. Res."}
MACRO {Helicobacter} {"Helicobacter"}
MACRO {HellSympOceanogrFishAbstrPanellSympOkeanogrAlieiasPerilips} {"Hell. Symp. Oceanogr. Fish. Abstr./Panell. Symp. Okeanogr. Alieias Perilips."}
MACRO {HelvChimActa} {"Helv. Chim. Acta"}
MACRO {HematolOncol} {"Hematol. Oncol."}
MACRO {HematopatholMolHematol} {"Hematopathol. Mol. Hematol."}
MACRO {Hemoglobin} {"Hemoglobin"}
MACRO {Hereditas} {"Hereditas"}
MACRO {Heredity} {"Heredity"}
MACRO {Herpetologica} {"Herpetologica"}
MACRO {HerpetolMonogr} {"Herpetol. Monogr."}
MACRO {HeteroceraSumatr} {"Heterocera Sumatr."}
MACRO {HidrobiologicaIztapalapa} {"Hidrobiologica (Iztapalapa)"}
MACRO {HidrogrGod} {"Hidrogr. God."}
MACRO {HighlightsAquacultDepSoutheastAsianFishDevCent} {"Highlights Aquacult. Dep. Southeast Asian Fish. Dev. Cent."}
MACRO {HimalayanJEnvironZool} {"Himalayan J. Environ. Zool."}
MACRO {Histopathology} {"Histopathology"}
MACRO {HistAnim} {"Hist. Anim."}
MACRO {TheHist} {"The Hist."}
MACRO {HIVMed} {"HIV Med."}
MACRO {HolarctLepid} {"Holarct. Lepid."}
MACRO {HomeHealthCareServQ} {"Home Health Care Serv. Q."}
MACRO {Homeostasis} {"Homeostasis"}
MACRO {HomicideStud} {"Homicide Stud."}
MACRO {HongKongJNephrol} {"Hong Kong J. Nephrol."}
MACRO {HormoneRes} {"Hormone Res."}
MACRO {HormBehav} {"Horm. Behav."}
MACRO {HortScience} {"HortScience"}
MACRO {HouilleBlanche} {"Houille Blanche"}
MACRO {HousehFishConsumGB} {"Househ. Fish Consum. G. B."}
MACRO {HrvatskeVode} {"Hrvatske Vode"}
MACRO {HumExpToxicol} {"Hum. Exp. Toxicol."}
MACRO {HumEcolRiskAssess} {"Hum. Ecol. Risk Assess."}
MACRO {HumAntibodies} {"Hum. Antibodies"}
MACRO {HumBrainMapp} {"Hum. Brain Mapp."}
MACRO {HumCytogenet} {"Hum Cytogenet"}
MACRO {HumEcol} {"Hum. Ecol."}
MACRO {HumEcolRev} {"Hum. Ecol. Rev."}
MACRO {HumFactors} {"Hum. Factors"}
MACRO {HumFactorsErgonomicsManuf} {"Hum. Factors Ergonomics Manuf."}
MACRO {HumGeneTher} {"Hum. Gene Ther."}
MACRO {HumGenet} {"Hum. Genet."}
MACRO {HumImmunol} {"Hum. Immunol."}
MACRO {HumMolGenet} {"Hum. Mol. Genet."}
MACRO {HumMutat} {"Hum. Mutat."}
MACRO {HumPerform} {"Hum. Perform."}
MACRO {HumPhysiol} {"Hum. Physiol."}
MACRO {HumPsychopharmacolClinExp} {"Hum. Psychopharmacol. Clin. Exp."}
MACRO {HumReprodUpdate} {"Hum. Reprod. Update"}
MACRO {Hybridoma} {"Hybridoma"}
MACRO {HybridomaandHybridomics} {"Hybridoma and Hybridomics"}
MACRO {HydraulLabRepUSBureauReclam} {"Hydraul. Lab. Rep. U.S. Bureau Reclam."}
MACRO {HydroInt} {"Hydro Int."}
MACRO {Hydrobiologia} {"Hydrobiologia"}
MACRO {HydrobiolJGidrobiolZh} {"Hydrobiol. J./Gidrobiol. Zh."}
MACRO {HydrocarbonProcess} {"Hydrocarbon Process."}
MACRO {HydroecolAppl} {"Hydroecol. Appl."}
MACRO {HydrogeolJ} {"Hydrogeol. J."}
MACRO {HydrogrJ} {"Hydrogr. J."}
MACRO {HydrolProcess} {"Hydrol. Process."}
MACRO {HydrolSciJJSciHydrol} {"Hydrol. Sci. J./J. Sci. Hydrol."}
MACRO {HydroresInf} {"Hydrores Inf."}
MACRO {HygNutrFoodservCater} {"Hyg. Nutr. Foodserv. Cater."}
MACRO {IFRONewsl} {"I.F.R.O. Newsl."}
MACRO {IAEABull} {"IAEA Bull."}
MACRO {IASEnvironRep} {"IAS Environ. Rep."}
MACRO {IASTechRep} {"IAS Tech. Rep."}
MACRO {Iberus} {"Iberus"}
MACRO {Ibis} {"Ibis"}
MACRO {ICAOJ} {"ICAO J."}
MACRO {ICCOPSNewsl} {"ICCOPS Newsl."}
MACRO {ICESAnnuRep} {"ICES Annu. Rep."}
MACRO {ICESCoopResRep} {"ICES Coop. Res. Rep."}
MACRO {ICESCouncilMeetingDocumentsCopenhagen} {"ICES Council Meeting Documents. Copenhagen"}
MACRO {ICESFishStat} {"ICES Fish. Stat."}
MACRO {ICESIdentifLeaflDisParasitFishShellfish} {"ICES Identif. Leafl. Dis. Parasit. Fish Shellfish"}
MACRO {ICESIdentifLeaflPlankton} {"ICES Identif. Leafl. Plankton"}
MACRO {ICESJMarSci} {"ICES J. Mar. Sci."}
MACRO {ICESMarSciSymp} {"ICES Mar. Sci. Symp."}
MACRO {ICESTechMarEnvironSci} {"ICES Tech. Mar. Environ. Sci."}
MACRO {IchthyolBull} {"Ichthyol. Bull."}
MACRO {IchthyolExplorFreshwat} {"Ichthyol. Explor. Freshwat."}
MACRO {IchthyolRes} {"Ichthyol. Res."}
MACRO {Ichthyos} {"Ichthyos"}
MACRO {IchtyophysiolActa} {"Ichtyophysiol. Acta"}
MACRO {IDAFNewslLettDIPA} {"IDAF Newsl./Lett.DIPA"}
MACRO {IDRCRep} {"IDRC Rep."}
MACRO {IEEEElectronDeviceLett} {"IEEE Electron Device Lett."}
MACRO {IEEEEngMedBiol} {"IEEE Eng. Med. Biol."}
MACRO {IEEEJOceanEng} {"IEEE J. Ocean. Eng."}
MACRO {IEEETransBiomedEng} {"IEEE Trans. Biomed. Eng."}
MACRO {IEEETransInfTechnolBiomed} {"IEEE Trans. Inf. Technol. Biomed."}
MACRO {IEEETransMedImaging} {"IEEE Trans. Med. Imaging"}
MACRO {IEEETransMicrowaveTheoryTech} {"IEEE Trans. Microwave Theory Tech."}
MACRO {IEEETransNanoBiosci} {"IEEE Trans. NanoBiosci."}
MACRO {IEEETransNeuralNetworks} {"IEEE Trans. Neural Networks"}
MACRO {IEEETransNeuralSystRehabEng} {"IEEE Trans. Neural Syst. Rehab. Eng."}
MACRO {IgMod} {"Ig. Mod."}
MACRO {IheringiaSerBot} {"Iheringia, Ser. Bot."}
MACRO {IheringiaSerZool} {"Iheringia, Ser. Zool."}
MACRO {IlPesce} {"Il Pesce"}
MACRO {INHSSpecPubl} {"INHS Spec. Publ."}
MACRO {IllStateGeolSurvEnvironGeol} {"Ill. State Geol. Surv., Environ. Geol."}
MACRO {IllWaterQualRep} {"Ill. Water Qual. Rep."}
MACRO {ImageVisionComput} {"Image Vision Comput."}
MACRO {Immunity} {"Immunity"}
MACRO {Immunobiology} {"Immunobiology"}
MACRO {Immunogenetics} {"Immunogenetics"}
MACRO {ImmunolRes} {"Immunol. Res."}
MACRO {ImmunolInvest} {"Immunol. Invest."}
MACRO {ImmunolRev} {"Immunol. Rev."}
MACRO {Immunology} {"Immunology"}
MACRO {ImmunolInfectDis} {"Immunol. Infect. Dis."}
MACRO {ImmunolCellBiol} {"Immunol. Cell Biol."}
MACRO {ImmunolLett} {"Immunol. Lett."}
MACRO {ImmunolToday} {"Immunol. Today"}
MACRO {Immunopharmacology} {"Immunopharmacology"}
MACRO {ImmunopharmacolImmunotoxicol} {"Immunopharmacol. Immunotoxicol."}
MACRO {Immunotechnology} {"Immunotechnology"}
MACRO {IMRPINROJointRepSer} {"IMR/PINRO Joint Rep. Ser."}
MACRO {InVitroMolToxicol} {"In Vitro Mol. Toxicol."}
MACRO {InVitroCellDevBiolAnim} {"In Vitro Cell. Dev. Biol. Anim."}
MACRO {InVitroCellDevBiolPlant} {"In Vitro Cell. Dev. Biol. Plant"}
MACRO {InVitroToxicol} {"In Vitro Toxicol."}
MACRO {IndianAgric} {"Indian Agric."}
MACRO {IndianBotRep} {"Indian Bot. Rep."}
MACRO {IndianFarming} {"Indian Farming"}
MACRO {IndianFishAbstr} {"Indian Fish. Abstr."}
MACRO {IndianFor} {"Indian For."}
MACRO {IndianJAgricEcon} {"Indian J. Agric. Econ."}
MACRO {IndianJAgricRes} {"Indian J. Agric. Res."}
MACRO {IndianJAgricSci} {"Indian J. Agric. Sci."}
MACRO {IndianJAnimSci} {"Indian J. Anim. Sci."}
MACRO {IndianJBiochemBiophys} {"Indian J. Biochem. Biophys."}
MACRO {IndianJBiotechnol} {"Indian J. Biotechnol."}
MACRO {IndianJBot} {"Indian J. Bot."}
MACRO {IndianJChemTechnol} {"Indian J. Chem. Technol."}
MACRO {IndianJChemBOrgMed} {"Indian J. Chem. (B Org. Med.)"}
MACRO {IndianJEarthSci} {"Indian J. Earth Sci."}
MACRO {IndianJEcol} {"Indian J. Ecol."}
MACRO {IndianJEngMaterSci} {"Indian J. Eng. Mater. Sci."}
MACRO {IndianJEntomol} {"Indian J. Entomol."}
MACRO {IndianJEnvironEcoplann} {"Indian J. Environ. Ecoplann."}
MACRO {IndianJEnvironHealth} {"Indian J. Environ. Health"}
MACRO {IndianJEnvironSci} {"Indian J. Environ. Sci."}
MACRO {IndianJExpBiol} {"Indian J. Exp. Biol."}
MACRO {IndianJFish} {"Indian J. Fish."}
MACRO {IndianJGenetPlantBreed} {"Indian J. Genet. Plant Breed."}
MACRO {IndianJIndigMed} {"Indian J. Indig. Med."}
MACRO {IndianJIndRelat} {"Indian J. Ind. Relat."}
MACRO {IndianJLeprosy} {"Indian J. Leprosy"}
MACRO {IndianJMarSci} {"Indian J. Mar. Sci."}
MACRO {IndianJMicrobiol} {"Indian J. Microbiol."}
MACRO {IndianJMycolPlantPathol} {"Indian J. Mycol. Plant Pathol."}
MACRO {IndianJPediatr} {"Indian J. Pediatr."}
MACRO {IndianJPetGeol} {"Indian J. Pet. Geol."}
MACRO {IndianJPureApplPhys} {"Indian J. Pure Appl. Phys."}
MACRO {IndianJVirol} {"Indian J. Virol."}
MACRO {IndianJZootomy} {"Indian J. Zootomy"}
MACRO {IndianOceanPolicyPap} {"Indian Ocean Policy Pap."}
MACRO {IndianOceanTunaNews} {"Indian Ocean Tuna News"}
MACRO {IndianaAHPERDJ} {"Indiana AHPERD. J."}
MACRO {InJGlobalLegalStud} {"In. J. Global Legal Stud."}
MACRO {IndoPacFishes} {"Indo-Pac. Fishes"}
MACRO {IndoorAir} {"Indoor Air"}
MACRO {IndoorBuiltEnviron} {"Indoor Built Environ."}
MACRO {IndoorEnviron} {"Indoor Environ."}
MACRO {IndConserve} {"Ind. Conserve"}
MACRO {IndEng} {"Ind. Eng."}
MACRO {IndHealth} {"Ind. Health"}
MACRO {IndLawJ} {"Ind. Law J."}
MACRO {IndRelat} {"Ind. Relat."}
MACRO {IndWaterWastewater} {"Ind. Water Wastewater"}
MACRO {IndPesq} {"Ind. Pesq."}
MACRO {IndAliment} {"Ind. Aliment."}
MACRO {Infection} {"Infection"}
MACRO {InfectImmun} {"Infect. Immun."}
MACRO {InfectControlHospEpidemiol} {"Infect. Control Hosp. Epidemiol."}
MACRO {InfectGenetEvol} {"Infect., Genet. Evol."}
MACRO {InfectDis} {"Infect. Dis."}
MACRO {InfectDisObstetrGynecol} {"Infect. Dis. Obstetr. Gynecol."}
MACRO {Inflammation} {"Inflammation"}
MACRO {InflammationRes} {"Inflammation Res."}
MACRO {INFOFISHFishTechnolDigAsiaPac} {"INFOFISH Fish. Technol. Dig. Asia-Pac."}
MACRO {INFOFISHInt} {"INFOFISH Int."}
MACRO {INFOFISHTechHandb} {"INFOFISH Tech. Handb."}
MACRO {INFOFISHTradeNews} {"INFOFISH Trade News"}
MACRO {INFOPECHENouvCommer} {"INFOPECHE Nouv. Commer."}
MACRO {INFOPECHETradeNewsAfrEd} {"INFOPECHE Trade News Afr. Ed."}
MACRO {INFOPESCAInt} {"INFOPESCA Int."}
MACRO {InfDocSerIOC} {"Inf. Doc. Ser. IOC"}
MACRO {InfoRepOregonDeptFishWildlFishDiv} {"Info. Rep. Oregon Dept. Fish Wildl. Fish Div."}
MACRO {InfSerDepPrimIndQueensl} {"Inf. Ser. Dep. Prim. Ind. (Queensl.)"}
MACRO {InfFischwirtschFischereiforsch} {"Inf. Fischwirtsch. Fischereiforsch."}
MACRO {InfConcernPeche} {"Inf. Concern. Peche"}
MACRO {InfByullSovAntarktEhksped} {"Inf. Byull. Sov. Antarkt. Ehksped."}
MACRO {InfEspecCentInvestCientEducSuperEnsenada} {"Inf. Espec. Cent. Invest. Cient. Educ. Super. Ensenada"}
MACRO {InfProgInstMarPeru} {"Inf. Prog. Inst. Mar Peru"}
MACRO {InfSectPesqMontev} {"Inf. Sect. Pesq. (Montev.)"}
MACRO {InfTecPESCART} {"Inf. Tec. PESCART"}
MACRO {InfTecFundPatagonNat} {"Inf. Tec. Fund. Patagon. Nat."}
MACRO {InfTecInstNacPescaUrug} {"Inf. Tec. Inst. Nac. Pesca (Urug.)"}
MACRO {InfInstMarPeru} {"Inf. Inst. Mar Peru"}
MACRO {InfMusMarBogot} {"Inf. Mus. Mar. Bogot"}
MACRO {InfOceanogrCentColombDatosOceanogr} {"Inf. Oceanogr. Cent. Colomb. Datos Oceanogr."}
MACRO {InfTecDepAguasContInstNacInvestDesarrPesqArgent} {"Inf. Tec. Dep. Aguas Cont. Inst. Nac. Invest. Desarr. Pesq. (Argent.)"}
MACRO {InfTecInstCanarCiencMar} {"Inf. Tec. Inst. Canar. Cienc. Mar."}
MACRO {InfTecInstEspOceanogr} {"Inf. Tec. Inst. Esp. Oceanogr."}
MACRO {InfEstudCOPEMED} {"Inf. Estud. COPEMED"}
MACRO {INFOSAMAKFactSheet} {"INFOSAMAK Fact Sheet"}
MACRO {INFOSAMAKTradeNews} {"INFOSAMAK Trade News"}
MACRO {IngEauAgricTerrit} {"Ing. Eau Agric. Territ."}
MACRO {InhalationToxicol} {"Inhalation Toxicol."}
MACRO {INIDEPDocCient} {"INIDEP Doc. Cient."}
MACRO {INIDEPInfTec} {"INIDEP Inf. Tec."}
MACRO {Injury} {"Injury"}
MACRO {InjuryControlSafePromot} {"Injury Control Safe. Promot."}
MACRO {InjuryPrev} {"Injury Prev."}
MACRO {InlandFishNews} {"Inland Fish. News"}
MACRO {InnovFoodSciEmergTechnol} {"Innov. Food Sci. Emerg. Technol."}
MACRO {InorgChem} {"Inorg. Chem."}
MACRO {InsectBiochemMolBiol} {"Insect Biochem. Mol. Biol."}
MACRO {InsectMolBiol} {"Insect Mol. Biol."}
MACRO {InsectSci} {"Insect Sci."}
MACRO {InsectSciAppl} {"Insect Sci. Appl."}
MACRO {InsectSystEvol} {"Insect Syst. Evol."}
MACRO {InsectaKoreana} {"Insecta Koreana"}
MACRO {InsectaMatsumurana} {"Insecta Matsumurana"}
MACRO {InsectesSoc} {"Insectes Soc."}
MACRO {InspRepUSArmyEngWaterwaysExpStn} {"Insp. Rep. U.S. Army Eng. Waterways Exp. Stn."}
MACRO {InstMarResNews} {"Inst. Mar. Res. News"}
MACRO {ProcInstCivEngWaterMaritEnergy} {"Proc. Inst. Civ. Eng. Water Marit. Energy"}
MACRO {InstMiningMetallTransSectAMiningTechnol} {"Inst. Mining Metall. Trans. Sect. A. Mining Technol."}
MACRO {IFMRapp} {"IFM Rapp."}
MACRO {IntegrEnvironAssessManage} {"Integr. Environ. Assess. Manage."}
MACRO {IntegrPestManageRev} {"Integr. Pest Manage. Rev."}
MACRO {IntegrCompBiol} {"Integr. Comp. Biol."}
MACRO {Interciencia} {"Interciencia"}
MACRO {IntercoastNetwork} {"Intercoast Network"}
MACRO {InternMedJ} {"Intern. Med. J."}
MACRO {IntAffairs} {"Int. Affairs"}
MACRO {IntAgricEngJ} {"Int. Agric. Eng. J."}
MACRO {IntCompLawQ} {"Int. Comp. Law Q."}
MACRO {IntArchAllergyImmunol} {"Int. Arch. Allergy Immunol."}
MACRO {IntArchOccupEnvironHealth} {"Int. Arch. Occup. Environ. Health"}
MACRO {IAMSLICConfSer} {"IAMSLIC Conf. Ser."}
MACRO {IntBiodeteriorBiodegrad} {"Int. Biodeterior. Biodegrad."}
MACRO {IntChallenges} {"Int. Challenges"}
MACRO {IntChemEng} {"Int. Chem. Eng."}
MACRO {IntCivDefJ} {"Int. Civ. Def. J."}
MACRO {IntDairyJ} {"Int. Dairy J."}
MACRO {IntDentJ} {"Int. Dent. J."}
MACRO {IntFishVesselConstr} {"Int. Fish. Vessel Constr."}
MACRO {IntFoodManuf} {"Int. Food Manuf."}
MACRO {IntHydrogrBullBullHydrogrIntBolHidrogrInt} {"Int. Hydrogr. Bull./Bull. Hydrogr. Int./Bol. Hidrogr. Int."}
MACRO {IntHydrogrRev} {"Int. Hydrogr. Rev."}
MACRO {IntImmunol} {"Int. Immunol."}
MACRO {IntImmunopharmacol} {"Int. Immunopharmacol."}
MACRO {IntJConsumerProdSaf} {"Int. J. Consumer Prod. Saf."}
MACRO {IntJParasitol} {"Int. J. Parasitol."}
MACRO {IntJQualHealthCare} {"Int. J. Qual. Health Care"}
MACRO {IntJAcarol} {"Int. J. Acarol."}
MACRO {IntJAntimicrobAgents} {"Int. J. Antimicrob. Agents"}
MACRO {IntJAviatPsychol} {"Int. J. Aviat. Psychol."}
MACRO {IntJBiodivSciManage} {"Int. J. Biodiv. Sci. Manage."}
MACRO {IntJBiosciLaw} {"Int. J. Biosci. Law"}
MACRO {IntJBiotechnol} {"Int. J. Biotechnol."}
MACRO {IntJCancer} {"Int. J. Cancer"}
MACRO {IntJCancerPredictOncol} {"Int. J. Cancer. Predict. Oncol."}
MACRO {IntJCancerRadiatOncolInvest} {"Int. J. Cancer. Radiat. Oncol. Invest."}
MACRO {IntJCardiovascImaging} {"Int. J. Cardiovasc. Imaging"}
MACRO {IntJClinPharmacolRes} {"Int. J. Clin. Pharmacol. Res."}
MACRO {IntJClinPract} {"Int. J. Clin. Pract."}
MACRO {IntJCognErgonomics} {"Int. J. Cogn. Ergonomics"}
MACRO {IntJCosmeticSci} {"Int. J. Cosmetic Sci."}
MACRO {IntJCrashworthiness} {"Int. J. Crashworthiness"}
MACRO {IntJDairyTechnol} {"Int. J. Dairy Technol."}
MACRO {IntJDermatol} {"Int. J. Dermatol."}
MACRO {IntJDevBiol} {"Int. J. Dev. Biol."}
MACRO {IntJDevNeurosci} {"Int. J. Dev. Neurosci."}
MACRO {IntJDisasMed} {"Int. J. Disas. Med."}
MACRO {IntJDrugPolicy} {"Int. J. Drug Policy"}
MACRO {IntJEatDisord} {"Int. J. Eat. Disord."}
MACRO {IntJEcohydrologyHydrobiol} {"Int. J. Ecohydrology Hydrobiol."}
MACRO {IntJEmergencyManage} {"Int. J. Emergency Manage."}
MACRO {IntJEnvironPollut} {"Int. J. Environ. Pollut."}
MACRO {IntJEnvironWorkplaceEmployment} {"Int. J. Environ. Workplace Employment"}
MACRO {IntJEnvironAnalChem} {"Int. J. Environ. Anal. Chem."}
MACRO {IntJEnvironHealthRes} {"Int. J. Environ. Health Res."}
MACRO {IntJEnvResPublicHealth} {"Int. J. Env. Res. Public Health"}
MACRO {IntJEnvironStud} {"Int. J. Environ. Stud."}
MACRO {IntJEpidemiol} {"Int. J. Epidemiol."}
MACRO {IntJFatigue} {"Int. J. Fatigue"}
MACRO {IntJFoodMicrobiol} {"Int. J. Food Microbiol."}
MACRO {IntJFoodProp} {"Int. J. Food Prop."}
MACRO {IntJFoodSciTech} {"Int. J. Food Sci. Tech."}
MACRO {IntJFoodSciTechnol} {"Int. J. Food Sci. Technol."}
MACRO {IntJFoodSciNutr} {"Int. J. Food Sci. Nutr."}
MACRO {IntJFuzzySyst} {"Int. J. Fuzzy Syst."}
MACRO {IntJGeomech} {"Int. J. Geomech."}
MACRO {IntJGeriatrPsychopharmacol} {"Int. J. Geriatr. Psychopharmacol."}
MACRO {IntJHealthPlannManage} {"Int. J. Health Plann. Manage."}
MACRO {IntJHealthServ} {"Int. J. Health Serv."}
MACRO {IntJHematol} {"Int. J. Hematol."}
MACRO {IntJHumFactorsManuf} {"Int. J. Hum. Factors Manuf."}
MACRO {IntJHumGenet} {"Int. J. Hum. Genet."}
MACRO {IntJHygEnvironHealth} {"Int. J. Hyg. Environ. Health"}
MACRO {IntJImmunogenet} {"Int. J. Immunogenet."}
MACRO {IntJImmunopatholPharmacol} {"Int. J. Immunopathol. Pharmacol."}
MACRO {IntJImmunopharmacol} {"Int. J. Immunopharmacol."}
MACRO {IntJImmunother} {"Int. J. Immunother."}
MACRO {IntJImpactEng} {"Int. J. Impact Eng."}
MACRO {IntJIndErgonomics} {"Int. J. Ind. Ergonomics"}
MACRO {IntJInjuryControlSafePromot} {"Int. J. Injury Control Safe. Promot."}
MACRO {IntJInsectMorpholEmbryol} {"Int. J. Insect Morphol. Embryol."}
MACRO {IntJIntellControlSyst} {"Int. J. Intell. Control Syst."}
MACRO {IntJLeprOtherMycobactDis} {"Int. J. Lepr. Other Mycobact. Dis."}
MACRO {IntJLowRadiat} {"Int. J. Low Radiat."}
MACRO {IntJManufSystDes} {"Int. J. Manuf. Syst. Des."}
MACRO {IntJManufTechnolManage} {"Int. J. Manuf. Technol. Manage."}
MACRO {IntJMarCoastLaw} {"Int. J. Mar. Coast. Law"}
MACRO {IntJMedInf} {"Int. J. Med. Inf."}
MACRO {IntJMedMicrobiol} {"Int. J. Med. Microbiol."}
MACRO {IntJMolMed} {"Int. J. Mol. Med."}
MACRO {IntJNeuralSyst} {"Int. J. Neural Syst."}
MACRO {IntJNeuroprotNeuroregen} {"Int. J. Neuroprot. Neuroregen."}
MACRO {IntJNeurosci} {"Int. J. Neurosci."}
MACRO {IntJNuclKnowlManage} {"Int. J. Nucl. Knowl. Manage."}
MACRO {IntJNursPract} {"Int. J. Nurs. Pract."}
MACRO {IntJObesity} {"Int. J. Obesity"}
MACRO {IntJOccupMedEnvironHealth} {"Int. J. Occup. Med. Environ. Health"}
MACRO {IntJOccupSafErgonomics} {"Int. J. Occup. Saf. Ergonomics"}
MACRO {IntJOffenderTherCompCriminol} {"Int. J. Offender Ther. Comp. Criminol."}
MACRO {IntJOffshorePolarEng} {"Int. J. Offshore Polar Eng."}
MACRO {IntJOncol} {"Int. J. Oncol."}
MACRO {IntJPeptideProteinRes} {"Int. J. Peptide Protein Res."}
MACRO {IntJPestManage} {"Int. J. Pest Manage."}
MACRO {IntJPharm} {"Int. J. Pharm."}
MACRO {IntJPhytoremediation} {"Int. J. Phytoremediation"}
MACRO {IntJPlantSci} {"Int. J. Plant Sci."}
MACRO {IntJPlast} {"Int. J. Plast."}
MACRO {IntJPolymMater} {"Int. J. Polym. Mater."}
MACRO {IntJPressureVesselsPiping} {"Int. J. Pressure Vessels Piping"}
MACRO {IntJPrimatol} {"Int. J. Primatol."}
MACRO {IntJPsychophysiol} {"Int. J. Psychophysiol."}
MACRO {IntJRadiatBiol} {"Int. J. Radiat. Biol."}
MACRO {IntJRadiatOncolBiolPhys} {"Int. J. Radiat. Oncol. Biol. Phys."}
MACRO {IntJRadioactMaterTransp} {"Int. J. Radioact. Mater. Transp."}
MACRO {IntJRecirculatAquacult} {"Int. J. Recirculat. Aquacult."}
MACRO {IntJRemoteSens} {"Int. J. Remote Sens."}
MACRO {IntJRiskSafMed} {"Int. J. Risk Saf. Med."}
MACRO {IntJRockMechMinSci} {"Int. J. Rock Mech. Min. Sci."}
MACRO {IntJSaltLakeRes} {"Int. J. Salt Lake Res."}
MACRO {IntJSportsMed} {"Int. J. Sports Med."}
MACRO {IntJSTDAIDS} {"Int. J. STD AIDS"}
MACRO {IntJStressManage} {"Int. J. Stress Manage."}
MACRO {IntJStructStabDyn} {"Int. J. Struct. Stab. Dyn."}
MACRO {IntJSystEvolMicrobiol} {"Int. J. Syst. Evol. Microbiol."}
MACRO {IntJSystBacteriol} {"Int. J. Syst. Bacteriol."}
MACRO {IntJTechnolAssessHealthCare} {"Int. J. Technol. Assess. Health Care"}
MACRO {IntJThymol} {"Int. J. Thymol."}
MACRO {IntJTissReact} {"Int. J. Tiss. React."}
MACRO {IntJToxicol} {"Int. J. Toxicol."}
MACRO {IntJTropInsectSci} {"Int. J. Trop. Insect Sci."}
MACRO {IntJTubercLungDis} {"Int. J. Tuberc. Lung Dis."}
MACRO {IntJUrbanRegionalRes} {"Int. J. Urban Regional Res."}
MACRO {IntJVehDes} {"Int. J. Veh. Des."}
MACRO {IntJWaterResourDev} {"Int. J. Water Resour. Dev."}
MACRO {IntJWildlandFire} {"Int. J. Wildland Fire"}
MACRO {IntJHydroDams} {"Int. J. Hydro. Dams"}
MACRO {IntLegMater} {"Int. Leg. Mater."}
MACRO {IntMedJ} {"Int. Med. J."}
MACRO {IntMicrobiol} {"Int. Microbiol."}
MACRO {IntMigr} {"Int. Migr."}
MACRO {IntOphthalmol} {"Int. Ophthalmol."}
MACRO {IntOrganLawSeaDocYearb} {"Int. Organ. Law Sea Doc. Yearb."}
MACRO {IntRevCytol} {"Int. Rev. Cytol."}
MACRO {IntRevHydrobiol} {"Int. Rev. Hydrobiol."}
MACRO {IntRevNeurobiol} {"Int. Rev. Neurobiol."}
MACRO {IntRiversLakes} {"Int. Rivers Lakes"}
MACRO {IntShipbuildProg} {"Int. Shipbuild. Prog."}
MACRO {IntSocSciJ} {"Int. Soc. Sci. J."}
MACRO {IntStudManageOrgan} {"Int. Stud. Manage. Organ."}
MACRO {IntStudPerspect} {"Int. Stud. Perspect."}
MACRO {IntStudQ} {"Int. Stud. Q."}
MACRO {IntStudRev} {"Int. Stud. Rev."}
MACRO {IntWildl} {"Int. Wildl."}
MACRO {IntRevGesamtHydrobiol} {"Int. Rev. Gesamt. Hydrobiol."}
MACRO {Intervirology} {"Intervirology"}
MACRO {InventorySamplDataNAFO} {"Inventory Sampl. Data NAFO"}
MACRO {InvertebrBiol} {"Invertebr. Biol."}
MACRO {InvertebrNeurosci} {"Invertebr. Neurosci."}
MACRO {InvertebrReprodDev} {"Invertebr. Reprod. Dev."}
MACRO {InvertebrSyst} {"Invertebr. Syst."}
MACRO {InvertebrTaxon} {"Invertebr. Taxon."}
MACRO {InvestMar} {"Invest. Mar."}
MACRO {InvestCentInterdiscipEstudDesarrUrug} {"Invest. Cent. Interdiscip. Estud. Desarr. Urug."}
MACRO {InvestRepOceanogrResInstDurban} {"Invest. Rep., Oceanogr. Res. Inst., Durban"}
MACRO {InvestRepSeaFishResInstCapeTownOndersNavorsingsinstSeevissCapeTown} {"Invest. Rep. Sea Fish. Res. Inst. Cape Town/Onders. Navorsingsinst. Seeviss. Cape Town"}
MACRO {IOTCDataSumm} {"IOTC Data Summ."}
MACRO {IPTPDataCat} {"IPTP Data Cat."}
MACRO {IPTPDataRec} {"IPTP Data Rec."}
MACRO {IranFishBull} {"Iran. Fish. Bull."}
MACRO {IranFishSciJ} {"Iran. Fish. Sci. J."}
MACRO {IranJBiotechnol} {"Iran. J. Biotechnol."}
MACRO {IranJFishSci} {"Iran. J. Fish. Sci."}
MACRO {IranianJImmunol} {"Iranian J. Immunol."}
MACRO {IreneMcCullochFoundMonogrSer} {"Irene McCulloch Found. Monogr. Ser."}
MACRO {IrBirds} {"Ir. Birds"}
MACRO {IrFishExportsImports} {"Ir. Fish Exports/Imports"}
MACRO {IrishFishInvestigNewSer} {"Irish Fish. Investig. (New Ser.)"}
MACRO {IrNatJ} {"Ir. Nat. J."}
MACRO {IrOffshoreRev} {"Ir. Offshore Rev."}
MACRO {IronSteelmaker} {"Iron Steelmaker"}
MACRO {ISATrans} {"ISA Trans."}
MACRO {IsotopesEnvironHealthStud} {"Isotopes Environ. Health Stud."}
MACRO {IsrJEntomol} {"Isr. J. Entomol."}
MACRO {IsrJPlantSci} {"Isr. J. Plant Sci."}
MACRO {IsrJZool} {"Isr. J. Zool."}
MACRO {IsrJAquacultBamidgeh} {"Isr. J. Aquacult./Bamidgeh"}
MACRO {IssledZemliKosmEarthResSpace} {"Issled. Zemli Kosm./Earth Res. Space"}
MACRO {IssledFaunyMorej} {"Issled. Fauny Morej"}
MACRO {IssuesSciTechnol} {"Issues Sci. Technol."}
MACRO {ItalJBiochem} {"Ital. J. Biochem."}
MACRO {ItalJZool} {"Ital. J. Zool."}
MACRO {ITCZMMonogrSer} {"ITCZM Monogr. Ser."}
MACRO {ITEJ} {"ITE J."}
MACRO {ItogiNaukiTekhIkhtiol} {"Itogi Nauki Tekh. (Ikhtiol.)"}
MACRO {ItogiNaukiTekhOkeanol} {"Itogi Nauki Tekh. (Okeanol.)"}
MACRO {ItogiNaukiTekhOkhrPrirVosproizvodPrirResur} {"Itogi Nauki Tekh. (Okhr. Prir. Vosproizvod. Prir. Resur.)"}
MACRO {ItogiNaukiTekhZoolBespozv} {"Itogi Nauki Tekh. (Zool. Bespozv.)"}
MACRO {Ittiopatologia} {"Ittiopatologia"}
MACRO {IUCNBull} {"IUCN Bull."}
MACRO {IzvInstRibniResurVarnaProcInstFishVarna} {"Izv. Inst. Ribni Resur. Varna/Proc. Inst. Fish. Varna"}
MACRO {IzvRANBiolProcRussAcadSciBiol} {"Izv. RAN (Biol.)/Proc. Russ. Acad. Sci. (Biol.)"}
MACRO {IzvRANFizAtmosOkeanaProcRussAcadSciAtmosOceanPhys} {"Izv. RAN (Fiz. Atmos. Okeana)/Proc. Russ. Acad. Sci. (Atmos. Ocean. Phys.)"}
MACRO {IzvRANGeogrProcRussAcadSciGeogr} {"Izv. RAN (Geogr.)/Proc. Russ. Acad. Sci. (Geogr.)"}
MACRO {IzvRussAcadSciPhysSolidEarth} {"Izv. Russ. Acad. Sci. Phys. Solid Earth"}
MACRO {IzvRGO} {"Izv. RGO"}
MACRO {IzvSORANBiolNauk} {"Izv. SO RAN (Biol. Nauk)"}
MACRO {IzvTINROTransPacResInstFishOceanogr} {"Izv. TINRO/Trans. Pac. Res. Inst. Fish. Oceanogr."}
MACRO {IzvVUZPishchTekhnol} {"Izv. VUZ (Pishch. Tekhnol.)"}
MACRO {IzvAtmosOceanPhys} {"Izv. Atmos. Ocean. Phys."}
MACRO {JaarverslProduktschapVisRijswijk} {"Jaarversl. Produktschap Vis Rijswijk"}
MACRO {JadranMeteorolAdriatMeteorol} {"Jadran. Meteorol./Adriat. Meteorol."}
MACRO {JahresberDtschFischwirtschAnnuRepGerFish} {"Jahresber. Dtsch. Fischwirtsch./Annu. Rep. Ger. Fish."}
MACRO {JahresberBayerLandesanstFischStarnb} {"Jahresber. Bayer. Landesanst. Fisch. Starnb."}
MACRO {JahresberBiolStnLunzOesterrAkadWiss} {"Jahresber. Biol. Stn. Lunz Oesterr. Akad. Wiss."}
MACRO {JahresberBundesamtSeeschiffahrtHydrogr} {"Jahresber. Bundesamt Seeschiffahrt Hydrogr."}
MACRO {JahresberBundesforschungsanstFischHamb} {"Jahresber. Bundesforschungsanst. Fisch. Hamb."}
MACRO {JahresberInstMeereskdUnivKiel} {"Jahresber. Inst. Meereskd. Univ. Kiel"}
MACRO {JahresberIntGewaesserschutzkommBodensee} {"Jahresber. Int. Gewaesserschutzkomm. Bodensee"}
MACRO {JahresberLandesumweltamtNordrhWestfal} {"Jahresber. Landesumweltamt Nordrh.-Westfal."}
MACRO {JahreshFischUmweltMecklenbgVorpommern} {"Jahresh. Fisch Umwelt Mecklenbg.-Vorpommern"}
MACRO {JAIDSJAcquiredImmuneDeficSyndromes} {"JAIDS J. Acquired Immune Defic. Syndromes"}
MACRO {Jaina} {"Jaina"}
MACRO {JAmMedAssoc} {"J. Am. Med. Assoc."}
MACRO {JAMSTECJDeepSeaResJAMSTECShinkaiKenkyu} {"JAMSTEC J. Deep Sea Res./JAMSTEC Shinkai Kenkyu"}
MACRO {JapanMedAssocJ} {"Japan Med. Assoc. J."}
MACRO {JapanShipbuildMarEng} {"Japan Shipbuild. Mar. Eng."}
MACRO {JapJAntibiot} {"Jap. J. Antibiot."}
MACRO {JapJBiometeorol} {"Jap. J. Biometeorol."}
MACRO {JapJCancerRes} {"Jap. J. Cancer Res."}
MACRO {JapJClinOncol} {"Jap. J. Clin. Oncol."}
MACRO {JapJEcol} {"Jap. J. Ecol."}
MACRO {JapJEntomol} {"Jap. J. Entomol."}
MACRO {JapJEntomolNewSer} {"Jap. J. Entomol. (New Ser.)"}
MACRO {JapJGenet} {"Jap. J. Genet."}
MACRO {JapJHumGenet} {"Jap. J. Hum. Genet."}
MACRO {JapJIchthyol} {"Jap. J. Ichthyol."}
MACRO {JapJLimnol} {"Jap. J. Limnol."}
MACRO {JapJNeuropsychopharmacol} {"Jap. J. Neuropsychopharmacol."}
MACRO {JapJPharmacol} {"Jap. J. Pharmacol."}
MACRO {JapJPhysiol} {"Jap. J. Physiol."}
MACRO {JapJSanitZool} {"Jap. J. Sanit. Zool."}
MACRO {JapJSystEntomol} {"Jap. J. Syst. Entomol."}
MACRO {JapJToxicolEnvironHealth} {"Jap. J. Toxicol. Environ. Health"}
MACRO {JapJVetRes} {"Jap. J. Vet. Res."}
MACRO {JobComplRepDepFishGameIdaho} {"Job Compl. Rep. Dep. Fish Game (Idaho)"}
MACRO {JobPerformRepIdahoDepFishGame} {"Job Perform. Rep. Idaho Dep. Fish Game"}
MACRO {JobProgRepMontDepFishGame} {"Job Prog. Rep. Mont. Dep. Fish Game"}
MACRO {JOIUSSACNewsletter} {"JOI/USSAC Newsletter"}
MACRO {JChimPhysPhysChimBiol} {"J. Chim. Phys. Phys.-Chim. Biol."}
MACRO {JRechOceanogr} {"J. Rech. Oceanogr."}
MACRO {JEurHydrolEurJWaterQual} {"J. Eur. Hydrol./Eur. J. Water Qual."}
MACRO {JNatConserv} {"J. Nat. Conserv."}
MACRO {JIvoirOceanolLimnol} {"J. Ivoir. Oceanol. Limnol."}
MACRO {JAddictDis} {"J. Addict. Dis."}
MACRO {JAdolesc} {"J. Adolesc."}
MACRO {JAdolescHealth} {"J. Adolesc. Health"}
MACRO {JAdvMater} {"J. Adv. Mater."}
MACRO {JAdvTransport} {"J. Adv. Transport."}
MACRO {JAdvZool} {"J. Adv. Zool."}
MACRO {JAerospaceEng} {"J. Aerospace Eng."}
MACRO {JAfrZool} {"J. Afr. Zool."}
MACRO {JAgingSocPolicy} {"J. Aging Soc. Policy"}
MACRO {JAgingHealth} {"J. Aging Health"}
MACRO {JAgricFoodInf} {"J. Agric. Food Inf."}
MACRO {JAgricFoodChem} {"J. Agric. Food Chem."}
MACRO {JAgricResourEcon} {"J. Agric. Resour. Econ."}
MACRO {JAgricUrbanEntomol} {"J. Agric. Urban Entomol."}
MACRO {JAgricBiotechnolNongyeShengwuJishuXuebao} {"J. Agric. Biotechnol./Nongye Shengwu Jishu Xuebao"}
MACRO {JAgricEntomol} {"J. Agric. Entomol."}
MACRO {JAgricSafHealth} {"J. Agric. Saf. Health"}
MACRO {JAgricSci} {"J. Agric. Sci."}
MACRO {JAgricultBiolEnvStat} {"J. Agricult. Biol. Env. Stat."}
MACRO {JAgricWA} {"J. Agric. W.A."}
MACRO {JAgromed} {"J. Agromed."}
MACRO {JAirLawCommerce} {"J. Air Law Commerce"}
MACRO {JAirTrafficControl} {"J. Air Traffic Control"}
MACRO {JAircraft} {"J. Aircraft"}
MACRO {JAlcoholDrugEduc} {"J. Alcohol Drug Educ."}
MACRO {JAllergyClinImmunol} {"J. Allergy Clin. Immunol."}
MACRO {JAlzheimersDis} {"J. Alzheimer's Dis."}
MACRO {JAmCollHealth} {"J. Am. Coll. Health"}
MACRO {JAnalToxicol} {"J. Anal. Toxicol."}
MACRO {JAnhuiAgricUniv} {"J. Anhui Agric. Univ."}
MACRO {JAnhuiNormUnivNatSci} {"J. Anhui Norm. Univ. (Nat. Sci.)"}
MACRO {JAnimBreedGenet} {"J. Anim. Breed. Genet."}
MACRO {JAnimEcol} {"J. Anim. Ecol."}
MACRO {JAnimMorpholPhysiol} {"J. Anim. Morphol. Physiol."}
MACRO {JAnimPhysiolAnimNutr} {"J. Anim. Physiol. Anim. Nutr."}
MACRO {JAnimSci} {"J. Anim. Sci."}
MACRO {JAntibiot} {"J. Antibiot."}
MACRO {JAntimicrobChemother} {"J. Antimicrob. Chemother."}
MACRO {JAOACInt} {"J. AOAC Int."}
MACRO {JApicRes} {"J. Apic. Res."}
MACRO {JApplAgricEcon} {"J. Appl. Agric. Econ."}
MACRO {JApplAquacult} {"J. Appl. Aquacult."}
MACRO {JApplBacteriol} {"J. Appl. Bacteriol."}
MACRO {JApplBiomater} {"J. Appl. Biomater."}
MACRO {JApplBot} {"J. Appl. Bot."}
MACRO {JApplEcol} {"J. Appl. Ecol."}
MACRO {JApplEntomol} {"J. Appl. Entomol."}
MACRO {JApplFireSci} {"J. Appl. Fire Sci."}
MACRO {JApplGenet} {"J. Appl. Genet."}
MACRO {JApplGerontol} {"J. Appl. Gerontol."}
MACRO {JApplIchthyol} {"J. Appl. Ichthyol."}
MACRO {JApplManufSyst} {"J. Appl. Manuf. Syst."}
MACRO {JApplMeteorol} {"J. Appl. Meteorol."}
MACRO {JApplMicrobiol} {"J. Appl. Microbiol."}
MACRO {JApplPhycol} {"J. Appl. Phycol."}
MACRO {JApplPhysiol} {"J. Appl. Physiol."}
MACRO {JApplPolymSci} {"J. Appl. Polym. Sci."}
MACRO {JApplSciEnvironManage} {"J. Appl. Sci. Environ. Manage."}
MACRO {JApplToxicol} {"J. Appl. Toxicol."}
MACRO {JAquac} {"J. Aquac."}
MACRO {JAquacultTrop} {"J. Aquacult. Trop."}
MACRO {JAquaricultAquatSci} {"J. Aquaricult. Aquat. Sci."}
MACRO {JAquatAnimHealth} {"J. Aquat. Anim. Health"}
MACRO {JAquatEcosystStressRecovery} {"J. Aquat. Ecosyst. Stress Recovery"}
MACRO {JAquatFoodProdTechnol} {"J. Aquat. Food Prod. Technol."}
MACRO {JAquatPlantManage} {"J. Aquat. Plant Manage."}
MACRO {JAquatSci} {"J. Aquat. Sci."}
MACRO {JArachnol} {"J. Arachnol."}
MACRO {JArchitEng} {"J. Archit. Eng."}
MACRO {JAridEnviron} {"J. Arid Environ."}
MACRO {JArtificialOrgans} {"J. Artificial Organs"}
MACRO {JAsiaPacifEntomol} {"J. Asia-Pacif. Entomol."}
MACRO {JAsianArchitBuildEng} {"J. Asian Archit. Build. Eng."}
MACRO {JAsianNatProdRes} {"J. Asian Nat. Prod. Res."}
MACRO {JAtmosOceanSci} {"J. Atmos. Ocean Sci."}
MACRO {JAtmosOceanTechnol} {"J. Atmos. Ocean. Technol."}
MACRO {JAutoimmun} {"J. Autoimmun."}
MACRO {JAutoMethManageChem} {"J. Auto. Meth. Manage. Chem."}
MACRO {JAutonPharmacol} {"J. Auton. Pharmacol."}
MACRO {JAvianBiol} {"J. Avian Biol."}
MACRO {JAvianMedSurg} {"J. Avian Med. Surg."}
MACRO {JBabolUnivMedSci} {"J. Babol Univ. Med. Sci."}
MACRO {JBacteriol} {"J. Bacteriol."}
MACRO {JBasicApplGenet} {"J. Basic Appl. Genet."}
MACRO {JBasicMicrobiol} {"J. Basic Microbiol."}
MACRO {JBengalNatHistSoc} {"J. Bengal Nat. Hist. Soc."}
MACRO {JBioactCompatiblePolym} {"J. Bioact. Compatible Polym."}
MACRO {JBiochemBiophysMethods} {"J. Biochem. Biophys. Methods"}
MACRO {JBiochemMolToxicol} {"J. Biochem. Mol. Toxicol."}
MACRO {JBiochemTokyo} {"J. Biochem., Tokyo"}
MACRO {JBiochemMolBiolBiophys} {"J. Biochem. Mol. Biol. Biophys."}
MACRO {JBioecon} {"J. Bioecon."}
MACRO {JBioenergBiomembr} {"J. Bioenerg. Biomembr."}
MACRO {JBiogeogr} {"J. Biogeogr."}
MACRO {JBioinfComputBiol} {"J. Bioinf. Comput. Biol."}
MACRO {JBiolawBus} {"J. Biolaw Bus."}
MACRO {JBiolChem} {"J. Biol. Chem."}
MACRO {JBiolEduc} {"J. Biol. Educ."}
MACRO {JBiolRhythms} {"J. Biol. Rhythms"}
MACRO {JBiolSyst} {"J. Biol. Syst."}
MACRO {JBiol} {"J. Biol."}
MACRO {JBioluminChemilumin} {"J. Biolumin. Chemilumin."}
MACRO {JBiomaterAppl} {"J. Biomater. Appl."}
MACRO {JBiomechEngTransASME} {"J. Biomech. Eng. Trans. ASME"}
MACRO {JBiomech} {"J. Biomech."}
MACRO {JBiomedEngShengwuYixueGongchengxueZazhi} {"J. Biomed. Eng./Shengwu Yixue Gongchengxue Zazhi"}
MACRO {JBiomedInf} {"J. Biomed. Inf."}
MACRO {JBiomedMaterResA} {"J. Biomed. Mater. Res. A"}
MACRO {JBiomedMaterResBApplBiomater} {"J. Biomed. Mater. Res. B Appl. Biomater."}
MACRO {JBiomedSci} {"J. Biomed. Sci."}
MACRO {JBiomedBiotechnol} {"J. Biomed. Biotechnol."}
MACRO {JBiomolNMR} {"J. Biomol. NMR"}
MACRO {JBiomolScreen} {"J. Biomol. Screen."}
MACRO {JBiomolStructDyn} {"J. Biomol. Struct. Dyn."}
MACRO {JBionicsEng} {"J. Bionics Eng."}
MACRO {JBiosciPenang} {"J. Biosci. (Penang)"}
MACRO {JBiosciBioeng} {"J. Biosci. Bioeng."}
MACRO {JBiosciBangalore} {"J. Biosci. (Bangalore)"}
MACRO {JBiotechnol} {"J. Biotechnol."}
MACRO {JBodyworkMovementTher} {"J. Bodywork Movement Ther."}
MACRO {JBoneJtSurgAm} {"J. Bone Jt. Surg. (Am.)"}
MACRO {JBoneJtSurgBr} {"J. Bone Jt. Surg. (Br.)"}
MACRO {JBoneMinerMetab} {"J. Bone Miner. Metab."}
MACRO {JBoneMinerRes} {"J. Bone Miner. Res."}
MACRO {JBridgeEng} {"J. Bridge Eng."}
MACRO {JCarbohydrChem} {"J. Carbohydr. Chem."}
MACRO {JCaveKarstStud} {"J. Cave Karst Stud."}
MACRO {JCellBiol} {"J. Cell Biol."}
MACRO {JCellSci} {"J. Cell Sci."}
MACRO {JCellMolMed} {"J. Cell. Mol. Med."}
MACRO {JCellBiochem} {"J. Cell. Biochem."}
MACRO {JCetaceanResManage} {"J. Cetacean Res. Manage."}
MACRO {JCetaceanResManageSpecialIssue} {"J. Cetacean Res. Manage. Special Issue"}
MACRO {JChemEcol} {"J. Chem. Ecol."}
MACRO {JChemEngJapan} {"J. Chem. Eng. Japan"}
MACRO {JChemNeuroanat} {"J. Chem. Neuroanat."}
MACRO {JChemTechnolBiotechnol} {"J. Chem. Technol. Biotechnol."}
MACRO {JChemometrics} {"J. Chemometrics"}
MACRO {JChildAdolescentSubstAbuse} {"J. Child Adolescent Subst. Abuse"}
MACRO {JChildPsycholPsychiatryAlliedDisciplines} {"J. Child Psychol. Psychiatry Allied Disciplines"}
MACRO {JChildSexAbuse} {"J. Child Sex. Abuse"}
MACRO {JChildHealth} {"J. Child. Health"}
MACRO {JChildrensHealth} {"J. Children's Health"}
MACRO {JChinaAgricUniv} {"J. China Agric. Univ."}
MACRO {JChineInstMetrology} {"J. Chine Inst. Metrology"}
MACRO {JChromatogr} {"J. Chromatogr."}
MACRO {JClim} {"J. Clim."}
MACRO {JClinLabImmunol} {"J. Clin. Lab. Immunol."}
MACRO {JClinChildPsychol} {"J. Clin. Child Psychol."}
MACRO {JClinComput} {"J. Clin. Comput."}
MACRO {JClinDensitometry} {"J. Clin. Densitometry"}
MACRO {JClinEff} {"J. Clin. Eff."}
MACRO {JClinEndocrinolMetab} {"J. Clin. Endocrinol. Metab."}
MACRO {JClinEpidemiol} {"J. Clin. Epidemiol."}
MACRO {JClinForensicMed} {"J. Clin. Forensic Med."}
MACRO {JClinImmunol} {"J. Clin. Immunol."}
MACRO {JClinInvest} {"J. Clin. Invest."}
MACRO {JClinMicrobiol} {"J. Clin. Microbiol."}
MACRO {JClinPathol} {"J. Clin. Pathol."}
MACRO {JClinPharmacol} {"J. Clin. Pharmacol."}
MACRO {JClinPharTher} {"J. Clin. Phar. Ther."}
MACRO {JClinPsychiatr} {"J. Clin. Psychiatr."}
MACRO {JClinPsychol} {"J. Clin. Psychol."}
MACRO {JClinUltrasound} {"J. Clin. Ultrasound"}
MACRO {JClinVirol} {"J. Clin. Virol."}
MACRO {JCoastConservation} {"J. Coast. Conservation"}
MACRO {JCoastRes} {"J. Coast. Res."}
MACRO {JCoastResSpecIssue} {"J. Coast. Res. (Spec. Issue)"}
MACRO {JCognitNeurosci} {"J. Cognit. Neurosci."}
MACRO {JCognitNeurosciSuppl} {"J. Cognit. Neurosci. Suppl."}
MACRO {JColdRegionsEng} {"J. Cold Regions Eng."}
MACRO {JColloidInterfaceSci} {"J. Colloid Interface Sci."}
MACRO {JCombChem} {"J. Comb. Chem."}
MACRO {JCommunicableDis} {"J. Communicable Dis."}
MACRO {JCommunityHealth} {"J. Community Health"}
MACRO {JCommunityHealthNurs} {"J. Community Health Nurs."}
MACRO {JCommunityPract} {"J. Community Pract."}
MACRO {JCompNeurol} {"J. Comp. Neurol."}
MACRO {JCompPhysiolA} {"J. Comp. Physiol., A"}
MACRO {JCompPhysiolB} {"J. Comp. Physiol., B"}
MACRO {JCompositeConstr} {"J. Composite Constr."}
MACRO {JComputBiol} {"J. Comput. Biol."}
MACRO {JComputNeurosci} {"J. Comput. Neurosci."}
MACRO {JComputAssistedLearn} {"J. Comput. Assisted Learn."}
MACRO {JComputAssistedTomogr} {"J. Comput. Assisted Tomogr."}
MACRO {JComputAidedMolDes} {"J. Comput.-Aided Mol. Des."}
MACRO {JComputCivEng} {"J. Comput. Civ. Eng."}
MACRO {JConchol} {"J. Conchol."}
MACRO {JConflSecLaw} {"J. Confl. Sec. Law"}
MACRO {JConstrEngManage} {"J. Constr. Eng. Manage."}
MACRO {JConstrRes} {"J. Constr. Res."}
MACRO {JConstrSteelRes} {"J. Constr. Steel Res."}
MACRO {JConsumerAff} {"J. Consumer Aff."}
MACRO {JConsumHealthInternet} {"J. Consum. Health Internet"}
MACRO {JConsumerPolicy} {"J. Consumer Policy"}
MACRO {JContingenciesCrisisManage} {"J. Contingencies Crisis Manage."}
MACRO {JControlledRelease} {"J. Controlled Release"}
MACRO {JCraniofacGenetDevBiol} {"J. Craniofac. Genet. Dev. Biol."}
MACRO {JCrimJustPopCult} {"J. Crim. Just. Pop. Cult."}
MACRO {JCropProd} {"J. Crop Prod."}
MACRO {JCrustBiol} {"J. Crust. Biol."}
MACRO {JCurrSci} {"J. Curr. Sci."}
MACRO {JDairyRes} {"J. Dairy Res."}
MACRO {JDairySci} {"J. Dairy Sci."}
MACRO {JDalianFishUnivDalianShuichanXueyuanXuebao} {"J. Dalian Fish. Univ./Dalian Shuichan Xueyuan Xuebao"}
MACRO {JDentRes} {"J. Dent. Res."}
MACRO {JDevAreas} {"J. Dev. Areas"}
MACRO {JDevEcon} {"J. Dev. Econ."}
MACRO {JDisasterPrevMitigEng} {"J. Disaster Prev. Mitig. Eng."}
MACRO {JDrugDelivSciTechnol} {"J. Drug Deliv. Sci. Technol."}
MACRO {JDrugEduc} {"J. Drug Educ."}
MACRO {JDrugIss} {"J. Drug Iss."}
MACRO {JDrugTargeting} {"J. Drug Targeting"}
MACRO {JDualDiagn} {"J. Dual Diagn."}
MACRO {JEarlyAdolesc} {"J. Early Adolesc."}
MACRO {JEarthquakeEng} {"J. Earthquake Eng."}
MACRO {JEarthquakeEngEngVibrat} {"J. Earthquake Eng. Eng. Vibrat."}
MACRO {JEastAfrNatHist} {"J. East Afr. Nat. Hist."}
MACRO {JEastChinaNormUnivNatSciEdHuadongShifanDaxueXuebaoZiranKexueBan} {"J. East China Norm. Univ. (Nat. Sci. Ed.)/Huadong Shifan Daxue Xuebao (Ziran Kexue Ban)"}
MACRO {JEastChinaShipbuildInst} {"J. East China Shipbuild. Inst."}
MACRO {JEcobiol} {"J. Ecobiol."}
MACRO {JEcol} {"J. Ecol."}
MACRO {JEconEntomol} {"J. Econ. Entomol."}
MACRO {JEcophysiologyOccupHealth} {"J. Ecophysiology Occup. Health"}
MACRO {JEcotoxicolEnvironMonitoring} {"J. Ecotoxicol. Environ. Monitoring"}
MACRO {JElderAbuseNeglect} {"J. Elder Abuse Neglect"}
MACRO {JElectromyogrKinesiol} {"J. Electromyogr. Kinesiol."}
MACRO {JElectronMicrosc} {"J. Electron Microsc."}
MACRO {JElectronTest} {"J. Electron. Test."}
MACRO {JElectrostatics} {"J. Electrostatics"}
MACRO {JEmergMed} {"J. Emerg. Med."}
MACRO {JEmotionalAbuse} {"J. Emotional Abuse"}
MACRO {JEndocrinol} {"J. Endocrinol."}
MACRO {JEndotoxinRes} {"J. Endotoxin Res."}
MACRO {JEndovascSurg} {"J. Endovasc. Surg."}
MACRO {JEngTechnolManage} {"J. Eng. Technol. Manage."}
MACRO {JEngMaterTechnolTransASME} {"J. Eng. Mater. Technol. Trans. ASME"}
MACRO {JEngMech} {"J. Eng. Mech."}
MACRO {JEntomolRes} {"J. Entomol. Res."}
MACRO {JEntomolSci} {"J. Entomol. Sci."}
MACRO {JEnvironPollut} {"J. Environ. Pollut."}
MACRO {JEnvironBiol} {"J. Environ. Biol."}
MACRO {JEnvironEconManage} {"J. Environ. Econ. Manage."}
MACRO {JEnvironEng} {"J. Environ. Eng."}
MACRO {JEnvironEngSci} {"J. Environ. Eng. Sci."}
MACRO {JEnvironHealth} {"J. Environ. Health"}
MACRO {JEnvironLawPract} {"J. Environ. Law Pract."}
MACRO {JEnvironManage} {"J. Environ. Manage."}
MACRO {JEnvironMed} {"J. Environ. Med."}
MACRO {JEnvironMonit} {"J. Environ. Monit."}
MACRO {JEnvironPatholToxicolOncol} {"J. Environ. Pathol. Toxicol. Oncol."}
MACRO {JEnvironPolymerDegradation} {"J. Environ. Polymer Degradation"}
MACRO {JEnvironRadioact} {"J. Environ. Radioact."}
MACRO {JEnvironSciEng} {"J. Environ. Sci. Eng."}
MACRO {JEnvironSciHealthPtAEnvironSciEngToxicHazardSubstControl} {"J. Environ. Sci. Health, Pt. A: Environ. Sci. Eng. Toxic Hazard. Subst. Control"}
MACRO {JEnvironSciHealthPtAToxicHazardSubstEnvironEng} {"J. Environ. Sci. Health, Pt. A: Toxic/Hazard. Subst. Environ. Eng."}
MACRO {JEnvironSciHealthPtBPesticFoodContamAgricWastes} {"J. Environ. Sci. Health, Pt. B: Pestic., Food Contam., Agric. Wastes"}
MACRO {JEnvironSciHealthPtC} {"J. Environ. Sci. Health, Pt. C"}
MACRO {JEnvironSciChina} {"J. Environ. Sci. (China)"}
MACRO {JEpidemiolCommunityHealth} {"J. Epidemiol. Community Health"}
MACRO {JEssentOilRes} {"J. Essent. Oil Res."}
MACRO {JEssentOilBearPlants} {"J. Essent. Oil-Bear. Plants"}
MACRO {JEthnSubstAbuse} {"J. Ethn. Subst. Abuse"}
MACRO {JEthnopharmacol} {"J. Ethnopharmacol."}
MACRO {JEthol} {"J. Ethol."}
MACRO {JEukaryotMicrobiol} {"J. Eukaryot. Microbiol."}
MACRO {JEvolBiol} {"J. Evol. Biol."}
MACRO {JExpBiol} {"J. Exp. Biol."}
MACRO {JExpBot} {"J. Exp. Bot."}
MACRO {JExpMarBiolEcol} {"J. Exp. Mar. Biol. Ecol."}
MACRO {JExpMed} {"J. Exp. Med."}
MACRO {JExpPsycholAnimBehavProcesses} {"J. Exp. Psychol.: Anim. Behav. Processes"}
MACRO {JExpZoolACompExpBiol} {"J. Exp. Zool. A Comp. Exp. Biol."}
MACRO {JExpZoolBMolDevEvol} {"J. Exp. Zool. B Mol. Dev. Evol."}
MACRO {JExposureAnalEnvironEpidemiol} {"J. Exposure Anal. Environ. Epidemiol."}
MACRO {JFamPract} {"J. Fam. Pract."}
MACRO {JFamSocWork} {"J. Fam. Soc. Work"}
MACRO {JFamTher} {"J. Fam. Ther."}
MACRO {JFamViolence} {"J. Fam. Violence"}
MACRO {JFermentBioeng} {"J. Ferment. Bioeng."}
MACRO {JFieldOrnithol} {"J. Field Ornithol."}
MACRO {JFireProtEng} {"J. Fire Prot. Eng."}
MACRO {JFireSci} {"J. Fire Sci."}
MACRO {JFishBiol} {"J. Fish Biol."}
MACRO {JFishDis} {"J. Fish Dis."}
MACRO {JFishEconDev} {"J. Fish. Econ. Dev."}
MACRO {JFishChinaShuichanXuebao} {"J. Fish. China/Shuichan Xuebao"}
MACRO {JFishSciTechnol} {"J. Fish. Sci. Technol."}
MACRO {JFishSciChinaZhongguoShuichanKexue} {"J. Fish. Sci. China/Zhongguo Shuichan Kexue"}
MACRO {JFoodAgricEnviron} {"J. Food Agric. Environ."}
MACRO {JFoodDrugAnal} {"J. Food Drug Anal."}
MACRO {JFoodBiochem} {"J. Food Biochem."}
MACRO {JFoodEng} {"J. Food Eng."}
MACRO {JFoodProcessEng} {"J. Food Process Eng."}
MACRO {JFoodProcessPreserv} {"J. Food Process. Preserv."}
MACRO {JFoodProt} {"J. Food Prot."}
MACRO {JFoodQual} {"J. Food Qual."}
MACRO {JFoodSaf} {"J. Food Saf."}
MACRO {JFoodSci} {"J. Food Sci."}
MACRO {JFoodSciTechnolMysore} {"J. Food Sci. Technol. (Mysore)"}
MACRO {JFoodSciTechnolNipponShokuhinKogyoGakkaishi} {"J. Food Sci. Technol./Nippon Shokuhin Kogyo Gakkaishi"}
MACRO {JForaminiferRes} {"J. Foraminifer. Res."}
MACRO {JFor} {"J. For."}
MACRO {JFreshwatBiol} {"J. Freshwat. Biol."}
MACRO {JFreshwatEcol} {"J. Freshwat. Ecol."}
MACRO {JFujianAgricUniv} {"J. Fujian Agric. Univ."}
MACRO {JFujianTeachUnivNatSciEdFujianShifanDaxueXuebao} {"J. Fujian Teach. Univ. (Nat. Sci. Ed.)/Fujian Shifan Daxue Xuebao"}
MACRO {JFusionEnergy} {"J. Fusion Energy"}
MACRO {JGenderSpecificMed} {"J. Gender-Specific Med."}
MACRO {JGeneMed} {"J. Gene Med."}
MACRO {JGenApplMicrobiol} {"J. Gen. Appl. Microbiol."}
MACRO {JGenInternMed} {"J. Gen. Intern. Med."}
MACRO {JGenPhysiol} {"J. Gen. Physiol."}
MACRO {JGenVirol} {"J. Gen. Virol."}
MACRO {JGeodesy} {"J. Geodesy"}
MACRO {JGeolHazardsEnvironPreserv} {"J. Geol. Hazards Environ. Preserv."}
MACRO {JGeol} {"J. Geol."}
MACRO {JGeomagnGeoelectr} {"J. Geomagn. Geoelectr."}
MACRO {JGeophysResBSolidEarth} {"J. Geophys. Res. (B Solid Earth)"}
MACRO {JGeophysResCOceans} {"J. Geophys. Res. (C Oceans)"}
MACRO {JGeophysResFEarthSurf} {"J. Geophys. Res. (F Earth Surf.)"}
MACRO {JGeosciOsakaCityUniv} {"J. Geosci. Osaka City Univ."}
MACRO {JGeotechGeoenvironEng} {"J. Geotech. Geoenviron. Eng."}
MACRO {JGeriatrDrugTher} {"J. Geriatr. Drug Ther."}
MACRO {JGlaciolGeocryol} {"J. Glaciol. Geocryol."}
MACRO {JGravitationalPhys} {"J. Gravitational Phys."}
MACRO {JGreatLakesRes} {"J. Great Lakes Res."}
MACRO {JGuangzhouUnivTradMedGuangzhouZhongyiyaoDaxueXuebao} {"J. Guangzhou Univ. Trad. Med./Guangzhou Zhongyiyao Daxue Xuebao"}
MACRO {JHazardMater} {"J. Hazard. Mater."}
MACRO {JHealthSocPolicy} {"J. Health Soc. Policy"}
MACRO {JHealthHumServAdmin} {"J. Health Hum. Serv. Admin."}
MACRO {JHealthCarePoorUnderserved} {"J. Health Care Poor Underserved"}
MACRO {JHealthEcon} {"J. Health Econ."}
MACRO {JHealthPolitPolicyLaw} {"J. Health Polit. Policy Law"}
MACRO {JHealthSci} {"J. Health Sci."}
MACRO {JHealthServResPolicy} {"J. Health Serv. Res. Policy"}
MACRO {JHerbalPharmacother} {"J. Herbal Pharmacother."}
MACRO {JHerbsSpicesMedPlants} {"J. Herbs, Spices Med. Plants"}
MACRO {JHered} {"J. Hered."}
MACRO {JHerpetol} {"J. Herpetol."}
MACRO {JHIVAIDSSocServ} {"J. HIV/AIDS Soc. Serv."}
MACRO {JHIVAIDSPrevEducAdolescChild} {"J. HIV/AIDS Prev. Educ. Adolesc. Child."}
MACRO {JHomelandSecurEmergencyManage} {"J. Homeland Secur. Emergency Manage."}
MACRO {JHomosex} {"J. Homosex."}
MACRO {JHorticSci} {"J. Hortic. Sci."}
MACRO {JHorticultSciBiotechnol} {"J. Horticult. Sci. Biotechnol."}
MACRO {JHospInfect} {"J. Hosp. Infect."}
MACRO {JHumBehavSocEnviron} {"J. Hum. Behav. Soc. Environ."}
MACRO {JHumEvol} {"J. Hum. Evol."}
MACRO {JHumGenet} {"J. Hum. Genet."}
MACRO {JHumResour} {"J. Hum. Resour."}
MACRO {JHunanUnivNatSci} {"J. Hunan Univ. Nat. Sci."}
MACRO {JHydraulEng} {"J. Hydraul. Eng."}
MACRO {JHydraulResJRechHydraul} {"J. Hydraul. Res./J. Rech. Hydraul."}
MACRO {JHydrolEng} {"J. Hydrol. Eng."}
MACRO {JHydrolNZ} {"J. Hydrol. (N.Z.)"}
MACRO {JHymenopteraRes} {"J. Hymenoptera Res."}
MACRO {JIchthyolVoprIkhtiol} {"J. Ichthyol./Vopr. Ikhtiol."}
MACRO {JImmigrantHealth} {"J. Immigrant Health"}
MACRO {JImmunoassay} {"J. Immunoassay"}
MACRO {JImmunoassayImmunochem} {"J. Immunoassay Immunochem."}
MACRO {JImmunolMethods} {"J. Immunol. Methods"}
MACRO {JImmunol} {"J. Immunol."}
MACRO {JImmunother} {"J. Immunother."}
MACRO {JImmunotherEmphTumorBiol} {"J. Immunother. Emph. Tumor Biol."}
MACRO {JImmunotoxicol} {"J. Immunotoxicol."}
MACRO {JIndianOceanStud} {"J. Indian Ocean Stud."}
MACRO {JIndMicrobiolBiotechnol} {"J. Ind. Microbiol. Biotechnol."}
MACRO {JIndText} {"J. Ind. Text."}
MACRO {JInfect} {"J. Infect."}
MACRO {JInfectChemother} {"J. Infect. Chemother."}
MACRO {JInfectDisPharmacother} {"J. Infect. Dis. Pharmacother."}
MACRO {JInfectDis} {"J. Infect. Dis."}
MACRO {JInfectDisAntimicrobialAgents} {"J. Infect. Dis. Antimicrobial Agents"}
MACRO {JInflammation} {"J. Inflammation"}
MACRO {JInfrastructSyst} {"J. Infrastruct. Syst."}
MACRO {JInheritedMetabDis} {"J. Inherited Metab. Dis."}
MACRO {JInsectBehav} {"J. Insect Behav."}
MACRO {JInsectConserv} {"J. Insect Conserv."}
MACRO {JInsectPhysiol} {"J. Insect Physiol."}
MACRO {JInsectSci} {"J. Insect Sci."}
MACRO {JInsectSciTucson} {"J. Insect Sci. (Tucson)"}
MACRO {JIntegraNeurosci} {"J. Integra. Neurosci."}
MACRO {JIntellManuf} {"J. Intell. Manuf."}
MACRO {JInterferonCytokineRes} {"J. Interferon Cytokine Res."}
MACRO {JInvertebrPathol} {"J. Invertebr. Pathol."}
MACRO {JIronSteelResInt} {"J. Iron Steel Res. Int."}
MACRO {JIslamDentAssocIran} {"J. Islam. Dent. Assoc. Iran"}
MACRO {JJapBot} {"J. Jap. Bot."}
MACRO {JJimeiUnivNatSciJimeiDaxueXuebao} {"J. Jimei Univ. (Nat. Sci.)./Jimei Daxue Xuebao"}
MACRO {JKingAbdulazizUnivMarSci} {"J. King Abdulaziz Univ. (Mar. Sci.)"}
MACRO {JKoreanSocCoastOceanEng} {"J. Korean Soc. Coast. Ocean Eng."}
MACRO {JLabelledCompdRadiopharmaceut} {"J. Labelled Compd. Radiopharmaceut."}
MACRO {JLaborEcon} {"J. Labor Econ."}
MACRO {JLaborRes} {"J. Labor Res."}
MACRO {JLakeSci} {"J. Lake Sci."}
MACRO {JLawMedEthics} {"J. Law Med. Ethics"}
MACRO {JLegalMed} {"J. Legal Med."}
MACRO {JLeukocyteBiol} {"J. Leukocyte Biol."}
MACRO {JLiaoningNormUnivLiaoningShifanDaxueXuebao} {"J. Liaoning Norm. Univ./Liaoning Shifan Daxue Xuebao"}
MACRO {JLifeSciCalicut} {"J. Life Sci. (Calicut)"}
MACRO {JLifeSciRDublinSoc} {"J. Life Sci. R. Dublin Soc."}
MACRO {JLimnol} {"J. Limnol."}
MACRO {JLipidRes} {"J. Lipid Res."}
MACRO {JLiposomeRes} {"J. Liposome Res."}
MACRO {JLiqChromatogr} {"J. Liq. Chromatogr."}
MACRO {JLiqChromatogrRelTechnol} {"J. Liq. Chromatogr. Rel. Technol."}
MACRO {JLongTermEffectsMedImplants} {"J. Long Term Effects Med. Implants"}
MACRO {JLossPrevProcessIndust} {"J. Loss Prev. Process Indust."}
MACRO {JMagnReson} {"J. Magn. Reson."}
MACRO {JMagnResonImaging} {"J. Magn. Reson. Imaging"}
MACRO {JMammEvol} {"J. Mamm. Evol."}
MACRO {JMammal} {"J. Mammal."}
MACRO {JManageEng} {"J. Manage. Eng."}
MACRO {JManagePsychol} {"J. Manage. Psychol."}
MACRO {JMarBiotechnol} {"J. Mar. Biotechnol."}
MACRO {JMarEnvironEng} {"J. Mar. Environ. Eng."}
MACRO {JMarRes} {"J. Mar. Res."}
MACRO {JMarSciQingdao} {"J. Mar. Sci. (Qingdao)"}
MACRO {JMarSciTechnol} {"J. Mar. Sci. Technol."}
MACRO {JMarSciHaiyangxueYanjiu} {"J. Mar. Sci./Haiyangxue Yanjiu"}
MACRO {JMarSyst} {"J. Mar. Syst."}
MACRO {JMassSpectrom} {"J. Mass Spectrom."}
MACRO {JMaterCivEng} {"J. Mater. Civ. Eng."}
MACRO {JMaterSciMaterMed} {"J. Mater. Sci. Mater. Med."}
MACRO {JMathBiol} {"J. Math. Biol."}
MACRO {JMechStrength} {"J. Mech. Strength"}
MACRO {JMechMedBiol} {"J. Mech. Med. Biol."}
MACRO {JMedVetMycol} {"J. Med. Vet. Mycol."}
MACRO {JMedCouncilIslamRepubIran} {"J. Med. Council Islam. Repub. Iran"}
MACRO {JMedEngTechnol} {"J. Med. Eng. Technol."}
MACRO {JMedEntomol} {"J. Med. Entomol."}
MACRO {JMedEthics} {"J. Med. Ethics"}
MACRO {JMedGenet} {"J. Med. Genet."}
MACRO {JMedInternetRes} {"J. Med. Internet Res."}
MACRO {JMedMicrobiol} {"J. Med. Microbiol."}
MACRO {JMedSci} {"J. Med. Sci."}
MACRO {JMedSyst} {"J. Med. Syst."}
MACRO {JMedUltrasound} {"J. Med. Ultrasound"}
MACRO {JMedVirol} {"J. Med. Virol."}
MACRO {JMedChem} {"J. Med. Chem."}
MACRO {JMedFood} {"J. Med. Food"}
MACRO {JMedBiochem} {"J. Med. Biochem."}
MACRO {JMembrBiol} {"J. Membr. Biol."}
MACRO {JMembrSci} {"J. Membr. Sci."}
MACRO {JMentHealthCouns} {"J. Ment. Health Couns."}
MACRO {JMicrobiolMethods} {"J. Microbiol. Methods"}
MACRO {JMicrobiolImmunolInfect} {"J. Microbiol. Immunol. Infect."}
MACRO {JMicroencaps} {"J. Microencaps."}
MACRO {JMicrosc} {"J. Microsc."}
MACRO {JMolBiol} {"J. Mol. Biol."}
MACRO {JMolEvol} {"J. Mol. Evol."}
MACRO {JMolGraphics} {"J. Mol. Graphics"}
MACRO {JMolGraphicsModel} {"J. Mol. Graphics Model."}
MACRO {JMolMicrobiolBiotechnol} {"J. Mol. Microbiol. Biotechnol."}
MACRO {JMolModel} {"J. Mol. Model."}
MACRO {JMolNeurosci} {"J. Mol. Neurosci."}
MACRO {JMolStruct} {"J. Mol. Struct."}
MACRO {JMolluscanStud} {"J. Molluscan Stud."}
MACRO {JMorphol} {"J. Morphol."}
MACRO {JMuscleResCellMotil} {"J. Muscle Res. Cell Motil."}
MACRO {JMusculoskeletNeuronInteract} {"J. Musculoskelet. Neuron. Interact."}
MACRO {JMusculoskeletalPain} {"J. Musculoskeletal Pain"}
MACRO {JMusculosketeletalRes} {"J. Musculosketeletal Res."}
MACRO {JMycolPlantPathol} {"J. Mycol. Plant Pathol."}
MACRO {JNanjingAgricultUniv} {"J. Nanjing Agricult. Univ."}
MACRO {JNanjingInstMeteorolNanjingQixiangXueyuanXuebao} {"J. Nanjing Inst. Meteorol./Nanjing Qixiang Xueyuan Xuebao"}
MACRO {JNanjingNormUniv} {"J. Nanjing Norm. Univ."}
MACRO {JNanjingUnivAeronautAstronaut} {"J. Nanjing Univ. Aeronaut. Astronaut."}
MACRO {JNanjingUnivTechnolNatSciEd} {"J. Nanjing Univ. Technol. (Nat. Sci. Ed.)"}
MACRO {JNatlFishUnivJapan} {"J. Natl. Fish. Univ. (Japan)"}
MACRO {JNatHist} {"J. Nat. Hist."}
MACRO {JNatProd} {"J. Nat. Prod."}
MACRO {JNatRemedies} {"J. Nat. Remedies"}
MACRO {JNatToxins} {"J. Nat. Toxins"}
MACRO {JNavig} {"J. Navig."}
MACRO {JNematol} {"J. Nematol."}
MACRO {JNeuralTransm} {"J. Neural Transm."}
MACRO {JNeuroAIDS} {"J. Neuro-AIDS"}
MACRO {JNeurobiol} {"J. Neurobiol."}
MACRO {JNeurochem} {"J. Neurochem."}
MACRO {JNeurocytol} {"J. Neurocytol."}
MACRO {JNeuroendocrinol} {"J. Neuroendocrinol."}
MACRO {JNeurogenet} {"J. Neurogenet."}
MACRO {JNeuroimaging} {"J. Neuroimaging"}
MACRO {JNeuroimmunol} {"J. Neuroimmunol."}
MACRO {JNeurolNeurosurgPsychiatry} {"J. Neurol. Neurosurg. Psychiatry"}
MACRO {JNeuropatholExpNeurol} {"J. Neuropathol. Exp. Neurol."}
MACRO {JNeurophysiol} {"J. Neurophysiol."}
MACRO {JNeuropterol} {"J. Neuropterol."}
MACRO {JNeurosci} {"J. Neurosci."}
MACRO {JNeurosciMethods} {"J. Neurosci. Methods"}
MACRO {JNeurosciRes} {"J. Neurosci. Res."}
MACRO {JNeurosurg} {"J. Neurosurg."}
MACRO {JNeurovirol} {"J. Neurovirol."}
MACRO {JNewDevClinMed} {"J. New Dev. Clin. Med."}
MACRO {JNewSeeds} {"J. New Seeds"}
MACRO {JNIHRes} {"J. NIH Res."}
MACRO {JNondestrEval} {"J. Nondestr. Eval."}
MACRO {JNorthwestAtlFishSci} {"J. Northwest Atl. Fish. Sci."}
MACRO {JNuclMater} {"J. Nucl. Mater."}
MACRO {JNuclMaterManage} {"J. Nucl. Mater. Manage."}
MACRO {JNutraceutFunctMedFoods} {"J. Nutraceut. Funct. Med. Foods"}
MACRO {JNutr} {"J. Nutr."}
MACRO {JNutrElderly} {"J. Nutr. Elderly"}
MACRO {JNutrRecipeMenuDev} {"J. Nutr. Recipe Menu Dev."}
MACRO {JNutrEnvironMed} {"J. Nutr. Environ. Med."}
MACRO {JNutrSciVitaminol} {"J. Nutr. Sci. Vitaminol."}
MACRO {JOccupEnvHyg} {"J. Occup. Env. Hyg."}
MACRO {JOccupEnvironMed} {"J. Occup. Environ. Med."}
MACRO {JOccupOrganPsychol} {"J. Occup. Organ. Psychol."}
MACRO {JOccupHealth} {"J. Occup. Health"}
MACRO {JOccupHealthPsychol} {"J. Occup. Health Psychol."}
MACRO {JOccupRehabil} {"J. Occup. Rehabil."}
MACRO {JOceanUnivChina} {"J. Ocean Univ. China"}
MACRO {JOceanUnivQingdaoEnglEdMarSci} {"J. Ocean Univ. Qingdao (Engl. Ed. Mar. Sci.)"}
MACRO {JOceanUnivQingdaoQingdaoHaiyangDaxueXuebao} {"J. Ocean Univ. Qingdao/Qingdao Haiyang Daxue Xuebao"}
MACRO {JOceanogr} {"J. Oceanogr."}
MACRO {JOceanogrTaiwanStraitTaiwanHaixia} {"J. Oceanogr. Taiwan Strait/Taiwan Haixia"}
MACRO {JOffenderRehabil} {"J. Offender Rehabil."}
MACRO {JOffshoreMechArctEngTransASME} {"J. Offshore Mech. Arct. Eng. Trans. ASME"}
MACRO {JOptimalNutr} {"J. Optimal Nutr."}
MACRO {JOralMaxillofacSurg} {"J. Oral Maxillofac. Surg."}
MACRO {JOrganBehavManage} {"J. Organ. Behav. Manage."}
MACRO {JOrthRes} {"J. Orth. Res."}
MACRO {JOrthopTech} {"J. Orthop. Tech."}
MACRO {JOrthopteraRes} {"J. Orthoptera Res."}
MACRO {JPaediatrChildHealth} {"J. Paediatr. Child Health"}
MACRO {JPainPalliativeCarePharmacotherapy} {"J. Pain Palliative Care Pharmacotherapy"}
MACRO {JPaleolimnol} {"J. Paleolimnol."}
MACRO {JPaleontol} {"J. Paleontol."}
MACRO {JParasitol} {"J. Parasitol."}
MACRO {JPathol} {"J. Pathol."}
MACRO {JPediatrSurg} {"J. Pediatr. Surg."}
MACRO {JPerformConstrFacil} {"J. Perform. Constr. Facil."}
MACRO {JPerinatalMed} {"J. Perinatal Med."}
MACRO {JPersonAssess} {"J. Person. Assess."}
MACRO {JPestSci} {"J. Pest Sci."}
MACRO {JPesticSci} {"J. Pestic. Sci."}
MACRO {JPharmBiomedAnal} {"J. Pharm. Biomed. Anal."}
MACRO {JPharmSci} {"J. Pharm. Sci."}
MACRO {JPharmacoepidemiol} {"J. Pharmacoepidemiol."}
MACRO {JPharmacolToxicolMethods} {"J. Pharmacol. Toxicol. Methods"}
MACRO {JPharmacolExpTher} {"J. Pharmacol. Exp. Ther."}
MACRO {JPharmPharmacol} {"J. Pharm. Pharmacol."}
MACRO {JPhotochemPhotobiolAChem} {"J. Photochem. Photobiol. A: Chem."}
MACRO {JPhotochemPhotobiolBBiol} {"J. Photochem. Photobiol. B: Biol."}
MACRO {JPhycol} {"J. Phycol."}
MACRO {JPhysOceanogr} {"J. Phys. Oceanogr."}
MACRO {JPhysEarth} {"J. Phys. Earth"}
MACRO {JPhysiolLond} {"J. Physiol. (Lond.)"}
MACRO {JPhysiolParis} {"J. Physiol. (Paris)"}
MACRO {JPhytopathol} {"J. Phytopathol."}
MACRO {JPinealRes} {"J. Pineal Res."}
MACRO {JPLAUnivSciTechNatSciEdJiefangjunLigongDaxueXuebao} {"J. PLA Univ. Sci. Tech. (Nat. Sci. Ed.)/Jiefangjun Ligong Daxue Xuebao"}
MACRO {JPlanktonRes} {"J. Plankton Res."}
MACRO {JPlantGrowthRegul} {"J. Plant Growth Regul."}
MACRO {JPlantNutr} {"J. Plant Nutr."}
MACRO {JPlantNutrSoilSci} {"J. Plant Nutr. Soil Sci."}
MACRO {JPlantPathol} {"J. Plant Pathol."}
MACRO {JPlantPhysiol} {"J. Plant Physiol."}
MACRO {JPlantRes} {"J. Plant Res."}
MACRO {JPrehospDisasterMed} {"J. Prehosp. Disaster Med."}
MACRO {JPressureVesselTechnolTransASME} {"J. Pressure Vessel Technol. Trans. ASME"}
MACRO {JPrimaryPrev} {"J. Primary Prev."}
MACRO {JProdAgric} {"J. Prod. Agric."}
MACRO {JPropulPower} {"J. Propul. Power"}
MACRO {JProsthetDent} {"J. Prosthet. Dent."}
MACRO {JProsthetOrthotics} {"J. Prosthet. Orthotics"}
MACRO {JProsthodontics} {"J. Prosthodontics"}
MACRO {JProteinChem} {"J. Protein Chem."}
MACRO {JPsychopharm} {"J. Psychopharm."}
MACRO {JPublicHealthMed} {"J. Public Health Med."}
MACRO {JPublicHealthPolicy} {"J. Public Health Policy"}
MACRO {JPublPol} {"J. Publ. Pol."}
MACRO {JPublicTransp} {"J. Public Transp."}
MACRO {JPyrotech} {"J. Pyrotech."}
MACRO {JQingdaoUnivNatSciEd} {"J. Qingdao Univ. (Nat. Sci. Ed.)"}
MACRO {JQualAssurHospTourism} {"J. Qual. Assur. Hosp. Tourism"}
MACRO {JQualClinPract} {"J. Qual. Clin. Pract."}
MACRO {JQuatSci} {"J. Quat. Sci."}
MACRO {JRadiatRes} {"J. Radiat. Res."}
MACRO {JRadiolProt} {"J. Radiol. Prot."}
MACRO {JRapidMethodsAutomatMicro} {"J. Rapid Methods Automat. Micro."}
MACRO {JReceptSignalTransduct} {"J. Recept. Signal Transduct."}
MACRO {JRegAnalPolicy} {"J. Reg. Anal. Policy"}
MACRO {JRegSci} {"J. Reg. Sci."}
MACRO {JRehabilMed} {"J. Rehabil. Med."}
MACRO {JRehabilResDev} {"J. Rehabil. Res. Dev."}
MACRO {JReprodImmunol} {"J. Reprod. Immunol."}
MACRO {JResReading} {"J. Res. Reading"}
MACRO {JResAdolesc} {"J. Res. Adolesc."}
MACRO {JResLepid} {"J. Res. Lepid."}
MACRO {JRiskRes} {"J. Risk Res."}
MACRO {JSafetyEnvAnquanYuHuanjingXuebao} {"J. Safety Env. / Anquan Yu Huanjing Xuebao"}
MACRO {JSafRes} {"J. Saf. Res."}
MACRO {JSchHealth} {"J. Sch. Health"}
MACRO {JSchoolViolence} {"J. School Violence"}
MACRO {JSciMedSport} {"J. Sci. Med. Sport"}
MACRO {JSciHiroshimaUnivB2Bot} {"J. Sci. Hiroshima Univ. (B. 2 Bot.)"}
MACRO {JSciIslamicRepubIran} {"J. Sci., Islamic Repub. Iran"}
MACRO {JSciIndRes} {"J. Sci. Ind. Res."}
MACRO {JSeaRes} {"J. Sea Res."}
MACRO {JSedimentResASedimentPetrolProcess} {"J. Sediment. Res. (A Sediment. Petrol. Process.)"}
MACRO {JSedimentResBStratigrGlobalStud} {"J. Sediment. Res. (B Stratigr. Global Stud.)"}
MACRO {JSeismol} {"J. Seismol."}
MACRO {JShandongUnivSciTechnolNatSciShandongKejiDaxueXuebaoZiranKexueban} {"J. Shandong Univ. Sci. Technol. (Nat. Sci.)/Shandong Keji Daxue Xuebao (Ziran Kexueban)"}
MACRO {JShanghaiFishUnivShanghaiShuichanDaxueXuebao} {"J. Shanghai Fish. Univ./Shanghai Shuichan Daxue Xuebao"}
MACRO {JShellfishRes} {"J. Shellfish Res."}
MACRO {JShenyangArchitCivEngUniv} {"J. Shenyang Archit. Civ. Eng. Univ."}
MACRO {JSleepRes} {"J. Sleep Res."}
MACRO {JSocIss} {"J. Soc. Iss."}
MACRO {JSocWelfareFamLaw} {"J. Soc. Welfare Fam. Law"}
MACRO {JSoilSci} {"J. Soil Sci."}
MACRO {JSoilsSed} {"J. Soils Sed."}
MACRO {JSolidWasteTechnolManage} {"J. Solid Waste Technol. Manage."}
MACRO {JSoundVibrat} {"J. Sound Vibrat."}
MACRO {JSouthAsianNatHist} {"J. South Asian Nat. Hist."}
MACRO {JSChinaAgricUnivNatSciEd} {"J. S. China Agric. Univ. (Nat. Sci. Ed.)"}
MACRO {JSouthChinNormUnivNatSciEdHuananShifanDaxueXuebaoZiranKexueBan} {"J. South Chin. Norm. Univ. (Nat. Sci. Ed.)/Huanan Shifan Daxue Xuebao (Ziran Kexue Ban)"}
MACRO {JSpacecraftRockets} {"J. Spacecraft Rockets"}
MACRO {JSportExercPsychol} {"J. Sport Exerc. Psychol."}
MACRO {JSportSocIss} {"J. Sport Soc. Iss."}
MACRO {JSportRehab} {"J. Sport Rehab."}
MACRO {JSportsChiroRehab} {"J. Sports Chiro. Rehab."}
MACRO {JSportsSci} {"J. Sports Sci."}
MACRO {JSportsTrauma} {"J. Sports Trauma."}
MACRO {JSteroidBiochemMolBiol} {"J. Steroid Biochem. Mol. Biol."}
MACRO {JStoredProdRes} {"J. Stored Prod. Res."}
MACRO {JStrainAnalEngDes} {"J. Strain Anal. Eng. Des."}
MACRO {JStructBiol} {"J. Struct. Biol."}
MACRO {JStructControl} {"J. Struct. Control"}
MACRO {JStructEng} {"J. Struct. Eng."}
MACRO {JStudAlcohol} {"J. Stud. Alcohol"}
MACRO {JSubstAbuse} {"J. Subst. Abuse"}
MACRO {JSubstAbuseTreat} {"J. Subst. Abuse Treat."}
MACRO {JSubstMisuse} {"J. Subst. Misuse"}
MACRO {JSubstUse} {"J. Subst. Use"}
MACRO {JSurgRes} {"J. Surg. Res."}
MACRO {JSurvEng} {"J. Surv. Eng."}
MACRO {JSustainableAgric} {"J. Sustainable Agric."}
MACRO {JTaiwanFishRes} {"J. Taiwan Fish. Res."}
MACRO {JTerramech} {"J. Terramech."}
MACRO {JAcoustSocAm} {"J. Acoust. Soc. Am."}
MACRO {JAcoustSocAmSuppl} {"J. Acoust. Soc. Am. (Suppl.)"}
MACRO {JAirWasteManageAssoc} {"J. Air Waste Manage. Assoc."}
MACRO {JAlaAcadSci} {"J. Ala. Acad. Sci."}
MACRO {JAmChemSoc} {"J. Am. Chem. Soc."}
MACRO {JAmCollCardiol} {"J. Am. Coll. Cardiol."}
MACRO {JAmCollToxicol} {"J. Am. Coll. Toxicol."}
MACRO {JAmDentAssoc} {"J. Am. Dent. Assoc."}
MACRO {JAmDietAssoc} {"J. Am. Diet. Assoc."}
MACRO {JAmGeriatrSoc} {"J. Am. Geriatr. Soc."}
MACRO {JAmMedInfAssoc} {"J. Am. Med. Inf. Assoc."}
MACRO {JAmMedWomensAssoc} {"J. Am. Med. Women's Assoc."}
MACRO {JAmMosqControlAssoc} {"J. Am. Mosq. Control Assoc."}
MACRO {JAmOilChemSoc} {"J. Am. Oil Chem. Soc."}
MACRO {JAmOptomAssoc} {"J. Am. Optom. Assoc."}
MACRO {JAmSocHortSci} {"J. Am. Soc. Hort. Sci."}
MACRO {JAmSocInfSci} {"J. Am. Soc. Inf. Sci."}
MACRO {JAmSocMassSpectrom} {"J. Am. Soc. Mass Spectrom."}
MACRO {JAmVetMedAssoc} {"J. Am. Vet. Med. Assoc."}
MACRO {JAmWaterWorksAssoc} {"J. Am. Water Works Assoc."}
MACRO {JAssocNursesAIDSCare} {"J. Assoc. Nurses AIDS Care"}
MACRO {JAstronautSci} {"J. Astronaut. Sci."}
MACRO {JAtmosSci} {"J. Atmos. Sci."}
MACRO {JAustEntomolSoc} {"J. Aust. Entomol. Soc."}
MACRO {JAutonNervSyst} {"J. Auton. Nerv. Syst."}
MACRO {JBlackSeaMediterraEnviron} {"J. Black Sea/Mediterra. Environ."}
MACRO {JBombayNatHistSoc} {"J. Bombay Nat. Hist. Soc."}
MACRO {JCanAssocRadiol} {"J. Can. Assoc. Radiol."}
MACRO {JCanDentAssoc} {"J. Can. Dent. Assoc."}
MACRO {JChemSocLondChemCommun} {"J. Chem. Soc. Lond. Chem. Commun."}
MACRO {JChemSocLondFaradayTrans2} {"J. Chem. Soc. Lond. Faraday Trans. 2"}
MACRO {JChinRailwaySoc} {"J. Chin. Railway Soc."}
MACRO {JChinInstEng} {"J. Chin. Inst. Eng."}
MACRO {JChinInstEnvironEng} {"J. Chin. Inst. Environ. Eng."}
MACRO {JChinSocAnimSci} {"J. Chin. Soc. Anim. Sci."}
MACRO {JCollPhysiciansSurgPak} {"J. Coll. Physicians Surg. Pak."}
MACRO {JElishaMitchellSciSoc} {"J. Elisha Mitchell Sci. Soc."}
MACRO {JEntomolResSoc} {"J. Entomol. Res. Soc."}
MACRO {JEntomolSocBC} {"J. Entomol. Soc. B. C."}
MACRO {JEntomolSocOnt} {"J. Entomol. Soc. Ont."}
MACRO {JExpAnalBehav} {"J. Exp. Anal. Behav."}
MACRO {JFacAgricKyushuUniv} {"J. Fac. Agric. Kyushu Univ."}
MACRO {JFacApplBiolSciHiroshimaUniv} {"J. Fac. Appl. Biol. Sci., Hiroshima Univ."}
MACRO {JFacSciTokyoUniv3Bot} {"J. Fac. Sci. Tokyo Univ. (3 Bot.)"}
MACRO {JFacVetMedUnivTehran} {"J. Fac. Vet. Med. Univ. Tehran"}
MACRO {JFishSocTaiwan} {"J. Fish. Soc. Taiwan"}
MACRO {JFoodHygSocJapan} {"J. Food Hyg. Soc. Japan"}
MACRO {JFormosanMedAssoc} {"J. Formosan Med. Assoc."}
MACRO {JGeolSocIndia} {"J. Geol. Soc. India"}
MACRO {JGeolSocJapan} {"J. Geol. Soc. Japan"}
MACRO {JGeolSocLond} {"J. Geol. Soc. Lond."}
MACRO {JIndianFishAssoc} {"J. Indian Fish. Assoc."}
MACRO {JIndianInstSci} {"J. Indian Inst. Sci."}
MACRO {JIowaAcadSci} {"J. Iowa Acad. Sci."}
MACRO {JJapanInstNavig} {"J. Japan Inst. Navig."}
MACRO {JJpnSocMechEng} {"J. Jpn. Soc. Mech. Eng."}
MACRO {JKansaiSocNavArchitJapan} {"J. Kansai Soc. Nav. Archit. Japan"}
MACRO {JKansEntomolSoc} {"J. Kans. Entomol. Soc."}
MACRO {JKyAcadSci} {"J. Ky. Acad. Sci."}
MACRO {JKoreanFishSoc} {"J. Korean Fish. Soc."}
MACRO {JKoreanSocPlastReconstrSurg} {"J. Korean Soc. Plast. Reconstr. Surg."}
MACRO {JLepidSoc} {"J. Lepid. Soc."}
MACRO {JMalacolSocAust} {"J. Malacol. Soc. Aust."}
MACRO {JMarBiolAssocIndia} {"J. Mar. Biol. Assoc. India"}
MACRO {JMarBiolAssocUK} {"J. Mar. Biol. Assoc. U.K."}
MACRO {JMedAssocGa} {"J. Med. Assoc. Ga."}
MACRO {JNatlAquatResourAgencySriLanka} {"J. Natl. Aquat. Resour. Agency (Sri Lanka)"}
MACRO {JNatlCancerInst} {"J. Natl. Cancer Inst."}
MACRO {JNatlMedAssoc} {"J. Natl. Med. Assoc."}
MACRO {JNatlSciCouncSriLanka} {"J. Natl. Sci. Counc. Sri Lanka"}
MACRO {JNatlSciFoundSriLanka} {"J. Natl. Sci. Found. Sri Lanka"}
MACRO {JNeurolSci} {"J. Neurol. Sci."}
MACRO {JNYEntomolSoc} {"J. N. Y. Entomol. Soc."}
MACRO {JNAmBentholSoc} {"J. N. Am. Benthol. Soc."}
MACRO {JOceanolSocKorea} {"J. Oceanol. Soc. Korea"}
MACRO {JRCollPhysiciansLond} {"J. R. Coll. Physicians Lond."}
MACRO {JRSocLondInterface} {"J. R. Soc. Lond. Interface"}
MACRO {JRSocMed} {"J. R. Soc. Med."}
MACRO {JRSocNZ} {"J. R. Soc. N. Z."}
MACRO {JRSocNZZool} {"J. R. Soc. N.Z. (Zool.)"}
MACRO {JRSocWestAust} {"J. R. Soc. West. Aust."}
MACRO {JSchMarSciTechnolTokaiUniv} {"J. Sch. Mar. Sci. Technol. Tokai Univ."}
MACRO {JSciFoodAgric} {"J. Sci. Food Agric."}
MACRO {JSocUnderwatTechnolLond} {"J. Soc. Underwat. Technol. Lond."}
MACRO {JSocNavArchitJapan} {"J. Soc. Nav. Archit. Japan"}
MACRO {JSAfrInstCivEng} {"J. S. Afr. Inst. Civ. Eng."}
MACRO {JTaiwanMus} {"J. Taiwan Mus."}
MACRO {JTennAcadSci} {"J. Tenn. Acad. Sci."}
MACRO {JTokyoUnivFish} {"J. Tokyo Univ. Fish."}
MACRO {JTorreyBotSoc} {"J. Torrey Bot. Soc."}
MACRO {JTransResBoard} {"J. Trans. Res. Board"}
MACRO {JUkrEntomolSoc} {"J. Ukr. Entomol. Soc."}
MACRO {JUnivKuwaitSci} {"J. Univ. Kuwait (Sci.)"}
MACRO {JWashAcadSci} {"J. Wash. Acad. Sci."}
MACRO {JWorldAquacultSoc} {"J. World Aquacult. Soc."}
MACRO {JTheorBiol} {"J. Theor. Biol."}
MACRO {JThermBiol} {"J. Therm. Biol."}
MACRO {JThrombThrombolysis} {"J. Thromb. Thrombolysis"}
MACRO {JTissueCultMethods} {"J. Tissue Cult. Methods"}
MACRO {JTongjiUnivNatSci} {"J. Tongji Univ. Nat. Sci."}
MACRO {JToxicolSci} {"J. Toxicol. Sci."}
MACRO {JToxicolEnvironHealth} {"J. Toxicol. Environ. Health"}
MACRO {JToxicolEnvironHealthA} {"J. Toxicol. Environ. Health, A"}
MACRO {JToxicolEnvironHealthACurrIss} {"J. Toxicol. Environ. Health, A: Curr. Iss."}
MACRO {JToxicolEnvironHealthPtBCritRev} {"J. Toxicol. Environ. Health, Pt. B Crit. Rev."}
MACRO {JToxicolClinToxicol} {"J. Toxicol.: Clin. Toxicol."}
MACRO {JToxicolCutaneousOcularToxicol} {"J. Toxicol.: Cutaneous Ocular Toxicol."}
MACRO {JToxicolToxinRev} {"J. Toxicol.: Toxin Rev."}
MACRO {JTraceElemExpMed} {"J. Trace Elem. Exp. Med."}
MACRO {JTranspGeogr} {"J. Transp. Geogr."}
MACRO {JTranspEng} {"J. Transp. Eng."}
MACRO {JTrauma} {"J. Trauma"}
MACRO {JTraumaPract} {"J. Trauma Pract."}
MACRO {JTraumStress} {"J. Traum. Stress"}
MACRO {JTravelMed} {"J. Travel Med."}
MACRO {JTropEcol} {"J. Trop. Ecol."}
MACRO {JTropMeteorol} {"J. Trop. Meteorol."}
MACRO {JTropOceanogrRedaiHaiyangXuebao} {"J. Trop. Oceanogr./Redai Haiyang Xuebao"}
MACRO {JTropPediatr} {"J. Trop. Pediatr."}
MACRO {JTsinghuaUnivSciTechnol} {"J. Tsinghua Univ. Sci. Technol."}
MACRO {JTurkishPhytopathol} {"J. Turkish Phytopathol."}
MACRO {JUrbanHealth} {"J. Urban Health"}
MACRO {JVenomAnimToxins} {"J. Venom. Anim. Toxins"}
MACRO {JVenomAnimToxinclTropDis} {"J. Venom. Anim. Tox. incl. Trop. Dis."}
MACRO {JVertPaleontol} {"J. Vert. Paleontol."}
MACRO {JVestibularResEquilibriumOrient} {"J. Vestibular Res.: Equilibrium Orient."}
MACRO {JVetMedSci} {"J. Vet. Med. Sci."}
MACRO {JVetMedBZentralblVeterinaermedReiheB} {"J. Vet. Med. B/Zentralbl. Veterinaermed. Reihe B"}
MACRO {JVibratAcoustTransASME} {"J. Vibrat. Acoust. Trans. ASME"}
MACRO {JVibratControl} {"J. Vibrat. Control"}
MACRO {JViralHepatitis} {"J. Viral Hepatitis"}
MACRO {JVirolMethods} {"J. Virol. Methods"}
MACRO {JVirol} {"J. Virol."}
MACRO {JWaterHealth} {"J. Water Health"}
MACRO {JWaterResourPlannManage} {"J. Water Resour. Plann. Manage."}
MACRO {JWaterwayPortCoastOceanEng} {"J. Waterway Port Coast. Ocean Eng."}
MACRO {JWestAfrFish} {"J. West Afr. Fish."}
MACRO {JWhiplashRelatedDisord} {"J. Whiplash Related Disord."}
MACRO {JWildlDis} {"J. Wildl. Dis."}
MACRO {JWildlManage} {"J. Wildl. Manage."}
MACRO {JWomenAging} {"J. Women Aging"}
MACRO {JWomensHealth} {"J. Women's Health"}
MACRO {JWomensHealthGenderBasedMed} {"J. Women's Health Gender-Based Med."}
MACRO {JWoodSci} {"J. Wood Sci."}
MACRO {JXiamenUnivNatSciXiamenDaxueXuebao} {"J. Xiamen Univ. (Nat. Sci.)/Xiamen Daxue Xuebao"}
MACRO {JZhanjiangOceanUnivZhanjiangHaiyangDaxueXuebao} {"J. Zhanjiang Ocean Univ./Zhanjiang Haiyang Daxue Xuebao"}
MACRO {JZhejiangAgricUniv} {"J. Zhejiang Agric. Univ."}
MACRO {JZhejiangOceanUnivZhejiangHaiyangXueyuanXuebao} {"J. Zhejiang Ocean Univ./Zhejiang Haiyang Xueyuan Xuebao"}
MACRO {JZhejiangUnivAgricLifeSci} {"J. Zhejiang Univ. (Agric. Life Sci.)"}
MACRO {JZooWildlMed} {"J. Zoo Wildl. Med."}
MACRO {JZoolSystEvolRes} {"J. Zool. Syst. Evol. Res."}
MACRO {JZool} {"J. Zool."}
MACRO {JZoolSerA} {"J. Zool. (Ser. A)"}
MACRO {JJapanSocBiosciBiotechnolAgrochem} {"J. Japan Soc. Biosci. Biotechnol. Agrochem."}
MACRO {JournAssocTunisSciBiol} {"Journ. Assoc. Tunis. Sci. Biol."}
MACRO {JSMEIntJSerC} {"JSME Int. J. Ser. C"}
MACRO {JurnalPenelitianPerikananLautJMarFishRes} {"Jurnal Penelitian Perikanan Laut/J. Mar. Fish. Res."}
MACRO {KaigaiSuisanSosho} {"Kaigai Suisan Sosho"}
MACRO {KaohsiungJMedSci} {"Kaohsiung J. Med. Sci."}
MACRO {KatKollektZoolMuzNNPMNANUkrCatZoolMusNatlNatHistMusUkrAcadSci} {"Kat. Kollekt. Zool. Muz. NNPM NAN Ukr./Cat. Zool. Mus. Natl. Nat. Hist. Mus. Ukr. Acad. Sci."}
MACRO {KavakaTransMycolSocIndia} {"Kavaka, Trans. Mycol. Soc. India"}
MACRO {KenyaJSciAPhysChemSci} {"Kenya J. Sci. (A Phys. Chem. Sci.)"}
MACRO {KenyaJSciBBiolSci} {"Kenya J. Sci. (B Biol. Sci.)"}
MACRO {KeskkondEstonianEnviron} {"Keskkond/Estonian Environ."}
MACRO {KEYIndicSeaFishIndAuth} {"KEY Indic. Sea Fish Ind. Auth."}
MACRO {KeyGeophysRecDoc} {"Key Geophys. Rec. Doc."}
MACRO {KeyMeteorolRecDoc} {"Key Meteorol. Rec. Doc."}
MACRO {KeyOceanogrRecDoc} {"Key Oceanogr. Rec. Doc."}
MACRO {KhimTekhnolVody} {"Khim. Tekhnol. Vody"}
MACRO {KielMeeresforschSonderh} {"Kiel. Meeresforsch. (Sonderh.)"}
MACRO {KISRTechRep} {"KISR Tech. Rep."}
MACRO {Klapalekiana} {"Klapalekiana"}
MACRO {KlinPaediatr} {"Klin. Paediatr."}
MACRO {KneeSurgerySportsTraumatologyArthroscopy} {"Knee Surgery, Sports Traumatology, Arthroscopy"}
MACRO {Koedoe} {"Koedoe"}
MACRO {Kogane} {"Kogane"}
MACRO {KoleopterolRundsch} {"Koleopterol. Rundsch."}
MACRO {KoreanJEntomol} {"Korean J. Entomol."}
MACRO {KoreanJLimnol} {"Korean J. Limnol."}
MACRO {Kromosomo} {"Kromosomo"}
MACRO {Kueste} {"Kueste"}
MACRO {KuwaitBullMarSci} {"Kuwait Bull. Mar. Sci."}
MACRO {KuwaitJSciEng} {"Kuwait J. Sci. Eng."}
MACRO {LabInvest} {"Lab. Invest."}
MACRO {LakeReservManage} {"Lake Reserv. Manage."}
MACRO {LakeChamplainBasinStudy} {"Lake Champlain Basin Study"}
MACRO {LakeErieFishAssessUnitRep} {"Lake Erie Fish. Assess. Unit Rep."}
MACRO {LakeNipissingFishAssessUnitRep} {"Lake Nipissing Fish. Assess. Unit Rep."}
MACRO {LakeoftheWoodsRainyLakeFishAssessUnitRep} {"Lake of the Woods - Rainy Lake Fish. Assess. Unit Rep."}
MACRO {LakeLine} {"LakeLine"}
MACRO {LakesReservResManage} {"Lakes Reserv.: Res. Manage."}
MACRO {LakesLett} {"Lakes Lett."}
MACRO {LakesideBordLac} {"Lakeside/Bord Lac"}
MACRO {LakseSjoeaurefiskeSalmonTroutFish} {"Lakse- Sjoeaurefiske/Salmon Trout Fish."}
MACRO {Lambillionea} {"Lambillionea"}
MACRO {Lammergeyer} {"Lammergeyer"}
MACRO {Lancet} {"Lancet"}
MACRO {LancetInfectDis} {"Lancet Infect. Dis."}
MACRO {LandWater} {"Land Water"}
MACRO {LandWaterLawRev} {"Land Water Law Rev."}
MACRO {LandForstwirtschFischFachser3Reihe45HochseeKuestenfisch} {"Land- Forstwirtsch. Fisch. (Fachser. 3 Reihe 4.5. Hochsee- Kuestenfisch.)"}
MACRO {LandingPlaceSurvDepFishThail} {"Landing Place Surv. Dep. Fish. (Thail.)"}
MACRO {LandscEcolEng} {"Landsc. Ecol. Eng."}
MACRO {LandscapeUrbanPlann} {"Landscape Urban Plann."}
MACRO {LandscapeEcol} {"Landscape Ecol."}
MACRO {Landscope} {"Landscope"}
MACRO {Landslides} {"Landslides"}
MACRO {Larus} {"Larus"}
MACRO {LasersSurgMed} {"Lasers Surg. Med."}
MACRO {LasersLifeSci} {"Lasers Life Sci."}
MACRO {LatinAmJAquatMammals} {"Latin Am. J. Aquat. Mammals"}
MACRO {LatvZinatAkadVestisBProcLatvAcadSciB} {"Latv. Zinat. Akad. Vestis (B)/Proc. Latv. Acad. Sci. (B)"}
MACRO {Lauterbornia} {"Lauterbornia"}
MACRO {LavSocVenezianaSciNat} {"Lav., Soc. Veneziana Sci. Nat."}
MACRO {LawPolicy} {"Law Policy"}
MACRO {LawSeaBibliogr} {"Law Sea Bibliogr."}
MACRO {LawSeaBull} {"Law Sea Bull."}
MACRO {LawQRev} {"Law Q. Rev."}
MACRO {LeLait} {"Le Lait"}
MACRO {LearnBehav} {"Learn. Behav."}
MACRO {LearnMemory} {"Learn. Memory"}
MACRO {LearnMotiv} {"Learn. Motiv."}
MACRO {LebanSciJJSciLiban} {"Leban. Sci. J./J. Sci. Liban."}
MACRO {LegalMed} {"Legal Med."}
MACRO {LeidenJIntLaw} {"Leiden J. Int. Law"}
MACRO {LepidNews} {"Lepid. News"}
MACRO {Lethaia} {"Lethaia"}
MACRO {LettApplMicrobiol} {"Lett. Appl. Microbiol."}
MACRO {LettMathPhys} {"Lett. Math. Phys."}
MACRO {Leukemia} {"Leukemia"}
MACRO {LeukLymphoma} {"Leuk. Lymphoma"}
MACRO {LeukemiaRes} {"Leukemia Res."}
MACRO {Levantina} {"Levantina"}
MACRO {LiaisonBullFAOSustainFishLivelihoodsProgrammeWestAfrBullLiaisonFAOProgrammeMoyensExistenceDurablePecheAfrOuest} {"Liaison Bull. FAO Sustain. Fish. Livelihoods Programme West Afr./Bull. Liaison FAO Programme Moyens Existence Durable Peche Afr. Ouest"}
MACRO {Libellula} {"Libellula"}
MACRO {LibrosUnivUnivAutonBajaCalifSurDidct} {"Libros Univ. Univ. Auton. Baja Calif. Sur (Didct.)"}
MACRO {Lichenologist} {"Lichenologist"}
MACRO {LiebigsAnnOrgBioorgChem} {"Liebigs Ann.: Org. Bioorg. Chem."}
MACRO {LietMokslSciArtsLith} {"Liet. Moksl./Sci. Arts Lith."}
MACRO {LifeSciRes} {"Life Sci. Res."}
MACRO {LifeSci} {"Life Sci."}
MACRO {LifeSciContribROntMus} {"Life. Sci. Contrib. R. Ont. Mus."}
MACRO {LifeSciMiscPublROntMus} {"Life Sci. Misc. Publ. R. Ont. Mus."}
MACRO {LifeSciOccasPapROntMus} {"Life Sci. Occas. Pap. R. Ont. Mus."}
MACRO {LiffraedistofnunFjaelritUnivIcelInstBiolRep} {"Liffraedistofnun. Fjaelrit/Univ. Icel. Inst. Biol. Rep."}
MACRO {LimitsSeas} {"Limits Seas"}
MACRO {Limnetica} {"Limnetica"}
MACRO {Limnologica} {"Limnologica"}
MACRO {LimnolAktuell} {"Limnol. Aktuell"}
MACRO {Limnology} {"Limnology"}
MACRO {LimnolOceanogr} {"Limnol. Oceanogr."}
MACRO {LimnolOceanogrMethods} {"Limnol. Oceanogr. Methods"}
MACRO {LinnBelg} {"Linn. Belg."}
MACRO {Lipids} {"Lipids"}
MACRO {ListFishVesselsNAFO} {"List Fish. Vessels NAFO"}
MACRO {Lithos} {"Lithos"}
MACRO {LiveReefFishInfBull} {"Live Reef Fish Inf. Bull."}
MACRO {LocalEnviron} {"Local Environ."}
MACRO {LondNat} {"Lond. Nat."}
MACRO {LaAgric} {"La. Agric."}
MACRO {LaConserv} {"La. Conserv."}
MACRO {LowellWakefieldFishSympSer} {"Lowell Wakefield Fish. Symp. Ser."}
MACRO {LTRNewsl} {"LTR Newsl."}
MACRO {Luminescence} {"Luminescence"}
MACRO {LundayanJ} {"Lundayan J."}
MACRO {Lung} {"Lung"}
MACRO {LUPUS} {"LUPUS"}
MACRO {Macromolecules} {"Macromolecules"}
MACRO {Madrono} {"Madrono"}
MACRO {MagSciAct} {"Mag. Sci. Act."}
MACRO {MagnResonImaging} {"Magn. Reson. Imaging"}
MACRO {MagnResonMed} {"Magn. Reson. Med."}
MACRO {MagnResonMaterBiolPhysMed} {"Magn. Reson. Mater. Biol. Phys. Med."}
MACRO {MagyAllatorvLapja} {"Magy. Allatorv. Lapja"}
MACRO {Malacologia} {"Malacologia"}
MACRO {MalayNatJ} {"Malay. Nat. J."}
MACRO {MalayJSciSerB} {"Malay. J. Sci. Ser. B"}
MACRO {MaldivesMarResBull} {"Maldives Mar. Res. Bull."}
MACRO {MammRev} {"Mamm. Rev."}
MACRO {Mammalia} {"Mammalia"}
MACRO {MammGenome} {"Mamm. Genome"}
MACRO {MammalianSpecies} {"Mammalian Species"}
MACRO {ManageDataSerParksWildlDepTex} {"Manage. Data Ser. Parks Wildl. Dep. (Tex.)"}
MACRO {ManejoFaunaPublTec} {"Manejo Fauna Publ. Tec."}
MACRO {MangrovesSaltMarshes} {"Mangroves Salt Marshes"}
MACRO {ManUnivUnivAutonBajaCalifSurDidct} {"Man. Univ. Univ. Auton. Baja Calif. Sur (Didct.)"}
MACRO {ManGuidesIOC} {"Man. Guides IOC"}
MACRO {ManufSyst} {"Manuf. Syst."}
MACRO {MapChartSerGeolSocAm} {"Map Chart Ser. Geol. Soc. Am."}
MACRO {MAPTechRepSer} {"MAP Tech. Rep. Ser."}
MACRO {MarMesop} {"Mar. Mesop."}
MACRO {MarFreshwatRes} {"Mar. Freshwat. Res."}
MACRO {MarAdvisBullFlaSeaGrantCollProgram} {"Mar. Advis. Bull. Fla. Sea Grant Coll. Program"}
MACRO {MarAdvisBullUnivAlaskaSeaGrantProgram} {"Mar. Advis. Bull. Univ. Alaska Sea Grant Program"}
MACRO {MarFreshwatBehavPhysiol} {"Mar. Freshwat. Behav. Physiol."}
MACRO {MarPetGeol} {"Mar. Pet. Geol."}
MACRO {MarBiol} {"Mar. Biol."}
MACRO {MarBiolRes} {"Mar. Biol. Res."}
MACRO {MarBiotechnol} {"Mar. Biotechnol."}
MACRO {MarBullRIUnivSeaGrantProgram} {"Mar. Bull. R.I. Univ. Sea Grant Program"}
MACRO {MarChem} {"Mar. Chem."}
MACRO {MarConservDevRep} {"Mar. Conserv. Dev. Rep."}
MACRO {MarDrugs} {"Mar. Drugs"}
MACRO {MarEcol} {"Mar. Ecol."}
MACRO {MarEcolProgSer} {"Mar. Ecol. Prog. Ser."}
MACRO {MarEnvironHealthSer} {"Mar. Environ. Health Ser."}
MACRO {MarEnvironRes} {"Mar. Environ. Res."}
MACRO {MarEnvironSciHaiyangHuanjingKexue} {"Mar. Environ. Sci./Haiyang Huanjing Kexue"}
MACRO {MarExtBullGaSeaGrantCollProgram} {"Mar. Ext. Bull. Ga. Sea Grant Coll. Program"}
MACRO {MarFishResourNewsl} {"Mar. Fish. Resour. Newsl."}
MACRO {MarFishInfServTechExtSer} {"Mar. Fish. Inf. Serv. Tech. Ext. Ser."}
MACRO {MarFishResHaiyangShuichanYanjiu} {"Mar. Fish. Res./Haiyang Shuichan Yanjiu"}
MACRO {MarFishRev} {"Mar. Fish. Rev."}
MACRO {MarFishSciTechInfBull} {"Mar. Fish. Sci. Tech. Inf. Bull."}
MACRO {MarFishStatDepFishThail} {"Mar. Fish. Stat. Dep. Fish. (Thail.)"}
MACRO {MarFishHaiyangYuye} {"Mar. Fish./Haiyang Yuye"}
MACRO {MarForecastsHaiyangYubao} {"Mar. Forecasts/Haiyang Yubao"}
MACRO {MarGeod} {"Mar. Geod."}
MACRO {MarGeol} {"Mar. Geol."}
MACRO {MarGeolQuaternGeolHaiyangDizhiYuDisijiDizhi} {"Mar. Geol. Quatern. Geol./Haiyang Dizhi Yu Disiji Dizhi"}
MACRO {MarGeoresourGeotechnol} {"Mar. Georesour. Geotechnol."}
MACRO {MarInvertScandinavia} {"Mar. Invert. Scandinavia"}
MACRO {MarIssuesCommSpecPubl} {"Mar. Issues Comm. Spec. Publ."}
MACRO {MarLife} {"Mar. Life"}
MACRO {MarMammSci} {"Mar. Mamm. Sci."}
MACRO {MarMemoSerRIUnivSeaGrantProgram} {"Mar. Memo. Ser. R.I. Univ. Sea Grant Program"}
MACRO {MarMicropaleontol} {"Mar. Micropaleontol."}
MACRO {MarModelsElectronRec} {"Mar. Models Electron. Rec."}
MACRO {MarModelsOnline} {"Mar. Models Online"}
MACRO {MarObs} {"Mar. Obs."}
MACRO {MarOrnithol} {"Mar. Ornithol."}
MACRO {MarPestIncursionManagRep} {"Mar. Pest Incursion Manag. Rep."}
MACRO {MarPolicy} {"Mar. Policy"}
MACRO {MarPollutBull} {"Mar. Pollut. Bull."}
MACRO {MarPropulInt} {"Mar. Propul. Int."}
MACRO {MarResIndones} {"Mar. Res. Indones."}
MACRO {MarResourBull} {"Mar. Resour. Bull."}
MACRO {MarResourEcon} {"Mar. Resour. Econ."}
MACRO {MarResourSer} {"Mar. Resour. Ser."}
MACRO {MarSanctuariesConservSer} {"Mar. Sanctuaries Conserv. Ser."}
MACRO {MarSciBull} {"Mar. Sci. Bull."}
MACRO {MarSciBullHaiyangTongbao} {"Mar. Sci. Bull./Haiyang Tongbao"}
MACRO {MarSciHaiyangKexue} {"Mar. Sci./Haiyang Kexue"}
MACRO {MarSci} {"Mar. Sci."}
MACRO {MarStruct} {"Mar. Struct."}
MACRO {MarTechRepSerRIUnivSeaGrantProgram} {"Mar. Tech. Rep. Ser. R.I. Univ. Sea Grant Program"}
MACRO {MarTechnolSNAMENews} {"Mar. Technol. SNAME News"}
MACRO {MarTechnolSocJ} {"Mar. Technol. Soc. J."}
MACRO {MarTurtleNewsl} {"Mar. Turtle Newsl."}
MACRO {MarinersWeatherLog} {"Mariner's Weather Log"}
MACRO {MaritPolicyManage} {"Marit. Policy Manage."}
MACRO {MaritStud} {"Marit. Stud."}
MACRO {Maritimes} {"Maritimes"}
MACRO {MarronGrowBull} {"Marron Grow. Bull."}
MACRO {MastersAbstInt} {"Masters Abst. Int."}
MACRO {MaterHandlEng} {"Mater. Handl. Eng."}
MACRO {MaterHandlManage} {"Mater. Handl. Manage."}
MACRO {MaterStruct} {"Mater. Struct."}
MACRO {MaterPerform} {"Mater. Perform."}
MACRO {MaterSciEngCBiomimeticSupramolSyst} {"Mater. Sci. Eng. C Biomimetic Supramol. Syst."}
MACRO {MathBiosci} {"Math. Biosci."}
MACRO {MathMedBiol} {"Math. Med. Biol."}
MACRO {MathModelSyst} {"Math. Model. Syst."}
MACRO {MathModelsMethodsApplSci} {"Math. Models Methods Appl. Sci."}
MACRO {Mausam} {"Mausam"}
MACRO {Maydica} {"Maydica"}
MACRO {MechEng} {"Mech. Eng."}
MACRO {MeddHavsfiskelabLysekil} {"Medd. Havsfiskelab. Lysekil"}
MACRO {MededFacLandbouwwetRijksunivGent} {"Meded. Fac. Landbouwwet. Rijksuniv. Gent"}
MACRO {MededKAcadWetLettSchoneKunstenBelgKlWet} {"Meded. K. Acad. Wet. Lett. Schone Kunsten Belg. Kl. Wet."}
MACRO {MedBiolEngComput} {"Med Biol Eng Comput"}
MACRO {MedPediatrOncol} {"Med. Pediatr. Oncol."}
MACRO {MedVetEntomol} {"Med. Vet. Entomol."}
MACRO {MedEngPhys} {"Med. Eng. Phys."}
MACRO {MedEntomolZool} {"Med. Entomol. Zool."}
MACRO {MedImageAnal} {"Med. Image Anal."}
MACRO {MedInfInternetMed} {"Med. Inf. Internet Med."}
MACRO {MedJAust} {"Med. J. Aust."}
MACRO {MedMicrobiolImmunol} {"Med. Microbiol. Immunol."}
MACRO {MedMicrobiolLett} {"Med. Microbiol. Lett."}
MACRO {MedMycol} {"Med. Mycol."}
MACRO {MedSciRes} {"Med. Sci. Res."}
MACRO {MedPaliativa} {"Med. Paliativa"}
MACRO {MedGlobalSurvival} {"Med. Global Survival"}
MACRO {MedSciSportsExerc} {"Med. Sci. Sports Exerc."}
MACRO {MedConflictSurvival} {"Med., Conflict Survival"}
MACRO {MedioAmbiente} {"Medio Ambiente"}
MACRO {MediterrSerEstudBiol} {"Mediterr. Ser. Estud. Biol."}
MACRO {MediterrMarSci} {"Mediterr. Mar. Sci."}
MACRO {MedKlin} {"Med. Klin."}
MACRO {MeereskdBeobErgeb} {"Meereskd. Beob. Ergeb."}
MACRO {MeereswissBerMarSciRep} {"Meereswiss. Ber./Mar. Sci. Rep."}
MACRO {MekongDevSer} {"Mekong Dev. Ser."}
MACRO {MembrCellBiolBiologMemb} {"Membr. Cell Biol./Biolog. Memb."}
MACRO {MemDEASciViePharmacolCentNoumeaORSTOM} {"Mem. DEA Sci. Vie Pharmacol. Cent. Noumea ORSTOM"}
MACRO {MemInstOceanogrMonaco} {"Mem. Inst. Oceanogr. Monaco"}
MACRO {MemSocRSciLiege} {"Mem. Soc. R. Sci. Liege"}
MACRO {MemSocVaudSciNat} {"Mem. Soc. Vaud. Sci. Nat."}
MACRO {MemMusNatlHistNatFrance} {"Mem. Mus. Natl. Hist. Nat. (France)"}
MACRO {MemInstRSciNatBelg2emeSerVerhKBelgInstNatuurwet2dereeks} {"Mem. Inst. R. Sci. Nat. Belg. (2eme Ser.)/Verh. K. Belg. Inst. Natuurwet. (2de reeks)"}
MACRO {MemInstRSciNatBelgVerhKBelgInstNatuurwet} {"Mem. Inst. R. Sci. Nat. Belg./Verh. K. Belg. Inst. Natuurwet."}
MACRO {MemMusVic} {"Mem. Mus. Vic."}
MACRO {MemAmEntomolInst} {"Mem. Am. Entomol. Inst."}
MACRO {MemAmEntomolSoc} {"Mem. Am. Entomol. Soc."}
MACRO {MemEntomolSocCan} {"Mem. Entomol. Soc. Can."}
MACRO {MemEntomolSocWash} {"Mem. Entomol. Soc. Wash."}
MACRO {MemFacAgricKinkiUniv} {"Mem. Fac. Agric. Kinki Univ."}
MACRO {MemFacFishHokkaidoUniv} {"Mem. Fac. Fish. Hokkaido Univ."}
MACRO {MemFacFishKagoshimaUniv} {"Mem. Fac. Fish. Kagoshima Univ."}
MACRO {MemGradSchFishSciHokkaidoUniv} {"Mem. Grad. Sch. Fish. Sci., Hokkaido Univ."}
MACRO {MemHourglassCruises} {"Mem. Hourglass Cruises"}
MACRO {MemQueenslMus} {"Mem. Queensl. Mus."}
MACRO {MemoRepUSNavResLab} {"Memo. Rep. U.S. Nav. Res. Lab."}
MACRO {MemFundLaSalleCiencNat} {"Mem. Fund. La Salle Cienc. Nat."}
MACRO {MemUnivNfldOccasPapBiol} {"Mem. Univ. Nfld. Occas. Pap. Biol."}
MACRO {MemAsocLatinoamAcuicult} {"Mem. Asoc. Latinoam. Acuicult."}
MACRO {MemRSocEspHistNat} {"Mem. R. Soc. Esp. Hist. Nat."}
MACRO {MemInstOswaldoCruz} {"Mem. Inst. Oswaldo Cruz"}
MACRO {MemMusCivStorNatVerona} {"Mem. Mus. Civ. Stor. Nat. Verona"}
MACRO {MemSocEntomolItal} {"Mem. Soc. Entomol. Ital."}
MACRO {MerChiffres} {"Mer Chiffres"}
MACRO {MercPescadoGdCiudadLatinoam} {"Merc. Pescado Gd. Ciudad. Latinoam."}
MACRO {Mesogee} {"Mesogee"}
MACRO {MetMar} {"Met-Mar"}
MACRO {MetabBrainDis} {"Metab. Brain Dis."}
MACRO {MetabEng} {"Metab. Eng."}
MACRO {MetabSyndrRelatDisord} {"Metab. Syndr. Relat. Disord."}
MACRO {Metabolism} {"Metabolism"}
MACRO {METEORBer} {"METEOR-Ber."}
MACRO {Meteorologie8eSer} {"Meteorologie (8e Ser.)"}
MACRO {MeteorolGidrol} {"Meteorol. Gidrol."}
MACRO {MethodsCellSci} {"Methods Cell Sci."}
MACRO {MethodsEnzymol} {"Methods Enzymol."}
MACRO {MethodsMolCellBiol} {"Methods Mol. Cell. Biol."}
MACRO {MethInformMed} {"Meth. Inform. Med."}
MACRO {Meyniana} {"Meyniana"}
MACRO {MichAcad} {"Mich. Acad."}
MACRO {MicolItal} {"Micol. Ital."}
MACRO {MicrobesEnviron} {"Microbes Environ."}
MACRO {MicrobInfect} {"Microb. Infect."}
MACRO {MicrobCompGenomics} {"Microb. Comp. Genomics"}
MACRO {MicrobDrugResist} {"Microb. Drug Resist."}
MACRO {MicrobEcol} {"Microb. Ecol."}
MACRO {MicrobEcolHealthDis} {"Microb. Ecol. Health Dis."}
MACRO {MicrobPathog} {"Microb. Pathog."}
MACRO {MicrobiolRes} {"Microbiol. Res."}
MACRO {MicrobiolRev} {"Microbiol. Rev."}
MACRO {Microbiology} {"Microbiology"}
MACRO {MicrobiologyRussAcadSci} {"Microbiology (Russ. Acad. Sci.)"}
MACRO {MicrobiolImmunol} {"Microbiol. Immunol."}
MACRO {MicrobiolMolBiolRev} {"Microbiol. Mol. Biol. Rev."}
MACRO {MicrobiolToday} {"Microbiol. Today"}
MACRO {Microbios} {"Microbios"}
MACRO {Microcirculation} {"Microcirculation"}
MACRO {MicrofaunaMar} {"Microfauna Mar."}
MACRO {MicrofichasInstEspOceanogr} {"Microfichas Inst. Esp. Oceanogr."}
MACRO {TesisDoctoralesInstitutoEspanoldeOceanografia} {"Tesis Doctorales. Instituto Espanol de Oceanografia"}
MACRO {MicrofluidNanofluid} {"Microfluid. Nanofluid."}
MACRO {Micronesica} {"Micronesica"}
MACRO {Micropaleontology} {"Micropaleontology"}
MACRO {MicroscResTech} {"Microsc. Res. Tech."}
MACRO {MidAtlanticAquaFarmer} {"Mid-Atlantic Aqua Farmer"}
MACRO {MiddleEastPolicy} {"Middle East Policy"}
MACRO {MikolFitopatol} {"Mikol. Fitopatol."}
MACRO {MikrobiolZh} {"Mikrobiol. Zh."}
MACRO {MilbankQ} {"Milbank Q."}
MACRO {Milchwissenschaft} {"Milchwissenschaft"}
MACRO {MilMed} {"Mil. Med."}
MACRO {MilPsychol} {"Mil. Psychol."}
MACRO {MiljoenFinlandFinnishEnviron} {"Miljoen Finland/Finnish Environ."}
MACRO {MiljoeverndeptRep} {"Miljoeverndept. Rep."}
MACRO {MiniRevDataFileFishResFishResLabKagoshimaUniv} {"Mini Rev. Data File Fish. Res. Fish. Res. Lab. Kagoshima Univ."}
MACRO {MiniRevMedChem} {"Mini-Rev. Med. Chem."}
MACRO {MinimInvasiveTherAlliedTechnol} {"Minim. Invasive Ther. Allied Technol."}
MACRO {MiningEng} {"Mining Eng."}
MACRO {MinistPolGuideFishDepWestAustralia} {"Minist. Pol. Guide. Fish. Dep. West. Australia"}
MACRO {MiscFundMiguelLillo} {"Misc. Fund. Miguel Lillo"}
MACRO {MiscPapUSArmyCoastEngResCent} {"Misc. Pap. U.S. Army Coast. Eng. Res. Cent."}
MACRO {MiscPapUSArmyEngWaterwaysExpStn} {"Misc. Pap. U.S. Army Eng. Waterways Exp. Stn."}
MACRO {MiscPapUSNavSurfWeaponsCent} {"Misc. Pap. U.S. Nav. Surf. Weapons Cent."}
MACRO {MiscPublGLFC} {"Misc. Publ. GLFC"}
MACRO {MiscRepToyohashiMusNatHist} {"Misc. Rep. Toyohashi Mus. Nat. Hist."}
MACRO {MiscRepMaineAgricExpStn} {"Misc. Rep. Maine Agric. Exp. Stn."}
MACRO {MiscRepUSArmyCoastEngResCent} {"Misc. Rep. U.S. Army Coast. Eng. Res. Cent."}
MACRO {MiscRepSerUSEnvironProtAgency} {"Misc. Rep. Ser. U.S. Environ. Prot. Agency"}
MACRO {MiscSerWestinghouseSavannahRiverCo} {"Misc. Ser. Westinghouse Savannah River Co."}
MACRO {MiscZool} {"Misc. Zool."}
MACRO {Mitochondrion} {"Mitochondrion"}
MACRO {MittHambZoolMusInst} {"Mitt. Hamb. Zool. Mus. Inst."}
MACRO {MittZoolMusUnivKiel} {"Mitt. Zool. Mus. Univ. Kiel"}
MACRO {MittZoolMusBerl} {"Mitt. Zool. Mus. Berl."}
MACRO {MittArbeitsgemRheinKoteopterol} {"Mitt. Arbeitsgem. Rhein. Koteopterol."}
MACRO {MittLandesforschungsanstLandwirtFischMecklenbgVorpommern} {"Mitt. Landesforschungsanst. Landwirt. Fisch. Mecklenbg.-Vorpommern"}
MACRO {MittNaturforschGesBeiderBasel} {"Mitt. Naturforsch. Ges. Beider Basel"}
MACRO {MittSchweizEntomolGes} {"Mitt. Schweiz. Entomol. Ges."}
MACRO {MittFranziusInstWasserbauKuesteningenieurwesenUnivHannover} {"Mitt. Franzius-Inst. Wasserbau Kuesteningenieurwesen Univ. Hannover"}
MACRO {MittIntEntomolVerFrankfurt} {"Mitt. Int. Entomol. Ver. Frankfurt"}
MACRO {MittFisch} {"Mitt. Fisch."}
MACRO {MittIntVerTheorAngewLimnolCommunIntAssocTheorApplLimnolCommunAssocIntLimnolTheorAppl} {"Mitt. Int. Ver. Theor. Angew. Limnol./Commun. Int. Assoc. Theor. Appl. Limnol./Commun. Assoc. Int. Limnol. Theor. Appl."}
MACRO {MiyagiPrefectRepFishSci} {"Miyagi Prefect. Rep. Fish. Sci."}
MACRO {ModCast} {"Mod. Cast."}
MACRO {ModGeol} {"Mod. Geol."}
MACRO {ModMaterHandl} {"Mod. Mater. Handl."}
MACRO {ModPowerSyst} {"Mod. Power Syst."}
MACRO {MoereforskAalesundRapp} {"Moereforsk. Aalesund Rapp."}
MACRO {MolBiochemParasitol} {"Mol. Biochem. Parasitol."}
MACRO {MolCellBiochem} {"Mol. Cell. Biochem."}
MACRO {MolCellBiol} {"Mol. Cell. Biol."}
MACRO {MolCellEndocrinol} {"Mol. Cell. Endocrinol."}
MACRO {MolCellNeurosci} {"Mol. Cell. Neurosci."}
MACRO {MolCellProteomics} {"Mol. Cell. Proteomics"}
MACRO {MolChemNeuropathol} {"Mol. Chem. Neuropathol."}
MACRO {MolGenGenet} {"Mol. Gen. Genet."}
MACRO {MolBiol} {"Mol. Biol."}
MACRO {MolBiolEvol} {"Mol. Biol. Evol."}
MACRO {MolBiolRep} {"Mol. Biol. Rep."}
MACRO {MolBiolToday} {"Mol. Biol. Today"}
MACRO {MolBiotechnol} {"Mol. Biotechnol."}
MACRO {MolBrainRes} {"Mol. Brain Res."}
MACRO {MolBreed} {"Mol. Breed."}
MACRO {MolCancerRes} {"Mol. Cancer Res."}
MACRO {MolCancerTher} {"Mol. Cancer Ther."}
MACRO {MolCarcinog} {"Mol. Carcinog."}
MACRO {MolCell} {"Mol. Cell"}
MACRO {MolDivers} {"Mol. Divers."}
MACRO {MolEcol} {"Mol. Ecol."}
MACRO {MolEcolNotes} {"Mol. Ecol. Notes"}
MACRO {MolEndocrinol} {"Mol. Endocrinol."}
MACRO {MolGenetGenomics} {"Mol. Genet. Genomics"}
MACRO {MolGenetMetab} {"Mol. Genet. Metab."}
MACRO {MolHumanReprod} {"Mol. Human Reprod."}
MACRO {MolImmunol} {"Mol. Immunol."}
MACRO {MolInterventions} {"Mol. Interventions"}
MACRO {MolMarBiolBiotechnol} {"Mol. Mar. Biol. Biotechnol."}
MACRO {MolMedToday} {"Mol. Med. Today"}
MACRO {MolMembrBiol} {"Mol. Membr. Biol."}
MACRO {MolMicrobiol} {"Mol. Microbiol."}
MACRO {MolNeurobiol} {"Mol. Neurobiol."}
MACRO {MolNutrFoodRes} {"Mol. Nutr. Food Res."}
MACRO {MolPharm} {"Mol. Pharm."}
MACRO {MolPharmacol} {"Mol. Pharmacol."}
MACRO {MolPhylogenEvol} {"Mol. Phylogen. Evol."}
MACRO {MolPlantPathol} {"Mol. Plant Pathol."}
MACRO {MolPlantMicrobeInteract} {"Mol. Plant-Microbe Interact."}
MACRO {MolPsychiatry} {"Mol. Psychiatry"}
MACRO {MolReprodDev} {"Mol. Reprod. Dev."}
MACRO {MolSystBiol} {"Mol. Syst. Biol."}
MACRO {MolBiolMosc} {"Mol. Biol. (Mosc.)"}
MACRO {MolluscanRes} {"Molluscan Res."}
MACRO {MonogrInstZoolDrAugustoNobre} {"Monogr. Inst. Zool. Dr. Augusto Nobre"}
MACRO {MonogrSerAustInstMarSci} {"Monogr. Ser. Aust. Inst. Mar. Sci."}
MACRO {MonogrDivAgricCommEconAfr} {"Monogr. Div. Agric. Comm. Econ. Afr."}
MACRO {MonogrBiol} {"Monogr. Biol."}
MACRO {MonogrNedEntomolVer} {"Monogr. Ned. Entomol. Ver."}
MACRO {MonogrMarMollusca} {"Monogr. Mar. Mollusca"}
MACRO {MonogrBorealEnvironRes} {"Monogr. Boreal Environ. Res."}
MACRO {MonogrUpperSilesMus} {"Monogr. Upper Siles. Mus."}
MACRO {MonogrWestNAmNat} {"Monogr. West. N. Am. Nat."}
MACRO {MonogrMarSciMonogrThalassEpistimon} {"Monogr. Mar. Sci./Monogr. Thalass. Epistimon"}
MACRO {MonFishInfBull} {"Mon. Fish. Inf. Bull."}
MACRO {MonWeatherRev} {"Mon. Weather Rev."}
MACRO {MorbMortalWeeklyRep} {"Morb. Mortal. Weekly Rep."}
MACRO {MorEhkolZhMarEcolJMorEhkolZh} {"Mor. Ehkol. Zh./Mar. Ecol. J./Mor. Ehkol. Zh."}
MACRO {MorskGidrofizZh} {"Morsk. Gidrofiz. Zh."}
MACRO {MotivEmotion} {"Motiv. Emotion"}
MACRO {MouseGenome} {"Mouse Genome"}
MACRO {Mputa} {"Mputa"}
MACRO {MRCTechPap} {"MRC Tech. Pap."}
MACRO {MRFPTechRep} {"MRFP Tech. Rep."}
MACRO {MuenchBeitrAbwasserFischFlussbiol} {"Muench. Beitr. Abwasser-Fisch.-Flussbiol."}
MACRO {MultipleSclerosis} {"Multiple Sclerosis"}
MACRO {MuscleNerve} {"Muscle Nerve"}
MACRO {MuseolSci} {"Museol. Sci."}
MACRO {Mutagenesis} {"Mutagenesis"}
MACRO {MutatRes} {"Mutat. Res."}
MACRO {MutatResDNAgingGenetInstabilAging} {"Mutat. Res.-DNAging Genet. Instabil. Aging"}
MACRO {MutatResEnvironMutagRelatedSubj} {"Mutat. Res.-Environ. Mutag. Related Subj."}
MACRO {MutatResFundamMolMechMutag} {"Mutat. Res.-Fundam. Mol. Mech. Mutag."}
MACRO {MutatResGenToxicolEnvironMutag} {"Mutat. Res.- Gen. Toxicol. Environ. Mutag."}
MACRO {MutatResGenetToxicolEnvironMutag} {"Mutat. Res.-Genet. Toxicol. Environ. Mutag."}
MACRO {MutatResMutatResLett} {"Mutat. Res.-Mutat. Res. Lett."}
MACRO {MutatResRevGenetToxicol} {"Mutat. Res.-Rev. Genet. Toxicol."}
MACRO {MutatResRevMutRes} {"Mutat. Res. - Rev. Mut. Res."}
MACRO {MutatResDNARepair} {"Mutat. Res./DNA Repair"}
MACRO {Mycologia} {"Mycologia"}
MACRO {MycolHelv} {"Mycol. Helv."}
MACRO {MycolRes} {"Mycol. Res."}
MACRO {Mycologist} {"Mycologist"}
MACRO {Mycopathologia} {"Mycopathologia"}
MACRO {Mycorrhiza} {"Mycorrhiza"}
MACRO {Mycoscience} {"Mycoscience"}
MACRO {Mycoses} {"Mycoses"}
MACRO {Ntturufraedingurinn} {"N tturufraedingurinn"}
MACRO {NtturufraedistofnuninFjaelritInstNatHistRep} {"N tturufraedistofnunin Fjaelrit/Inst. Nat. Hist. Rep."}
MACRO {NACANewsl} {"NACA Newsl."}
MACRO {NACCNovaActaCientCompostelBiol} {"NACC Nova Acta Cient. Compostel. (Biol.)"}
MACRO {NAFOHandb} {"NAFO Handb."}
MACRO {Naga} {"Naga"}
MACRO {NamibBrief} {"Namib. Brief"}
MACRO {NAMMCOAnnuRep} {"NAMMCO Annu. Rep."}
MACRO {NAMMCOSciPub} {"NAMMCO Sci. Pub."}
MACRO {NanhaiStudMarSinNanhaiHaiyangKexueJikan} {"Nanhai Stud. Mar. Sin./Nanhai Haiyang Kexue Jikan"}
MACRO {NanoLett} {"Nano Lett."}
MACRO {Nanobiology} {"Nanobiology"}
MACRO {Nanotechnology} {"Nanotechnology"}
MACRO {NASAContractRep} {"NASA Contract Rep."}
MACRO {NASATechMemo} {"NASA Tech. Memo."}
MACRO {NASATechPap} {"NASA Tech. Pap."}
MACRO {NaseMore} {"Nase More"}
MACRO {NatlAcadSciLett} {"Natl. Acad. Sci. Lett."}
MACRO {NatlBiolServInfTechnolRep} {"Natl. Biol. Serv.: Inf. Technol. Rep."}
MACRO {NatlSaf} {"Natl. Saf."}
MACRO {NatlWildlife} {"Natl. Wildlife"}
MACRO {NATOAdvSciInstSerALifeSci} {"NATO Adv. Sci. Inst. Ser. A Life Sci."}
MACRO {NATOAdvSciInstSerCMathPhysSci} {"NATO Adv. Sci. Inst. Ser. C Math. Phys. Sci."}
MACRO {NATOAdvSciInstSerEApplSci} {"NATO Adv. Sci. Inst. Ser. E Appl. Sci."}
MACRO {NATOAdvSciInstSerGEcolSci} {"NATO Adv. Sci. Inst. Ser. G Ecol. Sci."}
MACRO {NATOAdvSciInstSerIGlobalEnvironChange} {"NATO Adv. Sci. Inst. Ser. I Global Environ. Change"}
MACRO {NATOConfSer1Ecol} {"NATO Conf. Ser. (1 Ecol.)"}
MACRO {NATOConfSer4MarSci} {"NATO Conf. Ser. (4 Mar. Sci.)"}
MACRO {NATOConfSer5AirSeaInteract} {"NATO Conf. Ser. (5 Air-Sea Interact.)"}
MACRO {NATOSciSerSerALifeSci} {"NATO Sci. Ser. Ser. A. Life Sci."}
MACRO {NatLandschaft} {"Nat. Landschaft"}
MACRO {NatMus} {"Nat. Mus."}
MACRO {NaturaCaracas} {"Natura (Caracas)"}
MACRO {NatCroatSuppl} {"Nat. Croat. Suppl."}
MACRO {NatCroat} {"Nat. Croat."}
MACRO {NatJutl} {"Nat. Jutl."}
MACRO {NatNeotrop} {"Nat. Neotrop."}
MACRO {NatSlov} {"Nat. Slov."}
MACRO {NatAreasJ} {"Nat. Areas J."}
MACRO {NatComputing} {"Nat. Computing"}
MACRO {NatHazards} {"Nat. Hazards"}
MACRO {NatHazardsObs} {"Nat. Hazards Obs."}
MACRO {NatHazardsRev} {"Nat. Hazards Rev."}
MACRO {NatImmun} {"Nat. Immun."}
MACRO {NatProdLett} {"Nat. Prod. Lett."}
MACRO {NatProdRes} {"Nat. Prod. Res."}
MACRO {NatResourModel} {"Nat. Resour. Model."}
MACRO {NatResourEnviron} {"Nat. Resour. Environ."}
MACRO {NatResourEnvironIss} {"Nat. Resour. Environ. Iss."}
MACRO {NatResourForumUN} {"Nat. Resour. Forum, UN"}
MACRO {NatResourJ} {"Nat. Resour. J."}
MACRO {NatToxins} {"Nat. Toxins"}
MACRO {Naturalia} {"Naturalia"}
MACRO {NaturaliaPatagonicaCiencBiol} {"Naturalia Patagonica Cienc. Biol."}
MACRO {NaturaliaPatagonicaRepTec} {"Naturalia Patagonica Rep. Tec."}
MACRO {Naturalist} {"Naturalist"}
MACRO {Nature} {"Nature"}
MACRO {NatAust} {"Nat. Aust."}
MACRO {NatBiotechnol} {"Nat. Biotechnol."}
MACRO {NatCellBiol} {"Nat. Cell Biol."}
MACRO {NatClinPractCardiovascMed} {"Nat. Clin. Pract. Cardiovasc. Med."}
MACRO {NatClinPractGastroenterolHepatol} {"Nat. Clin. Pract. Gastroenterol. Hepatol."}
MACRO {NatClinPractOncol} {"Nat. Clin. Pract. Oncol."}
MACRO {NatClinPractUrol} {"Nat. Clin. Pract. Urol."}
MACRO {NatGenet} {"Nat. Genet."}
MACRO {NatImmunol} {"Nat. Immunol."}
MACRO {NatMed} {"Nat. Med."}
MACRO {NatNeurosci} {"Nat. Neurosci."}
MACRO {NatRevCancer} {"Nat. Rev. Cancer"}
MACRO {NatRevDrugDiscov} {"Nat. Rev. Drug Discov."}
MACRO {NatRevGenet} {"Nat. Rev. Genet."}
MACRO {NatRevImmunol} {"Nat. Rev. Immunol."}
MACRO {NatRevMicrobiol} {"Nat. Rev. Microbiol."}
MACRO {NatRevMolCellBiol} {"Nat. Rev. Mol. Cell Biol."}
MACRO {NatRevNeurosci} {"Nat. Rev. Neurosci."}
MACRO {NatStructMolBiol} {"Nat. Struct. Mol. Biol."}
MACRO {NatStructBiol} {"Nat. Struct. Biol."}
MACRO {NatEnvironPollutTechnol} {"Nat., Environ. Pollut. Technol."}
MACRO {NatSciSoc} {"Nat. Sci. Soc"}
MACRO {Naturwissenschaften} {"Naturwissenschaften"}
MACRO {NaturwissRundschStuttg} {"Naturwiss. Rundsch. Stuttg."}
MACRO {NauchnTrZoolMuzOGUSciWorksZoolMusOGU} {"Nauchn. Tr. Zool. Muz. OGU/Sci. Works. Zool. Mus. OGU"}
MACRO {NaunynSchmiedebergsArchPharmacol} {"Naunyn-Schmiedeberg's Arch. Pharmacol."}
MACRO {Nauplius} {"Nauplius"}
MACRO {Nautilus} {"Nautilus"}
MACRO {NavEngJ} {"Nav. Eng. J."}
MACRO {NavigationParis} {"Navigation (Paris)"}
MACRO {NavigationWash} {"Navigation (Wash.)"}
MACRO {NavorsNasMusBloemfontein} {"Navors. Nas. Mus. Bloemfontein"}
MACRO {NDTEInt} {"NDT E Int."}
MACRO {NEANews} {"NEA News"}
MACRO {NEANewslett} {"NEA Newslett."}
MACRO {NebrMedJ} {"Nebr. Med. J."}
MACRO {NedTijdschrGeneeskd} {"Ned. Tijdschr. Geneeskd."}
MACRO {Neoplasia} {"Neoplasia"}
MACRO {Neoplasma} {"Neoplasma"}
MACRO {Neotropica} {"Neotropica"}
MACRO {NeotropNotasZoolAm} {"Neotrop. Notas Zool. Am."}
MACRO {NeotropEntomol} {"Neotrop. Entomol."}
MACRO {NephrolDialTransplant} {"Nephrol. Dial. Transplant."}
MACRO {Neritica} {"Neritica"}
MACRO {NethIntLawRev} {"Neth. Int. Law Rev."}
MACRO {NetherlandsJAquatEcol} {"Netherlands J. Aquat. Ecol."}
MACRO {NethJZool} {"Neth. J. Zool."}
MACRO {NethQHumRights} {"Neth. Q. Hum. Rights"}
MACRO {NethYearbIntLaw} {"Neth. Yearb. Int. Law"}
MACRO {NetworkComputNeuralSyst} {"Network: Comput. Neural Syst."}
MACRO {NeuesJahrbGeolPalaeontolAbh} {"Neues Jahrb. Geol. Palaeontol. Abh."}
MACRO {NeuralComput} {"Neural Comput."}
MACRO {NeuralNetworks} {"Neural Networks"}
MACRO {NeurobiolAging} {"Neurobiol. Aging"}
MACRO {NeurobiolLearnMem} {"Neurobiol. Learn. Mem."}
MACRO {NeurochemRes} {"Neurochem. Res."}
MACRO {NeurochemInt} {"Neurochem. Int."}
MACRO {Neurocomputing} {"Neurocomputing"}
MACRO {Neuroendocrinology} {"Neuroendocrinology"}
MACRO {Neuroepidemiology} {"Neuroepidemiology"}
MACRO {Neuroinformatics} {"Neuroinformatics"}
MACRO {NeurolRes} {"Neurol. Res."}
MACRO {Neurology} {"Neurology"}
MACRO {Neuromethods} {"Neuromethods"}
MACRO {NeuromolecularMed} {"Neuromolecular Med."}
MACRO {Neuron} {"Neuron"}
MACRO {Neuropathology} {"Neuropathology"}
MACRO {NeuropatholApplNeurobiol} {"Neuropathol. Appl. Neurobiol."}
MACRO {NeuropatolPol} {"Neuropatol. Pol."}
MACRO {Neuropeptides} {"Neuropeptides"}
MACRO {Neuropharmacology} {"Neuropharmacology"}
MACRO {Neurophysiology} {"Neurophysiology"}
MACRO {Neuroradiology} {"Neuroradiology"}
MACRO {NeurorehabNeuralRepair} {"Neurorehab. Neural Repair"}
MACRO {Neuroreport} {"Neuroreport"}
MACRO {Neuroscience} {"Neuroscience"}
MACRO {NeurosciBiobehavRev} {"Neurosci. Biobehav. Rev."}
MACRO {NeurosciBehavPhysiol} {"Neurosci. Behav. Physiol."}
MACRO {NeurosciLett} {"Neurosci. Lett."}
MACRO {NerosciNews} {"Nerosci. News"}
MACRO {NeurosciResCommun} {"Neurosci. Res. Commun."}
MACRO {Neuroscientist} {"Neuroscientist"}
MACRO {Neurotoxicology} {"Neurotoxicology"}
MACRO {NeurotoxicolTeratol} {"Neurotoxicol. Teratol."}
MACRO {NewEnglJMed} {"New Engl. J. Med."}
MACRO {NewMicrobiol} {"New Microbiol."}
MACRO {NewPhytol} {"New Phytol."}
MACRO {NewSci} {"New Sci."}
MACRO {NewSolutions} {"New Solutions"}
MACRO {NZEntomol} {"N. Z. Entomol."}
MACRO {NZFishAssessRep} {"N.Z. Fish. Assess. Rep."}
MACRO {NZFishDataRep} {"N.Z. Fish. Data Rep."}
MACRO {NZFishOccasPubl} {"N.Z. Fish. Occas. Publ."}
MACRO {NZJAgricRes} {"N. Z. J. Agric. Res."}
MACRO {NZJBot} {"N. Z. J. Bot."}
MACRO {NZJCropHorticSci} {"N. Z. J. Crop Hortic. Sci."}
MACRO {NZJEcol} {"N. Z. J. Ecol."}
MACRO {NZJGeolGeophys} {"N. Z. J. Geol. Geophys."}
MACRO {NZJMarFreshwatRes} {"N. Z. J. Mar. Freshwat. Res."}
MACRO {NZJZool} {"N. Z. J. Zool."}
MACRO {NZMedJ} {"N. Z. Med. J."}
MACRO {NZOceanogrInstChartCoastser} {"N.Z. Oceanogr. Inst. Chart Coast ser."}
MACRO {NZOceanogrInstChartIslSer} {"N.Z. Oceanogr. Inst. Chart Isl. Ser."}
MACRO {NZOceanogrInstChartLakeSer} {"N.Z. Oceanogr. Inst. Chart Lake Ser."}
MACRO {NZOceanogrInstChartMiscSer} {"N.Z. Oceanogr. Inst. Chart Misc. Ser."}
MACRO {NZOceanogrInstMem} {"N.Z. Oceanogr. Inst. Mem."}
MACRO {NZSeafIndEconRev} {"N.Z. Seaf. Ind. Econ. Rev."}
MACRO {NicotineTobaccoRes} {"Nicotine Tobacco Res."}
MACRO {NIFFRNewsl} {"NIFFR Newsl."}
MACRO {NigerFishAquatSciAbstr} {"Niger. Fish. Aquat. Sci. Abstr."}
MACRO {NigerianJBiotechnol} {"Nigerian J. Biotechnol."}
MACRO {NigerJGenet} {"Niger. J. Genet."}
MACRO {NINAProjectRep} {"NINA Project Rep."}
MACRO {NINATemahefte} {"NINA Temahefte"}
MACRO {NINANIKUProjectRep} {"NINA-NIKU Project Rep."}
MACRO {NIOZRapp} {"NIOZ Rapp."}
MACRO {NipponNogeiKagakukaishi} {"Nippon Nogei Kagakukaishi"}
MACRO {NipponNoyakuGakkaishiJPesticSci} {"Nippon Noyaku Gakkaishi/J. Pestic. Sci."}
MACRO {NipponSuisanGakkaishi} {"Nippon Suisan Gakkaishi"}
MACRO {NIWAAnnuRep} {"NIWA Annu. Rep."}
MACRO {NIWABiodiversMem} {"NIWA Biodivers. Mem."}
MACRO {NMRBiomed} {"NMR Biomed."}
MACRO {NOAADataRepERLAOML} {"NOAA Data Rep. ERL AOML"}
MACRO {NOAADataRepERLCMDL} {"NOAA Data Rep. ERL CMDL"}
MACRO {NOAADataRepERLETL} {"NOAA Data Rep. ERL ETL"}
MACRO {NOAADataRepERLGLERL} {"NOAA Data Rep. ERL GLERL"}
MACRO {NOAADataReportOARAOML} {"NOAA Data Report OAR AOML"}
MACRO {NOAADataRepOARARL} {"NOAA Data Rep. OAR ARL"}
MACRO {NOAADataRepOARPMEL} {"NOAA Data Rep. OAR PMEL"}
MACRO {NOAAProfPap} {"NOAA Prof. Pap."}
MACRO {NOAASpecRep} {"NOAA Spec. Rep."}
MACRO {NOAATechMemNMFSSWFSC} {"NOAA Tech. Mem. NMFS SWFSC"}
MACRO {NOAATechMemoERL} {"NOAA Tech. Memo. ERL"}
MACRO {NOAATechMemERLAL} {"NOAA Tech. Mem. ERL AL"}
MACRO {NOAATechMemERLAOML} {"NOAA Tech. Mem. ERL AOML"}
MACRO {NOAATechMemERLBOMAP} {"NOAA Tech. Mem. ERL BOMAP"}
MACRO {NOAATechMemERLCMDL} {"NOAA Tech. Mem. ERL CMDL"}
MACRO {NOAATechMemERLESG} {"NOAA Tech. Mem. ERL ESG"}
MACRO {NOAATechMemERLETL} {"NOAA Tech. Mem. ERL ETL"}
MACRO {NOAATechMemERLFSL} {"NOAA Tech. Mem. ERL FSL"}
MACRO {NOAATechMemERLGLERL} {"NOAA Tech. Mem. ERL GLERL"}
MACRO {NOAATechMemERLMMTC} {"NOAA Tech. Mem. ERL MMTC"}
MACRO {NOAATechMemERLNHEML} {"NOAA Tech. Mem. ERL NHEML"}
MACRO {NOAATechMemERLNHRL} {"NOAA Tech. Mem. ERL NHRL"}
MACRO {NOAATechMemoERLNSSL} {"NOAA Tech. Memo. ERL NSSL"}
MACRO {NOAATechMemERLNSSL} {"NOAA Tech. Mem. ERL NSSL"}
MACRO {NOAATechMemERLOD} {"NOAA Tech. Mem. ERL OD"}
MACRO {NOAATechMemERLOWRM} {"NOAA Tech. Mem. ERL OWRM"}
MACRO {NOAATechMemERLPMEL} {"NOAA Tech. Mem. ERL PMEL"}
MACRO {NOAATechMemERLSEC} {"NOAA Tech. Mem. ERL SEC"}
MACRO {NOAATechMemERLWMPO} {"NOAA Tech. Mem. ERL WMPO"}
MACRO {NOAATechMemoNESDIS} {"NOAA Tech. Memo. NESDIS"}
MACRO {NOAATechMemoNMFS} {"NOAA Tech. Memo. NMFS"}
MACRO {NOAATechMemNMFSAFSC} {"NOAA Tech. Mem. NMFS AFSC"}
MACRO {NOAATechMemNMFSFSPO} {"NOAA Tech. Mem. NMFS F/SPO"}
MACRO {NOAATechMemNMFSNE} {"NOAA Tech. Mem. NMFS NE"}
MACRO {NOAATechMemNMFSNWFSC} {"NOAA Tech. Mem. NMFS NWFSC"}
MACRO {NOAATechMemNMFSOPR} {"NOAA Tech. Mem. NMFS OPR"}
MACRO {NOAATechMemNMFSSEFSC} {"NOAA Tech. Mem. NMFS SEFSC"}
MACRO {NOAATechMemoNMFSSWFSC} {"NOAA Tech. Memo. NMFS SWFSC"}
MACRO {NOAATechMemoNOS} {"NOAA Tech. Memo. NOS"}
MACRO {NOAATechMemoNOSCS} {"NOAA Tech. Memo. NOS CS"}
MACRO {NOAATechMemoNWS} {"NOAA Tech. Memo. NWS"}
MACRO {NOAATechMemNWSCR} {"NOAA Tech. Mem. NWS CR"}
MACRO {NOAATechMemNWSSR} {"NOAA Tech. Mem. NWS SR"}
MACRO {NOAATechMemNWSWR} {"NOAA Tech. Mem. NWS WR"}
MACRO {NOAATechMemoOAR} {"NOAA Tech. Memo. OAR"}
MACRO {NOAATechMemoOARAOML} {"NOAA Tech. Memo. OAR AOML"}
MACRO {NOAATechMemOARARL} {"NOAA Tech. Mem. OAR ARL"}
MACRO {NOAATechMemOARETL} {"NOAA Tech. Mem. OAR ETL"}
MACRO {NOAATechMemOARFSL} {"NOAA Tech. Mem. OAR FSL"}
MACRO {NOAATechMemoOARNSSL} {"NOAA Tech. Memo. OAR NSSL"}
MACRO {NOAATechMemOARPMEL} {"NOAA Tech. Mem. OAR PMEL"}
MACRO {NOAATechMemOARSEC} {"NOAA Tech. Mem. OAR SEC"}
MACRO {NOAATechMemo} {"NOAA Tech. Memo."}
MACRO {NOAATechRepERL} {"NOAA Tech. Rep. ERL"}
MACRO {NOAATechRepERLAOML} {"NOAA Tech. Rep. ERL AOML"}
MACRO {NOAATechRepERLARL} {"NOAA Tech. Rep. ERL ARL"}
MACRO {NOAATechRepERLETL} {"NOAA Tech. Rep. ERL ETL"}
MACRO {NOAATechRepERLFSL} {"NOAA Tech. Rep. ERL FSL"}
MACRO {NOAATechRepERLGLERL} {"NOAA Tech. Rep. ERL GLERL"}
MACRO {NOAATechRepNESDIS} {"NOAA Tech. Rep. NESDIS"}
MACRO {NOAATechRepNMFS} {"NOAA Tech. Rep. NMFS"}
MACRO {NOAATechRepNOSCOOPS} {"NOAA Tech. Rep. NOS CO-OPS"}
MACRO {NOAATechRepOARFSL} {"NOAA Tech. Rep. OAR FSL"}
MACRO {NOAATechRepOARSEC} {"NOAA Tech. Rep. OAR SEC"}
MACRO {NOAANMFSCurrFishStat} {"NOAA-NMFS Curr. Fish. Stat."}
MACRO {NoiseHealth} {"Noise Health"}
MACRO {NoiseVibratBull} {"Noise Vibrat. Bull."}
MACRO {NoiseVibratInd} {"Noise Vibrat. Ind."}
MACRO {NoiseControlEngJ} {"Noise Control Eng. J."}
MACRO {NondestrTestEval} {"Nondestr. Test. Eval."}
MACRO {NonlinearAnalModelControl} {"Nonlinear Anal. Model. Control"}
MACRO {NonlinearBiolToxicolMed} {"Nonlinear Biol. Toxicol. Med."}
MACRO {NorEaster} {"Nor'Easter"}
MACRO {Nord} {"Nord"}
MACRO {NordCommFoodAnalRep} {"Nord. Comm. Food Anal. Rep."}
MACRO {NordicHydrol} {"Nordic Hydrol."}
MACRO {NordJBot} {"Nord. J. Bot."}
MACRO {NordJFreshwatRes} {"Nord. J. Freshwat. Res."}
MACRO {NordSemArbejdsrapp} {"Nord. Sem. Arbejdsrapp."}
MACRO {NFRapp} {"NF-Rapp."}
MACRO {NorgesForskBioprodForedling} {"Norges Forsk. Bioprod. Foredling"}
MACRO {NHHDiscussPap} {"NHH Discuss. Pap."}
MACRO {NorgesHandelshoeyskSaertrykkserNorwegianSchEconReprSer} {"Norges Handelshoeysk. Saertrykkser./Norwegian Sch. Econ. Repr. Ser."}
MACRO {NHHSaertrykkser} {"NHH Saertrykkser."}
MACRO {NOUPubRepNorway} {"NOU/Pub. Rep. Norway"}
MACRO {NorinKinyuMonRevAgricForFishFinanc} {"Norin Kinyu/Mon. Rev. Agric. For. Fish. Financ."}
MACRO {Norois} {"Norois"}
MACRO {NorskInstLandbruksoekonomiskForsk} {"Norsk Inst. Landbruksoekonomisk Forsk."}
MACRO {NINAForskningsrapp} {"NINA Forskningsrapp."}
MACRO {NINAOppdragsmelding} {"NINA Oppdragsmelding"}
MACRO {NINAUtredning} {"NINA Utredning"}
MACRO {NIVARapp} {"NIVA Rapp."}
MACRO {NorskPolarinstMedd} {"Norsk Polarinst. Medd."}
MACRO {NorskVetTidsskr} {"Norsk Vet. Tidsskr."}
MACRO {NAmJAquacult} {"N. Am. J. Aquacult."}
MACRO {NAmJFishManage} {"N. Am. J. Fish. Manage."}
MACRO {NortheastNat} {"Northeast. Nat."}
MACRO {NorthAquacult} {"North. Aquacult."}
MACRO {NorthwestSci} {"Northwest Sci."}
MACRO {NorthwestNat} {"Northwest. Nat."}
MACRO {NorwegianJEntomol} {"Norwegian J. Entomol."}
MACRO {NorwegianSchEconBusAdmInstFishEconDiscussPapSer} {"Norwegian Sch. Econ. Bus. Adm. Inst. Fish. Econ. Discuss. Pap. Ser."}
MACRO {NotaLepidopterol} {"Nota Lepidopterol."}
MACRO {NotesFacFishKasetsartUniv} {"Notes Fac. Fish. Kasetsart Univ."}
MACRO {NotesTechSciMerOceanogrPhysCentNoumeaORSTOM} {"Notes Tech. Sci. Mer Oceanogr. Phys. Cent. Noumea ORSTOM"}
MACRO {NotMensMusNacHistNatChile} {"Not. Mens. Mus. Nac. Hist. Nat. (Chile)"}
MACRO {NotComerINFOPESCA} {"Not. Comer. INFOPESCA"}
MACRO {NotOdonatol} {"Not. Odonatol."}
MACRO {NouvRevEntomol} {"Nouv. Rev. Entomol."}
MACRO {NovaActaCientCompostelanaBiol} {"Nova Acta Cient. Compostelana (Biol.)"}
MACRO {NovaHedwigia} {"Nova Hedwigia"}
MACRO {NovaThalassia} {"Nova Thalassia"}
MACRO {NSWFishAnnuRep} {"N.S.W. Fish. Annu. Rep."}
MACRO {NSWFishFinalRepSer} {"N.S.W. Fish. Final Rep. Ser."}
MACRO {NSWFishFishResourAssessSer} {"N.S.W. Fish. Fish. Resour. Assess. Ser."}
MACRO {NTRITPPSpecPubl} {"NTR-ITPP Spec. Publ."}
MACRO {NuclEngDes} {"Nucl. Eng. Des."}
MACRO {NuclEngInt} {"Nucl. Eng. Int."}
MACRO {NuclPlantJ} {"Nucl. Plant J."}
MACRO {NuclSaf} {"Nucl. Saf."}
MACRO {NuclSciEng} {"Nucl. Sci. Eng."}
MACRO {NuclTechnol} {"Nucl. Technol."}
MACRO {NucleicAcidsRes} {"Nucleic Acids Res."}
MACRO {NucleosidesNucleotidesNuclAcids} {"Nucleosides Nucleotides Nucl. Acids"}
MACRO {NutrFoodSci} {"Nutr. Food Sci."}
MACRO {NutrCancer} {"Nutr. Cancer"}
MACRO {NutrRev} {"Nutr. Rev."}
MACRO {NutrNeurosci} {"Nutr. Neurosci."}
MACRO {NyFiskRappNewFishRep} {"Ny Fisk Rapp./New Fish Rep."}
MACRO {OberirdGewaesser} {"Oberird. Gewaesser"}
MACRO {ObesityRes} {"Obesity Res."}
MACRO {ObzInfVNIEhRKhAkvakult} {"Obz. Inf. VNIEhRKh (Akvakul't.)"}
MACRO {ObzInfVNIEhRKhMarikult} {"Obz. Inf. VNIEhRKh (Marikul't.)"}
MACRO {ObzInfVNIEhRKhRybokhozIspolzResurMirovOkeana} {"Obz. Inf. VNIEhRKh (Rybokhoz. Ispol'z. Resur. Mirov. Okeana)"}
MACRO {OccasPapSerLandWaterResourResDevCorp} {"Occas. Pap. Ser. Land Water Resour. Res. Dev. Corp."}
MACRO {OccasPapAustBurAgricResourEcon} {"Occas. Pap. Aust. Bur. Agric. Resour. Econ."}
MACRO {OccasPapCanWildlServ} {"Occas. Pap. Can. Wildl. Serv."}
MACRO {OccasPapFishSurvIndia} {"Occas. Pap. Fish. Surv. India"}
MACRO {OccasPapCalifAcadSci} {"Occas. Pap. Calif. Acad. Sci."}
MACRO {OccasPapInstArcticAlpineResUnivColorado} {"Occas. Pap. Inst. Arctic Alpine Res., Univ. Colorado"}
MACRO {OccasPapMollusks} {"Occas. Pap. Mollusks"}
MACRO {OccasPapJLBSmithInstIchthyol} {"Occas. Pap. J. L. B. Smith Inst. Ichthyol."}
MACRO {OccasPapMusZoolUnivMich} {"Occas. Pap. Mus. Zool. Univ. Mich."}
MACRO {OccasPublIrishBiogeogrSoc} {"Occas. Publ. Irish Biogeogr. Soc."}
MACRO {OccasPublFacFishMarSciUnivPertanianMalays} {"Occas. Publ. Fac. Fish. Mar. Sci. Univ. Pertanian Malays."}
MACRO {OccasPublFreshwatBiolAssocAmbleside} {"Occas. Publ. Freshwat. Biol. Assoc. Ambleside"}
MACRO {OccasPublMarBiolAssocUK} {"Occas. Publ. Mar. Biol. Assoc. U.K."}
MACRO {OccasPublUnivMarBiolStnMillport} {"Occas. Publ. Univ. Mar. Biol. Stn. Millport"}
MACRO {OccasPublIrBiogeogrSoc} {"Occas. Publ. Ir. Biogeogr. Soc."}
MACRO {OccupEnvironMed} {"Occup. Environ. Med."}
MACRO {OccupErgonomics} {"Occup. Ergonomics"}
MACRO {OccupHazards} {"Occup. Hazards"}
MACRO {OccupHealthSaf} {"Occup. Health Saf."}
MACRO {OccupHyg} {"Occup. Hyg."}
MACRO {OccupMed} {"Occup. Med."}
MACRO {OccupTherHealthCare} {"Occup. Ther. Health Care"}
MACRO {Ocenides} {"Oce nides"}
MACRO {OceanCoastManage} {"Ocean Coast. Manage."}
MACRO {OceanCoastLawJ} {"Ocean Coast. Law J."}
MACRO {OceanPolarRes} {"Ocean Polar Res."}
MACRO {OceanDevIntLaw} {"Ocean Dev. Int. Law"}
MACRO {OceanEng} {"Ocean Eng."}
MACRO {TheOceanEngHaiyangGongcheng} {"The Ocean Eng./Haiyang Gongcheng"}
MACRO {OceanModelOnline} {"Ocean Model. Online"}
MACRO {OceanNewsTechnol} {"Ocean News Technol."}
MACRO {OceanRes} {"Ocean Res."}
MACRO {OceanSci} {"Ocean Sci."}
MACRO {OceanSciDiscuss} {"Ocean Sci. Discuss."}
MACRO {OceanTechnolHaiyangJishu} {"Ocean Technol./Haiyang Jishu"}
MACRO {OceanVoice} {"Ocean Voice"}
MACRO {OceanYearb} {"Ocean Yearb."}
MACRO {OceanEngInt} {"Ocean. Eng. Int."}
MACRO {OceanisDocOceanogr} {"Oceanis (Doc. Oceanogr.)"}
MACRO {Oceanography} {"Oceanography"}
MACRO {OceanogrMarBiolAnnuRev} {"Oceanogr. Mar. Biol. Annu. Rev."}
MACRO {OceanogrMeteorol} {"Oceanogr. Meteorol."}
MACRO {OceanogrChinaZhongguoHaiyangxueWenji} {"Oceanogr. China/Zhongguo Haiyangxue Wenji"}
MACRO {Oceanologia} {"Oceanologia"}
MACRO {OceanolLimnolSinHaiyangYuHuzhao} {"Oceanol. Limnol. Sin./Haiyang Yu Huzhao"}
MACRO {OceanolActa} {"Oceanol. Acta"}
MACRO {OceanolHydrobiolStud} {"Oceanol. Hydrobiol. Stud."}
MACRO {OceanolStud} {"Oceanol. Stud."}
MACRO {OceanoramaInstOceanogrPaulRicard} {"Oceanorama Inst. Oceanogr. Paul Ricard"}
MACRO {Oceans9} {"Oceans 9-"}
MACRO {Oceanus} {"Oceanus"}
MACRO {OCSRepUSMinerManageServ} {"OCS Rep. U.S. Miner. Manage. Serv."}
MACRO {Odonatologica} {"Odonatologica"}
MACRO {OdontolPediatr} {"Odontol. Pediatr."}
MACRO {Oebalia} {"Oebalia"}
MACRO {OECDObs} {"OECD Obs."}
MACRO {Oecologia} {"Oecologia"}
MACRO {OecolAquat} {"Oecol. Aquat."}
MACRO {OecolMont} {"Oecol. Mont."}
MACRO {OECSFishRep} {"OECS Fish. Rep."}
MACRO {OekonomFiskeriforsk} {"Oekonom. Fiskeriforsk."}
MACRO {OekonAnalFiskeoppdrettEconAnalFishFarm} {"Oekon. Anal. Fiskeoppdrett/Econ. Anal. Fish Farm."}
MACRO {OesterrFisch} {"Oesterr. Fisch."}
MACRO {OffshoreEng} {"Offshore Eng."}
MACRO {OhioJSci} {"Ohio J. Sci."}
MACRO {Oikos} {"Oikos"}
MACRO {OilGasJ} {"Oil Gas J."}
MACRO {OilShale} {"Oil Shale"}
MACRO {OJTROccupParticipHealth} {"OJTR Occup. Particip. Health"}
MACRO {OkeanolIssledOceanolRes} {"Okeanol. Issled./Oceanol. Res."}
MACRO {Okeanologiya} {"Okeanologiya"}
MACRO {OkeanologiyaOceanologySofia} {"Okeanologiya/Oceanology (Sofia)"}
MACRO {Oligonucleotides} {"Oligonucleotides"}
MACRO {OljeGassvirksOilGasActStatSentralbyraaNorw} {"Olje Gassvirks./Oil Gas Act. Stat. Sentralbyraa (Norw.)"}
MACRO {OMICSJIntegrativeBiol} {"OMICS: J. Integrative Biol."}
MACRO {OnTheRiseInlandFishCommNewsl} {"On The Rise Inland Fish. Comm. Newsl."}
MACRO {Oncogene} {"Oncogene"}
MACRO {Oncologist} {"Oncologist"}
MACRO {OncolRep} {"Oncol. Rep."}
MACRO {OncolRes} {"Oncol. Res."}
MACRO {OnderstepoortJVetRes} {"Onderstepoort J. Vet. Res."}
MACRO {Onearth} {"Onearth"}
MACRO {ONGCBull} {"ONGC Bull."}
MACRO {OntFishTechRepSer} {"Ont. Fish. Tech. Rep. Ser."}
MACRO {OpenFileRepUSBurMines} {"Open-File Rep. U.S. Bur. Mines"}
MACRO {OpenFileRepUSGeolSurv} {"Open-File Rep. U.S. Geol. Surv."}
MACRO {OperaBot} {"Opera Bot."}
MACRO {Ophelia} {"Ophelia"}
MACRO {OphthalmicRes} {"Ophthalmic Res."}
MACRO {OphthalSurgLasersImag} {"Ophthal. Surg. Lasers Imag."}
MACRO {Ophthalmologica} {"Ophthalmologica"}
MACRO {Ophthalmology} {"Ophthalmology"}
MACRO {OpredPresnovodnVodoroslSSSR} {"Opred. Presnovodn. Vodorosl. S.S.S.R."}
MACRO {OpredFauneSSSR} {"Opred. Faune S.S.S.R."}
MACRO {OptionsMediterrBEtudeRech} {"Options Mediterr. (B Etude Rech.)"}
MACRO {OpuscZoolFlumin} {"Opusc. Zool. Flumin."}
MACRO {OralMicrobiolImmunol} {"Oral Microbiol. Immunol."}
MACRO {OralOncol} {"Oral Oncol."}
MACRO {OralOncolSuppl} {"Oral Oncol. Suppl."}
MACRO {OregLawRev} {"Oreg. Law Rev."}
MACRO {OrgGeochem} {"Org. Geochem."}
MACRO {OrgDiversEvol} {"Org. Divers. Evol."}
MACRO {OrientInsects} {"Orient. Insects"}
MACRO {OrnisFenn} {"Ornis Fenn."}
MACRO {OrnisNorv} {"Ornis Norv."}
MACRO {OrnisSvec} {"Ornis Svec."}
MACRO {Orthopedics} {"Orthopedics"}
MACRO {OryktPloutMinerWealth} {"Orykt. Plout./Miner. Wealth"}
MACRO {Oryx} {"Oryx"}
MACRO {Oseana} {"Oseana"}
MACRO {OsteoporosisInt} {"Osteoporosis Int."}
MACRO {Ostrich} {"Ostrich"}
MACRO {OvervAquac} {"Overv. Aquac."}
MACRO {OvervFishEconOrgan} {"Overv. Fish. Econ. Organ."}
MACRO {OvervMarFish} {"Overv. Mar. Fish."}
MACRO {OvervSeafProcessPreserv} {"Overv. Seaf. Process. Preserv."}
MACRO {PacAsianJEnergy} {"Pac. Asian J. Energy"}
MACRO {PacConservBiol} {"Pac. Conserv. Biol."}
MACRO {PacDiscov} {"Pac. Discov."}
MACRO {PacificFish} {"Pacific Fish."}
MACRO {PacHalibutFishRegul} {"Pac. Halibut Fish. Regul."}
MACRO {PacRev} {"Pac. Rev."}
MACRO {PacSci} {"Pac. Sci."}
MACRO {PackagTechnolSci} {"Packag. Technol. Sci."}
MACRO {PainRev} {"Pain Rev."}
MACRO {PakJMarSci} {"Pak. J. Mar. Sci."}
MACRO {PakJSci} {"Pak. J. Sci."}
MACRO {PakJZool} {"Pak. J. Zool."}
MACRO {PakSeafDig} {"Pak. Seaf. Dig."}
MACRO {Palaeobotanist} {"Palaeobotanist"}
MACRO {PalaeogeogrPalaeoclimatolPalaeoecol} {"Palaeogeogr., Palaeoclimatol., Palaeoecol."}
MACRO {Palaeontology} {"Palaeontology"}
MACRO {Palaios} {"Palaios"}
MACRO {Paleobiology} {"Paleobiology"}
MACRO {Paleoceanography} {"Paleoceanography"}
MACRO {PaleontolMex} {"Paleontol. Mex."}
MACRO {PanPacEntomol} {"Pan-Pac. Entomol."}
MACRO {PanoramaAtunero} {"Panorama Atunero"}
MACRO {PanoramaPesq} {"Panorama Pesq."}
MACRO {PapAvulsZool} {"Pap. Avuls. Zool."}
MACRO {PapProcRSocTasman} {"Pap. Proc. R. Soc. Tasman."}
MACRO {PNGNatlFishAuthNewsl} {"P.N.G. Natl. Fish. Auth. Newsl."}
MACRO {Parasite} {"Parasite"}
MACRO {ParasiteImmunol} {"Parasite Immunol."}
MACRO {Parasitica} {"Parasitica"}
MACRO {Parasitology} {"Parasitology"}
MACRO {ParasitolInt} {"Parasitol. Int."}
MACRO {ParasitolRes} {"Parasitol. Res."}
MACRO {ParasitolToday} {"Parasitol. Today"}
MACRO {Parassitologia} {"Parassitologia"}
MACRO {ParazitolSb} {"Parazitol. Sb."}
MACRO {Parazitologiya} {"Parazitologiya"}
MACRO {ParmaImpiantiTecFoodProcessPlants} {"Parma Impianti Tec./Food Process. Plants"}
MACRO {PatholBiol} {"Pathol. Biol."}
MACRO {Pathology} {"Pathology"}
MACRO {PatientCare} {"Patient Care"}
MACRO {PatrimNat} {"Patrim. Nat."}
MACRO {PatternRecogLett} {"Pattern Recog. Lett."}
MACRO {Pavo} {"Pavo"}
MACRO {PCIJ} {"PCI J."}
MACRO {PeaceChange} {"Peace Change"}
MACRO {PearlOysterInfBull} {"Pearl Oyster Inf. Bull."}
MACRO {PediatrAIDSHIVInfect} {"Pediatr. AIDS HIV Infect."}
MACRO {PediatrHematolOncol} {"Pediatr. Hematol. Oncol."}
MACRO {PediatrInfectDisJ} {"Pediatr. Infect. Dis. J."}
MACRO {Pediatrics} {"Pediatrics"}
MACRO {Pedobiologia} {"Pedobiologia"}
MACRO {Pedosphere} {"Pedosphere"}
MACRO {PennarBed} {"Penn ar Bed"}
MACRO {Peptides} {"Peptides"}
MACRO {PerangkaanTahunanPerikananJabatanPerikananMalaysAnnuFishStatFishDepMalays} {"Perangkaan Tahunan Perikanan Jabatan Perikanan (Malays.)/Annu. Fish. Stat. Fish. Dep. (Malays.)"}
MACRO {PerceptMotorSkills} {"Percept. Motor Skills"}
MACRO {PerfumFlavor} {"Perfum. Flavor."}
MACRO {PeriodOceanUnivChinaZhongguoHaiyangDaxueXuebao} {"Period. Ocean Univ. China/Zhongguo Haiyang Daxue Xuebao"}
MACRO {PeriodBiol} {"Period. Biol."}
MACRO {Persoonia} {"Persoonia"}
MACRO {PerspectDrugDiscovDes} {"Perspect. Drug Discov. Des."}
MACRO {PerspectPlantEcolEvolSyst} {"Perspect. Plant Ecol. Evol. Syst."}
MACRO {PerspectDevNeurobiol} {"Perspect. Dev. Neurobiol."}
MACRO {PertanikaJTropAgricSci} {"Pertanika J. Trop. Agric. Sci."}
MACRO {PeruPesq} {"Peru Pesq."}
MACRO {PervGlobEhkspPIGAP} {"Perv. Glob. Ehksp. PIGAP"}
MACRO {Pesca} {"Pesca"}
MACRO {PescaMerc} {"Pesca Merc."}
MACRO {PescaNaveg} {"Pesca Naveg."}
MACRO {PescaMarBarcoPesq} {"Pesca Mar. Barco Pesq."}
MACRO {PesquiAntartBras} {"Pesqui. Antart. Bras."}
MACRO {PesquiNav} {"Pesqui. Nav."}
MACRO {PestManageSci} {"Pest Manage. Sci."}
MACRO {Pesticidas} {"Pesticidas"}
MACRO {PesticBiochemPhysiol} {"Pestic. Biochem. Physiol."}
MACRO {PesticSci} {"Pestic. Sci."}
MACRO {PetRev} {"Pet. Rev."}
MACRO {PfluegersArchEurJPhysiol} {"Pfluegers Arch./Eur. J. Physiol."}
MACRO {PharmBiol} {"Pharm. Biol."}
MACRO {PharmDevTechnol} {"Pharm. Dev. Technol."}
MACRO {Pharmaceuticals} {"Pharmaceuticals"}
MACRO {PharmacoepidemiolDrugSaf} {"Pharmacoepidemiol. Drug Saf."}
MACRO {PharmacogenomJ} {"Pharmacogenom. J."}
MACRO {PharmacolRes} {"Pharmacol. Res."}
MACRO {PharmacolRev} {"Pharmacol. Rev."}
MACRO {Pharmacology} {"Pharmacology"}
MACRO {PharmacolTher} {"Pharmacol. Ther."}
MACRO {PharmacolToxicol} {"Pharmacol. Toxicol."}
MACRO {PharmacolBiochemBehav} {"Pharmacol. Biochem. Behav."}
MACRO {PharmacolRevComm} {"Pharmacol. Rev. Comm."}
MACRO {Pharmacotherapy} {"Pharmacotherapy"}
MACRO {Pheromones} {"Pheromones"}
MACRO {PhilippJSci} {"Philipp J. Sci."}
MACRO {PhilippSci} {"Philipp. Sci."}
MACRO {PhilosTransRSocLondSerAMathPhysEngSci} {"Philos. Trans. R. Soc. Lond., Ser. A: Math., Phys. Eng. Sci."}
MACRO {PhilosTransRSocLondSerB} {"Philos. Trans. R. Soc. Lond., Ser. B: Biol. Sci."}
MACRO {PhotochemPhotobiol} {"Photochem. Photobiol."}
MACRO {PhotogrammEngRemoteSensing} {"Photogramm. Eng. Remote Sensing"}
MACRO {Photonirvachak} {"Photonirvachak"}
MACRO {PhotosynthesisRes} {"Photosynthesis Res."}
MACRO {Photosynthetica} {"Photosynthetica"}
MACRO {Phycologia} {"Phycologia"}
MACRO {PhycolRes} {"Phycol. Res."}
MACRO {Phykos} {"Phykos"}
MACRO {PhysOceanogrMorskGidrofizZh} {"Phys. Oceanogr./Morsk. Gidrofiz. Zh."}
MACRO {PhysicianSportsmed} {"Physician Sportsmed."}
MACRO {PhysicsChemEarthBHydrolOceansAtmosphere} {"Physics Chem. Earth: B: Hydrol., Oceans Atmosphere"}
MACRO {PhysFluids} {"Phys. Fluids"}
MACRO {PhysiolPlant} {"Physiol. Plant."}
MACRO {PhysiolBiochemZool} {"Physiol. Biochem. Zool."}
MACRO {PhysiolMolPlantPathol} {"Physiol. Mol. Plant Pathol."}
MACRO {PhysiolEntomol} {"Physiol. Entomol."}
MACRO {PhysiolGenomics} {"Physiol. Genomics"}
MACRO {PhysiolMeas} {"Physiol. Meas."}
MACRO {PhysiolRev} {"Physiol. Rev."}
MACRO {PhysiolZool} {"Physiol. Zool."}
MACRO {Physiology} {"Physiology"}
MACRO {PhysiolBehav} {"Physiol. Behav."}
MACRO {PhysiolMolBiolPlants} {"Physiol. Mol. Biol. Plants"}
MACRO {PhysisABC} {"Physis (A, B, C)"}
MACRO {PhytochemAnal} {"Phytochem. Anal."}
MACRO {Phytochemistry} {"Phytochemistry"}
MACRO {PhytochemRev} {"Phytochem. Rev."}
MACRO {Phytocoenologia} {"Phytocoenologia"}
MACRO {Phytologia} {"Phytologia"}
MACRO {Phytomedicine} {"Phytomedicine"}
MACRO {PhytonBAires} {"Phyton (B. Aires)"}
MACRO {Phytoparasitica} {"Phytoparasitica"}
MACRO {Phytopathology} {"Phytopathology"}
MACRO {Phytophaga} {"Phytophaga"}
MACRO {Phytoprotection} {"Phytoprotection"}
MACRO {PhytotherRes} {"Phytother. Res."}
MACRO {PICESPress} {"PICES Press"}
MACRO {PICESSciRep} {"PICES Sci. Rep."}
MACRO {PierceLawRev} {"Pierce Law Rev."}
MACRO {PIMRISNewsl} {"PIMRIS Newsl."}
MACRO {PipeLineInd} {"Pipe Line Ind."}
MACRO {PishchPromst} {"Pishch. Prom-st'"}
MACRO {Pituitary} {"Pituitary"}
MACRO {PKVResJ} {"PKV Res. J."}
MACRO {PlainEnglGuideReasonPublicPolicyInst} {"Plain Engl. Guide, Reason Public Policy Inst."}
MACRO {PlanerMeldStatSentralbyraaNorw} {"Planer Meld. Stat. Sentralbyraa (Norw.)"}
MACRO {PlanktonBiolEcol} {"Plankton Biol. Ecol."}
MACRO {PlantCellPhysiol} {"Plant Cell Physiol."}
MACRO {PlantSoil} {"Plant Soil"}
MACRO {PlantBiol} {"Plant Biol."}
MACRO {PlantBiotechnol} {"Plant Biotechnol."}
MACRO {PlantBiotechnolJ} {"Plant Biotechnol. J."}
MACRO {PlantBreedZPflanzenzucht} {"Plant Breed./Z. Pflanzenzucht."}
MACRO {PlantCell} {"Plant Cell"}
MACRO {PlantCellRep} {"Plant Cell Rep."}
MACRO {PlantCellTissOrgCult} {"Plant Cell Tiss. Org. Cult."}
MACRO {PlantDis} {"Plant Dis."}
MACRO {PlantEcol} {"Plant Ecol."}
MACRO {PlantEng} {"Plant Eng."}
MACRO {PlantJ} {"Plant J."}
MACRO {PlantMolBiol} {"Plant Mol. Biol."}
MACRO {PlantPathol} {"Plant Pathol."}
MACRO {PlantPatholBull} {"Plant Pathol. Bull."}
MACRO {PlantPhysiol} {"Plant Physiol."}
MACRO {PlantPhysiolBiochem} {"Plant Physiol. Biochem."}
MACRO {PlantSci} {"Plant Sci."}
MACRO {PlantSpeciesBiol} {"Plant Species Biol."}
MACRO {PlantSystEvol} {"Plant Syst. Evol."}
MACRO {PlantCellEnviron} {"Plant, Cell Environ."}
MACRO {Planta} {"Planta"}
MACRO {Plantula} {"Plantula"}
MACRO {Plasmid} {"Plasmid"}
MACRO {PLoSBiol} {"PLoS Biol."}
MACRO {PLoSCompBiol} {"PLoS Comp. Biol."}
MACRO {PLoSGenet} {"PLoS Genet."}
MACRO {PLoSPath} {"PLoS Path."}
MACRO {PolarBiol} {"Polar Biol."}
MACRO {PolarRec} {"Polar Rec."}
MACRO {PolarRes} {"Polar Res."}
MACRO {Polarforschung} {"Polarforschung"}
MACRO {PolicePractRes} {"Police Pract. Res."}
MACRO {Policing} {"Policing"}
MACRO {PolishJEcol} {"Polish J. Ecol."}
MACRO {PolishJMicrobiol} {"Polish J. Microbiol."}
MACRO {PolJPharmacol} {"Pol. J. Pharmacol."}
MACRO {PolJSoilSci} {"Pol. J. Soil Sci."}
MACRO {PolPolarResPolBadaniaPolarne} {"Pol. Polar Res./Pol. Badania Polarne"}
MACRO {PolitPsychol} {"Polit. Psychol."}
MACRO {Poljoprivreda} {"Poljoprivreda"}
MACRO {PollutEng} {"Pollut. Eng."}
MACRO {PollutMonit} {"Pollut. Monit."}
MACRO {PollutPreventRev} {"Pollut. Prevent. Rev."}
MACRO {PolArchHydrobiolPolArchHydrobiol} {"Pol. Arch. Hydrobiol./Pol. Arch. Hydrobiol."}
MACRO {PolPismoEntomol} {"Pol. Pismo Entomol."}
MACRO {PolycycAromaticCompounds} {"Polycyc. Aromatic Compounds"}
MACRO {Polymer} {"Polymer"}
MACRO {PolymDegradationStab} {"Polym. Degradation Stab."}
MACRO {PolymEngSci} {"Polym. Eng. Sci."}
MACRO {PolymInt} {"Polym. Int."}
MACRO {PolymTest} {"Polym. Test."}
MACRO {PopulDevRev} {"Popul. Dev. Rev."}
MACRO {PopulEcol} {"Popul. Ecol."}
MACRO {PortZool} {"Port. Zool."}
MACRO {PostgradMedJ} {"Postgrad. Med. J."}
MACRO {PostharvestBiolTechnol} {"Postharvest Biol. Technol."}
MACRO {PowerTechnolEng} {"Power Technol. Eng."}
MACRO {PraceMatZootech} {"Prace Mat. Zootech."}
MACRO {PractPeriodicalHazardToxicRadioactWasteManage} {"Pract. Periodical Hazard., Toxic, Radioact. Waste Manage."}
MACRO {PractPeriodicalStructDesConstr} {"Pract. Periodical Struct. Des. Constr."}
MACRO {PrecambrianRes} {"Precambrian Res."}
MACRO {PrenatalDiagn} {"Prenatal Diagn."}
MACRO {PrepBiochemBiotechnol} {"Prep. Biochem. Biotechnol."}
MACRO {PresseMed} {"Presse Med."}
MACRO {PrevSci} {"Prev. Sci."}
MACRO {PriklBiokhimMikrobiol} {"Prikl. Biokhim. Mikrobiol."}
MACRO {Primates} {"Primates"}
MACRO {Priroda} {"Priroda"}
MACRO {PrisonJ} {"Prison J."}
MACRO {ProblArktAntarkt} {"Probl. Arkt. Antarkt."}
MACRO {ProblKhimZagryazVodMirovOkeana} {"Probl. Khim. Zagryaz. Vod. Mirov. Okeana"}
MACRO {ProcMarSci} {"Proc. Mar. Sci."}
MACRO {ProcPakCongressZool} {"Proc. Pak. Congress Zool."}
MACRO {ProcAcadNatSciPhila} {"Proc. Acad. Nat. Sci. Phila."}
MACRO {ProcAnnuConfFishSocNigerFISON} {"Proc. Annu. Conf. Fish. Soc. Niger. (FISON)"}
MACRO {ProcAnnuConfSEAFWA} {"Proc. Annu. Conf. SEAFWA"}
MACRO {ProcBiolSocWash} {"Proc. Biol. Soc. Wash."}
MACRO {ProcBurRuralResour} {"Proc. Bur. Rural Resour."}
MACRO {ProcCalifAcadSci} {"Proc. Calif. Acad. Sci."}
MACRO {ProcEntomolSocOnt} {"Proc. Entomol. Soc. Ont."}
MACRO {ProcEntomolSocWash} {"Proc. Entomol. Soc. Wash."}
MACRO {ProcEstonAcadSciBiolEcol} {"Proc. Eston. Acad. Sci. Biol. Ecol."}
MACRO {ProcEstAcadSciBiolEcol} {"Proc. Est. Acad. Sci. (Biol. Ecol.)"}
MACRO {ProcEstAcadSciChem} {"Proc. Est. Acad. Sci. (Chem.)"}
MACRO {ProcEstAcadSciEng} {"Proc. Est. Acad. Sci. (Eng.)"}
MACRO {ProcEstAcadSciGeol} {"Proc. Est. Acad. Sci. (Geol.)"}
MACRO {ProcEstAcadSciPhysMath} {"Proc. Est. Acad. Sci. (Phys. Math.)"}
MACRO {ProcGulfCaribbFishInst} {"Proc. Gulf Caribb. Fish. Inst."}
MACRO {ProcHawaiiEntomolSoc} {"Proc. Hawaii. Entomol. Soc."}
MACRO {ProcIndianAcadSciEarthPlanetSci} {"Proc. Indian Acad. Sci. (Earth Planet. Sci.)"}
MACRO {ProcIndianaAcadSci} {"Proc. Indiana Acad. Sci."}
MACRO {ProcInstMarEngSciTechnolCJMarSciEnviron} {"Proc. Inst. Mar. Eng. Sci. Technol. C: J. Mar. Sci. Environ."}
MACRO {ProcInstCivEngCivEng} {"Proc. Inst. Civ. Eng. Civ. Eng."}
MACRO {ProcInstCivEngMunicEng} {"Proc. Inst. Civ. Eng. Munic. Eng."}
MACRO {ProcInstCivEngStructBuild} {"Proc. Inst. Civ. Eng. Struct. Build."}
MACRO {ProcInstCivEngTransp} {"Proc. Inst. Civ. Eng. Transp."}
MACRO {ProcInstitCivEngWaterMaritimeEng} {"Proc. Instit. Civ. Eng. Water Maritime Eng."}
MACRO {ProcInstMechEngPtBJEngManuf} {"Proc. Inst. Mech. Eng. Pt. B: J. Eng. Manuf."}
MACRO {ProcInstMechEngPtDJAutomobileEng} {"Proc. Inst. Mech. Eng. Pt. D: J. Automobile Eng."}
MACRO {ProcInstMechEngPtFJRailRapidTransit} {"Proc. Inst. Mech. Eng. Pt. F: J. Rail Rapid Transit"}
MACRO {ProcInstMechEngPartMJEngMaritEnviron} {"Proc. Inst. Mech. Eng., Part M: J. Eng. Marit. Environ."}
MACRO {ProcInstMechEngPtGJAerospEng} {"Proc. Inst. Mech. Eng. Pt. G: J. Aerosp. Eng."}
MACRO {ProcIntOffshorePolarEngConf} {"Proc. Int. Offshore Polar Eng. Conf."}
MACRO {ProcJapanAcadSerBPhysBiolSci} {"Proc. Japan Acad., Ser. B Phys. Biol. Sci."}
MACRO {ProcLinnSocNSW} {"Proc. Linn. Soc. N.S.W."}
MACRO {ProcLaAcadSci} {"Proc. La. Acad. Sci."}
MACRO {ProcNatlAcadSciUSA} {"Proc. Natl. Acad. Sci. USA"}
MACRO {ProcNatlSciCouncRepChinaPtBLifeSci} {"Proc. Natl. Sci. Counc. Rep. China Pt. B Life Sci."}
MACRO {ProcNIPRSympPolarBiol} {"Proc. NIPR Symp. Polar Biol."}
MACRO {ProcRSocLondSerB} {"Proc. R. Soc. Lond., Ser. B: Biol. Sci."}
MACRO {ProcRSocQueensl} {"Proc. R. Soc. Queensl."}
MACRO {ProcRSocVic} {"Proc. R. Soc. Vic."}
MACRO {ProcSanDiegoSocNatHist} {"Proc. San Diego Soc. Nat. Hist."}
MACRO {ProcSectExpApplEntomolNEVAmst} {"Proc. Sect. Exp. Appl. Entomol. N. E. V. Amst."}
MACRO {ProcSocExpBiolMed} {"Proc. Soc. Exp. Biol. Med."}
MACRO {ProcSouthDakotaAcadSci} {"Proc. South Dakota Acad. Sci."}
MACRO {ProcWestPharmacolSoc} {"Proc. West. Pharmacol. Soc."}
MACRO {ProcWorldDredgConf} {"Proc. World Dredg. Conf."}
MACRO {ProcYorksGeolSoc} {"Proc. Yorks. Geol. Soc."}
MACRO {ProcAssocIslMarLabCaribb} {"Proc. Assoc. Isl. Mar. Lab. Caribb."}
MACRO {ProcBurResourSciAust} {"Proc. Bur. Resour. Sci. (Aust.)"}
MACRO {ProcConfMarTechnolSoc} {"Proc. Conf. Mar. Technol. Soc."}
MACRO {ProcIntBaltSeaFishComm} {"Proc. Int. Balt. Sea Fish. Comm."}
MACRO {ProcNAFO} {"Proc. NAFO"}
MACRO {ProcOffshoreTechnolConf} {"Proc. Offshore Technol. Conf."}
MACRO {ProcSocPhotoOptInstrumEng} {"Proc. Soc. Photo-Opt. Instrum. Eng."}
MACRO {ProcSCSeaGrantConsort} {"Proc. S.C. Sea Grant Consort."}
MACRO {ProcessBiochem} {"Process Biochem."}
MACRO {ProcessEng} {"Process Eng."}
MACRO {ProcessSafEnvironProt} {"Process Saf. Environ. Prot."}
MACRO {ProcessSafProg} {"Process Saf. Prog."}
MACRO {ProfFisherman} {"Prof. Fisherman"}
MACRO {ProfPapUSGeolSurv} {"Prof. Pap. U.S. Geol. Surv."}
MACRO {ProfSaf} {"Prof. Saf."}
MACRO {ProgBotFortschrBot} {"Prog. Bot./Fortschr. Bot."}
MACRO {ProgBrainRes} {"Prog. Brain Res."}
MACRO {ProgNeuroPsychopharmacolBiolPsychiatry} {"Prog. Neuro-Psychopharmacol. Biol. Psychiatry"}
MACRO {ProgNeurobiol} {"Prog. Neurobiol."}
MACRO {ProgNuclearEnergy} {"Prog. Nuclear Energy"}
MACRO {ProgNucleicAcidResMolBiol} {"Prog. Nucleic Acid Res. Mol. Biol."}
MACRO {ProgOceanogr} {"Prog. Oceanogr."}
MACRO {ProgStructEngMater} {"Prog. Struct. Eng. Mater."}
MACRO {ProgNotesCanWildlServ} {"Prog. Notes Can. Wildl. Serv."}
MACRO {ProgrRepDeltaInstHydrobiolRes} {"Progr. Rep. Delta Inst. Hydrobiol. Res."}
MACRO {ProgRepUSNavOceanResDevAct} {"Prog. Rep. U.S. Nav. Ocean Res. Dev. Act."}
MACRO {ProgFishCult} {"Prog. Fish-Cult."}
MACRO {ProjRepDepPrimIndQueensl} {"Proj. Rep. Dep. Prim. Ind. (Queensl.)"}
MACRO {ProjRepLakeKaribaFishResInst} {"Proj. Rep. Lake Kariba Fish. Res. Inst."}
MACRO {ProjResDevActAustInstMarSci} {"Proj. Res. Dev. Act. Aust. Inst. Mar. Sci."}
MACRO {ProstaglandinsLeukotrienesEssentialFattyAcids} {"Prostaglandins Leukotrienes Essential Fatty Acids"}
MACRO {ProsthetOrthoticsInt} {"Prosthet. Orthotics Int."}
MACRO {ProtMet} {"Prot. Met."}
MACRO {ProteinPeptideLett} {"Protein Peptide Lett."}
MACRO {ProteinEngDesSel} {"Protein Eng. Des. Sel."}
MACRO {ProteinExpressionPurif} {"Protein Expression Purif."}
MACRO {ProteinJ} {"Protein J."}
MACRO {ProteinSci} {"Protein Sci."}
MACRO {ProteinsStructFunctBioinform} {"Proteins: Struct. Funct. Bioinform."}
MACRO {Proteomics} {"Proteomics"}
MACRO {Protist} {"Protist"}
MACRO {Protoplasma} {"Protoplasma"}
MACRO {ProvisIndexListTitlesSciCouncMeetDocNAFO} {"Provis. Index List Titles Sci. Counc. Meet. Doc. NAFO"}
MACRO {PrzeglZool} {"Przegl. Zool."}
MACRO {PsychiatrServ} {"Psychiatr. Serv."}
MACRO {PsychiatryClinNeurosci} {"Psychiatry Clin. Neurosci."}
MACRO {PsycholMed} {"Psychol. Med."}
MACRO {PsycholWomenQ} {"Psychol. Women Q."}
MACRO {PsycholHealthMed} {"Psychol., Health Med."}
MACRO {Psychopharmacology} {"Psychopharmacology"}
MACRO {PsychosomMed} {"Psychosom. Med."}
MACRO {PublicHealth} {"Public Health"}
MACRO {PublicHealthRep} {"Public Health Rep."}
MACRO {PublicHealthRev} {"Public Health Rev."}
MACRO {PublAvulsInstPortInvestMarit} {"Publ. Avuls. Inst. Port. Invest. Marit."}
MACRO {PublOcasSocPortMalacol} {"Publ. Ocas. Soc. Port. Malacol."}
MACRO {PublEspecInstOceanogrSaoPaulo} {"Publ. Espec. Inst. Oceanogr. Sao Paulo"}
MACRO {PublInstPesquiMarRiodeJ} {"Publ. Inst. Pesqui. Mar. Rio de J."}
MACRO {PublInstZoolDrAugustoNobre} {"Publ. Inst. Zool. Dr. Augusto Nobre"}
MACRO {PublEspSocEntomolArgent} {"Publ. Esp. Soc. Entomol. Argent."}
MACRO {PublOcasMusNacHistNatChile} {"Publ. Ocas. Mus. Nac. Hist. Nat. (Chile)"}
MACRO {PublEspecCentCiencMarLimnolUnivNacAutonMex} {"Publ. Espec. Cent. Cienc. Mar. Limnol. Univ. Nac. Auton. Mex."}
MACRO {PublOcasInstOceanolUnivValparaiso} {"Publ. Ocas. Inst. Oceanol. Univ. Valparaiso"}
MACRO {PublTecFacCiencBiolUnivAutonNuevoLeon} {"Publ. Tec. Fac. Cienc. Biol. Univ. Auton. Nuevo Leon"}
MACRO {PublAvulsMusBocage2aSer} {"Publ. Avuls. Mus. Bocage (2a Ser.)"}
MACRO {PublSerNethInstSeaRes} {"Publ. Ser. Neth. Inst. Sea Res."}
MACRO {PublInstGeogrUnivTartu} {"Publ. Inst. Geogr. Univ. Tartu."}
MACRO {PublDepHalieutEcNatlSuperAgronRennes} {"Publ. Dep. Halieut. Ec. Natl. Super. Agron. Rennes"}
MACRO {PublAmakusaMarBiolLab} {"Publ. Amakusa Mar. Biol. Lab."}
MACRO {PublSetoMarBiolLab} {"Publ. Seto Mar. Biol. Lab."}
MACRO {PublSetoMarBiolLabSpecPublSer} {"Publ. Seto Mar. Biol. Lab. (Spec. Publ. Ser.)"}
MACRO {PublWaterEnvironResInst} {"Publ. Water Environ. Res. Inst."}
MACRO {PublChesapeakeResConsort} {"Publ. Chesapeake Res. Consort."}
MACRO {PublFlaInstPhosphateRes} {"Publ. Fla. Inst. Phosphate Res."}
MACRO {PublGalvestonBayNatlEstuarProgram} {"Publ. Galveston Bay Natl. Estuar. Program"}
MACRO {PublMarAdvisServRIUnivSeaGrantProgram} {"Publ. Mar. Advis. Serv. R.I. Univ. Sea Grant Program"}
MACRO {PublMdUnivSeaGrantProgram} {"Publ. Md. Univ. Sea Grant Program"}
MACRO {PublOregStateUnivSeaGrantCollProgram} {"Publ. Oreg. State Univ. Sea Grant Coll. Program"}
MACRO {PublRIUnivSeaGrantCollProgram} {"Publ. R.I. Univ. Sea Grant Coll. Program"}
MACRO {PublTennValleyAuth} {"Publ. Tenn. Valley Auth."}
MACRO {PublVaSeaGrantConsort} {"Publ. Va. Sea Grant Consort."}
MACRO {PUCSPCiencBiolAmbiente} {"PUC-SP Cienc. Biol. Ambiente"}
MACRO {PunjabUnivJZool} {"Punjab Univ. J. Zool."}
MACRO {PureApplGeophys} {"Pure Appl. Geophys."}
MACRO {QitawaFishNewsl} {"Qitawa Fish. Newsl."}
MACRO {QJM} {"QJM"}
MACRO {QuadETPNuovaSer} {"Quad. ETP (Nuova Ser.)"}
MACRO {QuadICRAM} {"Quad. ICRAM"}
MACRO {QualSafHealthCare} {"Qual. Saf. Health Care"}
MACRO {QualReliabEngInt} {"Qual. Reliab. Eng. Int."}
MACRO {QuantMicrobiol} {"Quant. Microbiol."}
MACRO {QAquatAnimDisRepAsiaPacReg} {"Q. Aquat. Anim. Dis. Rep. (Asia Pac. Reg.)"}
MACRO {QJExpPsycholSectB} {"Q. J. Exp. Psychol. Sect. B"}
MACRO {QJIntAgric} {"Q. J. Int. Agric."}
MACRO {QRepRTRI} {"Q. Rep. RTRI"}
MACRO {QRevBiol} {"Q. Rev. Biol."}
MACRO {QRevBiophys} {"Q. Rev. Biophys."}
MACRO {QuaternRes} {"Quatern. Res."}
MACRO {QuatSciRev} {"Quat. Sci. Rev."}
MACRO {QueenslAquacNews} {"Queensl. Aquac. News"}
MACRO {QueenslFishNews} {"Queensl. Fish. News"}
MACRO {QueenslFisherman} {"Queensl. Fisherman"}
MACRO {QueenslNat} {"Queensl. Nat."}
MACRO {QuekettJMicrosc} {"Quekett J. Microsc."}
MACRO {QuickFrozenFoodsInt} {"Quick Frozen Foods Int."}
MACRO {QuintessenceExcellenceEnvironContamToxicol} {"Quintessence Excellence Environ. Contam. Toxicol."}
MACRO {FridtjofNansenSurvRep} {"Fridtjof Nansen Surv. Rep."}
MACRO {RadSigurWorkSaf} {"Rad Sigur./Work Saf."}
MACRO {RadiatEnvironBiophys} {"Radiat. Environ. Biophys."}
MACRO {RadiatMeasur} {"Radiat. Measur."}
MACRO {RadiatOncolInvest} {"Radiat. Oncol. Invest."}
MACRO {RadiatPhysChem} {"Radiat. Phys. Chem."}
MACRO {RadiatProtDosimet} {"Radiat. Prot. Dosimet."}
MACRO {RadiatRes} {"Radiat. Res."}
MACRO {RadiatBiolRadioekol} {"Radiat. Biol. Radioekol."}
MACRO {RadioactWasteManageEnvironRestor} {"Radioact. Waste Manage. Environ. Restor."}
MACRO {RadioactFoodEnviron} {"Radioact. Food Environ."}
MACRO {Radiographics} {"Radiographics"}
MACRO {Radiography} {"Radiography"}
MACRO {RadiolMed} {"Radiol. Med."}
MACRO {Radiology} {"Radiology"}
MACRO {RafflesBullZool} {"Raffles Bull. Zool."}
MACRO {RailInt} {"Rail Int."}
MACRO {RailwayAge} {"Railway Age"}
MACRO {RangelandEcolManage} {"Rangeland Ecol. Manage."}
MACRO {RannsFiskidSkyrIcelFishLabRep} {"Ranns. Fiskid. Skyr./Icel. Fish. Lab. Rep."}
MACRO {RAPPubl} {"RAP Publ."}
MACRO {RAPARep} {"RAPA Rep."}
MACRO {RappAnnuGIROQUnivLavalUnivMcGill} {"Rapp. Annu. GIROQ Univ. Laval/Univ.McGill"}
MACRO {RappAnnuINRSOceanol} {"Rapp. Annu. INRS-Oceanol."}
MACRO {RappActProgrammesRechActCentNatlRechOceanogrPechesMauritania} {"Rapp. Act. Programmes Rech. Act. Cent. Natl. Rech. Oceanogr. Peches (Mauritania)"}
MACRO {RappNordlandsForskning} {"Rapp. Nordlands Forskning"}
MACRO {RappTriennDepOceanogrUnivQueRimouski} {"Rapp. Trienn. Dep. Oceanogr. Univ. Que. Rimouski"}
MACRO {RappFiskeriforsk} {"Rapp. Fiskeriforsk."}
MACRO {RappInstAdminOrganUnivBergen} {"Rapp. Inst. Admin. Organ. Univ. Bergen"}
MACRO {RappMissionsSciMerBiolMarCentNoumeaORSTOM} {"Rapp. Missions Sci. Mer Biol. Mar. Cent. Noumea ORSTOM"}
MACRO {RappMissionsSciMerOceanogrPhysCentNoumeaORSTOM} {"Rapp. Missions Sci. Mer. Oceanogr. Phys. Cent. Noumea ORSTOM"}
MACRO {RappSciTechSciMerBiolMarCentNoumeaORSTOM} {"Rapp. Sci. Tech. Sci. Mer. Biol. Mar. Cent. Noumea ORSTOM"}
MACRO {RapportserNorskPolarinst} {"Rapportser. Norsk Polarinst."}
MACRO {Rasain} {"Rasain"}
MACRO {RazprDiss} {"Razpr. Diss."}
MACRO {ReactFunctPolym} {"React. Funct. Polym."}
MACRO {ReceptSignalTransduct} {"Recept. Signal Transduct."}
MACRO {ReceptorsChannels} {"Receptors Channels"}
MACRO {Recherche} {"Recherche"}
MACRO {RecAustMus} {"Rec. Aust. Mus."}
MACRO {RecQueenVicMus} {"Rec. Queen Vic. Mus."}
MACRO {RecSAustMus} {"Rec. S. Aust. Mus."}
MACRO {RecWestAustMus} {"Rec. West. Aust. Mus."}
MACRO {RECOSCIXWIOAnnuRep} {"RECOSCIX-WIO Annu. Rep."}
MACRO {ReclMedVetAlfort} {"Recl. Med. Vet. Alfort"}
MACRO {RecursPescaSerDivulgGabEstudPlanPescasPort} {"Recurs. Pesca (Ser. Divulg.) Gab. Estud. Plan. Pescas (Port.)"}
MACRO {RecursPescaSerEstatGabEstudPlanPescasPort} {"Recurs. Pesca (Ser. Estat.) Gab. Estud. Plan. Pescas (Port.)"}
MACRO {RecursHidric} {"Recurs. Hidric."}
MACRO {ReefRes} {"Reef Res."}
MACRO {RefMethodsMarPollutStud} {"Ref. Methods Mar. Pollut. Stud."}
MACRO {RegTunaBullOceanFishProgrammeSecrPacCommunity} {"Reg. Tuna Bull. Ocean. Fish. Programme Secr. Pac. Community"}
MACRO {RegulRiversResManage} {"Regul. Rivers: Res. Manage."}
MACRO {RegulatoryPeptides} {"Regulatory Peptides"}
MACRO {RegulToxicolPharmacol} {"Regul. Toxicol. Pharmacol."}
MACRO {RehabilTechnol} {"Rehabil. Technol."}
MACRO {RelatAnuInstNacInvestPesq} {"Relat. Anu. Inst. Nac. Invest. Pesq."}
MACRO {RelatIntInstOceanogrUnivSaoPaulo} {"Relat. Int. Inst. Oceanogr. Univ. Sao Paulo"}
MACRO {RelatCientTecInstInvestPescasMar} {"Relat. Cient. Tec. Inst. Invest. Pescas Mar."}
MACRO {RelatTecInstOceanogrSaoPaulo} {"Relat. Tec. Inst. Oceanogr. Sao Paulo"}
MACRO {ReliabEngSystSaf} {"Reliab. Eng. Syst. Saf."}
MACRO {Remediation} {"Remediation"}
MACRO {RemoteSensEnviron} {"Remote Sens. Environ."}
MACRO {RenaissanceStud} {"Renaissance Stud."}
MACRO {RenewAgricFoodSyst} {"Renew. Agric. Food Syst."}
MACRO {RenewEnergyNewsDig} {"Renew. Energy News Dig."}
MACRO {ReperesOcean} {"Reperes Ocean"}
MACRO {RepAccDunstaffnageMarLabScottAssocMarSci} {"Rep. Acc. Dunstaffnage. Mar. Lab. Scott. Assoc. Mar. Sci."}
MACRO {RepAccFishResServGB} {"Rep. Acc. Fish. Res. Serv. (G.B.)"}
MACRO {RepCSIROMarLab} {"Rep. CSIRO Mar. Lab."}
MACRO {RepFishResourInvestSciFishAgencyJapGov} {"Rep. Fish. Resour. Invest. Sci. Fish. Agency Jap. Gov."}
MACRO {RepFishResLabKyushuUniv} {"Rep. Fish. Res. Lab. Kyushu Univ."}
MACRO {RepJapanMarSciTechnolCentKaiyoKagakuGijutsuSentaShikenKenkyuHokoku} {"Rep. Japan Mar. Sci. Technol. Cent./Kaiyo Kagaku Gijutsu Senta Shiken Kenkyu Hokoku"}
MACRO {RepKumamotoPrefectFishResCent} {"Rep. Kumamoto Prefect. Fish. Res. Cent."}
MACRO {RepPortHarbourResInstYokosuka} {"Rep. Port Harbour Res. Inst. Yokosuka"}
MACRO {RepShimanePrefectFishExpStn} {"Rep. Shimane Prefect. Fish. Exp. Stn."}
MACRO {RepBrAntarctSurv} {"Rep. Br. Antarct. Surv."}
MACRO {RepCentEcolHydrolSwindon} {"Rep. Cent. Ecol. Hydrol. Swindon"}
MACRO {RepClerkChiefFishOffNWestNWalesSeaFishComm} {"Rep. Clerk Chief Fish. Off. N. West. N. Wales Sea Fish. Comm."}
MACRO {RepCouncNatEnvironResCouncUK} {"Rep. Counc. Nat. Environ. Res. Counc. (U.K)"}
MACRO {RepFishLabMiyazakiUniv} {"Rep. Fish. Lab. Miyazaki Univ."}
MACRO {RepFishResLabMieUniv} {"Rep. Fish. Res. Lab. Mie Univ."}
MACRO {RepFukauraMarBiolLabHirosakiUniv} {"Rep. Fukaura Mar. Biol. Lab. Hirosaki Univ."}
MACRO {RepMeetCouncSoutheastAsianFishDevCent} {"Rep. Meet. Counc. Southeast Asian Fish. Dev. Cent."}
MACRO {RepMeetProgramCommSoutheastAsianFishDevCent} {"Rep. Meet. Program Comm. Southeast Asian Fish. Dev. Cent."}
MACRO {RepMeetSCCAMLR} {"Rep. Meet. SC-CAMLR"}
MACRO {RepMeetTechAdvisCommNACA} {"Rep. Meet. Tech. Advis. Comm. NACA"}
MACRO {RepPlymouthMarLab} {"Rep. Plymouth Mar. Lab."}
MACRO {RepProudmanOceanogrLabBidston} {"Rep. Proudman Oceanogr. Lab. Bidston"}
MACRO {RepSadoMarBiolStnNiigataUniv} {"Rep. Sado Mar. Biol. Stn. Niigata Univ"}
MACRO {RepTokyoMetropFishExpStn} {"Rep. Tokyo Metrop. Fish. Exp. Stn."}
MACRO {RepTokyoUnivFish} {"Rep. Tokyo Univ. Fish."}
MACRO {RepFishProd} {"Rep. Fish Prod."}
MACRO {RepActNorthAtlSalmonConservOrgan} {"Rep. Act. North Atl. Salmon Conserv. Organ."}
MACRO {RepActOsloParisComm} {"Rep. Act. Oslo Paris Comm."}
MACRO {RepSerCalifSeaGrantCollProgram} {"Rep. Ser. Calif. Sea Grant Coll. Program"}
MACRO {RepSerNYSeaGrantInst} {"Rep. Ser. N.Y. Sea Grant Inst."}
MACRO {RepSerSalmGenetResProgramCan} {"Rep. Ser. Salm. Genet. Res. Program (Can.)"}
MACRO {RepAustFishManagAuth} {"Rep. Aust. Fish. Manag. Auth."}
MACRO {RepAlaskaMinerManageServ} {"Rep. Alaska Miner. Manage. Serv."}
MACRO {RepAquacultDepSoutheastAsianFishDevCent} {"Rep. Aquacult. Dep. Southeast Asian Fish. Dev. Cent."}
MACRO {RepArgonneNatlLab} {"Rep. Argonne Natl. Lab."}
MACRO {RepBrookhavenNatlLab} {"Rep. Brookhaven Natl. Lab."}
MACRO {RepBurResourSciAust} {"Rep. Bur. Resour. Sci. (Aust.)"}
MACRO {RepCalifInstTechnolWMKeckLabHydraulWaterResour} {"Rep. Calif. Inst. Technol. W.M. Keck Lab. Hydraul. Water Resour."}
MACRO {RepCIRIAUnderwatEngGroup} {"Rep. CIRIA Underwat. Eng. Group"}
MACRO {RepDavidTaylorResCent} {"Rep. David Taylor Res. Cent."}
MACRO {RepDeepSeaFishDevProj} {"Rep. Deep Sea Fish. Dev. Proj."}
MACRO {RepEnvironResInstMich} {"Rep. Environ. Res. Inst. Mich."}
MACRO {RepEnvironStudResFunds} {"Rep. Environ. Stud. Res. Funds"}
MACRO {RepFishDepVanuatu} {"Rep. Fish. Dep. (Vanuatu)"}
MACRO {RepFlaSeaGrantCollProgram} {"Rep. Fla. Sea Grant. (Coll.) Program"}
MACRO {RepGFCM} {"Rep. GFCM"}
MACRO {RepGeophysInstUnivBergen} {"Rep. Geophys. Inst. Univ. Bergen"}
MACRO {RepGovCouncMeetNACA} {"Rep. Gov. Counc. Meet. NACA"}
MACRO {RepHydraulResStnWallingford} {"Rep. Hydraul. Res. Stn. Wallingford"}
MACRO {RepHydrolEngCentDavisCalif} {"Rep. Hydrol. Eng. Cent. Davis Calif."}
MACRO {RepIllEnvironProtAgencyDivWaterPollutControl} {"Rep. Ill. Environ. Prot. Agency Div. Water Pollut. Control"}
MACRO {RepIllIndianaSeaGrantProgram} {"Rep. Ill.-Indiana Sea Grant Program"}
MACRO {RepInlandFishCommTasman} {"Rep. Inland Fish. Comm. (Tasman.)"}
MACRO {RepICCAT} {"Rep. ICCAT"}
MACRO {RepIowaInstHydraulRes} {"Rep. Iowa Inst. Hydraul. Res."}
MACRO {RepLawrenceBerkeleyNatlLab} {"Rep. Lawrence Berkeley Natl. Lab."}
MACRO {RepLawrenceLivermoreNatlLab} {"Rep. Lawrence Livermore Natl. Lab."}
MACRO {RepLosAlamosNatlLab} {"Rep. Los Alamos Natl. Lab."}
MACRO {RepMaineNHSeaGrantCollProgram} {"Rep. Maine-N.H. Sea Grant Coll. Program"}
MACRO {RepMarFreshwResInst} {"Rep. Mar. Freshw. Res. Inst."}
MACRO {RepMdUnivChesapeakeBiolLab} {"Rep. Md. Univ. Chesapeake Biol. Lab."}
MACRO {RepMdUnivNatResourInst} {"Rep. Md. Univ. Nat. Resour. Inst."}
MACRO {RepMassInstTechnolSeaGrantProgram} {"Rep. Mass. Inst. Technol. Sea Grant Program"}
MACRO {RepMassInstTechnolDepEarthAtmosPlanetPhys} {"Rep. Mass. Inst. Technol. Dep. Earth Atmos. Planet. Phys."}
MACRO {RepMassInstTechnolOceanEngDep} {"Rep. Mass. Inst. Technol. Ocean Eng. Dep."}
MACRO {RepMissAlaSeaGrantConsort} {"Rep. Miss.-Ala. Sea Grant Consort."}
MACRO {RepNatlTranspSafBoardUS} {"Rep. Natl. Transp. Saf. Board (U.S.)"}
MACRO {RepNHUnivSeaGrantProgram} {"Rep. N.H. Univ. Sea Grant Program"}
MACRO {RepNMWaterResourInst} {"Rep. N.M. Water Resour. Inst."}
MACRO {RepNCUnivWaterResourResInst} {"Rep. N.C. Univ. Water Resour. Res. Inst."}
MACRO {RepOakRidgeNatlLab} {"Rep. Oak Ridge Natl. Lab."}
MACRO {RepOffResDevUSCoastGuard} {"Rep. Off. Res. Dev. U.S. Coast Guard"}
MACRO {RepRegTechMeetFishSecrPacCommunity} {"Rep. Reg. Tech. Meet. Fish. Secr. Pac. Community"}
MACRO {RepSandiaNatlLab} {"Rep. Sandia Natl. Lab."}
MACRO {RepScrippsInstOceanogrMarPhysLab} {"Rep. Scripps Inst. Oceanogr. Mar. Phys. Lab."}
MACRO {RepSocioeconLakeVicFish} {"Rep. Socioecon. Lake Vic. Fish."}
MACRO {RepSouthCalifUnivSeaGrantProgram} {"Rep. South. Calif. Univ. Sea Grant Program"}
MACRO {RepStandingCommTunaBillfishSecrPacCommunity} {"Rep. Standing Comm. Tuna Billfish Secr. Pac. Community"}
MACRO {RepStevensInstTechnolDavidsonLab} {"Rep. Stevens Inst. Technol. Davidson Lab."}
MACRO {RepSwedEnvironProtAgency} {"Rep. Swed. Environ. Prot. Agency"}
MACRO {RepTennValleyAuth} {"Rep. Tenn. Valley Auth."}
MACRO {RepTexA&MUnivSeaGrantProgram} {"Rep. Tex. A&M Univ. Sea Grant Program"}
MACRO {RepTexUnivApplResLab} {"Rep. Tex. Univ. Appl. Res. Lab."}
MACRO {RepUSAirForceInstTechnol} {"Rep. U.S. Air Force Inst. Technol."}
MACRO {RepUSArmyCoastEngResCent} {"Rep. U.S. Army Coast. Eng. Res. Cent."}
MACRO {RepUSArmyEngWaterwaysExpStnGeotechLab} {"Rep. U.S. Army Eng. Waterways Exp. Stn. Geotech. Lab."}
MACRO {RepUSBurReclamEngResCent} {"Rep. U.S. Bur. Reclam. Eng. Res. Cent."}
MACRO {RepUSCoastGuard} {"Rep. U.S. Coast Guard"}
MACRO {RepUSCoastGuardOceanogrUnit} {"Rep. U.S. Coast Guard Oceanogr. Unit"}
MACRO {RepUSCoastGuardResDevCent} {"Rep. U.S. Coast Guard Res. Dev. Cent"}
MACRO {RepUSDepEnergy} {"Rep. U.S. Dep. Energy"}
MACRO {RepUSEnvironProtAgency} {"Rep. U.S. Environ. Prot. Agency"}
MACRO {RepUSGeolSurv} {"Rep. U.S. Geol. Surv."}
MACRO {RepUSGeolSurvWaterResourDiv} {"Rep. U.S. Geol. Surv. Water Resour. Div."}
MACRO {RepUSMaritAdmOffResDev} {"Rep. U.S. Marit. Adm. Off. Res. Dev."}
MACRO {RepUSNavBiodynLab} {"Rep. U.S. Nav. Biodyn. Lab."}
MACRO {RepUSNavCivEngLab} {"Rep. U.S. Nav. Civ. Eng. Lab."}
MACRO {RepUSNavEnvironPredictResFacil} {"Rep. U.S. Nav. Environ. Predict. Res. Facil."}
MACRO {RepUSNavFacilEngCommandChesapeakeDiv} {"Rep. U.S. Nav. Facil. Eng. Command Chesapeake Div."}
MACRO {RepUSNavHealthResCent} {"Rep. U.S. Nav. Health Res. Cent."}
MACRO {RepUSNavMedResInst} {"Rep. U.S. Nav. Med. Res. Inst."}
MACRO {RepUSNavOceanResDevAct} {"Rep. U.S. Nav. Ocean Res. Dev. Act."}
MACRO {RepUSNavOceanSystCent} {"Rep. U.S. Nav. Ocean Syst. Cent."}
MACRO {RepUSNavOceanogrAtmosResLab} {"Rep. U.S. Nav. Oceanogr. Atmos. Res. Lab."}
MACRO {RepUSNavPostgradSch} {"Rep. U.S. Nav. Postgrad. Sch."}
MACRO {RepUSNavResLab} {"Rep. U.S. Nav. Res. Lab."}
MACRO {RepUSNavSubmarMedResLab} {"Rep. U.S. Nav. Submar. Med. Res. Lab."}
MACRO {RepUSNavExpDivingUnit} {"Rep. U.S. Nav. Exp. Diving Unit"}
MACRO {RepUnivSouthCalifInstMarCoastStud} {"Rep. Univ. South. Calif. Inst. Mar. Coast. Stud."}
MACRO {RepUnivDCWaterResourResCent} {"Rep. Univ. D.C. Water Resour. Res. Cent."}
MACRO {RepWaterEnvironStudLinkoepUniv} {"Rep. Water Environ. Stud. Linkoep. Univ."}
MACRO {RepWaterResourResLabUSBureauReclamRSeries} {"Rep. Water Resour. Res. Lab. U.S. Bureau Reclam. R-Series"}
MACRO {RepWisSeaGrantAdvisServ} {"Rep. Wis. Sea Grant Advis. Serv."}
MACRO {RepWisSeaGrantInst} {"Rep. Wis. Sea Grant Inst."}
MACRO {RepWisUnivSeaGrantCollProgram} {"Rep. Wis. Univ. Sea Grant Coll. Program"}
MACRO {RepWoodsHoleOceanogrInst} {"Rep. Woods Hole Oceanogr. Inst."}
MACRO {RepWorldDataCentAOceanogr} {"Rep. World Data Cent. A. Oceanogr."}
MACRO {RepInvestInstOceanolAcadCiencCuba} {"Rep. Invest. Inst. Oceanol. Acad. Cienc. Cuba"}
MACRO {RepMensInstInvestOceanolUnivAutonBajaCalif} {"Rep. Mens. Inst. Invest. Oceanol. Univ. Auton. Baja Calif."}
MACRO {RepTecInstInvestOceanolUnivAutonBajaCalif} {"Rep. Tec. Inst. Invest. Oceanol. Univ. Auton. Baja Calif."}
MACRO {RepStudGESAMP} {"Rep. Stud. GESAMP"}
MACRO {RepMeteorolOceanogrUniversBergen} {"Rep. Meteorol. Oceanogr. Univers. Bergen"}
MACRO {RepCACoopOceanFishInvest} {"Rep. CA Coop. Ocean. Fish. Invest."}
MACRO {RepGovMajorSubsidBodiesIOC} {"Rep. Gov. Major Subsid. Bodies IOC"}
MACRO {RepMeetExpertsEquivBodiesIOC} {"Rep. Meet. Experts Equiv. Bodies IOC"}
MACRO {RepResWoodsHoleOceanogrInst} {"Rep. Res. Woods Hole Oceanogr. Inst."}
MACRO {ReposTrabLabNacInvestVetPort} {"Repos. Trab. Lab. Nac. Invest. Vet. (Port.)"}
MACRO {Reproduction} {"Reproduction"}
MACRO {ReprodNutrDev} {"Reprod. Nutr. Dev."}
MACRO {ReprodFertilDev} {"Reprod. Fertil. Dev."}
MACRO {ReprodToxicol} {"Reprod. Toxicol."}
MACRO {ResDevNewsR&DNews} {"Res. Dev. News/R & D News"}
MACRO {ResBullPhuketMarBiolCent} {"Res. Bull. Phuket Mar. Biol. Cent."}
MACRO {ResCommunMolPatholPharmacol} {"Res. Commun. Mol. Pathol. Pharmacol."}
MACRO {ResHoriz} {"Res. Horiz."}
MACRO {ResImmunol} {"Res. Immunol."}
MACRO {ResMicrobiol} {"Res. Microbiol."}
MACRO {ResNondestrEval} {"Res. Nondestr. Eval."}
MACRO {ResSportsMed} {"Res. Sports Med."}
MACRO {ResVetSci} {"Res. Vet. Sci."}
MACRO {ResVirol} {"Res. Virol."}
MACRO {ResInstIndSciTechnol} {"Res. Inst. Ind. Sci. Technol"}
MACRO {ResNoteUSDAForServIntermtResStn} {"Res. Note USDA For. Serv. Intermt. Res. Stn."}
MACRO {ResNoteUSDAForServPacNorthwestResStn} {"Res. Note USDA For. Serv. Pac. Northwest Res. Stn."}
MACRO {ResEnvironSciHuanjingKexueYanjiu} {"Res. Environ. Sci./Huanjing Kexue Yanjiu"}
MACRO {ResPapSerTrainDepSoutheastAsianFishDevCent} {"Res. Pap. Ser. Train. Dep. Southeast Asian Fish. Dev. Cent."}
MACRO {ResPapUSDAForServPacSouthwestResStn} {"Res. Pap., USDA For. Serv. Pac. Southwest Res. Stn."}
MACRO {ResPapArgonneNatlLab} {"Res. Pap. Argonne Natl. Lab."}
MACRO {ResPapUSDAForServIntermtResStn} {"Res. Pap. USDA For. Serv. Intermt. Res. Stn."}
MACRO {ResPapUSDAForServNortheastResStn} {"Res. Pap. USDA For. Serv. Northeast. Res. Stn."}
MACRO {ResPapUSDAForServSoutheastIntermtResStn} {"Res. Pap. USDA For. Serv. Southeast Intermt. Res. Stn."}
MACRO {ResPositionPapCSIROLandWater} {"Res. Position Pap. CSIRO Land Water"}
MACRO {ResPublGreatBarrierReefMarParkAuth} {"Res. Publ. Great Barrier Reef Mar. Park Auth."}
MACRO {ResRepFlindersInstAtmosMarSci} {"Res. Rep. Flinders Inst. Atmos. Mar. Sci."}
MACRO {ResRepIllUnivWaterResourCent} {"Res. Rep. Ill. Univ. Water Resour. Cent."}
MACRO {ResRepKyUnivWaterResourResInst} {"Res.Rep. Ky. Univ. Water Resour. Res. Inst."}
MACRO {ResRepMinnSeaGrantProgram} {"Res. Rep. Minn. Sea Grant Program"}
MACRO {ResRepSupervSciAlligatorRiversRegAust} {"Res. Rep. Superv. Sci. Alligator Rivers Reg. (Aust.)"}
MACRO {ResRepWaterServAssocAust} {"Res. Rep. Water Serv. Assoc. Aust."}
MACRO {ResResourManageRepUSNatlParkServ} {"Res./Resour. Manage. Rep. U.S. Natl. Park Serv."}
MACRO {ResPopulEcol} {"Res. Popul. Ecol."}
MACRO {ResourEnvironBiotechnol} {"Resour. Environ. Biotechnol."}
MACRO {Resources} {"Resources"}
MACRO {RespirMed} {"Respir. Med."}
MACRO {RessourMerIFREMER} {"Ressour. Mer IFREMER"}
MACRO {RestorManageNotes} {"Restor. Manage. Notes"}
MACRO {RestorEcol} {"Restor. Ecol."}
MACRO {ResultGenPecheMaritSenegal} {"Result. Gen. Peche Marit. Senegal."}
MACRO {RevDevEcon} {"Rev. Dev. Econ."}
MACRO {RevEconStud} {"Rev. Econ. Stud."}
MACRO {RevEurCommunityIntEnvironLaw} {"Rev. Eur. Community Int. Environ. Law"}
MACRO {RevMaritTransp} {"Rev. Marit. Transp."}
MACRO {RevPalaeobotPalynol} {"Rev. Palaeobot. Palynol."}
MACRO {RevEndocrMetabDisord} {"Rev. Endocr. Metab. Disord."}
MACRO {RevEnvironSciTechnol} {"Rev. Environ. Sci. Technol."}
MACRO {RevFishBiolFish} {"Rev. Fish Biol. Fish."}
MACRO {RevFishSci} {"Rev. Fish. Sci."}
MACRO {RevGastroenterolDisord} {"Rev. Gastroenterol. Disord."}
MACRO {RevMedMicrobiol} {"Rev. Med. Microbiol."}
MACRO {RevMedVirol} {"Rev. Med. Virol."}
MACRO {RevMolBiotechnol} {"Rev. Mol. Biotechnol."}
MACRO {RevToxicol} {"Rev. Toxicol."}
MACRO {RevGeophys} {"Rev. Geophys."}
MACRO {RevBrasBiol} {"Rev. Bras. Biol."}
MACRO {RevBrasEntomol} {"Rev. Bras. Entomol."}
MACRO {RevBrasOceanogrBrazJOceanogr} {"Rev. Bras. Oceanogr./Braz. J. Oceanogr."}
MACRO {RevBrasZool} {"Rev. Bras. Zool."}
MACRO {RevChilEntomol} {"Rev. Chil. Entomol."}
MACRO {RevChilHistNat} {"Rev. Chil. Hist. Nat."}
MACRO {RevColombianaBiotecnol} {"Rev. Colombiana Biotecnol."}
MACRO {RevCubInvestPesq} {"Rev. Cub. Invest. Pesq."}
MACRO {RevFacOdontolLins} {"Rev. Fac. Odontol. Lins"}
MACRO {RevBiolLisboa} {"Rev. Biol. (Lisboa)"}
MACRO {RevBiolMarOceanogr} {"Rev. Biol. Mar. Oceanogr."}
MACRO {RevBiolTrop} {"Rev. Biol. Trop."}
MACRO {RevBiolUnivAveiro} {"Rev. Biol. Univ. Aveiro"}
MACRO {RevCiencFarm} {"Rev. Cienc. Farm."}
MACRO {RevEcolLatinoam} {"Rev. Ecol. Latinoam."}
MACRO {RevIctiol} {"Rev. Ictiol."}
MACRO {RevInvestPesqMaputo} {"Rev. Invest. Pesq. (Maputo)"}
MACRO {RevInvestCientUnivAutonBajaCalifSurSerCiencMar} {"Rev. Invest. Cient. Univ. Auton. Baja Calif. Sur (Ser. Cienc. Mar)"}
MACRO {RevInvestDesarrPesq} {"Rev. Invest. Desarr. Pesq."}
MACRO {RevInvestMar} {"Rev. Invest. Mar."}
MACRO {RevComPermPacSur} {"Rev. Com. Perm. Pac. Sur"}
MACRO {RevFacAgron} {"Rev. Fac. Agron."}
MACRO {RevFacAgronUnivZulia} {"Rev. Fac. Agron. Univ. Zulia"}
MACRO {RevSocEntomolArgent} {"Rev. Soc. Entomol. Argent."}
MACRO {RevSocMexHistNat} {"Rev. Soc. Mex. Hist. Nat."}
MACRO {RevMar} {"Rev. Mar."}
MACRO {RevMicrobiol} {"Rev. Microbiol."}
MACRO {RevOdontolUNESP} {"Rev. Odontol. UNESP"}
MACRO {RevSaudePublicaSaoPaulo} {"Rev. Saude Publica, Sao Paulo"}
MACRO {RevZoolIztacala} {"Rev. Zool. (Iztacala)"}
MACRO {RevMusArgentCiencNatNuevaSer} {"Rev. Mus. Argent. Cienc. Nat. (Nueva Ser.)"}
MACRO {RevInstAdolfoLutz} {"Rev. Inst. Adolfo Lutz"}
MACRO {RevGeofisMex} {"Rev. Geofis. (Mex.)"}
MACRO {RevIberoamMicol} {"Rev. Iberoam. Micol."}
MACRO {RevIntContamAmbient} {"Rev. Int. Contam. Ambient."}
MACRO {RevLatAcui} {"Rev. Lat. Acui."}
MACRO {RevLatinoamMicrobiol} {"Rev. Latinoam. Microbiol."}
MACRO {RevMedChile} {"Rev. Med. Chile"}
MACRO {RevNicaragEntomol} {"Rev. Nicarag. Entomol."}
MACRO {RevNordestinaBiol} {"Rev. Nordestina Biol."}
MACRO {RevPanamSaludPublicaPanAmJPublicHealth} {"Rev. Panam. Salud Publica/Pan Am. J. Public Health"}
MACRO {RevPeruAcuic} {"Rev. Peru. Acuic."}
MACRO {RevPeruBiol} {"Rev. Peru. Biol."}
MACRO {RevPortCiencVet} {"Rev. Port. Cienc. Vet."}
MACRO {RevVet} {"Rev. Vet."}
MACRO {RevInstGeolUnivNacAutonMex} {"Rev. Inst. Geol. Univ. Nac. Auton. Mex."}
MACRO {RevEpidemiolSantePubliqueEpidemiolPubHealth} {"Rev. Epidemiol. Sante Publique/Epidemiol. Pub. Health"}
MACRO {RevElevMedVetPaysTrop} {"Rev. Elev. Med. Vet. Pays Trop."}
MACRO {RevInstNatlAgronTunis} {"Rev. Inst. Natl. Agron. Tunis."}
MACRO {RevMedVet} {"Rev. Med. Vet."}
MACRO {RevRhumEnglEd} {"Rev. Rhum. (Engl. Ed.)"}
MACRO {RevSciEauJWaterSci} {"Rev. Sci. Eau/J. Water Sci."}
MACRO {RevGenFroid} {"Rev. Gen. Froid"}
MACRO {RevMarit} {"Rev. Marit."}
MACRO {RevRoumBiolBiolAnim} {"Rev. Roum. Biol. (Biol. Anim.)"}
MACRO {RevSuisseZool} {"Rev. Suisse Zool."}
MACRO {RevTechCETMEF} {"Rev. Tech. CETMEF"}
MACRO {Rheumatology} {"Rheumatology"}
MACRO {Rhodora} {"Rhodora"}
MACRO {Ribarstvo} {"Ribarstvo"}
MACRO {RingingMigr} {"Ringing Migr."}
MACRO {RisalahPerikananBilangan} {"Risalah Perikanan Bilangan"}
MACRO {RiskHealthSafEnviron} {"Risk - Health Saf. Environ."}
MACRO {RiskAnal} {"Risk Anal."}
MACRO {RitFiskideildarJMarResInst} {"Rit Fiskideildar/J. Mar. Res. Inst."}
MACRO {RiverResAppl} {"River Res. Appl."}
MACRO {Rivers} {"Rivers"}
MACRO {RiversFuture} {"Rivers Future"}
MACRO {RivBiolBiolForum} {"Riv. Biol./Biol. Forum"}
MACRO {RivIdrobiol} {"Riv. Idrobiol."}
MACRO {RivParassitol} {"Riv. Parassitol."}
MACRO {RivSciAliment} {"Riv. Sci. Aliment."}
MACRO {RivItalAcquacolt} {"Riv. Ital. Acquacolt."}
MACRO {RNA} {"RNA"}
MACRO {RoczMuzGornoslaskBytomPrzyod} {"Rocz. Muz. Gornoslask. Bytom. Przyod."}
MACRO {RostockMeeresbiolBeitr} {"Rostock. Meeresbiol. Beitr."}
MACRO {RouxsArchDevBiol} {"Roux's Arch. Dev. Biol."}
MACRO {RozprMonogr} {"Rozpr. Monogr."}
MACRO {RTRIRep} {"RTRI Rep."}
MACRO {RudolstaedterNaturhistSchr} {"Rudolstaedter Naturhist. Schr."}
MACRO {RudolstaedterNaturhistSchrSuppl} {"Rudolstaedter Naturhist. Schr., Suppl."}
MACRO {RuralRemoteHealth} {"Rural Remote Health"}
MACRO {RussAcadSciOceanol} {"Russ. Acad. Sci. Oceanol."}
MACRO {RussJAquatEcol} {"Russ. J. Aquat. Ecol."}
MACRO {RussianJEcol} {"Russian J. Ecol."}
MACRO {RussJGenet} {"Russ. J. Genet."}
MACRO {RussJMarBiolBiolMorya} {"Russ. J. Mar. Biol./Biol. Morya"}
MACRO {Ruthenica} {"Ruthenica"}
MACRO {RybnGospod} {"Rybn. Gospod."}
MACRO {RybnGospodUkrFishUkr} {"Rybn. Gospod. Ukr./Fish. Ukr."}
MACRO {RybnKhozMosc} {"Rybn. Khoz. (Mosc.)"}
MACRO {RybokhozIzuchVnutrVodoemov} {"Rybokhoz. Izuch. Vnutr. Vodoemov"}
MACRO {Rybolov} {"Rybolov"}
MACRO {RybovodRybolov} {"Rybovod. Rybolov."}
MACRO {SABRAOJ} {"SABRAO J."}
MACRO {SABRAOJBreedGenet} {"SABRAO J. Breed. Genet."}
MACRO {SADCInlandFishNews} {"SADC Inland Fish. News"}
MACRO {SADCNatResourNewsl} {"SADC Nat. Resour. Newsl."}
MACRO {SAFEJ} {"SAFE J."}
MACRO {SafHealth} {"Saf. Health"}
MACRO {SafSeaInt} {"Saf. Sea Int."}
MACRO {SafSci} {"Saf. Sci."}
MACRO {SaharaJSocialAspectsHIVAIDS} {"Sahara J. Social Aspects HIV/AIDS"}
MACRO {SamakiNews} {"Samaki News"}
MACRO {SAMUDRARep} {"SAMUDRA Rep."}
MACRO {SAMUDRADoss} {"SAMUDRA: Doss."}
MACRO {SanFranciscoEstuaryWatershedSci} {"San Francisco Estuary Watershed Sci."}
MACRO {SantoTomasJMed} {"Santo Tomas J. Med."}
MACRO {SARQSAREnvironRes} {"SAR QSAR Environ. Res."}
MACRO {SARDIResRepSer} {"SARDI Res. Rep. Ser."}
MACRO {Sarsia} {"Sarsia"}
MACRO {SbJihoceskehoMuzCeskBudejovicichPrirVedy} {"Sb. Jihoceskeho Muz. Cesk. Budejovicich, Prir. Vedy"}
MACRO {SbNauchnTrAtlantNIRO} {"Sb. Nauchn. Tr. AtlantNIRO"}
MACRO {SbNauchnTrMMBI} {"Sb. Nauchn. Tr. MMBI"}
MACRO {SbNauchnTrNIIGA} {"Sb. Nauchn. Tr. NIIGA"}
MACRO {SbNauchnTrPINRO} {"Sb. Nauchn. Tr. PINRO"}
MACRO {SbNauchnTrVNIROCollectPapAllRussResInstMarFishOceanogr} {"Sb. Nauchn. Tr. VNIRO/Collect. Pap. All-Russ. Res. Inst. Mar. Fish. Oceanogr."}
MACRO {SbNauchnTrVNIIPRKh} {"Sb. Nauchn. Tr. VNIIPRKh"}
MACRO {SbNauchnTrGosNIORKh} {"Sb. Nauchn. Tr. GosNIORKh"}
MACRO {SbRabIBM} {"Sb. Rab. IBM"}
MACRO {SbTrZoolMuzMGUArchZoolMusMoscStateUniv} {"Sb. Tr. Zool. Muz. MGU/Arch. Zool. Mus. Mosc. State Univ."}
MACRO {ScandAudiol} {"Scand. Audiol."}
MACRO {ScandJClinLabInvest} {"Scand. J. Clin. Lab. Invest."}
MACRO {ScandJDentRes} {"Scand. J. Dent. Res."}
MACRO {ScandJForRes} {"Scand. J. For. Res."}
MACRO {ScandJGastroenterolSuppl} {"Scand. J. Gastroenterol., Suppl."}
MACRO {ScandJImmunol} {"Scand. J. Immunol."}
MACRO {ScandJImmunolSuppl} {"Scand. J. Immunol., Suppl."}
MACRO {ScandJInfectDis} {"Scand. J. Infect. Dis."}
MACRO {ScandJInfectDisSuppl} {"Scand. J. Infect. Dis. Suppl."}
MACRO {ScandJMedSciSports} {"Scand. J. Med. Sci. Sports"}
MACRO {ScandJPsychol} {"Scand. J. Psychol."}
MACRO {ScandJPublicHealth} {"Scand. J. Public Health"}
MACRO {ScandJRehabilMed} {"Scand. J. Rehabil. Med."}
MACRO {ScandJWorkEnvironHealth} {"Scand. J. Work Environ. Health"}
MACRO {ScandPolitStud} {"Scand. Polit. Stud."}
MACRO {SchiffHafen} {"Schiff Hafen"}
MACRO {SchrBundesforschungsanstFischHamb} {"Schr. Bundesforschungsanst. Fisch. Hamb."}
MACRO {SchrNaturwissVerSchleswHolst} {"Schr. Naturwiss. Ver. Schlesw.- Holst."}
MACRO {SchriftenrSchutzgemDtschNordseekueste} {"Schriftenr. Schutzgem. Dtsch. Nordseekueste"}
MACRO {SchriftenrVerbDtschFischereiverwaltungsbeamterFischereiwiss} {"Schriftenr. Verb. Dtsch. Fischereiverwaltungsbeamter Fischereiwiss."}
MACRO {SchriftenrVerWasserBodenLufthyg} {"Schriftenr. Ver. Wasser- Boden- Lufthyg."}
MACRO {SchriftenrUmwFisch} {"Schriftenr. Umw. (Fisch.)"}
MACRO {SchriftenrNationalparkSchleswHolstWattenmeer} {"Schriftenr. Nationalpark Schlesw.-Holst. Wattenmeer"}
MACRO {SciCult} {"Sci. Cult."}
MACRO {SciResInternalRepNZDeptConserv} {"Sci. Res. Internal Rep. NZ Dept. Conserv."}
MACRO {ScienceWash} {"Science (Wash.)"}
MACRO {SciEnviron} {"Sci. Environ."}
MACRO {SciBullFacAgricKyushuUniv} {"Sci. Bull. Fac. Agric. Kyushu Univ."}
MACRO {SciConserv} {"Sci. Conserv."}
MACRO {SciChinaSerA} {"Sci. China Ser. A"}
MACRO {SciChinaSerCLifeSci} {"Sci. China Ser. C (Life Sci.)"}
MACRO {SciChinaSeriesFInformSci} {"Sci. China. Series F: Inform. Sci."}
MACRO {SciTotalEnviron} {"Sci. Total Environ."}
MACRO {SciTsunamiHazards} {"Sci. Tsunami Hazards"}
MACRO {SciProg} {"Sci. Prog."}
MACRO {SciRepToyohashiMusNatHist} {"Sci. Rep. Toyohashi Mus. Nat. Hist."}
MACRO {SciRepNewDelhi} {"Sci.Rep. (New Delhi)"}
MACRO {SciRepTohokuUniv4SerBiol} {"Sci. Rep. Tohoku Univ. (4 Ser. Biol.)"}
MACRO {SciRepHirosakiUniv} {"Sci. Rep. Hirosaki Univ."}
MACRO {SciRevPacRegDepFishOceansCan} {"Sci. Rev. Pac. Reg. Dep. Fish. Oceans (Can.)"}
MACRO {SciRevScotiaFundyRegDepFishOceansCan} {"Sci. Rev. Scotia-Fundy Reg. Dep. Fish. Oceans (Can.)"}
MACRO {SciSerAquatEnvironMonitRepCentEnvironFishAquacSci} {"Sci. Ser. Aquat. Environ. Monit. Rep. Cent. Environ. Fish. Aquac. Sci."}
MACRO {SciSerAquatEnvironProtAnalMethods} {"Sci. Ser. Aquat. Environ. Prot. Anal. Methods"}
MACRO {SciSerDataRepCentEnvironFishAquacSci} {"Sci. Ser. Data Rep. Cent. Environ. Fish. Aquac. Sci."}
MACRO {SciSerTechRepCentEnvironFishAquacSci} {"Sci. Ser. Tech. Rep. Cent. Environ. Fish. Aquac. Sci."}
MACRO {ScienceCiencia} {"Science/Ciencia"}
MACRO {SciTechEau} {"Sci. Tech. Eau"}
MACRO {SciIranica} {"Sci. Iranica"}
MACRO {SciMarBarc} {"Sci. Mar. (Barc.)"}
MACRO {SciSilvaeSin} {"Sci. Silvae Sin."}
MACRO {SciAm} {"Sci. Am."}
MACRO {SciAmSciMed} {"Sci. Am. Sci. Med."}
MACRO {SciCouncRepNAFO} {"Sci. Counc. Rep. NAFO"}
MACRO {SciCouncResDocNAFO} {"Sci. Counc. Res. Doc. NAFO"}
MACRO {SciCouncStudNAFO} {"Sci. Counc. Stud. NAFO"}
MACRO {SciPapInstAlgolResFacSciHokkaidoUniv} {"Sci. Pap. Inst. Algol. Res. Fac. Sci. Hokkaido Univ."}
MACRO {SciPapInstAlgolResHokkaidoUniv} {"Sci. Pap. Inst. Algol. Res. Hokkaido Univ."}
MACRO {SciPublFreshwatBiolAssocAmbleside} {"Sci. Publ. Freshwat. Biol. Assoc. Ambleside"}
MACRO {SciRepLabAmphibianBiolHiroshimaUniv} {"Sci. Rep. Lab. Amphibian Biol., Hiroshima Univ."}
MACRO {SciRepIPHC} {"Sci. Rep. IPHC."}
MACRO {SciRepSeaMammResUnitCamb} {"Sci. Rep. Sea Mamm. Res. Unit Camb."}
MACRO {SciRepCetaceanRes} {"Sci. Rep. Cetacean Res."}
MACRO {SciRepHokkaidoFishHatch} {"Sci. Rep. Hokkaido Fish Hatch."}
MACRO {SciRepHokkaidoFishExpStn} {"Sci. Rep. Hokkaido Fish. Exp. Stn."}
MACRO {SciRepHokkaidoSalmHatch} {"Sci. Rep. Hokkaido Salm. Hatch."}
MACRO {SciStudyResChemChemEngBiotechFoodIndustry} {"Sci. Study Res. Chem. Chem. Eng. Biotech. Food Industry"}
MACRO {ScottAquacultResRep} {"Scott. Aquacult. Res. Rep."}
MACRO {ScottFishInfPam} {"Scott. Fish. Inf. Pam."}
MACRO {ScottFishResRep} {"Scott. Fish. Res. Rep."}
MACRO {ScottFishStat} {"Scott. Fish. Stat."}
MACRO {ScottJGeol} {"Scott. J. Geol."}
MACRO {ScottNat} {"Scott. Nat."}
MACRO {SIORef} {"SIO Ref."}
MACRO {SIOTechRep} {"SIO Tech. Rep."}
MACRO {SeaFishStatMinistAgricFishFoodGB} {"Sea Fish. Stat. Minist. Agric. Fish. Food (G.B.)"}
MACRO {SeaFront} {"Sea Front."}
MACRO {SeaGrantAdvisRepHawaiiUnivSeaGrantProgram} {"Sea Grant Advis. Rep. Hawaii Univ. Sea Grant Program"}
MACRO {SeaGrantCoopRepHawaiiUniv} {"Sea Grant Coop. Rep. Hawaii Univ."}
MACRO {SeaGrantExtBullFlaSeaGrantCollProgram} {"Sea Grant Ext. Bull. Fla. Sea Grant Coll. Program"}
MACRO {SeaGrantExtPublFlaSeaGrantCollProgram} {"Sea Grant Ext. Publ. Fla. Sea Grant Coll. Program"}
MACRO {SeaGrantMarEconRepHawaiiUniv} {"Sea Grant Mar. Econ. Rep. Hawaii Univ."}
MACRO {SeaGrantMiscRepHawaiiUniv} {"Sea Grant Misc. Rep. Hawaii Univ."}
MACRO {SeaGrantProgramRepAlaskaUnivInstMarSci} {"Sea Grant Program Rep. Alaska Univ. Inst. Mar. Sci."}
MACRO {SeaGrantProjPapVaPolytechInstStateUniv} {"Sea Grant Proj. Pap. Va. Polytech. Inst. State Univ."}
MACRO {SeaGrantPublCalifUnivSanDiegoInstMarResour} {"Sea Grant Publ. Calif. Univ. San Diego Inst. Mar. Resour."}
MACRO {SeaGrantPublLaStateUnivCentWetlandRes} {"Sea Grant Publ. La. State Univ. Cent. Wetland Res."}
MACRO {SeaGrantPublMaineUniv} {"Sea Grant Publ. Maine Univ."}
MACRO {SeaGrantPublNCUnivSeaGrantProgram} {"Sea Grant Publ. N.C. Univ. Sea Grant Program"}
MACRO {SeaGrantRepDelUnivCollMarStud} {"Sea Grant Rep. Del. Univ. Coll. Mar. Stud."}
MACRO {SeaGrantRepPRUnivSeaGrantProgram} {"Sea Grant Rep. P.R. Univ. Sea Grant Program"}
MACRO {SeaGrantRepRIUniv} {"Sea Grant Rep. R.I. Univ."}
MACRO {SeaGrantSpecRepMiamiUniv} {"Sea Grant Spec. Rep. Miami Univ."}
MACRO {SeaGrantTechBullMiamiUniv} {"Sea Grant Tech. Bull. Miami Univ."}
MACRO {SeaGrantTechRepHawaiiUniv} {"Sea Grant Tech. Rep. Hawaii Univ."}
MACRO {SeaGrantTechRepWisUnivSeaGrantInst} {"Sea Grant Tech. Rep. Wis. Univ. Sea Grant Inst."}
MACRO {SeaTechnol} {"Sea Technol."}
MACRO {TheSeaIdeasObsProgStudySeas} {"The Sea: Ideas Obs. Prog. Study Seas"}
MACRO {Seabird} {"Seabird"}
MACRO {SEAFDECAnnuRep} {"SEAFDEC Annu. Rep."}
MACRO {SEAFDECAsianAquacult} {"SEAFDEC Asian Aquacult."}
MACRO {SEAFDECMFRDMDRMRepMeet} {"SEAFDEC MFRDMD/RM (Rep. Meet.)"}
MACRO {SEAFDECMFRDMDSTStat} {"SEAFDEC MFRDMD/ST (Stat.)"}
MACRO {SEAFDECNewsl} {"SEAFDEC Newsl."}
MACRO {SeafoodExportJ} {"Seafood Export J."}
MACRO {SeafoodInt} {"Seafood Int."}
MACRO {SEAPOLNewsl} {"SEAPOL Newsl."}
MACRO {Seaways} {"Seaways"}
MACRO {SeaweedResUtil} {"Seaweed Res. Util."}
MACRO {Security} {"Security"}
MACRO {SedimentGeol} {"Sediment. Geol."}
MACRO {Seevoegel} {"Seevoegel"}
MACRO {SeismolResLett} {"Seismol. Res. Lett."}
MACRO {SemFundEsReumatol} {"Sem. Fund. Es. Reumatol."}
MACRO {SeminCancerBiol} {"Semin. Cancer Biol."}
MACRO {SeminCellDevBiol} {"Semin. Cell Dev. Biol."}
MACRO {SeminCellBiol} {"Semin. Cell Biol."}
MACRO {SeminDevBiol} {"Semin. Dev. Biol."}
MACRO {SeminImmunol} {"Semin. Immunol."}
MACRO {SeminOncol} {"Semin. Oncol."}
MACRO {SeminRoentgenol} {"Semin. Roentgenol."}
MACRO {SeminNeurosci} {"Semin. Neurosci."}
MACRO {SeminVirol} {"Semin. Virol."}
MACRO {SenckenbBiol} {"Senckenb. Biol."}
MACRO {SenckenbLethaea} {"Senckenb. Lethaea"}
MACRO {SenckenbMarit} {"Senckenb. Marit."}
MACRO {SenriEthnolStud} {"Senri Ethnol. Stud."}
MACRO {SensorLett} {"Sensor Lett."}
MACRO {SensorsActuatorsBChem} {"Sensors Actuators B: Chem."}
MACRO {SensSystSensSist} {"Sens. Syst./Sens. Sist."}
MACRO {SMRRapp} {"SMR Rapp."}
MACRO {SEFOSNot} {"SEFOS Not."}
MACRO {SepPurifMethods} {"Sep. Purif. Methods"}
MACRO {Sepsis} {"Sepsis"}
MACRO {SerCientInstAntrtChil} {"Ser. Cient. Inst. Ant rt. Chil."}
MACRO {SerCientUnivAutonBajaCalifSur} {"Ser. Cient. Univ. Auton. Baja Calif. Sur"}
MACRO {SerConservNatFundMiguelLillo} {"Ser. Conserv. Nat. Fund. Miguel Lillo"}
MACRO {SerInfEspecInstMarPeru} {"Ser. Inf. Espec. Inst. Mar. Peru"}
MACRO {SerFundamInstNacPescaAcuicColomb} {"Ser. Fundam. Inst. Nac. Pesca Acuic. (Colomb.)"}
MACRO {SerMonogrICCM} {"Ser. Monogr. ICCM"}
MACRO {Serket} {"Serket"}
MACRO {Seshaiyana} {"Seshaiyana"}
MACRO {SexTransmittedDis} {"Sex. Transmitted Dis."}
MACRO {SexTransInf} {"Sex. Trans. Inf."}
MACRO {SeychellesTunaBull} {"Seychelles Tuna Bull."}
MACRO {ShandongFishQiluYuye} {"Shandong Fish./Qilu Yuye"}
MACRO {ShellfishNews} {"Shellfish News"}
MACRO {ShellfishProdSurv} {"Shellfish Prod. Surv."}
MACRO {SherkinComment} {"Sherkin Comment"}
MACRO {ShigakenSuisanShikenjoKenkyuHokoku} {"Shiga-ken Suisan Shikenjo Kenkyu Hokoku"}
MACRO {SHILAPRevLepidopterol} {"SHILAP Rev. Lepidopterol."}
MACRO {ShipBoatInt} {"Ship Boat Int."}
MACRO {ShipRepair} {"Ship Repair"}
MACRO {ShockVibrat} {"Shock Vibrat."}
MACRO {ShoreBeach} {"Shore Beach"}
MACRO {ShrimpBull} {"Shrimp Bull."}
MACRO {SignalTransductKnowlEnviron} {"Signal Transduct. Knowl. Environ."}
MACRO {Sigurnost} {"Sigurnost"}
MACRO {SilvaFenn} {"Silva Fenn."}
MACRO {SilvaGabreta} {"Silva Gabreta"}
MACRO {SilvaeGenet} {"Silvae Genet."}
MACRO {Sinozoologia} {"Sinozoologia"}
MACRO {SinozoologiaDongwuxueJikan} {"Sinozoologia/Dongwuxue Jikan"}
MACRO {SINTEFRapp} {"SINTEF Rapp."}
MACRO {SIORefSerScrippsInstOceanogr} {"SIO Ref. Ser. Scripps Inst. Oceanogr."}
MACRO {SIORepSerScrippsInstOceanogr} {"SIO Rep. Ser. Scripps Inst. Oceanogr."}
MACRO {SjukdomsstatAnimDisRep} {"Sjukdomsstat./Anim. Dis. Rep."}
MACRO {SkeletalRadiol} {"Skeletal Radiol."}
MACRO {SkinResTechnol} {"Skin Res. Technol."}
MACRO {Sleep} {"Sleep"}
MACRO {SleepHypnosis} {"Sleep Hypnosis"}
MACRO {SlezskeZemskeMuzCasSerAVedyPrir} {"Slezske Zemske Muz. Cas. Ser. A Vedy Prir."}
MACRO {SmallFruitsRev} {"Small Fruits Rev."}
MACRO {SMHIOceanogr} {"SMHI Oceanogr."}
MACRO {SMHIRepOceanogr} {"SMHI Rep. Oceanogr."}
MACRO {SmithianaBull} {"Smithiana Bull."}
MACRO {SmithianaSpecPubl} {"Smithiana Spec. Publ."}
MACRO {SmithsonContribBot} {"Smithson. Contrib. Bot."}
MACRO {SmithsonContribPaleobiol} {"Smithson. Contrib. Paleobiol."}
MACRO {SmithsonContribEarthSci} {"Smithson. Contrib. Earth Sci."}
MACRO {SmithsonContribMarSci} {"Smithson. Contrib. Mar. Sci."}
MACRO {SmithsonContribZool} {"Smithson. Contrib. Zool."}
MACRO {SocEconPapInstSocEconResMemUnivNfld} {"Soc. Econ. Pap. Inst. Soc. Econ. Res. Mem. Univ. Nfld."}
MACRO {SocForces} {"Soc. Forces"}
MACRO {SocSciMed} {"Soc. Sci. Med."}
MACRO {SocNatResour} {"Soc. Nat. Resour."}
MACRO {SocApplMicrobiolSympSer} {"Soc. Appl. Microbiol. Symp. Ser."}
MACRO {SocGenMicrobiolQ} {"Soc. Gen. Microbiol. Q."}
MACRO {SocExpBiolSemSer} {"Soc. Exp. Biol. Sem. Ser."}
MACRO {Sociobiology} {"Sociobiology"}
MACRO {SocHealthIllness} {"Soc. Health Illness"}
MACRO {SoilBiolBiochem} {"Soil Biol. Biochem."}
MACRO {SoilDynEarthquakeEng} {"Soil Dyn. Earthquake Eng."}
MACRO {SoilSciPlantNutr} {"Soil Sci. Plant Nutr."}
MACRO {SoilSciSocAmJ} {"Soil Sci. Soc. Am. J."}
MACRO {SomaticCellMolGenet} {"Somatic Cell Mol. Genet."}
MACRO {SomatosensMotorRes} {"Somatosens. Motor Res."}
MACRO {SOPACCruiseRep} {"SOPAC Cruise Rep."}
MACRO {SOPACJtContribRep} {"SOPAC Jt. Contrib. Rep."}
MACRO {SOPACMiscRep} {"SOPAC Misc. Rep."}
MACRO {SOPACNews} {"SOPAC News"}
MACRO {SOPACPrelimRep} {"SOPAC Prelim. Rep."}
MACRO {SOPACTechBull} {"SOPAC Tech. Bull."}
MACRO {SOPACTechRep} {"SOPAC Tech. Rep."}
MACRO {SOPACTrainRep} {"SOPAC Train. Rep."}
MACRO {SoratoUmi} {"Sora to Umi"}
MACRO {SoundVibrat} {"Sound Vibrat."}
MACRO {SAfrCommerFishRev} {"S. Afr. Commer. Fish. Rev."}
MACRO {SAfrFoodBeverageManufRev} {"S. Afr. Food Beverage Manuf. Rev."}
MACRO {SAfrJAnimSci} {"S. Afr. J. Anim. Sci."}
MACRO {SAfrJAntarctRes} {"S. Afr. J. Antarct. Res."}
MACRO {SAfrJBot} {"S. Afr. J. Bot."}
MACRO {SAfrJGeolSAfrTydskrGeol} {"S. Afr. J. Geol./S. Afr. Tydskr. Geol."}
MACRO {SAfrJMarSciSAfrTydskrSeewet} {"S. Afr. J. Mar. Sci./S.-Afr. Tydskr. Seewet."}
MACRO {SAfrJPlantSoilSAfrTydskrPlantGrond} {"S. Afr. J. Plant Soil./S.-Afr. Tydskr. Plant Grond"}
MACRO {SAfrJSci} {"S. Afr. J. Sci."}
MACRO {SAfrJWildlRes} {"S. Afr. J. Wildl. Res."}
MACRO {SAfrJZool} {"S. Afr. J. Zool."}
MACRO {SAfrMedJSAfrMedTydskr} {"S. Afr. Med. J./S.-Afr. Med. Tydskr."}
MACRO {SAfrShippNewsFishIndRev} {"S. Afr. Shipp. News Fish. Ind. Rev."}
MACRO {SouthGlobMag} {"South Glob. Mag."}
MACRO {SPacJNatSci} {"S. Pac. J. Nat. Sci."}
MACRO {SPacMarGeolNotes} {"S. Pac. Mar. Geol. Notes"}
MACRO {SoutheastAsianJTropMedPublicHealth} {"Southeast Asian J. Trop. Med. Public Health"}
MACRO {SoutheasternGeol} {"Southeastern Geol."}
MACRO {SoutheastNat} {"Southeast. Nat."}
MACRO {SouthFish} {"South. Fish."}
MACRO {SouthJApplFor} {"South. J. Appl. For."}
MACRO {SouthwestEntomol} {"Southwest. Entomol."}
MACRO {SouthwestNat} {"Southwest. Nat."}
MACRO {SpaceTechnol} {"Space Technol."}
MACRO {SpecIssueRepIntWhalingComm} {"Spec. Issue Rep. Int. Whaling Comm."}
MACRO {SpecPapSoutheastAsianFishDevCent} {"Spec. Pap. Southeast Asian Fish. Dev. Cent."}
MACRO {SpecPapUSNavOceanResDevAct} {"Spec. Pap. U.S. Nav. Ocean Res. Dev. Act."}
MACRO {SpecPapHuttonFoundNZ} {"Spec. Pap. Hutton Found. N. Z."}
MACRO {SpecPublSadoMarBiolStnNiigataUniv} {"Spec. Publ. Sado Mar. Biol. Stn. Niigata Univ."}
MACRO {SpecPublSerAtlSalmFed} {"Spec. Publ. Ser. Atl. Salm. Fed."}
MACRO {SpecPublSerGreatBarrierReefMarParkAuth} {"Spec. Publ. Ser. Great Barrier Reef Mar. Park Auth."}
MACRO {SpecPublAmFishSoc} {"Spec. Publ. Am. Fish. Soc."}
MACRO {SpecPublAsianFishSoc} {"Spec. Publ. Asian Fish. Soc."}
MACRO {SpecPublGLFC} {"Spec. Publ. GLFC"}
MACRO {SpecPublPhuketMarBiolCent} {"Spec. Publ. Phuket Mar. Biol. Cent."}
MACRO {SpecPublJLBSmithInstIchthyolGrahamstown} {"Spec. Publ. J.L.B. Smith Inst. Ichthyol. Grahamstown"}
MACRO {SpecRepApplSciOceanEng} {"Spec. Rep. Appl. Sci. Ocean Eng."}
MACRO {SpecRepApplMarSciOceanEngVaInstMarSci} {"Spec. Rep. Appl. Mar. Sci. Ocean Eng. Va. Inst. Mar. Sci."}
MACRO {SpecRepHydrolEngCentDavisCalif} {"Spec. Rep. Hydrol. Eng. Cent. Davis Calif."}
MACRO {SpecRepIATTCRepSpecCIAT} {"Spec. Rep. IATTC/Rep. Spec. CIAT"}
MACRO {SpecRepSeaFishResInstCapeTown} {"Spec. Rep. Sea Fish. Res. Inst. Cape Town"}
MACRO {SpecRepUSArmyCoastEngResCent} {"Spec. Rep. U.S. Army Coast. Eng. Res. Cent."}
MACRO {SpecRepUSArmyColdRegResEngLab} {"Spec. Rep. U.S. Army Cold Reg. Res. Eng. Lab."}
MACRO {SpecRepUSArmyConstructEngResLab} {"Spec. Rep. U.S. Army Construct. Eng. Res. Lab."}
MACRO {SpecRepUSNavOceanResDevAct} {"Spec. Rep. U.S. Nav. Ocean Res. Dev. Act."}
MACRO {SpecSeaGrantRepVaPolytechInstStateUniv} {"Spec. Sea Grant Rep. Va. Polytech. Inst. State Univ."}
MACRO {SpectrochimActaPtAMolSpectrosc} {"Spectrochim. Acta, Pt. A: Mol. Spectrosc."}
MACRO {SpectrochimActaPtAMolBiomolSpectrosc} {"Spectrochim. Acta, Pt. A: Mol. Biomol. Spectrosc."}
MACRO {SpeculationsSciTechnol} {"Speculations Sci. Technol."}
MACRO {SpillSciTechnolBull} {"Spill Sci. Technol. Bull."}
MACRO {Spine} {"Spine"}
MACRO {Spixiana} {"Spixiana"}
MACRO {SpixianaSuppl} {"Spixiana (Suppl.)"}
MACRO {SportSoc} {"Sport Soc."}
MACRO {SportsEng} {"Sports Eng."}
MACRO {SportsExercInjury} {"Sports Exerc. Injury"}
MACRO {SportsMed} {"Sports Med."}
MACRO {SportsMedAlert} {"Sports Med. Alert"}
MACRO {SportsMedArthRev} {"Sports Med. Arth. Rev."}
MACRO {SportsMedStandMalpracticeRep} {"Sports Med. Stand. Malpractice Rep."}
MACRO {SportsMedTrainRehabil} {"Sports Med., Train. Rehabil."}
MACRO {SPREPTopicRev} {"SPREP Topic Rev."}
MACRO {SpringerSeminImmunopathol} {"Springer Semin. Immunopathol."}
MACRO {SriLankaJAquatSci} {"Sri Lanka J. Aquat. Sci."}
MACRO {StThomasLawRev} {"St. Thomas Law Rev."}
MACRO {StanfordLawRev} {"Stanford Law Rev."}
MACRO {StateFishRepFishDepWestAustralia} {"State Fish. Rep. Fish. Dep. West. Australia"}
MACRO {StateWorldFishAquac} {"State World Fish. Aquac."}
MACRO {SFTVeiledning} {"SFT-Veiledning"}
MACRO {StatBullICCATBullStatCICTABolEstadCICAA} {"Stat. Bull. ICCAT/Bull. Stat. CICTA/Bol. Estad. CICAA"}
MACRO {StatBullNAFO} {"Stat. Bull. NAFO"}
MACRO {StatYearbAgricForFishSeoul} {"Stat. Yearb. Agric. For. Fish. (Seoul)"}
MACRO {StatYearbNPAFC} {"Stat. Yearb. NPAFC"}
MACRO {StatMed} {"Stat. Med."}
MACRO {StatisticsNorwayDiscussionPapersStatitiskSentralbyra} {"Statistics Norway Discussion Papers. Statitisk Sentralbyra"}
MACRO {StatFishProd} {"Stat. Fish Prod."}
MACRO {StatFishFactDepFishThail} {"Stat. Fish. Fact. Dep. Fish. (Thail.)"}
MACRO {StatMarShellfishOtherProd} {"Stat. Mar. Shellfish Other Prod."}
MACRO {StatShrimpCultDepFishThail} {"Stat. Shrimp Cult. Dep. Fish. (Thail.)"}
MACRO {StatPerikananIndonesFishStatIndones} {"Stat. Perikanan Indones./Fish. Stat. Indones."}
MACRO {StatPecheCaetiereOffNatlPechesMorocco} {"Stat. Peche Caetiere Off. Natl. Peches (Morocco)"}
MACRO {StatAnalStatAnalStatSentralbyraaNorw} {"Stat. Anal./Stat. Anal. Stat. Sentralbyraa (Norw.)"}
MACRO {StatusFishResourNSWFish} {"Status Fish. Resour. N.S.W. Fish."}
MACRO {Steenstrupia} {"Steenstrupia"}
MACRO {StemCells} {"Stem Cells"}
MACRO {STEPRapp} {"STEP Rapp."}
MACRO {SNFRep} {"SNF Rep."}
MACRO {StockAssessRepIATTC} {"Stock Assess. Rep. IATTC"}
MACRO {StockhContribGeol} {"Stockh. Contrib. Geol."}
MACRO {SIWIRep} {"SIWI Rep."}
MACRO {STPPharmaSci} {"STP Pharma Sci."}
MACRO {StraalevernRapp} {"Straalevern Rapp."}
MACRO {Strain} {"Strain"}
MACRO {Stratigraphy} {"Stratigraphy"}
MACRO {Stress} {"Stress"}
MACRO {StressHealth} {"Stress Health"}
MACRO {Stroke} {"Stroke"}
MACRO {StructContrHealthMonit} {"Struct. Contr. Health Monit."}
MACRO {StructDesTallSpecBuild} {"Struct. Des. Tall Spec. Build."}
MACRO {StructDesTallBuild} {"Struct. Des. Tall Build."}
MACRO {StructEngMech} {"Struct. Eng. Mech."}
MACRO {StructEngInt} {"Struct. Eng. Int."}
MACRO {StructHealthMonit} {"Struct. Health Monit."}
MACRO {StructSaf} {"Struct. Saf."}
MACRO {Structure} {"Structure"}
MACRO {StudMarSinHaiyangKexueJikan} {"Stud. Mar. Sin./Haiyang Kexue Jikan"}
MACRO {StudOecol} {"Stud. Oecol."}
MACRO {StudWyzszaSkMorskSzczecin} {"Stud. Wyzsza Sk. Morsk. Szczecin."}
MACRO {StudiedocKBelgInstNatuurwetDocTravInstRSciNatBelg} {"Studiedoc. K. Belg. Inst. Natuurwet./Doc. Trav. Inst. R. Sci. Nat. Belg."}
MACRO {StudRevGFCM} {"Stud. Rev. GFCM"}
MACRO {StudFamilyPlann} {"Stud. Family Plann."}
MACRO {StudNeotropFaunaEnviron} {"Stud. Neotrop. Fauna Environ."}
MACRO {StudyTourRepDepPrimIndQueensl} {"Study Tour Rep. Dep. Prim. Ind. (Queensl.)"}
MACRO {SturgeonQ} {"Sturgeon Q."}
MACRO {StuttgarterBeitrNaturkdSerA} {"Stuttgarter Beitr. Naturkd., Ser. A"}
MACRO {StuttgarterBeitrNaturkdSerB} {"Stuttgarter Beitr. Naturkd., Ser. B"}
MACRO {StuttgBeitrNaturkdABiol} {"Stuttg. Beitr. Naturkd. (A Biol.)"}
MACRO {StuttgBeitrNaturkdBGeolPalaeontol} {"Stuttg. Beitr. Naturkd. (B Geol. Palaeontol.)"}
MACRO {StyretsSluttrapPUSHProgrammet} {"Styrets Sluttrap. PUSH-Programmet"}
MACRO {SuUrunDergJAquatProd} {"Su Urun. Derg./J. Aquat. Prod."}
MACRO {SuUrunDergJFishAquatSci} {"Su Urun. Derg./J. Fish. Aquat. Sci."}
MACRO {SuUrunIstatDevlIstatEnstTurkFishStatStateInstStatTurk} {"Su Urun. Istat. Devl. Istat. Enst. (Turk.)/Fish. Stat. State Inst. Stat. (Turk.)"}
MACRO {SubstUseMisuse} {"Subst. Use Misuse"}
MACRO {SuffolkTransnatlLawRev} {"Suffolk Transnatl. Law Rev."}
MACRO {SuisanKenkyusosho} {"Suisan Kenkyu sosho"}
MACRO {SuisanZoyoshokuSosho} {"Suisan Zoyoshoku Sosho"}
MACRO {SVTYmpaeristoeMiljoeOffStatFinland} {"SVT Ympaeristoe Miljoe/Off. Stat. Finland"}
MACRO {SVTMaaMetsaeKalatalousFinlandsOffStatJordSkogsbrukFiskeOffStatFinlandAgricForestFish} {"SVT Maa Metsae Kalatalous/Finlands. Off. Stat. Jord Skogsbruk Fiske/Off. Stat. Finland Agric. Forest. Fish."}
MACRO {SurfCoatTechnol} {"Surf. Coat. Technol."}
MACRO {Surgery} {"Surgery"}
MACRO {SurvOphthalmol} {"Surv. Ophthalmol."}
MACRO {SurvGeophys} {"Surv. Geophys."}
MACRO {SvenBotTidskr} {"Sven. Bot. Tidskr."}
MACRO {SwaraEastAfrWildlSoc} {"Swara East Afr. Wildl. Soc."}
MACRO {SwedJAgricRes} {"Swed. J. Agric. Res."}
MACRO {SWEDMARSpecRep} {"SWEDMAR Spec. Rep."}
MACRO {Syllogeus} {"Syllogeus"}
MACRO {Symbiosis} {"Symbiosis"}
MACRO {Synapse} {"Synapse"}
MACRO {SynopBrFaunaNewSer} {"Synop. Br. Fauna (New Ser.)"}
MACRO {SyracuseLawRev} {"Syracuse Law Rev."}
MACRO {SystApplMicrobiol} {"Syst. Appl. Microbiol."}
MACRO {SystBiol} {"Syst. Biol."}
MACRO {SystBot} {"Syst. Bot."}
MACRO {SystEntomol} {"Syst. Entomol."}
MACRO {SystParasitol} {"Syst. Parasitol."}
MACRO {SystBiodivers} {"Syst. Biodivers."}
MACRO {TablasMareaCentInvestCientEducSuperEnsenada} {"Tablas Marea Cent. Invest. Cient. Educ. Super. Ensenada"}
MACRO {TablasMareasInstOceanolAcadCiencCuba} {"Tablas Mareas Inst. Oceanol. Acad. Cienc. Cuba"}
MACRO {TaetigkeitsberIntKommSchutzeRheinsVerunreinig} {"Taetigkeitsber. Int. Komm. Schutze Rheins Verunreinig."}
MACRO {TaiwanJPublicHealth} {"Taiwan J. Public Health"}
MACRO {Taiwania} {"Taiwania"}
MACRO {Talanta} {"Talanta"}
MACRO {Tane} {"Tane"}
MACRO {TAO} {"TAO"}
MACRO {TargetsApplGenomicsProteomics} {"Targets Appl. Genomics Proteomics"}
MACRO {TasmanNat} {"Tasman. Nat."}
MACRO {Taxon} {"Taxon"}
MACRO {TechBullPacTunaDevFound} {"Tech. Bull. Pac. Tuna Dev. Found."}
MACRO {TechCircDirFishBahrain} {"Tech. Circ. Dir. Fish. (Bahrain)"}
MACRO {TechComplRepMontInstWaterResourResCent} {"Tech. Compl. Rep. Mont. Inst. Water Resour. Res. Cent."}
MACRO {TechComplRepNMWaterResourResCent} {"Tech. Compl. Rep. N.M. Water Resour. Res. Cent."}
MACRO {TechDocHydrolEngCentDavisCalif} {"Tech. Doc. Hydrol. Eng. Cent. Davis Calif."}
MACRO {TechDocIntegrCoastFishManagProjSecrPacCommunity} {"Tech. Doc. Integr. Coast. Fish. Manag. Proj. Secr. Pac. Community"}
MACRO {TechDocLakeVicFishResProjPhaseII} {"Tech. Doc. Lake Vic. Fish. Res. Proj. Phase II"}
MACRO {TechDocSouthCalifUnivInstMarCoastStud} {"Tech. Doc. South. Calif. Univ. Inst. Mar. Coast. Stud."}
MACRO {TechDocUSNavOceanResDevAct} {"Tech. Doc. U.S. Nav. Ocean Res. Dev. Act."}
MACRO {TechDocUSNavOceanSystCent} {"Tech. Doc. U.S. Nav. Ocean Syst. Cent."}
MACRO {TechDocUSNavUnderwatSystCent} {"Tech. Doc. U.S. Nav. Underwat. Syst. Cent."}
MACRO {TechMemoArgonneNatlLab} {"Tech. Memo. Argonne Natl. Lab."}
MACRO {TechMemoEnvironResInstMich} {"Tech. Memo. Environ. Res. Inst. Mich."}
MACRO {TechMemoGreatBarrierReefMarParkAuth} {"Tech. Memo. Great Barrier Reef Mar. Park Auth."}
MACRO {TechMemoOakRidgeNatlLab} {"Tech. Memo. Oak Ridge Natl. Lab."}
MACRO {TechMemoScrippsInstOceanogrMarPhysLab} {"Tech. Memo. Scripps Inst. Oceanogr. Mar. Phys. Lab."}
MACRO {TechMemoSupervSciAlligatorRiversRegAust} {"Tech. Memo. Superv. Sci. Alligator Rivers Reg. (Aust.)"}
MACRO {TechMemoUSNavCoastSystCent} {"Tech. Memo. U.S. Nav. Coast. Syst. Cent."}
MACRO {TechNoteNansenEnvironRemoteSensCent} {"Tech. Note Nansen Environ. Remote Sens. Cent."}
MACRO {TechNoteNatlCentAtmosResUS} {"Tech. Note Natl. Cent. Atmos. Res. (U.S.)"}
MACRO {TechNoteUSNavCoastalSystCent} {"Tech. Note U.S. Nav. Coastal. Syst. Cent."}
MACRO {TechNoteUSNavOceanResDevAct} {"Tech. Note U.S. Nav. Ocean Res. Dev. Act."}
MACRO {TechNoteUSNavOceanogrAtmosResLab} {"Tech. Note U.S. Nav. Oceanogr. Atmos. Res. Lab."}
MACRO {TechNoteUSNavyCivEngLab} {"Tech. Note U.S. Navy Civ. Eng. Lab."}
MACRO {TechPapBattellePacNorthwestLab} {"Tech. Pap. Battelle Pac. Northwest Lab."}
MACRO {TechPaperCSIROAtmosRes} {"Tech. Paper. CSIRO Atmos. Res."}
MACRO {TechPapFlaSeaGrantProgram} {"Tech. Pap. Fla. Sea Grant Program"}
MACRO {TechPapHydrolEngResCentDavisCalif} {"Tech. Pap. Hydrol. Eng. Res. Cent. Davis Calif."}
MACRO {TechPapNatlRenewEnergyLabUS} {"Tech. Pap. Natl. Renew. Energy Lab. (U.S.)"}
MACRO {TechPapNigerInstOceanogrMarRes} {"Tech. Pap. Niger. Inst. Oceanogr. Mar. Res."}
MACRO {TechPapReefResourAssessManag} {"Tech. Pap. Reef Resour. Assess. Manag."}
MACRO {TechPapSolarEnergyResInstGoldenColo} {"Tech. Pap. Solar Energy Res. Inst. Golden Colo."}
MACRO {TechPapUSArmyCoastEngResCent} {"Tech. Pap. U.S. Army Coast. Eng. Res. Cent."}
MACRO {TechPapUSBurLandManage} {"Tech. Pap. U.S. Bur. Land Manage."}
MACRO {TechPublSerAmWaterResourAssoc} {"Tech. Publ. Ser. Am. Water Resour. Assoc."}
MACRO {TechRepMRCREADProjCambodia} {"Tech. Rep. MRC-READ Proj. (Cambodia)"}
MACRO {TechRepSerChesapeakeBayProgram} {"Tech. Rep. Ser. Chesapeake Bay Program"}
MACRO {TechRepSerIAEA} {"Tech. Rep. Ser. IAEA"}
MACRO {TechRepSerNatlInstFreshwatFishResNiger} {"Tech. Rep. Ser. Natl. Inst. Freshwat. Fish. Res. (Niger.)"}
MACRO {TechRepSerNigerGerKainjiLakeFishPromotProj} {"Tech. Rep. Ser. Niger. Ger. Kainji Lake Fish. Promot. Proj."}
MACRO {TechRepSerTennValleyAuth} {"Tech. Rep. Ser. Tenn. Valley Auth."}
MACRO {TechRepBattellePacNorthwestLab} {"Tech. Rep. Battelle Pac. Northwest Lab."}
MACRO {TechRepCRCReefResCent} {"Tech. Rep. CRC Reef Res. Cent."}
MACRO {TechRepCSIROMarRes} {"Tech. Rep. CSIRO Mar. Res."}
MACRO {TechRepDelUnivSeaGrantCollProgram} {"Tech. Rep. Del. Univ. Sea Grant Coll. Program"}
MACRO {TechRepGreatBarrierReefMarParkAuth} {"Tech. Rep. Great Barrier Reef Mar. Park Auth."}
MACRO {TechRepGLFC} {"Tech. Rep. GLFC"}
MACRO {TechRepHawaiiDepLandNatResourDivWaterLandDev} {"Tech. Rep. Hawaii Dep. Land Nat. Resour. Div. Water Land Dev."}
MACRO {TechRepHawaiiInstGeophys} {"Tech. Rep. Hawaii Inst. Geophys."}
MACRO {TechRepHawaiiUnivWaterResourResCent} {"Tech. Rep. Hawaii Univ. Water Resour. Res. Cent."}
MACRO {TechRepIDOECUAE} {"Tech. Rep. IDOE CUAE"}
MACRO {TechRepIPHC} {"Tech. Rep. IPHC"}
MACRO {TechRepLamontDohertyGeolObs} {"Tech. Rep. Lamont-Doherty Geol. Obs."}
MACRO {TechRepLaStateUnivCoastStudInst} {"Tech. Rep. La. State Univ. Coast. Stud. Inst."}
MACRO {TechRepMaineSeaGrant} {"Tech. Rep. Maine Sea Grant"}
MACRO {TechRepMarGeosciUnitUnivCapeTown} {"Tech. Rep. Mar. Geosci. Unit Univ. Cape Town"}
MACRO {TechRepMarResLabDepPrimIndFishTasman} {"Tech. Rep. Mar. Res. Lab. Dep. Prim. Ind. Fish. (Tasman.)"}
MACRO {TechRepMarStudProgrammeUnivSPac} {"Tech. Rep. Mar. Stud. Programme Univ. S. Pac."}
MACRO {TechRepMdUnivSeaGrantProgram} {"Tech. Rep. Md. Univ. Sea Grant Program"}
MACRO {TechRepMiamiUnivRosenstielSchMarAtmosSci} {"Tech. Rep. Miami Univ. Rosenstiel Sch. Mar. Atmos. Sci."}
MACRO {TechRepMichUnivSeaGrantProgram} {"Tech. Rep. Mich. Univ. Sea Grant Program"}
MACRO {TechRepNRSC} {"Tech. Rep. NRSC"}
MACRO {TechRepNatlInstOceanogrIndia} {"Tech. Rep. Natl. Inst. Oceanogr. (India)"}
MACRO {TechRepNatHistMusLosAngCty} {"Tech. Rep. Nat. Hist. Mus. Los Ang. Cty."}
MACRO {TechRepOceanFishProgrammeSecrPacCommunity} {"Tech. Rep. Ocean. Fish. Programme Secr. Pac. Community"}
MACRO {TechRepOffNavRes} {"Tech. Rep. Off. Nav. Res."}
MACRO {TechRepPaStateUnivApplResLab} {"Tech. Rep. Pa. State Univ. Appl. Res. Lab."}
MACRO {TechRepPurdueUnivWaterResourResCent} {"Tech. Rep. Purdue Univ. Water Resour. Res. Cent."}
MACRO {RepFishResInstWashUniv} {"Rep. Fish. Res. Inst. Wash. Univ."}
MACRO {TechRepSeychellesFishAuth} {"Tech. Rep. Seychelles Fish. Auth."}
MACRO {TechRepSolarEnergyResInstGoldenColo} {"Tech. Rep. Solar Energy Res. Inst. Golden Colo."}
MACRO {TechRepSCMarResourCent} {"Tech. Rep. S.C. Mar. Resour. Cent."}
MACRO {TechRepSouthCalifUnivSeaGrantProgram} {"Tech. Rep. South. Calif. Univ. Sea Grant Program"}
MACRO {TechRepTasmanianAquacultFishInst} {"Tech. Rep. Tasmanian Aquacult. Fish. Inst."}
MACRO {TechRepTetraTech} {"Tech. Rep. Tetra Tech."}
MACRO {TechRepTexasA&MUnivDepOceanogr} {"Tech. Rep. Texas A & M Univ. Dep. Oceanogr."}
MACRO {TechRepTexasUnivApplResLab} {"Tech. Rep. Texas Univ. Appl. Res. Lab."}
MACRO {TechRepUSAirForceGeophysLab} {"Tech. Rep. U.S. Air Force Geophys. Lab."}
MACRO {TechRepUSArmyCoastEngResCent} {"Tech. Rep. U.S. Army Coast. Eng. Res. Cent."}
MACRO {TechRepUSArmyColdRegResEngLab} {"Tech. Rep. U.S. Army Cold Reg. Res. Eng. Lab."}
MACRO {TechRepUSArmyEngTopogrLab} {"Tech. Rep. U.S. Army Eng. Topogr. Lab."}
MACRO {TechRepUSArmyEngWaterwaysExpStn} {"Tech. Rep. U.S. Army Eng. Waterways Exp. Stn."}
MACRO {TechRepUSBurReclam} {"Tech. Rep. U.S. Bur. Reclam."}
MACRO {TechRepUSFishWildlServ} {"Tech. Rep. U.S. Fish Wildl. Serv."}
MACRO {TechRepUSNavEnvironPredictResFacil} {"Tech. Rep. U.S. Nav. Environ. Predict. Res. Facil."}
MACRO {TechRepUSNavMedResInst} {"Tech. Rep. U.S. Nav. Med. Res. Inst."}
MACRO {TechRepUSNavOceanSystCent} {"Tech. Rep. U.S. Nav. Ocean Syst. Cent."}
MACRO {TechRepUSNavPostgradSch} {"Tech. Rep. U.S. Nav. Postgrad. Sch."}
MACRO {TechRepUSNavSurfWeaponsCent} {"Tech. Rep. U.S. Nav. Surf. Weapons Cent."}
MACRO {TechRepUSNavUnderwatSystCent} {"Tech. Rep. U.S. Nav. Underwat. Syst. Cent."}
MACRO {TechRepUSNavyCivEngLab} {"Tech. Rep. U.S. Navy Civ. Eng. Lab."}
MACRO {TechRepUnivWashDepAtmosSci} {"Tech. Rep. Univ. Wash. Dep. Atmos. Sci."}
MACRO {TechRepVaUnivDepEnvironSci} {"Tech. Rep. Va. Univ. Dep. Environ. Sci."}
MACRO {TechRepWashDepFish} {"Tech. Rep. Wash. Dep. Fish."}
MACRO {TechRepWashUnivApplPhysLab} {"Tech. Rep. Wash. Univ. Appl. Phys. Lab."}
MACRO {TechRepWestinghouseSavannahRiverCo} {"Tech. Rep. Westinghouse Savannah River Co."}
MACRO {TechRepWisUnivDepGeolGeophys} {"Tech. Rep. Wis. Univ. Dep. Geol. Geophys."}
MACRO {TechRepWoodsHoleOceanogrInst} {"Tech. Rep. Woods Hole Oceanogr. Inst."}
MACRO {TechSerIOC} {"Tech. Ser. IOC"}
MACRO {TechSerNZDeptConserv} {"Tech. Ser. NZ Dept. Conserv."}
MACRO {TechSummRepWisUnivMathResCent} {"Tech. Summ. Rep. Wis. Univ. Math. Res. Cent."}
MACRO {TechSummOhioSeaGrant} {"Tech. Summ. Ohio Sea Grant"}
MACRO {TechnolForecastSocChange} {"Technol. Forecast. Soc. Change"}
MACRO {TechnolHealthCare} {"Technol. Health Care"}
MACRO {Technovation} {"Technovation"}
MACRO {TecnolAmbient} {"Tecnol. Ambient."}
MACRO {TellUs} {"Tell'Us"}
MACRO {TellusADynMeteorolOceanogr} {"Tellus (A Dyn. Meteorol. Oceanogr.)"}
MACRO {TellusBChemPhysMeteorol} {"Tellus (B Chem. Phys. Meteorol.)"}
MACRO {TemaNord} {"TemaNord"}
MACRO {TeratogCarcinogMutag} {"Teratog., Carcinog. Mutag."}
MACRO {Terra} {"Terra"}
MACRO {TesisDrInstEspOceanogr} {"Tesis Dr. Inst. Esp. Oceanogr."}
MACRO {Tetrahedron} {"Tetrahedron"}
MACRO {TetrahedronLett} {"Tetrahedron Lett."}
MACRO {TexAssocHealthPhysEducRecreationDanceJ} {"Tex. Assoc. Health, Phys. Educ., Recreation, Dance J."}
MACRO {TexLawRev} {"Tex. Law Rev."}
MACRO {TexasShores} {"Texas Shores"}
MACRO {TextRefBookSerTrainDepSoutheastAsianFishDevCent} {"Text/Ref. Book Ser. Train. Dep. Southeast Asian Fish. Dev. Cent."}
MACRO {TexteUmweltbundesamt} {"Texte Umweltbundesamt"}
MACRO {TFRIConfProc} {"TFRI Conf. Proc."}
MACRO {ThaiFishVesselsStat} {"Thai Fish. Vessels Stat."}
MACRO {ThaiMarFishResBull} {"Thai Mar. Fish. Res. Bull."}
MACRO {Thalassas} {"Thalassas"}
MACRO {ThalassiaSalent} {"Thalassia Salent."}
MACRO {TheorApplFractMech} {"Theor. Appl. Fract. Mech."}
MACRO {TheorApplGenet} {"Theor. Appl. Genet."}
MACRO {TheorIssuesErgonomicsSci} {"Theor. Issues Ergonomics Sci."}
MACRO {TheorPopulBiol} {"Theor. Popul. Biol."}
MACRO {TherImmunol} {"Ther. Immunol."}
MACRO {TheScientificWorldJ} {"TheScientificWorld J."}
MACRO {Thorax} {"Thorax"}
MACRO {TidsskrSamfunnsforsk} {"Tidsskr. Samfunnsforsk."}
MACRO {TieraerztlUmsch} {"Tieraerztl. Umsch."}
MACRO {TijdschrEntomol} {"Tijdschr. Entomol."}
MACRO {TissueCell} {"Tissue Cell"}
MACRO {TissueAntigens} {"Tissue Antigens"}
MACRO {TissueEng} {"Tissue Eng."}
MACRO {TMLConfProc} {"TML Conf. Proc."}
MACRO {TodaysAquar} {"Today's Aquar."}
MACRO {TohokuJAgricRes} {"Tohoku J. Agric. Res."}
MACRO {TokyoMetropUnivBullNatHist} {"Tokyo Metrop. Univ. Bull. Nat. Hist."}
MACRO {ToxicolPathol} {"Toxicol. Pathol."}
MACRO {ToxicolEnvironChem} {"Toxicol. Environ. Chem."}
MACRO {ToxicolRev} {"Toxicol. Rev."}
MACRO {ToxicolSci} {"Toxicol. Sci."}
MACRO {Toxicology} {"Toxicology"}
MACRO {ToxicolApplPharmacol} {"Toxicol. Appl. Pharmacol."}
MACRO {ToxicolIndHealth} {"Toxicol. Ind. Health"}
MACRO {ToxicolInVitro} {"Toxicol. In Vitro"}
MACRO {ToxicolInt} {"Toxicol. Int."}
MACRO {ToxicolLett} {"Toxicol. Lett."}
MACRO {ToxicolMechMethods} {"Toxicol. Mech. Methods"}
MACRO {Toxicon} {"Toxicon"}
MACRO {ToxinRev} {"Toxin Rev."}
MACRO {TrabOceanogrUnivFedPernambuco} {"Trab. Oceanogr. Univ. Fed. Pernambuco"}
MACRO {TraditMarResourManagKnowlInfBull} {"Tradit. Mar. Resour. Manag. Knowl. Inf. Bull."}
MACRO {TrafficInjuryPrev} {"Traffic Injury Prev."}
MACRO {TrainCourseRepIOC} {"Train. Course Rep. IOC"}
MACRO {TrainRepSPacRegEnvironProgramme} {"Train. Rep. S. Pac. Reg. Environ. Programme"}
MACRO {TransNanjingUnivAeronautAstronaut} {"Trans. Nanjing Univ. Aeronaut. Astronaut."}
MACRO {TransOceanolLimnolHaiyangHuzhaoTongbao} {"Trans. Oceanol. Limnol./Haiyang Huzhao Tongbao"}
MACRO {TransAmEntomolSoc} {"Trans. Am. Entomol. Soc."}
MACRO {TransAmFishSoc} {"Trans. Am. Fish. Soc."}
MACRO {TransAmSocAgricChem} {"Trans. Am. Soc. Agric. Chem."}
MACRO {TransASAE} {"Trans. ASAE"}
MACRO {TransIllStateAcadSci} {"Trans. Ill. State Acad. Sci."}
MACRO {TransKansAcadSci} {"Trans. Kans. Acad. Sci."}
MACRO {TransKyAcadSci} {"Trans. Ky. Acad. Sci."}
MACRO {TransLepidopterolSocJap} {"Trans. Lepidopterol. Soc. Jap."}
MACRO {TransNatHistSocNorthumbria} {"Trans. Nat. Hist. Soc. Northumbria"}
MACRO {TransNebrAcadSci} {"Trans. Nebr. Acad. Sci."}
MACRO {TransNAmWildlNatResourConf} {"Trans. N. Am. Wildl. Nat. Resour. Conf."}
MACRO {TransRSocEdinb} {"Trans. R. Soc. Edinb."}
MACRO {TransRSocSAfr} {"Trans. R. Soc. S. Afr."}
MACRO {TransRSocSAust} {"Trans. R. Soc. S. Aust."}
MACRO {TransRSocTropMedHyg} {"Trans. R. Soc. Trop. Med. Hyg."}
MACRO {TransTokyoUnivFish} {"Trans. Tokyo Univ. Fish."}
MACRO {TransWiscAcadSciArtsLett} {"Trans. Wisc. Acad. Sci. Arts Lett."}
MACRO {TransZimbabweSciAssoc} {"Trans. Zimbabwe Sci. Assoc."}
MACRO {TransTianjinUniv} {"Trans. Tianjin Univ."}
MACRO {TransfusionApheresisSci} {"Transfusion Apheresis Sci."}
MACRO {TransgenicRes} {"Transgenic Res."}
MACRO {Transgenics} {"Transgenics"}
MACRO {TransplantImmunol} {"Transplant Immunol."}
MACRO {TransplantInt} {"Transplant Int."}
MACRO {Transplantation} {"Transplantation"}
MACRO {TranspPolicy} {"Transp. Policy"}
MACRO {Transportation} {"Transportation"}
MACRO {TranspResA} {"Transp. Res. A"}
MACRO {TranspResB} {"Transp. Res. B"}
MACRO {TranspResC} {"Transp. Res. C"}
MACRO {TranspResDTranspEnviron} {"Transp. Res. D: Transp. Environ."}
MACRO {TranspResFTrafficPsycholBehav} {"Transp. Res. F: Traffic Psychol. Behav."}
MACRO {TravDocInstSciPechesMarit} {"Trav. Doc. Inst. Sci. Peches Marit."}
MACRO {TravSciParcNatlPortCros} {"Trav. Sci. Parc Natl. Port-Cros"}
MACRO {TrebMusZoolBarc} {"Treb. Mus. Zool. Barc."}
MACRO {TreeGenetGenom} {"Tree Genet. Genom."}
MACRO {TreesNatResour} {"Trees Nat. Resour."}
MACRO {TrendsBiochemSci} {"Trends Biochem. Sci."}
MACRO {TrendsBiotechnol} {"Trends Biotechnol."}
MACRO {TrendsCellBiol} {"Trends Cell Biol."}
MACRO {TrendsCompBiochemPhysiol} {"Trends Comp. Biochem. Physiol."}
MACRO {TrendsEcolEvol} {"Trends Ecol. Evol."}
MACRO {TrendsEndocrinolMetab} {"Trends Endocrinol. Metab."}
MACRO {TrendsFoodSciTechnol} {"Trends Food Sci. Technol."}
MACRO {TrendsGenet} {"Trends Genet."}
MACRO {TrendsImmunol} {"Trends Immunol."}
MACRO {TrendsMicrobiol} {"Trends Microbiol."}
MACRO {TrendsMolMed} {"Trends Mol. Med."}
MACRO {TrendsNeurosci} {"Trends Neurosci."}
MACRO {TrendsParasitol} {"Trends Parasitol."}
MACRO {TrendsPharmacolSci} {"Trends Pharmacol. Sci."}
MACRO {TrendsPharmacolSciReceptorIonChannelNomenclatureSuppl} {"Trends Pharmacol. Sci. Receptor Ion Channel Nomenclature Suppl."}
MACRO {TrendsPhotochemPhotobiol} {"Trends Photochem. Photobiol."}
MACRO {TrendsPlantSci} {"Trends Plant Sci."}
MACRO {Trianea} {"Trianea"}
MACRO {TrochusInfBull} {"Trochus Inf. Bull."}
MACRO {TropAgric} {"Trop. Agric."}
MACRO {TropGeogrMed} {"Trop. Geogr. Med."}
MACRO {TropCoasts} {"Trop. Coasts"}
MACRO {TropEcol} {"Trop. Ecol."}
MACRO {TropFishHobbyist} {"Trop. Fish. Hobbyist"}
MACRO {TropForPap} {"Trop. For. Pap."}
MACRO {TropFreshwatBiol} {"Trop. Freshwat. Biol."}
MACRO {TropGeogrRedaiDili} {"Trop. Geogr./Redai Dili"}
MACRO {TropLepid} {"Trop. Lepid."}
MACRO {TropMedIntHealth} {"Trop. Med. Int. Health"}
MACRO {TropZool} {"Trop. Zool."}
MACRO {TroutNews} {"Trout News"}
MACRO {TrAntarktEhksped} {"Tr. Antarkt. Ehksped."}
MACRO {TrAANII} {"Tr. AANII"}
MACRO {TrBBSMGU} {"Tr. BBS MGU"}
MACRO {TrBiolNIIPGUPapBiolSciResInstStPeterbgUniv} {"Tr. Biol. NII PGU/Pap. Biol. Sci. Res. Inst. St.-Peterbg. Univ."}
MACRO {TrDVNIGMI} {"Tr. DVNIGMI"}
MACRO {TrGINTransGeolInstRussAcadSci} {"Tr. GIN/Trans. Geol. Inst. Russ. Acad. Sci."}
MACRO {TrGOIN} {"Tr. GOIN"}
MACRO {TrInstBiolVnutrVodTransInstBiolInlandWaters} {"Tr. Inst. Biol. Vnutr. Vod/Trans. Inst. Biol. Inland Waters"}
MACRO {TrIORANTransInstOceanolRAN} {"Tr. IORAN/Trans. Inst. Oceanol. RAN"}
MACRO {TrLimnolInst} {"Tr. Limnol. Inst."}
MACRO {TrPaleontolInst} {"Tr. Paleontol. Inst."}
MACRO {TrVGBOTransHydrobiolSocRAN} {"Tr. VGBO/Trans. Hydrobiol. Soc. RAN"}
MACRO {TrVNIIGMIMTsD} {"Tr. VNIIGMI-MTsD"}
MACRO {TrYugNIROProcSouthSciResInstMarFishOceanogr} {"Tr. YugNIRO/Proc. South. Sci. Res. Inst. Mar. Fish. Oceanogr."}
MACRO {TrZINProcZoolInstRAN} {"Tr. ZIN/Proc. Zool. Inst. RAN"}
MACRO {TsitolGenetCytolGenet} {"Tsitol. Genet./Cytol. Genet."}
MACRO {TubercleLungDis} {"Tubercle Lung Dis."}
MACRO {Tuberculosis} {"Tuberculosis"}
MACRO {TulaneStudZoolBot} {"Tulane Stud. Zool. Bot."}
MACRO {TumorBiol} {"Tumor Biol."}
MACRO {TumorTarget} {"Tumor Target."}
MACRO {TunaFishAssessRep} {"Tuna Fish. Assess. Rep."}
MACRO {TunaFishYearb} {"Tuna Fish. Yearb."}
MACRO {TunnelTrenchlessConstruct} {"Tunnel. Trenchless Construct."}
MACRO {TunnelUndergroundSpaceTechnol} {"Tunnel. Underground Space Technol."}
MACRO {TunnelsTunnelInt} {"Tunnels Tunnel Int."}
MACRO {TurkishJFishAquatSci} {"Turkish J. Fish. Aquat. Sci."}
MACRO {TurkJMarSci} {"Turk. J. Mar. Sci."}
MACRO {TurtleTortoiseNewsl} {"Turtle Tortoise Newsl."}
MACRO {USNavWarCollIntLawStud} {"U.S. Nav. War. Coll. Int. Law Stud."}
MACRO {UchZapPGUGeogrNaukSciPapStPetersbgStateUnivGeogrSci} {"Uch. Zap. PGU (Geogr. Nauk)/Sci. Pap. St.-Petersbg. State Univ. (Geogr. Sci.)"}
MACRO {UCLALawRev} {"UCLA Law Rev."}
MACRO {UitkBelgZeeviss} {"Uitk. Belg. Zeeviss."}
MACRO {UKTradeBullSFIA} {"UK Trade Bull. (SFIA)"}
MACRO {UkrBotZh} {"Ukr. Bot. Zh."}
MACRO {UkrBiokhimZhUkrBiokhimZhUkrBiochemJ} {"Ukr. Biokhim. Zh./Ukr. Biokhim. Zh./Ukr. Biochem. J."}
MACRO {UkrAntarktZhUkrAntarctJ} {"Ukr. Antarkt. Zh./Ukr. Antarct. J."}
MACRO {UltrasoundMedBiol} {"Ultrasound Med. Biol."}
MACRO {UltrasoundObstetrGynecol} {"Ultrasound Obstetr. Gynecol."}
MACRO {UminoKenkyu} {"Umi no Kenkyu"}
MACRO {UmitoSora} {"Umi to Sora"}
MACRO {UmiMer} {"Umi/Mer"}
MACRO {UmweltwissSchadstoffForsch} {"Umweltwiss. Schadstoff-Forsch."}
MACRO {UndergroundConstr} {"Underground Constr."}
MACRO {UnderseaHyperbMed} {"Undersea Hyperb. Med."}
MACRO {UnderwatNat} {"Underwat. Nat."}
MACRO {UnderwatTechnol} {"Underwat. Technol."}
MACRO {UNEPEnvironLib} {"UNEP Environ. Lib."}
MACRO {UNEPRegSeasDirBibliogr} {"UNEP Reg. Seas Dir. Bibliogr."}
MACRO {UNEPRegSeasRepStud} {"UNEP Reg. Seas Rep. Stud."}
MACRO {UNICIENCIA} {"UNICIENCIA"}
MACRO {UnivCienc} {"Univ. Cienc."}
MACRO {UnivCiencTecnol} {"Univ. Cienc. Tecnol."}
MACRO {UrbanNatMag} {"Urban Nat. Mag."}
MACRO {UrbanWater} {"Urban Water"}
MACRO {UspSovremBiolAdvCurrBiol} {"Usp. Sovrem. Biol./Adv. Curr. Biol."}
MACRO {UtahSci} {"Utah Sci."}
MACRO {Vaccine} {"Vaccine"}
MACRO {VaccineRes} {"Vaccine Res."}
MACRO {VANN} {"VANN"}
MACRO {VattenWater} {"Vatten/Water"}
MACRO {VectorBorneZoonoticDis} {"Vector Borne Zoonotic Dis."}
MACRO {Vegetatio} {"Vegetatio"}
MACRO {VehSystDyn} {"Veh. Syst. Dyn."}
MACRO {VeidimlastofnunFjaelritFreshwFishInst} {"Veidim lastofnun Fjaelrit/Freshw. Fish. Inst."}
MACRO {Veliger} {"Veliger"}
MACRO {VenusJapJMalacol} {"Venus Jap. J. Malacol."}
MACRO {VerhDtschZoolGes} {"Verh. Dtsch. Zool. Ges."}
MACRO {VerhGesIchthyol} {"Verh. Ges. Ichthyol."}
MACRO {VerhGesOekol} {"Verh. Ges. Oekol."}
MACRO {VerhZoolBotGesWien} {"Verh. Zool.-Bot. Ges. Wien"}
MACRO {VerhIntVerTheorAngewLimnolProcIntAssocTheorApplLimnolTravAssocIntLimnolTheorAppl} {"Verh. Int. Ver. Theor. Angew. Limnol./Proc. Int. Assoc. Theor. Appl. Limnol./Trav. Assoc. Int. Limnol. Theor. Appl."}
MACRO {VestBio} {"VestBio"}
MACRO {VestnAkadNaukUkr} {"Vestn. Akad. Nauk Ukr."}
MACRO {VestnMoskUnivBiol} {"Vestn. Mosk. Univ. (Biol.)"}
MACRO {VestnRAN} {"Vestn. RAN"}
MACRO {VestnStPeterbUnivGeolGeogr} {"Vestn. St.-Peterb. Univ. (Geol. Geogr.)"}
MACRO {VestnStPetersbUnivBiol} {"Vestn. St.-Petersb. Univ. (Biol.)"}
MACRO {VestnZool} {"Vestn. Zool."}
MACRO {VetMontev} {"Vet. (Montev.)"}
MACRO {VetZootec} {"Vet. Zootec."}
MACRO {VetMex} {"Vet. Mex."}
MACRO {VetHumToxicol} {"Vet. Hum. Toxicol."}
MACRO {VetClinNAmSmallAnimPract} {"Vet. Clin. N. Am.: Small Anim. Pract."}
MACRO {VetImmunolImmunopathol} {"Vet. Immunol. Immunopathol."}
MACRO {VetJ} {"Vet. J."}
MACRO {VetMicrobiol} {"Vet. Microbiol."}
MACRO {VetParasitol} {"Vet. Parasitol."}
MACRO {VetPathol} {"Vet. Pathol."}
MACRO {VetRec} {"Vet. Rec."}
MACRO {VetRes} {"Vet. Res."}
MACRO {VetResCommun} {"Vet. Res. Commun."}
MACRO {VicNat} {"Vic. Nat."}
MACRO {VieMilieu} {"Vie Milieu"}
MACRO {VietnamFishExtBull} {"Vietnam Fish. Ext. Bull."}
MACRO {VillesPortsCitiesPorts} {"Villes Ports/Cities Ports"}
MACRO {VoilenceAgainstWomen} {"Voilence Against Women"}
MACRO {ViralHepatitisRev} {"Viral Hepatitis Rev."}
MACRO {ViralImmunol} {"Viral Immunol."}
MACRO {VirchowsArchiv} {"Virchows Archiv"}
MACRO {VirginiaJIntLaw} {"Virginia J. Int. Law"}
MACRO {VaJSci} {"Va. J. Sci."}
MACRO {VaLawRev} {"Va. Law Rev."}
MACRO {VaMarResourBull} {"Va. Mar. Resour. Bull."}
MACRO {VirolSin} {"Virol. Sin."}
MACRO {Virology} {"Virology"}
MACRO {VirusGenes} {"Virus Genes"}
MACRO {VirusRes} {"Virus Res."}
MACRO {VirusUirusu} {"Virus/Uirusu"}
MACRO {VisionRes} {"Vision Res."}
MACRO {VitenskRappZoolSer} {"Vitensk. Rapp. Zool. Ser."}
MACRO {Vitis} {"Vitis"}
MACRO {VLIZSpecPubl} {"VLIZ Spec. Publ."}
MACRO {VodnResur} {"Vodn. Resur."}
MACRO {Volucella} {"Volucella"}
MACRO {VomWasser} {"Vom Wasser"}
MACRO {VoprIkhtiol} {"Vopr. Ikhtiol."}
MACRO {VoprMedKhim} {"Vopr. Med. Khim."}
MACRO {VoprPitan} {"Vopr. Pitan."}
MACRO {VoprRybolov} {"Vopr. Rybolov."}
MACRO {VoprVirusol} {"Vopr. Virusol."}
MACRO {VoxSang} {"Vox Sang."}
MACRO {VTTPubl} {"VTT Publ."}
MACRO {WashingtonLawRev} {"Washington Law Rev."}
MACRO {WashSeaGrantPubl} {"Wash. Sea Grant Publ."}
MACRO {WashSeaGrantRep} {"Wash. Sea Grant Rep."}
MACRO {WashSeaGrantTechRep} {"Wash. Sea Grant Tech. Rep."}
MACRO {WasserBoden} {"Wasser Boden"}
MACRO {WasserguetedatenElbe} {"Wasserguetedaten Elbe"}
MACRO {WasteManage} {"Waste Manage."}
MACRO {WasteManageRes} {"Waste Manage. Res."}
MACRO {WaterAntwerp} {"Water (Antwerp.)"}
MACRO {WaterWastesDig} {"Water Wastes Dig."}
MACRO {WaterWastewaterProd} {"Water Wastewater Prod."}
MACRO {WaterEngManage} {"Water Eng. Manage."}
MACRO {WaterEnvironTechnol} {"Water Environ. Technol."}
MACRO {WaterEnvironRes} {"Water Environ. Res."}
MACRO {WaterJ} {"Water J."}
MACRO {WaterLog} {"Water Log"}
MACRO {WaterPolicy} {"Water Policy"}
MACRO {WaterQualResJCan} {"Water Qual. Res. J. Can."}
MACRO {WaterRes} {"Water Res."}
MACRO {WaterResourImpact} {"Water Resour. Impact"}
MACRO {WaterResourManage} {"Water Resour. Manage."}
MACRO {WaterResourRes} {"Water Resour. Res."}
MACRO {WaterResourVodResur} {"Water Resour./Vod. Resur."}
MACRO {WaterResourJNigerAssocHydrogeol} {"Water Resour. J. Niger. Assoc. Hydrogeol."}
MACRO {WaterSA} {"Water S. A."}
MACRO {WaterSciTechnol} {"Water Sci. Technol."}
MACRO {WaterSciTechnolWaterSupply} {"Water Sci. Technol. Water Supply"}
MACRO {WaterSci} {"Water Sci."}
MACRO {WaterSupply} {"Water Supply"}
MACRO {WaterSupplyPapUSGeolSurv} {"Water Supply Pap. U.S. Geol. Surv."}
MACRO {WaterAirSoilPollut} {"Water, Air, Soil Pollut."}
MACRO {WaterAirSoilPollutFocus} {"Water, Air, Soil Pollut. Focus"}
MACRO {WaterDataRepUSGeolSurv} {"Water-Data Rep. U.S. Geol. Surv."}
MACRO {Waterbirds} {"Waterbirds"}
MACRO {Watsonia} {"Watsonia"}
MACRO {WayneLawRev} {"Wayne Law Rev."}
MACRO {WeedRes} {"Weed Res."}
MACRO {WeedSci} {"Weed Sci."}
MACRO {WeedTechnol} {"Weed Technol."}
MACRO {WestFish} {"West. Fish."}
MACRO {WestIndianOceanJMarSci} {"West. Indian Ocean J. Mar. Sci."}
MACRO {WestJMed} {"West. J. Med."}
MACRO {WestNAmNat} {"West. N. Am. Nat."}
MACRO {WetlandSci} {"Wetland Sci."}
MACRO {Wetlands} {"Wetlands"}
MACRO {WetlandsSyd} {"Wetlands (Syd.)"}
MACRO {WetlandsEcolManage} {"Wetlands Ecol. Manage."}
MACRO {WHOTechRepSer} {"WHO Tech. Rep. Ser."}
MACRO {WiadEntomol} {"Wiad. Entomol."}
MACRO {WildernessEnvironMed} {"Wilderness Environ. Med."}
MACRO {Wildfire} {"Wildfire"}
MACRO {WildlandWaters} {"Wildland Waters"}
MACRO {WildlAust} {"Wildl. Aust."}
MACRO {WildlBiol} {"Wildl. Biol."}
MACRO {WildlRes} {"Wildl. Res."}
MACRO {WildlSocBull} {"Wildl. Soc. Bull."}
MACRO {Willdenowia} {"Willdenowia"}
MACRO {WilsonBull} {"Wilson Bull."}
MACRO {WindowNewsl} {"Window Newsl."}
MACRO {WisMedJ} {"Wis. Med. J."}
MACRO {WissMittNationalparkHoheTauern} {"Wiss. Mitt. Nationalpark Hohe Tauern"}
MACRO {WomenHealth} {"Women Health"}
MACRO {WomenFishInfBull} {"Women Fish. Inf. Bull."}
MACRO {WomenNatResour} {"Women Nat. Resour."}
MACRO {WomenSportPhysActJ} {"Women Sport Phys. Act. J."}
MACRO {WomensHealthIssues} {"Women's Health Issues"}
MACRO {Work} {"Work"}
MACRO {WorkOccup} {"Work Occup."}
MACRO {WorkStress} {"Work Stress"}
MACRO {WorkEmploymentSoc} {"Work Employment Soc."}
MACRO {WorkPapBurRuralResourAust} {"Work. Pap. Bur. Rural Resour. (Aust.)"}
MACRO {WorkPapCalifSeaGrantCollProgram} {"Work. Pap. Calif. Sea Grant Coll. Program"}
MACRO {WorkPapCentApplRes} {"Work. Pap. Cent. Appl. Res."}
MACRO {WorkingPaperInstResEconBuisnessAdmin} {"Working Paper. Inst. Res. Econ. Buisness Admin."}
MACRO {WorkPapNCUnivSeaGrantProgram} {"Work. Pap. N.C. Univ. Sea Grant Program"}
MACRO {WorkPapUnivBergenDeptEcon} {"Work. Pap. Univ. Bergen Dept. Econ."}
MACRO {WorkshopRepIOC} {"Workshop Rep. IOC"}
MACRO {WorkshopSerGreatBarrierReefMarParkAuth} {"Workshop Ser. Great Barrier Reef Mar. Park Auth."}
MACRO {WorkshopWashSeaGrant} {"Workshop Wash. Sea Grant"}
MACRO {WorldAquacult} {"World Aquacult."}
MACRO {WorldBankDiscussPap} {"World Bank Discuss. Pap."}
MACRO {WorldJMicrobiolBiotechnol} {"World J. Microbiol. Biotechnol."}
MACRO {WorldResourRev} {"World Resour. Rev."}
MACRO {WorldShellsMondoConchiglie} {"World Shells/Mondo Conchiglie"}
MACRO {WorldTunnel} {"World Tunnel."}
MACRO {WorldFishCentAnnuRep} {"WorldFish Cent. Annu. Rep."}
MACRO {WorldFishCentBibliogr} {"WorldFish Cent. Bibliogr."}
MACRO {WorldFishCentConfProc} {"WorldFish Cent. Conf. Proc."}
MACRO {WorldFishCentEducSer} {"WorldFish Cent. Educ. Ser."}
MACRO {WorldFishCentMediumTermPlan} {"WorldFish Cent. Medium-Term Plan"}
MACRO {WorldFishCentOperPlan} {"WorldFish Cent. Oper. Plan"}
MACRO {WorldFishCentSoftw} {"WorldFish Cent. Softw."}
MACRO {WorldFishCentStrategPlan} {"WorldFish Cent. Strateg. Plan"}
MACRO {WorldFishCentStudRev} {"WorldFish Cent. Stud. Rev."}
MACRO {WorldFishCentTechRep} {"WorldFish Cent. Tech. Rep."}
MACRO {WuhanUnivJNatSci} {"Wuhan Univ. J. Nat. Sci."}
MACRO {XRaySpectrom} {"X-Ray Spectrom."}
MACRO {Xenobiotica} {"Xenobiotica"}
MACRO {Yakhteh} {"Yakhteh"}
MACRO {YearbIntHydrogrOrganAnnuOrganHydrogrInt} {"Yearb. Int. Hydrogr.Organ./Annu. Organ. Hydrogr. Int."}
MACRO {YearbIntTribLawSeaITLOS} {"Yearb. Int. Trib. Law Sea (ITLOS)"}
MACRO {Yeast} {"Yeast"}
MACRO {YemayaICSFNewslGendFish} {"Yemaya ICSF Newsl. Gend. Fish."}
MACRO {Yerbilimleri} {"Yerbilimleri"}
MACRO {YouthSoc} {"Youth Soc."}
MACRO {ZbBiotehFakUnivLjublResRepBiotechFacUnivLjubl} {"Zb. Bioteh. Fak. Univ. Ljubl./Res. Rep. Biotech. Fac. Univ. Ljubl."}
MACRO {ZArbeitsgemOsterrEntomol} {"Z. Arbeitsgem. Osterr. Entomol."}
MACRO {ZAngewZool} {"Z. Angew. Zool."}
MACRO {ZFeldherpetol} {"Z. Feldherpetol."}
MACRO {ZFischkd} {"Z. Fischkd."}
MACRO {ZMykol} {"Z. Mykol."}
MACRO {ZNaturforschSectC} {"Z. Naturforsch. Sect. C"}
MACRO {ZPflanzenernaehrBodenkd} {"Z. Pflanzenernaehr. Bodenkd."}
MACRO {ZPflanzenkrPflanzenschutz} {"Z. Pflanzenkr. Pflanzenschutz"}
MACRO {ZAngewGeol} {"Z. Angew. Geol."}
MACRO {ZMikroskAnatForsch} {"Z. Mikrosk.-Anat. Forsch."}
MACRO {ZNaturforschCBiosci} {"Z. Naturforsch. (C Biosci.)"}
MACRO {ZZoolSystEvolutionsforsch} {"Z. Zool. Syst. Evolutionsforsch."}
MACRO {ZentralblBakteriol} {"Zentralbl. Bakteriol."}
MACRO {ZhObshchBiolJGenBiol} {"Zh. Obshch. Biol./J. Gen. Biol."}
MACRO {ZimbabweAgricJ} {"Zimbabwe Agric. J."}
MACRO {ZooBiol} {"Zoo Biol."}
MACRO {Zoocriaderos} {"Zoocriaderos"}
MACRO {ZoolBaetica} {"Zool. Baetica"}
MACRO {ZoolScr} {"Zool. Scr."}
MACRO {ZoolJLinnSoc} {"Zool. J. Linn. Soc."}
MACRO {ZoolRes} {"Zool. Res."}
MACRO {ZoolSci} {"Zool. Sci."}
MACRO {ZoolStud} {"Zool. Stud."}
MACRO {ZoolZh} {"Zool. Zh."}
MACRO {ZoolJahrbSystOekolGeogrTiere} {"Zool. Jahrb. (Syst. Oekol. Geogr. Tiere)"}
MACRO {ZoolMeded} {"Zool. Meded."}
MACRO {ZoolAnz} {"Zool. Anz."}
MACRO {ZoolAnzSuppl} {"Zool. Anz. (Suppl.)"}
MACRO {ZoolMiddleEast} {"Zool. Middle East"}
MACRO {Zoomorphology} {"Zoomorphology"}
MACRO {Zoophysiology} {"Zoophysiology"}
MACRO {Zoosystema} {"Zoosystema"}
MACRO {ZootecNutrAnim} {"Zootec. Nutr. Anim."}
MACRO {ZusetsuGyogyoHakusho} {"Zusetsu Gyogyo Hakusho"}
MACRO {ZweijahresberAlfredWegenerInstPolarMeeresforsch} {"Zweijahresber. Alfred-Wegener-Inst. Polar- Meeresforsch."}
MACRO {ZweijahresberInstOstseeforschWarnemuende} {"Zweijahresber. Inst. Ostseeforsch. Warnemuende"}
MACRO {ZweijahresberZentMarTropenoekolUnivBremen} {"Zweijahresber. Zent. Mar. Tropenoekol. Univ. Bremen"}
MACRO {SystZool} {"Syst. Zool."}
MACRO {LivestProdSci} {"Livest. Prod. Sci."}
MACRO {JAmerStatistAssoc} {"J. Amer. Statist. Assoc."}
MACRO {BiometricalJ} {"Biometical J."}
MACRO {ProcRoyalSocEdinburgh} {"Proc. Royal Soc. Edinburgh"}
MACRO {newKey} {"full. name"}
MACRO {newKey2} {"full. name"}
%% Copyright 1994-2004 Patrick W Daly
MACRO {acmcs} {"ACM Comput. Surv."}

MACRO {acta} {"Acta Inf."}

MACRO {cacm} {"Commun. ACM"}

MACRO {ibmjrd} {"IBM J. Res. Dev."}

MACRO {ibmsj} {"IBM Syst.~J."}

MACRO {ieeese} {"IEEE Trans. Software Eng."}

MACRO {ieeetc} {"IEEE Trans. Comput."}

MACRO {ieeetcad}
 {"IEEE Trans. Comput. Aid. Des."}

MACRO {ipl} {"Inf. Process. Lett."}

MACRO {jacm} {"J.~ACM"}

MACRO {jcss} {"J.~Comput. Syst. Sci."}

MACRO {scp} {"Sci. Comput. Program."}

MACRO {sicomp} {"SIAM J. Comput."}

MACRO {tocs} {"ACM Trans. Comput. Syst."}

MACRO {tods} {"ACM Trans. Database Syst."}

MACRO {tog} {"ACM Trans. Graphic."}

MACRO {toms} {"ACM Trans. Math. Software"}

MACRO {toois} {"ACM Trans. Office Inf. Syst."}

MACRO {toplas} {"ACM Trans. Progr. Lang. Syst."}

MACRO {tcs} {"Theor. Comput. Sci."}

FUNCTION {bibinfo.check}
{ swap$
  duplicate$ missing$
    {
      pop$ pop$
      ""
    }
    { duplicate$ empty$
        {
          swap$ pop$
        }
        { swap$
          pop$
        }
      if$
    }
  if$
}
FUNCTION {bibinfo.warn}
{ swap$
  duplicate$ missing$
    {
      swap$ "missing " swap$ * " in " * cite$ * warning$ pop$
      ""
    }
    { duplicate$ empty$
        {
          swap$ "empty " swap$ * " in " * cite$ * warning$
        }
        { swap$
          pop$
        }
      if$
    }
  if$
}
STRINGS  { bibinfo}
INTEGERS { nameptr namesleft numnames }

FUNCTION {format.names}
{ 'bibinfo :=
  duplicate$ empty$ 'skip$ {
  's :=
  "" 't :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr
      "{vv~}{ll}{, f.}{, jj}"
      format.name$
      bibinfo bibinfo.check
      't :=
      nameptr #1 >
        {
          namesleft #1 >
            { "; " * t * }
            {
              s nameptr "{ll}" format.name$ duplicate$ "others" =
                { 't := }
                { pop$ }
              if$
              t "others" =
                {
                  " " * bbl.etal *
                }
                {
                  "\&"
                  space.word * t *
                }
              if$
            }
          if$
        }
        't
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
  } if$
}
FUNCTION {format.names.ed}
{
  'bibinfo :=
  duplicate$ empty$ 'skip$ {
  's :=
  "" 't :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr
      "{f.~}{vv~}{ll}{, jj}"
      format.name$
      bibinfo bibinfo.check
      't :=
      nameptr #1 >
        {
          namesleft #1 >
            { "; " * t * }
            {
              s nameptr "{ll}" format.name$ duplicate$ "others" =
                { 't := }
                { pop$ }
              if$
              t "others" =
                {

                  " " * bbl.etal *
                }
                {
                  "\&"
                  space.word * t *
                }
              if$
            }
          if$
        }
        't
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
  } if$
}
FUNCTION {format.key}
{ empty$
    { key field.or.null }
    { "" }
  if$
}

FUNCTION {format.authors}
{ author "author" format.names
}
FUNCTION {get.bbl.editor}
{ editor num.names$ #1 > 'bbl.editors 'bbl.editor if$ }

FUNCTION {format.editors}
{ editor "editor" format.names duplicate$ empty$ 'skip$
    {
      " " *
      get.bbl.editor
   "(" swap$ * ")" *
      *
    }
  if$
}
FUNCTION {format.note}
{
 note empty$
    { "" }
    { note #1 #1 substring$
      duplicate$ "{" =
        'skip$
        { output.state mid.sentence =
          { "l" }
          { "u" }
        if$
        change.case$
        }
      if$
      note #2 global.max$ substring$ * "note" bibinfo.check
    }
  if$
}

FUNCTION {format.title}
{ title
  "title" bibinfo.check
}
FUNCTION {format.full.names}
{'s :=
 "" 't :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr
      "{vv~}{ll}" format.name$
      't :=
      nameptr #1 >
        {
          namesleft #1 >
            { ", " * t * }
            {
              s nameptr "{ll}" format.name$ duplicate$ "others" =
                { 't := }
                { pop$ }
              if$
              t "others" =
                {
                  " " * bbl.etal *
                }
                {
                  "\&"
                  space.word * t *
                }
              if$
            }
          if$
        }
        't
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}

FUNCTION {author.editor.key.full}
{ author empty$
    { editor empty$
        { key empty$
            { cite$ #1 #3 substring$ }
            'key
          if$
        }
        { editor format.full.names }
      if$
    }
    { author format.full.names }
  if$
}

FUNCTION {author.key.full}
{ author empty$
    { key empty$
         { cite$ #1 #3 substring$ }
          'key
      if$
    }
    { author format.full.names }
  if$
}

FUNCTION {editor.key.full}
{ editor empty$
    { key empty$
         { cite$ #1 #3 substring$ }
          'key
      if$
    }
    { editor format.full.names }
  if$
}

FUNCTION {make.full.names}
{ type$ "book" =
  type$ "inbook" =
  or
    'author.editor.key.full
    { type$ "proceedings" =
        'editor.key.full
        'author.key.full
      if$
    }
  if$
}

FUNCTION {output.bibitem}
{ newline$
  "\bibitem[{" write$
  label write$
  ")" make.full.names duplicate$ short.list =
     { pop$ }
     { * }
   if$
  "}]{" * write$
  cite$ write$
  "}" write$
  newline$
  ""
  before.all 'output.state :=
}

FUNCTION {n.dashify}
{
  't :=
  ""
    { t empty$ not }
    { t #1 #1 substring$ "-" =
        { t #1 #2 substring$ "--" = not
            { "--" *
              t #2 global.max$ substring$ 't :=
            }
            {   { t #1 #1 substring$ "-" = }
                { "-" *
                  t #2 global.max$ substring$ 't :=
                }
              while$
            }
          if$
        }
        { t #1 #1 substring$ *
          t #2 global.max$ substring$ 't :=
        }
      if$
    }
  while$
}

FUNCTION {word.in}
{ "" }

FUNCTION {format.date}
{ year "year" bibinfo.check duplicate$ empty$
    {
      "empty year in " cite$ * "; set to ????" * warning$
       pop$ "????"
    }
    'skip$
  if$
  extra.label *
  before.all 'output.state :=
  " (" swap$ * ")" *
}
FUNCTION {format.btitle}
{ title "title" bibinfo.check
  duplicate$ empty$ 'skip$
    {
      emphasize
    }
  if$
}
FUNCTION {either.or.check}
{ empty$
    'pop$
    { "can't use both " swap$ * " fields in " * cite$ * warning$ }
  if$
}
FUNCTION {format.bvolume}
{ volume empty$
    { "" }
    { bbl.volume volume tie.or.space.prefix
      "volume" bibinfo.check * *
      series "series" bibinfo.check
      duplicate$ empty$ 'pop$
        { swap$ bbl.of space.word * swap$
          emphasize * }
      if$
      "volume and number" number either.or.check
    }
  if$
}
FUNCTION {format.number.series}
{ volume empty$
    { number empty$
        { series field.or.null }
        { series empty$
            { number "number" bibinfo.check }
            { output.state mid.sentence =
                { bbl.number }
                { bbl.number capitalize }
              if$
              number tie.or.space.prefix "number" bibinfo.check * *
              bbl.in space.word *
              series "series" bibinfo.check *
            }
          if$
        }
      if$
    }
    { "" }
  if$
}

FUNCTION {format.edition}
{ edition duplicate$ empty$ 'skip$
    {
      output.state mid.sentence =
        { "l" }
        { "t" }
      if$ change.case$
      "edition" bibinfo.check
      " " * bbl.edition *
    }
  if$
}
INTEGERS { multiresult }
FUNCTION {multi.page.check}
{ 't :=
  #0 'multiresult :=
    { multiresult not
      t empty$ not
      and
    }
    { t #1 #1 substring$
      duplicate$ "-" =
      swap$ duplicate$ "," =
      swap$ "+" =
      or or
        { #1 'multiresult := }
        { t #2 global.max$ substring$ 't := }
      if$
    }
  while$
  multiresult
}
FUNCTION {format.pages}
{ pages duplicate$ empty$ 'skip$
    { duplicate$ multi.page.check
        {
          bbl.pages swap$
          n.dashify
        }
        {
          bbl.page swap$
        }
      if$
      tie.or.space.prefix
      "pages" bibinfo.check
      * *
    }
  if$
}
FUNCTION {format.journal.pages}
{ pages duplicate$ empty$ 'pop$
    { swap$ duplicate$ empty$
        { pop$ pop$ format.pages }
        {
          ":" *
          swap$
          n.dashify
          "pages" bibinfo.check
          *
        }
      if$
    }
  if$
}
FUNCTION {format.journal.eid}
{ eid "eid" bibinfo.check
  duplicate$ empty$ 'pop$
    { swap$ duplicate$ empty$ 'skip$
      {
          ":" *
      }
      if$
      swap$ *
    }
  if$
}
FUNCTION {format.vol.num.pages}
{ volume field.or.null
  duplicate$ empty$ 'skip$
    {
      "volume" bibinfo.check
    }
  if$
  bolden
  number "number" bibinfo.check duplicate$ empty$ 'skip$
    {
      swap$ duplicate$ empty$
        { "there's a number but no volume in " cite$ * warning$ }
        'skip$
      if$
      swap$
      "(" swap$ * ")" *
    }
  if$ *
  eid empty$
    { format.journal.pages }
    { format.journal.eid }
  if$
}

FUNCTION {format.chapter.pages}
{ chapter empty$
    'format.pages
    { type empty$
        { bbl.chapter }
        { type "l" change.case$
          "type" bibinfo.check
        }
      if$
      chapter tie.or.space.prefix
      "chapter" bibinfo.check
      * *
      pages empty$
        'skip$
        { ", " * format.pages * }
      if$
    }
  if$
}

FUNCTION {format.booktitle}
{
  booktitle "booktitle" bibinfo.check
  emphasize
}
FUNCTION {format.in.ed.booktitle}
{ format.booktitle duplicate$ empty$ 'skip$
    {
      editor "editor" format.names.ed duplicate$ empty$ 'pop$
        {
          " " *
          get.bbl.editor
          "(" swap$ * "), " *
          * swap$
          * }
      if$
      word.in swap$ *
    }
  if$
}
FUNCTION {format.thesis.type}
{ type duplicate$ empty$
    'pop$
    { swap$ pop$
      "t" change.case$ "type" bibinfo.check
    }
  if$
}
FUNCTION {format.tr.number}
{ number "number" bibinfo.check
  type duplicate$ empty$
    { pop$ bbl.techrep }
    'skip$
  if$
  "type" bibinfo.check
  swap$ duplicate$ empty$
    { pop$ "t" change.case$ }
    { tie.or.space.prefix * * }
  if$
}
FUNCTION {format.article.crossref}
{
  word.in
  " \cite{" * crossref * "}" *
}
FUNCTION {format.book.crossref}
{ volume duplicate$ empty$
    { "empty volume in " cite$ * "'s crossref of " * crossref * warning$
      pop$ word.in
    }
    { bbl.volume
      capitalize
      swap$ tie.or.space.prefix "volume" bibinfo.check * * bbl.of space.word *
    }
  if$
  " \cite{" * crossref * "}" *
}
FUNCTION {format.incoll.inproc.crossref}
{
  word.in
  " \cite{" * crossref * "}" *
}
FUNCTION {format.org.or.pub}
{ 't :=
  ""
  address empty$ t empty$ and
    'skip$
    {
      t empty$
        { address "address" bibinfo.check *
        }
        { t *
          address empty$
            'skip$
            { ", " * address "address" bibinfo.check * }
          if$
        }
      if$
    }
  if$
}
FUNCTION {format.publisher.address}
{ publisher "publisher" bibinfo.warn format.org.or.pub
}

FUNCTION {format.organization.address}
{ organization "organization" bibinfo.check format.org.or.pub
}

FUNCTION {article}
{ output.bibitem
  format.authors "author" output.check
  author format.key output
  format.date "year" output.check
  date.block
  format.title "title" output.check
  new.block
  crossref missing$
    {
      journal
      "journal" bibinfo.check
      emphasize
      "journal" output.check
      add.blank
      format.vol.num.pages output
    }
    { format.article.crossref output.nonnull
      format.pages output
    }
  if$
  new.block
  format.note output
  fin.entry
}
FUNCTION {book}
{ output.bibitem
  author empty$
    { format.editors "author and editor" output.check
      editor format.key output
    }
    { format.authors output.nonnull
      crossref missing$
        { "author and editor" editor either.or.check }
        'skip$
      if$
    }
  if$
  format.date "year" output.check
  date.block
  format.btitle "title" output.check
  crossref missing$
    { format.bvolume output
      new.block
      format.number.series output
      new.sentence
      format.publisher.address output
    }
    {
      new.block
      format.book.crossref output.nonnull
    }
  if$
  format.edition output
  new.block
  format.note output
  fin.entry
}
FUNCTION {booklet}
{ output.bibitem
  format.authors output
  author format.key output
  format.date "year" output.check
  date.block
  format.title "title" output.check
  new.block
  howpublished "howpublished" bibinfo.check output
  address "address" bibinfo.check output
  new.block
  format.note output
  fin.entry
}

FUNCTION {inbook}
{ output.bibitem
  author empty$
    { format.editors "author and editor" output.check
      editor format.key output
    }
    { format.authors output.nonnull
      crossref missing$
        { "author and editor" editor either.or.check }
        'skip$
      if$
    }
  if$
  format.date "year" output.check
  date.block
  format.btitle "title" output.check
  crossref missing$
    {
      format.bvolume output
      format.chapter.pages "chapter and pages" output.check
      new.block
      format.number.series output
      new.sentence
      format.publisher.address output
    }
    {
      format.chapter.pages "chapter and pages" output.check
      new.block
      format.book.crossref output.nonnull
    }
  if$
  format.edition output
  new.block
  format.note output
  fin.entry
}

FUNCTION {incollection}
{ output.bibitem
  format.authors "author" output.check
  author format.key output
  format.date "year" output.check
  date.block
  format.title "title" output.check
  new.block
  crossref missing$
    { format.in.ed.booktitle "booktitle" output.check
      format.bvolume output
      format.number.series output
      format.chapter.pages output
      new.sentence
      format.publisher.address output
      format.edition output
    }
    { format.incoll.inproc.crossref output.nonnull
      format.chapter.pages output
    }
  if$
  new.block
  format.note output
  fin.entry
}
FUNCTION {inproceedings}
{ output.bibitem
  format.authors "author" output.check
  author format.key output
  format.date "year" output.check
  date.block
  format.title "title" output.check
  new.block
  crossref missing$
    { format.in.ed.booktitle "booktitle" output.check
      format.bvolume output
      format.number.series output
      format.pages output
      new.sentence
      publisher empty$
        { format.organization.address output }
        { organization "organization" bibinfo.check output
          format.publisher.address output
        }
      if$
    }
    { format.incoll.inproc.crossref output.nonnull
      format.pages output
    }
  if$
  new.block
  format.note output
  fin.entry
}
FUNCTION {conference} { inproceedings }
FUNCTION {manual}
{ output.bibitem
  format.authors output
  author format.key output
  format.date "year" output.check
  date.block
  format.btitle "title" output.check
  organization address new.block.checkb
  organization "organization" bibinfo.check output
  address "address" bibinfo.check output
  format.edition output
  new.block
  format.note output
  fin.entry
}

FUNCTION {mastersthesis}
{ output.bibitem
  format.authors "author" output.check
  author format.key output
  format.date "year" output.check
  date.block
  format.btitle
  "title" output.check
  new.block
  bbl.mthesis format.thesis.type output.nonnull
  school "school" bibinfo.warn output
  address "address" bibinfo.check output
  new.block
  format.note output
  fin.entry
}

FUNCTION {misc}
{ output.bibitem
  format.authors output
  author format.key output
  format.date "year" output.check
  date.block
  format.title output
  new.block
  howpublished "howpublished" bibinfo.check output
  new.block
  format.note output
  fin.entry
}
FUNCTION {phdthesis}
{ output.bibitem
  format.authors "author" output.check
  author format.key output
  format.date "year" output.check
  date.block
  format.btitle
  "title" output.check
  new.block
  bbl.phdthesis format.thesis.type output.nonnull
  school "school" bibinfo.warn output
  address "address" bibinfo.check output
  new.block
  format.note output
  fin.entry
}

FUNCTION {proceedings}
{ output.bibitem
  format.editors output
  editor format.key output
  format.date "year" output.check
  date.block
  format.btitle "title" output.check
  format.bvolume output
  format.number.series output
  new.sentence
  publisher empty$
    { format.organization.address output }
    { organization "organization" bibinfo.check output
      format.publisher.address output
    }
  if$
  new.block
  format.note output
  fin.entry
}

FUNCTION {techreport}
{ output.bibitem
  format.authors "author" output.check
  author format.key output
  format.date "year" output.check
  date.block
  format.title
  "title" output.check
  new.block
  format.tr.number output.nonnull
  institution "institution" bibinfo.warn output
  address "address" bibinfo.check output
  new.block
  format.note output
  fin.entry
}

FUNCTION {unpublished}
{ output.bibitem
  format.authors "author" output.check
  author format.key output
  format.date "year" output.check
  date.block
  format.title "title" output.check
  new.block
  format.note "note" output.check
  fin.entry
}

FUNCTION {default.type} { misc }
READ
FUNCTION {sortify}
{ purify$
  "l" change.case$
}
INTEGERS { len }
FUNCTION {chop.word}
{ 's :=
  'len :=
  s #1 len substring$ =
    { s len #1 + global.max$ substring$ }
    's
  if$
}
FUNCTION {format.lab.names}
{ 's :=
  "" 't :=
  s #1 "{vv~}{ll}" format.name$
  s num.names$ duplicate$
  #2 >
    { pop$
      " " * bbl.etal *
    }
    { #2 <
        'skip$
        { s #2 "{ff }{vv }{ll}{ jj}" format.name$ "others" =
            {
              " " * bbl.etal *
            }
            { " \& " * s #2 "{vv~}{ll}" format.name$
              * }
          if$
        }
      if$
    }
  if$
}

FUNCTION {author.key.label}
{ author empty$
    { key empty$
        { cite$ #1 #3 substring$ }
        'key
      if$
    }
    { author format.lab.names }
  if$
}

FUNCTION {author.editor.key.label}
{ author empty$
    { editor empty$
        { key empty$
            { cite$ #1 #3 substring$ }
            'key
          if$
        }
        { editor format.lab.names }
      if$
    }
    { author format.lab.names }
  if$
}

FUNCTION {editor.key.label}
{ editor empty$
    { key empty$
        { cite$ #1 #3 substring$ }
        'key
      if$
    }
    { editor format.lab.names }
  if$
}

FUNCTION {calc.short.authors}
{ type$ "book" =
  type$ "inbook" =
  or
    'author.editor.key.label
    { type$ "proceedings" =
        'editor.key.label
        'author.key.label
      if$
    }
  if$
  'short.list :=
}

FUNCTION {calc.label}
{ calc.short.authors
  short.list
  "("
  *
  year duplicate$ empty$
  short.list key field.or.null = or
     { pop$ "" }
     'skip$
  if$
  *
  'label :=
}

FUNCTION {sort.format.names}
{ 's :=
  #1 'nameptr :=
  ""
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr
      "{ll{ }}{  f{ }}{  jj{ }}"
      format.name$ 't :=
      nameptr #1 >
        {
          "   "  *
          namesleft #1 = t "others" = and
            { "zzzzz" * }
            { t sortify * }
          if$
        }
        { t sortify * }
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}

FUNCTION {sort.format.title}
{ 't :=
  "A " #2
    "An " #3
      "The " #4 t chop.word
    chop.word
  chop.word
  sortify
  #1 global.max$ substring$
}
FUNCTION {author.sort}
{ author empty$
    { key empty$
        { "to sort, need author or key in " cite$ * warning$
          ""
        }
        { key sortify }
      if$
    }
    { author sort.format.names }
  if$
}
FUNCTION {author.editor.sort}
{ author empty$
    { editor empty$
        { key empty$
            { "to sort, need author, editor, or key in " cite$ * warning$
              ""
            }
            { key sortify }
          if$
        }
        { editor sort.format.names }
      if$
    }
    { author sort.format.names }
  if$
}
FUNCTION {editor.sort}
{ editor empty$
    { key empty$
        { "to sort, need editor or key in " cite$ * warning$
          ""
        }
        { key sortify }
      if$
    }
    { editor sort.format.names }
  if$
}
FUNCTION {presort}
{ calc.label
  label sortify
  "    "
  *
  type$ "book" =
  type$ "inbook" =
  or
    'author.editor.sort
    { type$ "proceedings" =
        'editor.sort
        'author.sort
      if$
    }
  if$
  #1 entry.max$ substring$
  'sort.label :=
  sort.label
  *
  "    "
  *
  title field.or.null
  sort.format.title
  *
  #1 entry.max$ substring$
  'sort.key$ :=
}

ITERATE {presort}
SORT
STRINGS { last.label next.extra }
INTEGERS { last.extra.num number.label }
FUNCTION {initialize.extra.label.stuff}
{ #0 int.to.chr$ 'last.label :=
  "" 'next.extra :=
  #0 'last.extra.num :=
  #0 'number.label :=
}
FUNCTION {forward.pass}
{ last.label label =
    { last.extra.num #1 + 'last.extra.num :=
      last.extra.num int.to.chr$ 'extra.label :=
    }
    { "a" chr.to.int$ 'last.extra.num :=
      "" 'extra.label :=
      label 'last.label :=
    }
  if$
  number.label #1 + 'number.label :=
}
FUNCTION {reverse.pass}
{ next.extra "b" =
    { "a" 'extra.label := }
    'skip$
  if$
  extra.label 'next.extra :=
  extra.label
  duplicate$ empty$
    'skip$
    { "{\natexlab{" swap$ * "}}" * }
  if$
  'extra.label :=
  label extra.label * 'label :=
}
EXECUTE {initialize.extra.label.stuff}
ITERATE {forward.pass}
REVERSE {reverse.pass}
FUNCTION {bib.sort.order}
{ sort.label
  "    "
  *
  year field.or.null sortify
  *
  "    "
  *
  title field.or.null
  sort.format.title
  *
  #1 entry.max$ substring$
  'sort.key$ :=
}
ITERATE {bib.sort.order}
SORT
FUNCTION {begin.bib}
{ preamble$ empty$
    'skip$
    { preamble$ write$ newline$ }
  if$
  "\begin{thebibliography}{" number.label int.to.str$ * "}" *
  write$ newline$
  "\providecommand{\natexlab}[1]{#1}"
  write$ newline$
}
EXECUTE {begin.bib}
EXECUTE {init.state.consts}
ITERATE {call.type$}
FUNCTION {end.bib}
{ newline$
  "\end{thebibliography}" write$ newline$
}
EXECUTE {end.bib}
%% End of customized bst file
%%
%% End of file `biometrics.bst'.
