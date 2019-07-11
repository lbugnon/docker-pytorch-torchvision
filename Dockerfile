FROM anibali/pytorch:cuda-9.0                                                                
                                                                                       
                                                                                             
RUN conda install -y pytorch torchvision cudatoolkit=9.0 -c pytorch                          
                                                                                             
RUN conda install -y scikit-learn                                                            
RUN conda install -y pandas                                                                  
                                                                                             
                                                                                             
RUN mkdir /home/user/data/                                                                   
RUN mkdir /home/user/data/train/                                                             
RUN mkdir /home/user/data/test/                                                              
RUN mkdir /home/user/results/                                                                
RUN mkdir /home/user/model/                                                                  
RUN mkdir /home/user/src/                                                                    
                                  
