class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  

  def client
    SODA::Client.new({:domain => "data.cityofboston.gov", :app_token => "RSqcJ79LA7uJL4Ssu3wXoGvpp"})
  end

  private 

  def sign_in(user)
    user.regenerate_auth_token
    cookies[:auth_token] = user.auth_token
    @current_user = user
  end

  def permanent_sign_in(user)
    user.regenerate_auth_token
    cookies.permanent[:auth_token] = user.auth_token
    @current_user = user
  end

  def sign_out
    @current_user = nil
    cookies.delete(:auth_token)
  end

  def current_user
    @current_user ||= User.find_by_auth_token(cookies[:auth_token]) if cookies[:auth_token]
  end
  helper_method :current_user

  def signed_in_user?
    !!current_user
  end
  helper_method :signed_in_user?

  def require_login
    unless signed_in_user?
      flash[:danger] = "Not authorized, please sign in!"
      redirect_to root_path
    end
  end

  def require_current_user
    unless params[:id] == current_user.id.to_s
      flash[:danger] = "You're not authorized for that action!"
      redirect_to root_path
    end
  end

 

  def street_names
    ["A St",
"Abbotsford St",
"Aberdeen St",
"Acadia St",
"Ackley Pl",
"Adams St",
"Addison St",
"Agassiz Rd",
"Aguadilla St",
"Akron St",
"Alaska St",
"Albany St",
"Albemarle St",
"Albion Pl",
"Alcorn St",
"Aldwin Rd",
"Alexander St",
"Alford St",
"Algonquin Street",
"Alleghany St",
"Allston St",
"Almont St",
"Alpha Rd",
"Alpine St",
"Ames St",
"Amory St",
"Anderson St",
"Annapolis St",
"Anson St",
"Anthony Rip Valenti Way",
"Appleton St",
"Arborcrest Ter",
"Arboretum Rd",
"Arborway",
"Arbutus St",
"Arcadia Park",
"Arcadia St",
"Arcadia Ter",
"Arch St",
"Archdale Rd",
"Arcola St",
"Ardee St",
"Arion Street",
"Arklow St",
"Arlington Ave",
"Arlington St",
"Armington St",
"Armory St",
"Armstrong St",
"Ashburton Pl",
"Ashcroft St",
"Ashford St",
"Ashley St",
"Ashmont St",
"Ashton St",
"Aspen St",
"Aspinwall Rd",
"Astoria St",
"Athens St",
"Atkinson St",
"Atlantic Ave",
"Atlantic St",
"Auburn St",
"Auckland St",
"Austin St",
"Avenue De Lafayette",
"Avery St",
"Ayr Rd",
"Babcock St",
"Bailey Street",
"Baird St",
"Baker Ave",
"Bakersfield St",
"Baldwin St",
"Ballou Ave",
"Balsam St",
"Bancroft St",
"Banfield Ave",
"Barbara St",
"Barker St",
"Barrows St",
"Barry Park",
"Barry St",
"Bartlett St",
"Basile St",
"Battery St",
"Batterymarch St",
"Baxter St",
"Bay St",
"Bayside St",
"Beach St",
"Beacon St",
"Beaver St",
"Bedford St",
"Beechcroft St",
"Beecher St",
"Beethoven St",
"Belfort St",
"Bellevue St",
"Belmont St",
"Belmore Ter",
"Belvidere St",
"Bennett St",
"Bennington St",
"Bentham Rd",
"Berkeley St",
"Bernard St",
"Bexley Rd",
"Bilodeau Rd",
"Binney St",
"Bird St",
"Bismarck St",
"Blackstone St",
"Blackwood St",
"Blagden St",
"Blaine St",
"Blakeville St",
"Blanchard St",
"Bloomfield St",
"Blossom Ct",
"Blossom St",
"Blue Hill Ave",
"Bluefield Ter",
"Bodwell St",
"Bolster St",
"Bolton St",
"Bond St",
"Border St",
"Boston St",
"Bowdoin Ave",
"Bowdoin Park",
"Bowdoin St",
"Bower St",
"Bowker St",
"Boyd St",
"Boyden St",
"Boylston St",
"Brackett St",
"Braddock Park",
"Bradeen St",
"Bradston St",
"Braemore Rd",
"Bragdon St",
"Brainerd Rd",
"Braintree St",
"Branch St",
"Bremen St",
"Brent St",
"Brewer St",
"Brewster St",
"Briarcliff Ter",
"Brighton Ave",
"Brighton St",
"Brimmer St",
"Brinsley St",
"Brinton St",
"Broad St",
"Broadway",
"Brock St",
"Bromfield St",
"Brook Marshall Rd",
"Brookford Street",
"Brookledge St",
"Brookline Ave",
"Brooks St",
"Brookside Ave",
"Brookview St",
"Brookway Rd",
"Bruce St",
"Brunswick St",
"Bucknam St",
"Bullard St",
"Bunker Hill St",
"Burbank St",
"Burlington Ave",
"Burney St",
"Burt Street",
"Buttonwood St",
"Bynner St",
"Byron St",
"Cabot St",
"Caddy Rd",
"Caldwell St",
"Callender St",
"Calumet St",
"Cambria St",
"Cambridge St",
"Cameron St",
"Canal St",
"Carlisle St",
"Carlos St",
"Carmel St",
"Carson St",
"Carter St",
"Caryll St",
"Caspian Way",
"Cassnet St",
"Castle Rock St",
"Castlegate Rd",
"Castleton St",
"Catawba St",
"Causeway St",
"Cedar Pl",
"Cedar St",
"Central St",
"Centre St",
"Ceylon St",
"Chandler St",
"Chappie St",
"Charlame St",
"Charles St",
"Charles Street South",
"Charlesgate East",
"Charlesgate West",
"Charter St",
"Chase St",
"Chatham St",
"Chaucer St",
"Chauncy St",
"Chelsea St",
"Cheney Street",
"Cherokee St",
"Chester Park",
"Chester St",
"Chesterton St",
"Chestnut Ave",
"Chestnut Hill Ave",
"Chestnut St",
"Chilcott Pl",
"Chipman St",
"Chiswick Rd",
"Church St",
"Circuit St",
"City Sq",
"Claremont Park",
"Clarendon St",
"Clark St",
"Clarkson St",
"Clarkwood St",
"Claxton St",
"Claybourne Street",
"Claymoss Rd",
"Clayton Street",
"Clearwater Dr",
"Clementine Park",
"Cleveland St",
"Clevemont Ave",
"Clifford St",
"Clinton St",
"Clipper Ship Ln",
"Codman Park",
"Coleman St",
"Coleus Park",
"Colgate Rd",
"Colliston Rd",
"Colonial Ave",
"Colorado St",
"Columbia Rd",
"Columbia Road",
"Columbus Ave",
"Commercial St",
"Common St",
"Commonwealth Ave",
"Commonwealth Ave. Underpass",
"Concord Sq",
"Concord St",
"Condor St",
"Congress St",
"Constitution Rd",
"Cook St",
"Cooper St",
"Copeland Park",
"Copeland St",
"Copenger Street",
"Copley St",
"Cordis St",
"Corey Rd",
"Corey St",
"Cornwall St",
"Corona St",
"Corwin St",
"Cottage St",
"Cotting St",
"Countryside Dr",
"Court Sq",
"Court St",
"Courtland Rd",
"Covington St",
"Cragmere Ter",
"Cranston St",
"Crawford St",
"Creighton St",
"Crescent Ave",
"Crescent Avenue",
"Cresthill Road",
"Creston St",
"Crestwood Park",
"Cross St",
"Crossman St",
"Cumberland St",
"Cummings Rd",
"Curtis St",
"Cushing Ave",
"Custom House St",
"D St",
"Dacia Street",
"Dakota St",
"Dale St",
"Dalrymple St",
"Dalton St",
"Danforth St",
"Dania St",
"Darling St",
"Darlington St",
"Dartmouth St",
"Davern Ave",
"Davidson Ave",
"Davitt St",
"Dawes St",
"Dawson St",
"Day St",
"Dayton St",
"Decatur St",
"Deckard St",
"Deer St",
"Deering Rd",
"Delford St",
"Delhi St",
"Delle Ave",
"Denby Rd",
"Dennison St",
"Denny St",
"Dern St",
"Desmond Rd",
"Devens St",
"Dever St",
"Devon St",
"Devonshire St",
"Dewar St",
"Dewitt Dr",
"Dickens St",
"Ditson St",
"Dixwell St",
"Don St",
"Donald Rd",
"Donwood Ter",
"Doone Ave",
"Dorchester Ave",
"Dorchester St",
"Doris St",
"Dorr St",
"Dorrance St",
"Douglas St",
"Dracut St",
"Draper St",
"Drayton Ave",
"Dudley St",
"Duke St",
"Dumas St",
"Duncan St",
"Duncklee St",
"Dunkeld St",
"Dunlap St",
"Dunreath St",
"Dunstable St",
"Durham St",
"Duxbury Rd",
"Dwight St",
"E St",
"East Berkeley St",
"East Broadway",
"East Brookline St",
"East Canton St",
"East Concord St",
"East Cottage St",
"East Dedham St",
"East Eagle St",
"East Eighth St",
"East Fifth St",
"East First St",
"East Fourth St",
"East Lenox St",
"East Newton St",
"East Ninth St",
"East Second St",
"East Seventh St",
"East Sixth St",
"East Springfield St",
"East St",
"East Third St",
"Eden St",
"Edge Hill St",
"Edgerly Rd",
"Edgewood St",
"Edison Green",
"Edwin St",
"Egleston St",
"Egremont Rd",
"Eighth St",
"Eldon St",
"Eldora St",
"Eleanor St",
"Eliot Pl",
"Elizabeth St",
"Ellsworth Street",
"Elm Hill Ave",
"Elm Hill Park",
"Elm St",
"Elmhurst St",
"Elmwood St",
"Elton St",
"Elven Rd",
"Emerson St",
"Emery Rd",
"Emmet St",
"Emmons St",
"Endicott St",
"Englewood Ave",
"Ennis Rd",
"Erie Street",
"Ernst St",
"Essex St",
"Estabrook Rd",
"Estella St",
"Estes Ave",
"Estey St",
"Estrella St",
"Euclid St",
"Eunice St",
"Eustis St",
"Eutaw St",
"Evandale Ter",
"Evelyn St",
"Everett St",
"Evergreen St",
"Everton St",
"Exeter St",
"F St",
"Fabyan St",
"Fairbanks St",
"Fairfield St",
"Fairland St",
"Fairmount St",
"Falcon St",
"Faneuil St",
"Farragut Rd",
"Farrington Ave",
"Father Francis J Gilday St",
"Faunce Rd",
"Fawndale Rd",
"Fayston St",
"Federal St",
"Feneno Ter",
"Fenton St",
"Fenway",
"Fenwood Rd",
"Fernboro St",
"Ferndale St",
"Ferrin St",
"Fessenden St",
"Fifield St",
"First Ave",
"Firth Rd",
"Fisher Ave",
"Fiske Ter",
"Fleet St",
"Flint St",
"Florence St",
"Florida St",
"Floyd St",
"Follen St",
"Forbes St",
"Fordham Rd",
"Forest St",
"Forsyth St",
"Forsyth Way",
"Foster St",
"Fottler Rd",
"Foundry St",
"Fountain St",
"Fox St",
"Francis Parkman Dr",
"Francis St",
"Frankfort St",
"Franklin St",
"Frawley St",
"Frederick St",
"Freeland St",
"Freeport St",
"Fremont St",
"Friend St",
"Frontenac St",
"Fruit St",
"Fuller St",
"Fuller Street",
"Fulton St",
"G St",
"Gainsborough St",
"Gallivan Blvd",
"Gannett St",
"Garden Court",
"Garden St",
"Gardner St",
"Garrison St",
"Gaston St",
"Gates St",
"Gay Head St",
"Geneva Avenue",
"Georgia Street",
"Germania St",
"Gilmer St",
"Gladeside Ave",
"Glen Rd",
"Glenarm Street",
"Glendale St",
"Glendon St",
"Glenhill Rd",
"Glenrose Rd",
"Glenville Ave",
"Gloucester St",
"Goodale Rd",
"Goodenough St",
"Gordon St",
"Gore St",
"Gorham St",
"Gove St",
"Grafton St",
"Grampian Way",
"Granada Park",
"Granfield Ave",
"Granger St",
"Grant St",
"Gray St",
"Green St",
"Greenbrier St",
"Greendale Rd",
"Greenheys St",
"Greenley Pl",
"Greenmount St",
"Greenock St",
"Greenville St",
"Greenwich Ct",
"Greenwich Park",
"Greenwich St",
"Greenwood Street",
"Greylock Rd",
"Gridley St",
"Griggs St",
"Grimes St",
"Grotto Glen Rd",
"Grove St",
"Groveland St",
"Grovenor Rd",
"Guild St",
"Gurney St",
"Gustin St",
"H St",
"Hadassah Way",
"Hadley St",
"Hagar St",
"Halborn St",
"Haley St",
"Halifax St",
"Hallam St",
"Hamilton St",
"Hamlin St",
"Hammond St",
"Hancock St",
"Hancock Street",
"Hano St",
"Hanover St",
"Hansborough St",
"Hanson St",
"Harborview St",
"Harcourt St",
"Hardy St",
"Harleston St",
"Harold St",
"Harriet St",
"Harrishof St",
"Harrison Ave",
"Harrison Avenue Ext",
"Hartland St",
"Hartley Ter",
"Harvard Ave",
"Harvard Avenue",
"Harvard Sq",
"Harvard St",
"Harvard Street",
"Harwood St",
"Hatch St",
"Hathaway St",
"Havelock St",
"Haverford St",
"Haviland St",
"Havre St",
"Hawkins St",
"Hawley Pl",
"Hawley St",
"Hayden St",
"Haymarket Sq",
"Haynes St",
"Hayward Pl",
"Hazelwood St",
"Hazleton St",
"Heath St",
"Hecla St",
"Hemenway St",
"Henchman St",
"Hendry St",
"Henley St",
"Henry St",
"Herald St",
"Herbert St",
"Hereford St",
"Hiawatha Rd",
"Higgins St",
"High Rock Way",
"High St",
"Highgate St",
"Highland Ave",
"Highland St",
"Hildreth St",
"Hillsboro Rd",
"Hillside St",
"Hinckley St",
"Hoffman St",
"Holborn St",
"Holbrook St",
"Holiday St",
"Hollander St",
"Holworthy St",
"Holyoke St",
"Homes Ave",
"Homestead St",
"Hooper St",
"Hopestill St",
"Hosmer St",
"Howard Avenue",
"Howe St",
"Howe Ter",
"Howes St",
"Howland St",
"Hoyt St",
"Hubbardston Rd",
"Hudson St",
"Hull St",
"Humboldt Ave",
"Humphreys Street",
"Hunter St",
"Huntington Ave",
"Hutchings St",
"Hyde Park Ave",
"I St",
"Idaho St",
"Iffley Rd",
"Imrie Rd",
"India St",
"Intervale St",
"Inwood St",
"Iowa St",
"Ipswich St",
"Irma St",
"Iroquois St",
"Irving St",
"Islington St",
"Itasca St",
"Jacob St",
"Jamaicaway",
"Jamestown Ter",
"Jeffries St",
"Jerome St",
"Jersey St",
"Jess St",
"Joe L. Smith Way",
"Johnny Court",
"Johnny Ct",
"Johnston Rd",
"Jones Ave",
"Josephine St",
"Joy St",
"Judson Street",
"Julian Street",
"Juliette St",
"K St",
"Kane St",
"Kearsarge Ave",
"Kelton St",
"Kendall St",
"Kenilworth St",
"Kenmore St",
"Kenney St",
"Kenwood St",
"Kerr Pl",
"Kerr Way",
"Keswick St",
"Kilby St",
"Kilmarnock St",
"Kilsyth Rd",
"Kilsyth Ter",
"Kimball St",
"King St",
"Kingsboro Park",
"Kingsdale St",
"Kingston St",
"Kinross Rd",
"Kirkwood Rd",
"Knapp St",
"Kneeland St",
"Knowlton St",
"L St",
"La Grange St",
"Lake Shore Rd",
"Lamartine St",
"Lambert Ave",
"Lambert St",
"Lamson St",
"Lanark Rd",
"Lancaster St",
"Landor Rd",
"Langford Park",
"Lansdowne St",
"Larchmont St",
"Lark St",
"Laurel St",
"Lauriat St",
"Lawn St",
"Lawnwood Pl",
"Lawrence Ave",
"Lawrence St",
"Leahaven Rd",
"Leamington Rd",
"Ledgebrook Rd",
"Lee Hill Rd",
"Leicester St",
"Leonard St",
"Leroy St",
"Lesher St",
"Leston St",
"Lexington St",
"Lime St",
"Lincoln St",
"Lindall St",
"Linden St",
"Lindsey St",
"Linvale Ter",
"Linwood Sq",
"Linwood St",
"Lithgow St",
"Liverpool St",
"Livingstone St",
"Logan St",
"Lomasney Way",
"London St",
"Long Ave",
"Longfellow St",
"Lonsdale St",
"Loring St",
"Lorna Rd",
"Louis D. Brown Way",
"Lubec St",
"Lucerne St",
"Lyford St",
"Lynde St",
"Lyndeboro St",
"Lyndhurst St",
"Lyon St",
"M St",
"Madeline St",
"Madison Park Ct",
"Magazine St",
"Magnolia St",
"Mahler Rd",
"Main St",
"Malbert Rd",
"Malcolm X Blvd",
"Malden St",
"Mallard Ave",
"Mallet St",
"Mallon Rd",
"Malvern St",
"Mamelon Cir",
"Manchester St",
"Manton Ter",
"Maple St",
"Maple Street",
"Marbury Ter",
"Marden Ave",
"Marginal Rd",
"Marginal Road",
"Marginal St",
"Marie St",
"Marine Rd",
"Marion St",
"Market St",
"Marlborough St",
"Marmion St",
"Martha Rd",
"Martin Luther King Blvd",
"Marvin St",
"Maryknoll St",
"Maryknoll Ter",
"Maryland St",
"Mascoma St",
"Mascot St",
"Mason St",
"Massachusetts Ave",
"Mather St",
"Mattapan St",
"Matthews St",
"Maverick St",
"Maybury St",
"Mayfield St",
"Maywood St",
"McKinley Sq",
"Mead St",
"Meadowbank Ave",
"Medfield St",
"Medford St",
"Melbourne St",
"Melton Rd",
"Melville Ave",
"Melvinside Ter",
"Mendell Way",
"Menton St",
"Mercer St",
"Merchants Row",
"Meridian St",
"Merill Street",
"Merola Park",
"Merriam St",
"Merrimac St",
"Middlesex St",
"Middleton St",
"Midland St",
"Mildred Ave",
"Miles St",
"Milford St",
"Milk St",
"Millet St",
"Millmont St",
"Mills St",
"Milton Ave",
"Minden St",
"Minton St",
"Mission St",
"Mitchell St",
"Monadnock St",
"Monks St",
"Monmouth St",
"Monsignor Albert A Jacobbe Rd",
"Monsignor Patrick J Lydon Way",
"Monson St",
"Montebello Rd",
"Montello St",
"Montfern Ave",
"Montgomery St",
"Montrose St",
"Monument Ave",
"Monument Ct",
"Monument Sq",
"Monument St",
"Moon St",
"Moore St",
"Moraine St",
"Moreland St",
"Morrill St",
"Morris St",
"Morse St",
"Morton St",
"Moseley St",
"Mosely Street",
"Mosgrove Ave",
"Moulton St",
"Moultrie St",
"Mount Bowdoin Ter",
"Mount Ida Rd",
"Mountain Ave",
"Mozart St",
"Mt Everett St",
"Mt Hood Rd",
"Mt Pleasant Ave",
"Mt Vernon St",
"Mt. Vernon",
"Mulvey St",
"Munroe St",
"Murray Hill Rd",
"Myrtle St",
"Mystic St",
"N St",
"Naples St",
"Nashua St",
"National St",
"Navillus Ter",
"Nazing Street",
"Neponset Ave",
"New Chardon St",
"New England Ave",
"New Rutherford Ave",
"New St",
"Newbury St",
"Newcroft Cr",
"Newmarket Sq",
"Newport St",
"Nightingale St",
"Niles St",
"Ninth St",
"Nira Ave",
"Nixon St",
"Nonquit St",
"Norfolk Ave",
"Norfolk St",
"Normandy St",
"North Bennet St",
"North Grove St",
"North Margin St",
"North St",
"North Washington St",
"Northampton St",
"Northern Ave",
"Norton St",
"Norway St",
"Norwell St",
"Nottingham St",
"O St",
"Oak Square Ave",
"Oak St",
"Oakhurst St",
"Oakland St",
"Oakley St",
"Oakview Ter",
"Oakwood St",
"Old Colony Ave",
"Old Colony Ter",
"Old Harbor St",
"Old Morton St",
"Oldfields Rd",
"Oliver St",
"Olney St",
"Opera Pl",
"Ophir St",
"Orchardfield St",
"Orkney Rd",
"Orleans St",
"Ormond St",
"Oscar St",
"Oswald St",
"Otis St",
"Otisfield St",
"Outlook Rd",
"Overland St",
"Owen St",
"P St",
"Pacific St",
"Palmer St",
"Paris St",
"Parish St",
"Park Dr",
"Park St",
"Park Vale Ave",
"Park View St",
"Parker Hill Ave",
"Parker St",
"Parkman St",
"Parmenter St",
"Parsons St",
"Pasadena Rd",
"Patson Avenue",
"Patterson Way",
"Paul Gore St",
"Paula Rd",
"Paulding St",
"Paxton St",
"Payson Ave",
"Pearl St",
"Pembroke St",
"Penhallow St",
"Penniman Rd",
"Pequot St",
"Percival St",
"Perkins St",
"Perrin St",
"Perry Street",
"Perth St",
"Peter Parley Rd",
"Peterborough St",
"Peters St",
"Phillips St",
"Phipps St",
"Pinckney St",
"Pine St",
"Playstead Rd",
"Pleasant St",
"Plympton St",
"Polk St",
"Pompeii St",
"Pond St",
"Pontiac St",
"Porter St",
"Portland St",
"Potosi St",
"Powellton Road",
"Pratt St",
"Preble St",
"Prescott St",
"Price Rd",
"Priesing St",
"Prince St",
"Princeton St",
"Prospect St",
"Providence St",
"Province St",
"Purchase St",
"Puritan Ave",
"Putnam St",
"Queensberry St",
"Quincefield Street",
"Quincy St",
"Quint Ave",
"Radnor Rd",
"Rand Street",
"Randolph St",
"Raven St",
"Raynor Cir",
"Reading St",
"Reedsdale St",
"Regent St",
"Regina Rd",
"Remington St",
"REV R A BURKE ST",
"Revere St",
"Rhoades St",
"Rich St",
"Richfield Park",
"Richfield St",
"Richmond St",
"Ridgemont St",
"Ridgeview Ave",
"Ridgewood St",
"Ringgold St",
"River St",
"Riverway",
"Roach St",
"Robinson St",
"Rockland Ave",
"Rockland St",
"Rockledge St",
"Rockmere St",
"Rockville Park",
"Rogers Park Ave",
"Romsey St",
"Ronald St",
"Ronan St",
"Rosedale St",
"Rosemary St",
"Rosseter St",
"Rossmore Rd",
"Round Hill St",
"Rowell St",
"Roxbury St",
"Royce Rd",
"Roys St",
"Rugg Rd",
"Ruggles St",
"Russell St",
"Rutherford Ave",
"Ruthven St",
"Rutland Sq",
"Rutland St",
"Sachem St",
"Sackville St",
"Sagamore St",
"Salem St",
"Salem Street Ave",
"San Juan St",
"Sanderson Pl",
"Sanford St",
"Sanger St",
"Saratoga St",
"Savin Hill Ave",
"Savin Hill Ct",
"Savin St",
"Saxton St",
"Sayward St",
"Schiller St",
"School St",
"Schulyer Street",
"Scotia St",
"Scottfield Rd",
"Seaborn St",
"Seaport Blvd",
"Seaver St",
"Seaverns Ave",
"Selkirk Rd",
"Seminary St",
"Semont Rd",
"Seventh St",
"Sewall St",
"Sharp St",
"Shawmut Ave",
"Sheafe St",
"Shelby St",
"Shepton St",
"Sheridan St",
"Sherman St",
"Shirley St",
"Short St",
"Sigourney St",
"Silloway St",
"Silver St",
"Sixth St",
"Sleeper St",
"Smith St",
"Snow Hill St",
"Sojourner Truth Ct",
"Soley St",
"Somerset St",
"Sonoma Street",
"South Bay Ave",
"South Bremen St",
"South Hobbart St",
"South Huntington Ave",
"South Russell St",
"South St",
"South Sydney St",
"Southampton St",
"Southern Ave",
"Southmere Rd",
"Southwood St",
"Spalding St",
"Speedwell St",
"Spencer St",
"Spice St",
"Spofford Rd",
"Spring Garden St",
"Springer St",
"Spruce St",
"St Albans Rd",
"St Alphonsus St",
"St Botolph St",
"St Cecelia St",
"St George St",
"St James Ave",
"St James St",
"St Lukes Rd",
"St Mark's Rd",
"St Martin St",
"St Peter St",
"St Stephen St",
"St William St",
"Standard St",
"Standish St",
"Stanhope St",
"Staniford St",
"Stanley St",
"Stanwood St",
"State St",
"Stellman Rd",
"Stillman St",
"Stockwell St",
"Stoneholm St",
"Stonehurst St",
"Story St",
"Stoughton St",
"Stow Rd",
"Strathcona Rd",
"Strathmore Rd",
"Stratton St",
"Stuart St",
"Sturbridge St",
"Sudan St",
"Sudbury St",
"Sullivan St",
"Summer St",
"Sumner St",
"Sunderland St",
"Sunnyside St",
"Sunset St",
"Supple Rd",
"Surrey St",
"Sussex St",
"Sutherland Rd",
"Sutton St",
"Swallow St",
"Sydney St",
"Sydney Street",
"Sylvia St",
"Symphony Rd",
"Taft St",
"Tai Tung St",
"Talbot Ave",
"Tamworth St",
"Tanglewood Rd",
"Taylor St",
"Telegraph St",
"Temple Pl",
"Temple St",
"Tennis Rd",
"Terrace St",
"Thacher St",
"Theodore A. Glynn Way",
"Theodore St",
"Third Ave",
"Thomas Park",
"Thonrdike St",
"Thornley St",
"Thornton St",
"Tibbetts Town Way",
"Ticknor St",
"Tileston St",
"Tiverton Rd",
"Toledo Ter",
"Tonawanda St",
"Topeka St",
"Topliff Street",
"Torrey St",
"Tovar St",
"Townsend St",
"Traveler St",
"Treadway Rd",
"Tremlett St",
"Tremont St",
"Trent St",
"Trenton St",
"Trescott St",
"Trinity Pl",
"Trull Street",
"Tucker St",
"Tufts St",
"Tupelo St",
"Turner St",
"Tuttle St",
"Tyler St",
"Union Ave",
"Union Park",
"Union Park St",
"Union St",
"Unity St",
"Upton St",
"Van Ness St",
"Vaughan Ave",
"Vernon St",
"Verona St",
"Verrill St",
"Victoria St",
"Vine St",
"Vining St",
"Violet St",
"Virginia St",
"Wabeno St",
"Wabon St",
"Wade St",
"Wadsworth St",
"Wainwright St",
"Wait St",
"Wakullah St",
"Walbridge St",
"Waldeck St",
"Walden St",
"Wales St",
"Walford Way",
"Walk Hill St",
"Walker St",
"Wall St",
"Wallingford Rd",
"Walnut Ave",
"Walnut Park",
"Walnut St",
"Waltham St",
"Ward St",
"Wareham St",
"Warner St",
"Warren Ave",
"Warren Pl",
"Warren St",
"Warrenton St",
"Warwick St",
"Washington St",
"Water St",
"Waumbeck St",
"Wave Ave",
"Waverly St",
"Wayne Street",
"Webley St",
"Webster St",
"Weld Ave",
"Weldon St",
"Well St",
"Welles Ave",
"Wellington Hill St",
"Wellington St",
"Wendell St",
"Wendover Street",
"Wenoah St",
"Wensley St",
"Wentworth Ter",
"West Broadway",
"West Brookline St",
"West Canton St",
"West Cedar St",
"West Concord St",
"West Dedham St",
"West Eagle St",
"West Eighth St",
"West Fifth St",
"West First St",
"West Fourth St",
"West Howell St",
"West Newton St",
"West Ninth St",
"West School St",
"West Second St",
"West Selden St",
"West Seventh St",
"West Sixth St",
"West Springfield St",
"West St",
"West Third St",
"West Tremlett St",
"West Walnut Park",
"Westerly St",
"Westland Ave",
"Westminster St",
"Westmore Rd",
"Westview St",
"Westville St",
"Westville Street",
"Westville Ter",
"Wheatland Ave",
"White St",
"Whitfield St",
"Whiting St",
"Whitman St",
"Whittier St",
"Wichita Ter",
"Wiggin St",
"Wigglesworth St",
"Wilcock St",
"Wildwood St",
"Wilkinson Park",
"William Cardinal O'Connell Way",
"William E. Mullins Way",
"William J. Day Blvd",
"Williams St",
"Willis St",
"Willow Pond Rd",
"Willow St",
"Willowwood St",
"Wilmore St",
"Wilrose St",
"Wilson Park",
"Wilton St",
"Windsor St",
"Winfield St",
"Winston Rd",
"Winter St",
"Winthrop St",
"Wise St",
"Withington St",
"Wollaston Ter",
"Wood St",
"Woodbine St",
"Woodbole Ave",
"Wooddale Ave",
"Woodgate St",
"Woodmere St",
"Woodrow Ave",
"Woodruff Way",
"Woodside Ave",
"Woodville Park",
"Woodville St",
"Woolson St",
"Worcester Sq",
"Worcester St",
"Wordsworth St",
"Worthington St",
"Wrentham St",
"Wyman St",
"Wyola Pl",
"Wyoming St",
"Yarmouth St",
"Yawkey Way",
"Zamora St",
"Zeigler St"]
end

end
