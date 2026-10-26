# List Available Datasets from UCI ML Repository

Prints a list of datasets that can be imported via the `fetch_ucirepo`
function.

## Usage

``` r
list_available_datasets(filter, search, area)
```

## Arguments

- filter:

  Character. Optional query to filter available datasets based on a
  label.

- search:

  Character. Optional query to search for available datasets by name.

- area:

  Character. Optional query to filter available datasets based on
  subject area.

## Value

A data frame containing the list of available datasets with columns of:

- **id**: Integer ID for the data set.

- **name**: Name of Dataset

- **url**: Download location of the data set

In the event the search fails, the data frame returned will be empty.

## Examples

``` r
list_available_datasets(search = "iris")
#> -------------------------------------------------------------
#> The following datasets are available for search query "iris":
#> -------------------------------------------------------------
#>  name id
#>  Iris 53
#> 
list_available_datasets(area = "social science")
#> -------------------------------------
#> The following datasets are available:
#> For subject area: social science
#> -------------------------------------
#>  name                                             id 
#>  Adult                                            2  
#>  Balance Scale                                    12 
#>  Balloons                                         13 
#>  Census Income                                    20 
#>  Hayes-Roth                                       44 
#>  Nursery                                          76 
#>  Congressional Voting Records                     105
#>  US Census Data (1990)                            116
#>  Census-Income (KDD)                              117
#>  Statlog (German Credit Data)                     144
#>  Communities and Crime                            183
#>  Communities and Crime Unnormalized               211
#>  Bike Sharing                                     275
#>  Student Performance                              320
#>  Drug Consumption (Quantified)                    373
#>  Autism Screening Adult                           426
#>  Gender by Name                                   591
#>  Predict Students' Dropout and Academic Success   697
#>  Power Consumption of Tetouan City                849
#>  Higher Education Students Performance Evaluation 856
#> 
list_available_datasets(filter = "python") # Required for now...
#> --------------------------------------------
#> The following python datasets are available:
#> --------------------------------------------
#>  name                                                                                
#>  Abalone                                                                             
#>  Adult                                                                               
#>  Annealing                                                                           
#>  Audiology (Standardized)                                                            
#>  Auto MPG                                                                            
#>  Automobile                                                                          
#>  Balance Scale                                                                       
#>  Balloons                                                                            
#>  Breast Cancer                                                                       
#>  Breast Cancer Wisconsin (Original)                                                  
#>  Breast Cancer Wisconsin (Prognostic)                                                
#>  Breast Cancer Wisconsin (Diagnostic)                                                
#>  Pittsburgh Bridges                                                                  
#>  Car Evaluation                                                                      
#>  Census Income                                                                       
#>  Chess (King-Rook vs. King-Pawn)                                                     
#>  Chess (King-Rook vs. King)                                                          
#>  Connect-4                                                                           
#>  Credit Approval                                                                     
#>  Japanese Credit Screening                                                           
#>  Computer Hardware                                                                   
#>  Contraceptive Method Choice                                                         
#>  Covertype                                                                           
#>  Cylinder Bands                                                                      
#>  Dermatology                                                                         
#>  Echocardiogram                                                                      
#>  Ecoli                                                                               
#>  Flags                                                                               
#>  Glass Identification                                                                
#>  Haberman's Survival                                                                 
#>  Hayes-Roth                                                                          
#>  Heart Disease                                                                       
#>  Hepatitis                                                                           
#>  Horse Colic                                                                         
#>  Image Segmentation                                                                  
#>  Ionosphere                                                                          
#>  Iris                                                                                
#>  ISOLET                                                                              
#>  Lenses                                                                              
#>  Letter Recognition                                                                  
#>  Liver Disorders                                                                     
#>  Lung Cancer                                                                         
#>  Lymphography                                                                        
#>  Molecular Biology (Splice-junction Gene Sequences)                                  
#>  MONK's Problems                                                                     
#>  Mushroom                                                                            
#>  Musk (Version 1)                                                                    
#>  Musk (Version 2)                                                                    
#>  Nursery                                                                             
#>  Page Blocks Classification                                                          
#>  Optical Recognition of Handwritten Digits                                           
#>  Pen-Based Recognition of Handwritten Digits                                         
#>  Post-Operative Patient                                                              
#>  Primary Tumor                                                                       
#>  Servo                                                                               
#>  Shuttle Landing Control                                                             
#>  Solar Flare                                                                         
#>  Soybean (Large)                                                                     
#>  Soybean (Small)                                                                     
#>  Challenger USA Space Shuttle O-Ring                                                 
#>  Spambase                                                                            
#>  SPECT Heart                                                                         
#>  SPECTF Heart                                                                        
#>  Tic-Tac-Toe Endgame                                                                 
#>  Congressional Voting Records                                                        
#>  Waveform Database Generator (Version 1)                                             
#>  Wine                                                                                
#>  Yeast                                                                               
#>  Zoo                                                                                 
#>  US Census Data (1990)                                                               
#>  Census-Income (KDD)                                                                 
#>  El Nino                                                                             
#>  Statlog (Australian Credit Approval)                                                
#>  Statlog (German Credit Data)                                                        
#>  Statlog (Heart)                                                                     
#>  Statlog (Landsat Satellite)                                                         
#>  Statlog (Image Segmentation)                                                        
#>  Statlog (Shuttle)                                                                   
#>  Statlog (Vehicle Silhouettes)                                                       
#>  Connectionist Bench (Sonar, Mines vs. Rocks)                                        
#>  Cloud                                                                               
#>  Poker Hand                                                                          
#>  MAGIC Gamma Telescope                                                               
#>  Mammographic Mass                                                                   
#>  Forest Fires                                                                        
#>  Concrete Compressive Strength                                                       
#>  Ozone Level Detection                                                               
#>  Parkinsons                                                                          
#>  Blood Transfusion Service Center                                                    
#>  Communities and Crime                                                               
#>  Acute Inflammations                                                                 
#>  Wine Quality                                                                        
#>  Parkinsons Telemonitoring                                                           
#>  Cardiotocography                                                                    
#>  Steel Plates Faults                                                                 
#>  Communities and Crime Unnormalized                                                  
#>  Vertebral Column                                                                    
#>  Bank Marketing                                                                      
#>  ILPD (Indian Liver Patient Dataset)                                                 
#>  Skin Segmentation                                                                   
#>  Individual Household Electric Power Consumption                                     
#>  Energy Efficiency                                                                   
#>  Fertility                                                                           
#>  ISTANBUL STOCK EXCHANGE                                                             
#>  User Knowledge Modeling                                                             
#>  EEG Eye State                                                                       
#>  Banknote Authentication                                                             
#>  Gas Sensor Array Drift at Different Concentrations                                  
#>  Bike Sharing                                                                        
#>  Thoracic Surgery Data                                                               
#>  Airfoil Self-Noise                                                                  
#>  Wholesale customers                                                                 
#>  Combined Cycle Power Plant                                                          
#>  Diabetes 130-US Hospitals for Years 1999-2008                                       
#>  Tennis Major Tournament Match Statistics                                            
#>  Dow Jones Index                                                                     
#>  Student Performance                                                                 
#>  Phishing Websites                                                                   
#>  Diabetic Retinopathy Debrecen                                                       
#>  Online News Popularity                                                              
#>  Chronic Kidney Disease                                                              
#>  Mice Protein Expression                                                             
#>  Default of Credit Card Clients                                                      
#>  Online Retail                                                                       
#>  Occupancy Detection                                                                 
#>  Air Quality                                                                         
#>  Polish Companies Bankruptcy                                                         
#>  Dota2 Games Results                                                                 
#>  Facebook Metrics                                                                    
#>  HTRU2                                                                               
#>  Drug Consumption (Quantified)                                                       
#>  Appliances Energy Prediction                                                        
#>  Website Phishing                                                                    
#>  YouTube Spam Collection                                                             
#>  Beijing PM2.5                                                                       
#>  Cervical Cancer (Risk Factors)                                                      
#>  Stock Portfolio Performance                                                         
#>  Sales Transactions Weekly                                                           
#>  Daily Demand Forecasting Orders                                                     
#>  Autistic Spectrum Disorder Screening Data for Children                              
#>  Autism Screening Adult                                                              
#>  Absenteeism at work                                                                 
#>  Breast Cancer Coimbra                                                               
#>  Drug Reviews (Druglib.com)                                                          
#>  Drug Reviews (Drugs.com)                                                            
#>  Superconductivty Data                                                               
#>  Student Academics Performance                                                       
#>  Online Shoppers Purchasing Intention Dataset                                        
#>  Electrical Grid Stability Simulated Data                                            
#>  Real Estate Valuation                                                               
#>  Travel Reviews                                                                      
#>  Travel Review Ratings                                                               
#>  Facebook Live Sellers in Thailand                                                   
#>  Metro Interstate Traffic Volume                                                     
#>  Hepatitis C Virus (HCV) for Egyptian patients                                       
#>  Heart Failure Clinical Records                                                      
#>  Early Stage Diabetes Risk Prediction                                                
#>  Pedestrians in Traffic                                                              
#>  Cervical Cancer Behavior Risk                                                       
#>  Estimation of Obesity Levels Based On Eating Habits and Physical Condition          
#>  Rice (Cammeo and Osmancik)                                                          
#>  Algerian Forest Fires                                                               
#>  Gas Turbine CO and NOx Emission Data Set                                            
#>  Apartment for Rent Classified                                                       
#>  Seoul Bike Sharing Demand                                                           
#>  Iranian Churn                                                                       
#>  Bone marrow transplant: children                                                    
#>  COVID-19 Surveillance                                                               
#>  HCV data                                                                            
#>  Taiwanese Bankruptcy Prediction                                                     
#>  Myocardial infarction complications                                                 
#>  Student Performance on an Entrance Examination                                      
#>  Gender by Name                                                                      
#>  Productivity Prediction of Garment Employees                                        
#>  AI4I 2020 Predictive Maintenance Dataset                                            
#>  Dry Bean                                                                            
#>  In-Vehicle Coupon Recommendation                                                    
#>  Predict Students' Dropout and Academic Success                                      
#>  Auction Verification                                                                
#>  NATICUSdroid (Android Permissions)                                                  
#>  Toxicity                                                                            
#>  DARWIN                                                                              
#>  Accelerometer Gyro Mobile Phone                                                     
#>  Glioma Grading Clinical and Mutation Features                                       
#>  Multivariate Gait Data                                                              
#>  Land Mines                                                                          
#>  Single Elder Home Monitoring: Gas and Position                                      
#>  Sepsis Survival Minimal Clinical Records                                            
#>  Secondary Mushroom                                                                  
#>  Power Consumption of Tetouan City                                                   
#>  Raisin                                                                              
#>  Steel Industry Energy Consumption                                                   
#>  Higher Education Students Performance Evaluation                                    
#>  Risk Factor Prediction of Chronic Kidney Disease                                    
#>  Maternal Health Risk                                                                
#>  Room Occupancy Estimation                                                           
#>  Cirrhosis Patient Survival Prediction                                               
#>  SUPPORT2                                                                            
#>  National Health and Nutrition Health Survey 2013-2014 (NHANES) Age Prediction Subset
#>  AIDS Clinical Trials Group Study 175                                                
#>  CDC Diabetes Health Indicators                                                      
#>  Recipe Reviews and User Feedback                                                    
#>  Forty Soybean Cultivars from Subsequent Harvests                                    
#>  Differentiated Thyroid Cancer Recurrence                                            
#>  Infrared Thermography Temperature                                                   
#>  National Poll on Healthy Aging (NPHA)                                               
#>  Regensburg Pediatric Appendicitis                                                   
#>  RT-IoT2022                                                                          
#>  PhiUSIIL Phishing URL (Website)                                                     
#>  id 
#>  1  
#>  2  
#>  3  
#>  8  
#>  9  
#>  10 
#>  12 
#>  13 
#>  14 
#>  15 
#>  16 
#>  17 
#>  18 
#>  19 
#>  20 
#>  22 
#>  23 
#>  26 
#>  27 
#>  28 
#>  29 
#>  30 
#>  31 
#>  32 
#>  33 
#>  38 
#>  39 
#>  40 
#>  42 
#>  43 
#>  44 
#>  45 
#>  46 
#>  47 
#>  50 
#>  52 
#>  53 
#>  54 
#>  58 
#>  59 
#>  60 
#>  62 
#>  63 
#>  69 
#>  70 
#>  73 
#>  74 
#>  75 
#>  76 
#>  78 
#>  80 
#>  81 
#>  82 
#>  83 
#>  87 
#>  88 
#>  89 
#>  90 
#>  91 
#>  92 
#>  94 
#>  95 
#>  96 
#>  101
#>  105
#>  107
#>  109
#>  110
#>  111
#>  116
#>  117
#>  122
#>  143
#>  144
#>  145
#>  146
#>  147
#>  148
#>  149
#>  151
#>  155
#>  158
#>  159
#>  161
#>  162
#>  165
#>  172
#>  174
#>  176
#>  183
#>  184
#>  186
#>  189
#>  193
#>  198
#>  211
#>  212
#>  222
#>  225
#>  229
#>  235
#>  242
#>  244
#>  247
#>  257
#>  264
#>  267
#>  270
#>  275
#>  277
#>  291
#>  292
#>  294
#>  296
#>  300
#>  312
#>  320
#>  327
#>  329
#>  332
#>  336
#>  342
#>  350
#>  352
#>  357
#>  360
#>  365
#>  367
#>  368
#>  372
#>  373
#>  374
#>  379
#>  380
#>  381
#>  383
#>  390
#>  396
#>  409
#>  419
#>  426
#>  445
#>  451
#>  461
#>  462
#>  464
#>  467
#>  468
#>  471
#>  477
#>  484
#>  485
#>  488
#>  492
#>  503
#>  519
#>  529
#>  536
#>  537
#>  544
#>  545
#>  547
#>  551
#>  555
#>  560
#>  563
#>  565
#>  567
#>  571
#>  572
#>  579
#>  582
#>  591
#>  597
#>  601
#>  602
#>  603
#>  697
#>  713
#>  722
#>  728
#>  732
#>  755
#>  759
#>  760
#>  763
#>  799
#>  827
#>  848
#>  849
#>  850
#>  851
#>  856
#>  857
#>  863
#>  864
#>  878
#>  880
#>  887
#>  890
#>  891
#>  911
#>  913
#>  915
#>  925
#>  936
#>  938
#>  942
#>  967
#> 
```
