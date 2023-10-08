% Least Frequently Used (LFU)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





%%%%% Variables
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
NumberOfRounds=5000;

TotalRoundList=zeros(NumberOfRounds,9); % 1:RoundNumber | 2:NumberOfRequests_Round | 3:NumberOfSuccessJobs_Round | 4:NumberOfNonSuccessJobs_Round | 5:BuyPrice_Site1 | 6:BuyPrice_Site2 | 7:BuyPrice_Site3 | 8:BuyPrice_Site4 | 9:BuyPrice_AllSites
TotalRoundList_Index=0;

AllUsersNumber=0;
MinimumUser_EachSite=5;
MaximumUser_EachSite=50;
Site1_Users=zeros(MaximumUser_EachSite,4); % User_Index | Number of requests | Number of success jobs | Number of non success
Site1_Users_Index=0;
Site2_Users=zeros(MaximumUser_EachSite,4); % User_Index | Number of requests | Number of success jobs | Number of non success
Site2_Users_Index=0;
Site3_Users=zeros(MaximumUser_EachSite,4); % User_Index | Number of requests | Number of success jobs | Number of non success
Site3_Users_Index=0;
Site4_Users=zeros(MaximumUser_EachSite,4); % User_Index | Number of requests | Number of success jobs | Number of non success
Site4_Users_Index=0;

Minimum_FileNumber=10;
Maximum_FileNumber=40;
MinimumSize_File=100; % MB
MaximumSize_File=500; % MB
MinimumPrice_File=20; % Dollar
MaximumPrice_File=200; % Dollar
FileNumber=Minimum_FileNumber+round(rand(1)*(Maximum_FileNumber-Minimum_FileNumber));
FileList=zeros(FileNumber,3); % File_Index | Size | Price
FileSelectionProbability=0.3;

Site_AllFilesSize=0;
Site1_Files=zeros(FileNumber,4); % File_Index | Number of referred by users | Present time at current site | Last used RoundNumber
Site1_Files_Index=0;
Site2_Files=zeros(FileNumber,4); % File_Index | Number of referred by users | Present time at current site | Last used RoundNumber
Site2_Files_Index=0;
Site3_Files=zeros(FileNumber,4); % File_Index | Number of referred by users | Present time at current site | Last used RoundNumber
Site3_Files_Index=0;
Site4_Files=zeros(FileNumber,4); % File_Index | Number of referred by users | Present time at current site | Last used RoundNumber
Site4_Files_Index=0;

NumberOfRequests=0;
NumberOfSuccessJobs=0;
NumberOfNonSuccessJobs=0;
BuyPrice_Site1=0;
BuyPrice_Site2=0;
BuyPrice_Site3=0;
BuyPrice_Site4=0;
BuyPrice=0;





%%%%% Initialize
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Users of sites
% Site 1
UserNumber_Site=MinimumUser_EachSite+round(rand(1)*(MaximumUser_EachSite-MinimumUser_EachSite));
for i=1:UserNumber_Site
    Site1_Users_Index=Site1_Users_Index+1;

    Site1_Users(Site1_Users_Index,1)=i;
    Site1_Users(Site1_Users_Index,2)=0;
    Site1_Users(Site1_Users_Index,3)=0;
    Site1_Users(Site1_Users_Index,4)=0;
end;
AllUsersNumber=UserNumber_Site;
% Site 2
UserNumber_Site=MinimumUser_EachSite+round(rand(1)*(MaximumUser_EachSite-MinimumUser_EachSite));
for i=1:UserNumber_Site
    Site2_Users_Index=Site2_Users_Index+1;

    Site2_Users(Site2_Users_Index,1)=i;
    Site2_Users(Site2_Users_Index,2)=0;
    Site2_Users(Site2_Users_Index,3)=0;
    Site2_Users(Site2_Users_Index,4)=0;
end;
AllUsersNumber=AllUsersNumber+UserNumber_Site;
% Site 3
UserNumber_Site=MinimumUser_EachSite+round(rand(1)*(MaximumUser_EachSite-MinimumUser_EachSite));
for i=1:UserNumber_Site
    Site3_Users_Index=Site3_Users_Index+1;

    Site3_Users(Site3_Users_Index,1)=i;
    Site3_Users(Site3_Users_Index,2)=0;
    Site3_Users(Site3_Users_Index,3)=0;
    Site3_Users(Site3_Users_Index,4)=0;
end;
AllUsersNumber=AllUsersNumber+UserNumber_Site;
% Site 4
UserNumber_Site=MinimumUser_EachSite+round(rand(1)*(MaximumUser_EachSite-MinimumUser_EachSite));
for i=1:UserNumber_Site
    Site4_Users_Index=Site4_Users_Index+1;

    Site4_Users(Site4_Users_Index,1)=i;
    Site4_Users(Site4_Users_Index,2)=0;
    Site4_Users(Site4_Users_Index,3)=0;
    Site4_Users(Site4_Users_Index,4)=0;
end;
AllUsersNumber=AllUsersNumber+UserNumber_Site;

%%% FileList
for i=1:FileNumber
    FileList(i,1)=i;
    FileList(i,2)=MinimumSize_File+round(rand(1)*(MaximumSize_File-MinimumSize_File));
    FileList(i,3)=MinimumPrice_File+round(rand(1)*(MaximumPrice_File-MinimumPrice_File));
end;

%%% Files of sites
Site_AllFilesSize=sum(FileList(:,2));
% Site 1
for i=1:FileNumber
    RandomNumber=rand(1);
    if RandomNumber>=FileSelectionProbability
        Site1_Files_Index=Site1_Files_Index+1;
        
        Site1_Files(Site1_Files_Index,1)=i;
        Site1_Files(Site1_Files_Index,2)=0;
        Site1_Files(Site1_Files_Index,3)=0;
        Site1_Files(Site1_Files_Index,4)=0;
    end;
end;
% Site 2
for i=1:FileNumber
    RandomNumber=rand(1);
    if RandomNumber>=FileSelectionProbability
        Site2_Files_Index=Site2_Files_Index+1;
        
        Site2_Files(Site2_Files_Index,1)=i;
        Site2_Files(Site2_Files_Index,2)=0;
        Site2_Files(Site2_Files_Index,3)=0;
        Site2_Files(Site2_Files_Index,4)=0;
    end;
end;
% Site 3
for i=1:FileNumber
    RandomNumber=rand(1);
    if RandomNumber>=FileSelectionProbability
        Site3_Files_Index=Site3_Files_Index+1;
        
        Site3_Files(Site3_Files_Index,1)=i;
        Site3_Files(Site3_Files_Index,2)=0;
        Site3_Files(Site3_Files_Index,3)=0;
        Site3_Files(Site3_Files_Index,4)=0;
    end;
end;
% Site 4
for i=1:FileNumber
    RandomNumber=rand(1);
    if RandomNumber>=FileSelectionProbability
        Site4_Files_Index=Site4_Files_Index+1;
        
        Site4_Files(Site4_Files_Index,1)=i;
        Site4_Files(Site4_Files_Index,2)=0;
        Site4_Files(Site4_Files_Index,3)=0;
        Site4_Files(Site4_Files_Index,4)=0;
    end;
end;

%%% RequestGenerationRate
RequestGenerationRate=0:100:NumberOfRounds; 





%%%%% Cycle
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
RoundNumber=1;
while RoundNumber<=NumberOfRounds                    
    
    NumberOfRequests_Round=0;
    NumberOfSuccessJobs_Round=0;
    NumberOfNonSuccessJobs_Round=0;
    BuyPrice_Site1_Round=0;
    BuyPrice_Site2_Round=0;
    BuyPrice_Site3_Round=0;
    BuyPrice_Site4_Round=0;
    BuyPrice_AllSites=0;

    %%% Generate requests  
    if length(strfind(RequestGenerationRate,RoundNumber))>0
        
        
        
        
        
        %************************* Site 1 *************************
        %**********************************************************
        %**********************************************************
        User_Index=round(rand(1)*Site1_Users_Index);
        if User_Index==0
            User_Index=1;
        end;
        
        File_Index=round(rand(1)*FileNumber);
        if File_Index==0
            File_Index=1;
        end; 
        
        % Search file into the buffer of Site1
        FileFindFlag=0;
        for i=1:Site1_Files_Index
            if Site1_Files(i,1)==File_Index
                FileFindFlag=1;
            end;
        end;
        
        % Get the file from other sites
        if FileFindFlag==0
            Find=0;            
            for i=1:Site2_Files_Index
                if Site2_Files(i,1)==File_Index
                    Find=1;
                end;
            end;             
            for i=1:Site3_Files_Index
                if Site3_Files(i,1)==File_Index
                    Find=1;
                end;
            end;            
            for i=1:Site4_Files_Index
                if Site4_Files(i,1)==File_Index
                    Find=1;
                end;
            end; 
            
            if Find==1
                FileSize=FileList(File_Index,2);
                FilePrice=FileList(File_Index,3);
                
                SumFileSize=0;
                for i=1:Site1_Files_Index
                    SumFileSize=SumFileSize+Site1_Files(i,2);
                end;
                
                RemainderFileSize=Site_AllFilesSize-SumFileSize;
                
                if FileSize<=RemainderFileSize
                    Site1_Files_Index=Site1_Files_Index+1;

                    Site1_Files(Site1_Files_Index,1)=File_Index;
                    Site1_Files(Site1_Files_Index,2)=0;
                    Site1_Files(Site1_Files_Index,3)=RoundNumber;
                    Site1_Files(Site1_Files_Index,4)=RoundNumber;
                    %
                    BuyPrice_Site1_Round=FilePrice;
                else
                    Files=[]; % File_Index | Last used RoundNumber
                    Files_Index=0;
                    
                    for i=1:Site1_Files_Index  
                        Files_Index=Files_Index+1;
                        
                        Files(Files_Index,1)=Site1_Files(i,1);
                        Files(Files_Index,2)=Site1_Files(i,4);
                    end;
                    
                    FitFlag=0;
                    while (FitFlag==0)||(Files_Index>0)
                        Files=sortrows(Files,2);
                        Index=Files(Files_Index,1);
                        
                        %/ Find the position
                        for i=1:Site1_Files_Index
                            if Site1_Files(i,1)==Index
                                break;
                            end;
                        end;
                        
                        %/ Delete file from Files
                        for j=1:(Files_Index-1)
                            Files(j,1)=Files(j+1,1);
                            Files(j,2)=Files(j+1,2);
                            Files(j,3)=Files(j+1,3);
                        end; 
                        Files_Index=Files_Index-1;
                        
                        %/ Delete file from Site1_Files
                        for j=i:(Site1_Files_Index-1)
                            Site1_Files(j,1)=Site1_Files(j+1,1);
                            Site1_Files(j,2)=Site1_Files(j+1,2);
                            Site1_Files(j,3)=Site1_Files(j+1,3);
                        end; 
                        Site1_Files_Index=Site1_Files_Index-1;
                        
                        % Calculate fitness
                        SumFileSize=SumFileSize-FileList(Index,2);
                        RemainderFileSize=Site_AllFilesSize-SumFileSize;
                        if FileSize<=RemainderFileSize
                            FitFlag=1;
                        end;
                    end;
                    
                    if FitFlag==1
                        Site1_Files_Index=Site1_Files_Index+1;

                        Site1_Files(Site1_Files_Index,1)=File_Index;
                        Site1_Files(Site1_Files_Index,2)=0;
                        Site1_Files(Site1_Files_Index,3)=RoundNumber; 
                        Site1_Files(Site1_Files_Index,4)=RoundNumber; 
                        %
                        BuyPrice_Site1_Round=FilePrice;
                    end;
                end;
            end;
            
        end;
         
        % Update overall information of Site1
        NumberOfRequests_Round=NumberOfRequests_Round+1;
        if FileFindFlag==1
            NumberOfSuccessJobs_Round=NumberOfSuccessJobs_Round+1;

            Site1_Users(User_Index,2)=Site1_Users(User_Index,2)+1;
            Site1_Users(User_Index,3)=Site1_Users(User_Index,3)+1;
            
            for i=1:Site1_Files_Index
                if Site1_Files(i,1)==File_Index
                    Site1_Files(i,2)=Site1_Files(i,2)+1;
                    Site1_Files(i,4)=RoundNumber;
                end;
            end;
        else
            NumberOfNonSuccessJobs_Round=NumberOfNonSuccessJobs_Round+1;

            Site1_Users(User_Index,2)=Site1_Users(User_Index,2)+1;
            Site1_Users(User_Index,4)=Site1_Users(User_Index,4)+1;            
        end; 
        
        
        
        
        
        %************************* Site 2 *************************
        %**********************************************************
        %**********************************************************
        User_Index=round(rand(1)*Site2_Users_Index);
        if User_Index==0
            User_Index=1;
        end;
        
        File_Index=round(rand(1)*FileNumber);
        if File_Index==0
            File_Index=1;
        end; 
        
        % Search file into the buffer of Site2
        FileFindFlag=0;
        for i=1:Site2_Files_Index
            if Site2_Files(i,1)==File_Index
                FileFindFlag=1;
            end;
        end;
        
        % Get the file from other sites
        if FileFindFlag==0
            Find=0;            
            for i=1:Site1_Files_Index
                if Site1_Files(i,1)==File_Index
                    Find=1;
                end;
            end;             
            for i=1:Site3_Files_Index
                if Site3_Files(i,1)==File_Index
                    Find=1;
                end;
            end;            
            for i=1:Site4_Files_Index
                if Site4_Files(i,1)==File_Index
                    Find=1;
                end;
            end; 
            
            if Find==1
                FileSize=FileList(File_Index,2);
                FilePrice=FileList(File_Index,3);
                
                SumFileSize=0;
                for i=1:Site2_Files_Index
                    SumFileSize=SumFileSize+Site2_Files(i,2);
                end;
                
                RemainderFileSize=Site_AllFilesSize-SumFileSize;
                
                if FileSize<=RemainderFileSize
                    Site2_Files_Index=Site2_Files_Index+1;

                    Site2_Files(Site2_Files_Index,1)=File_Index;
                    Site2_Files(Site2_Files_Index,2)=0;
                    Site2_Files(Site2_Files_Index,3)=RoundNumber;
                    Site2_Files(Site2_Files_Index,4)=RoundNumber;
                    %
                    BuyPrice_Site2_Round=FilePrice;
                else
                    Files=[]; % File_Index | Last used RoundNumber
                    Files_Index=0;
                    
                    for i=1:Site2_Files_Index  
                        Files_Index=Files_Index+1;
                        
                        Files(Files_Index,1)=Site2_Files(i,1);
                        Files(Files_Index,2)=Site2_Files(i,4);
                    end;
                    
                    FitFlag=0;
                    while (FitFlag==0)||(Files_Index>0)
                        Files=sortrows(Files,2);
                        Index=Files(Files_Index,1);
                        
                        %/ Find the position
                        for i=1:Site2_Files_Index
                            if Site2_Files(i,1)==Index
                                break;
                            end;
                        end;
                        
                        %/ Delete file from Files
                        for j=1:(Files_Index-1)
                            Files(j,1)=Files(j+1,1);
                            Files(j,2)=Files(j+1,2);
                            Files(j,3)=Files(j+1,3);
                        end; 
                        Files_Index=Files_Index-1;
                        
                        %/ Delete file from Site2_Files
                        for j=i:(Site2_Files_Index-1)
                            Site2_Files(j,1)=Site2_Files(j+1,1);
                            Site2_Files(j,2)=Site2_Files(j+1,2);
                            Site2_Files(j,3)=Site2_Files(j+1,3);
                        end; 
                        Site2_Files_Index=Site2_Files_Index-1;
                        
                        % Calculate fitness
                        SumFileSize=SumFileSize-FileList(Index,2);
                        RemainderFileSize=Site_AllFilesSize-SumFileSize;
                        if FileSize<=RemainderFileSize
                            FitFlag=1;
                        end;
                    end;
                    
                    if FitFlag==1
                        Site2_Files_Index=Site2_Files_Index+1;

                        Site2_Files(Site2_Files_Index,1)=File_Index;
                        Site2_Files(Site2_Files_Index,2)=0;
                        Site2_Files(Site2_Files_Index,3)=RoundNumber; 
                        Site2_Files(Site2_Files_Index,4)=RoundNumber; 
                        %
                        BuyPrice_Site2_Round=FilePrice;
                    end;
                end;
            end;
            
        end;
         
        % Update overall information of Site2
        NumberOfRequests_Round=NumberOfRequests_Round+1;
        if FileFindFlag==1
            NumberOfSuccessJobs_Round=NumberOfSuccessJobs_Round+1;

            Site2_Users(User_Index,2)=Site2_Users(User_Index,2)+1;
            Site2_Users(User_Index,3)=Site2_Users(User_Index,3)+1;
            
            for i=1:Site2_Files_Index
                if Site2_Files(i,1)==File_Index
                    Site2_Files(i,2)=Site2_Files(i,2)+1;
                    Site2_Files(i,4)=RoundNumber;
                end;
            end;
        else
            NumberOfNonSuccessJobs_Round=NumberOfNonSuccessJobs_Round+1;

            Site2_Users(User_Index,2)=Site2_Users(User_Index,2)+1;
            Site2_Users(User_Index,4)=Site2_Users(User_Index,4)+1;            
        end; 
        
        
        
        
        
        %************************* Site 3 *************************
        %**********************************************************
        %**********************************************************
        User_Index=round(rand(1)*Site3_Users_Index);
        if User_Index==0
            User_Index=1;
        end;
        
        File_Index=round(rand(1)*FileNumber);
        if File_Index==0
            File_Index=1;
        end; 
        
        % Search file into the buffer of Site3
        FileFindFlag=0;
        for i=1:Site3_Files_Index
            if Site3_Files(i,1)==File_Index
                FileFindFlag=1;
            end;
        end;
        
        % Get the file from other sites
        if FileFindFlag==0
            Find=0;            
            for i=1:Site1_Files_Index
                if Site1_Files(i,1)==File_Index
                    Find=1;
                end;
            end;             
            for i=1:Site2_Files_Index
                if Site2_Files(i,1)==File_Index
                    Find=1;
                end;
            end;            
            for i=1:Site4_Files_Index
                if Site4_Files(i,1)==File_Index
                    Find=1;
                end;
            end; 
            
            if Find==1
                FileSize=FileList(File_Index,2);
                FilePrice=FileList(File_Index,3);
                
                SumFileSize=0;
                for i=1:Site3_Files_Index
                    SumFileSize=SumFileSize+Site3_Files(i,2);
                end;
                
                RemainderFileSize=Site_AllFilesSize-SumFileSize;
                
                if FileSize<=RemainderFileSize
                    Site3_Files_Index=Site3_Files_Index+1;

                    Site3_Files(Site3_Files_Index,1)=File_Index;
                    Site3_Files(Site3_Files_Index,2)=0;
                    Site3_Files(Site3_Files_Index,3)=RoundNumber;
                    Site3_Files(Site3_Files_Index,4)=RoundNumber;
                    %
                    BuyPrice_Site3_Round=FilePrice;
                else
                    Files=[]; % File_Index | Last used RoundNumber
                    Files_Index=0;
                    
                    for i=1:Site3_Files_Index  
                        Files_Index=Files_Index+1;
                        
                        Files(Files_Index,1)=Site3_Files(i,1);
                        Files(Files_Index,2)=Site3_Files(i,4);
                    end;
                    
                    FitFlag=0;
                    while (FitFlag==0)||(Files_Index>0)
                        Files=sortrows(Files,2);
                        Index=Files(Files_Index,1);
                        
                        %/ Find the position
                        for i=1:Site3_Files_Index
                            if Site3_Files(i,1)==Index
                                break;
                            end;
                        end;
                        
                        %/ Delete file from Files
                        for j=1:(Files_Index-1)
                            Files(j,1)=Files(j+1,1);
                            Files(j,2)=Files(j+1,2);
                            Files(j,3)=Files(j+1,3);
                        end; 
                        Files_Index=Files_Index-1;
                        
                        %/ Delete file from Site3_Files
                        for j=i:(Site3_Files_Index-1)
                            Site3_Files(j,1)=Site3_Files(j+1,1);
                            Site3_Files(j,2)=Site3_Files(j+1,2);
                            Site3_Files(j,3)=Site3_Files(j+1,3);
                        end; 
                        Site3_Files_Index=Site3_Files_Index-1;
                        
                        % Calculate fitness
                        SumFileSize=SumFileSize-FileList(Index,2);
                        RemainderFileSize=Site_AllFilesSize-SumFileSize;
                        if FileSize<=RemainderFileSize
                            FitFlag=1;
                        end;
                    end;
                    
                    if FitFlag==1
                        Site3_Files_Index=Site3_Files_Index+1;

                        Site3_Files(Site3_Files_Index,1)=File_Index;
                        Site3_Files(Site3_Files_Index,2)=0;
                        Site3_Files(Site3_Files_Index,3)=RoundNumber; 
                        Site3_Files(Site3_Files_Index,4)=RoundNumber; 
                        %
                        BuyPrice_Site3_Round=FilePrice;
                    end;
                end;
            end;
            
        end;
         
        % Update overall information of Site3
        NumberOfRequests_Round=NumberOfRequests_Round+1;
        if FileFindFlag==1
            NumberOfSuccessJobs_Round=NumberOfSuccessJobs_Round+1;

            Site3_Users(User_Index,2)=Site3_Users(User_Index,2)+1;
            Site3_Users(User_Index,3)=Site3_Users(User_Index,3)+1;
            
            for i=1:Site3_Files_Index
                if Site3_Files(i,1)==File_Index
                    Site3_Files(i,2)=Site3_Files(i,2)+1;
                    Site3_Files(i,4)=RoundNumber;
                end;
            end;
        else
            NumberOfNonSuccessJobs_Round=NumberOfNonSuccessJobs_Round+1;

            Site3_Users(User_Index,2)=Site3_Users(User_Index,2)+1;
            Site3_Users(User_Index,4)=Site3_Users(User_Index,4)+1;            
        end; 
        
        
        
        
        
        %************************* Site 4 *************************
        %**********************************************************
        %**********************************************************
        User_Index=round(rand(1)*Site4_Users_Index);
        if User_Index==0
            User_Index=1;
        end;
        
        File_Index=round(rand(1)*FileNumber);
        if File_Index==0
            File_Index=1;
        end; 
        
        % Search file into the buffer of Site4
        FileFindFlag=0;
        for i=1:Site4_Files_Index
            if Site4_Files(i,1)==File_Index
                FileFindFlag=1;
            end;
        end;
        
        % Get the file from other sites
        if FileFindFlag==0
            Find=0; 
            for i=1:Site1_Files_Index
                if Site1_Files(i,1)==File_Index
                    Find=1;
                end;
            end;             
            for i=1:Site2_Files_Index
                if Site2_Files(i,1)==File_Index
                    Find=1;
                end;
            end;             
            for i=1:Site3_Files_Index
                if Site3_Files(i,1)==File_Index
                    Find=1;
                end;
            end;            
            
            if Find==1
                FileSize=FileList(File_Index,2);
                FilePrice=FileList(File_Index,3);
                
                SumFileSize=0;
                for i=1:Site4_Files_Index
                    SumFileSize=SumFileSize+Site4_Files(i,2);
                end;
                
                RemainderFileSize=Site_AllFilesSize-SumFileSize;
                
                if FileSize<=RemainderFileSize
                    Site4_Files_Index=Site4_Files_Index+1;

                    Site4_Files(Site4_Files_Index,1)=File_Index;
                    Site4_Files(Site4_Files_Index,2)=0;
                    Site4_Files(Site4_Files_Index,3)=RoundNumber;
                    Site4_Files(Site4_Files_Index,4)=RoundNumber;
                    %
                    BuyPrice_Site4_Round=FilePrice;
                else
                    Files=[]; % File_Index | Last used RoundNumber
                    Files_Index=0;
                    
                    for i=1:Site4_Files_Index  
                        Files_Index=Files_Index+1;
                        
                        Files(Files_Index,1)=Site4_Files(i,1);
                        Files(Files_Index,2)=Site4_Files(i,4);
                    end;
                    
                    FitFlag=0;
                    while (FitFlag==0)||(Files_Index>0)
                        Files=sortrows(Files,2);
                        Index=Files(Files_Index,1);
                        
                        %/ Find the position
                        for i=1:Site4_Files_Index
                            if Site4_Files(i,1)==Index
                                break;
                            end;
                        end;
                        
                        %/ Delete file from Files
                        for j=1:(Files_Index-1)
                            Files(j,1)=Files(j+1,1);
                            Files(j,2)=Files(j+1,2);
                            Files(j,3)=Files(j+1,3);
                        end; 
                        Files_Index=Files_Index-1;
                        
                        %/ Delete file from Site4_Files
                        for j=i:(Site4_Files_Index-1)
                            Site4_Files(j,1)=Site4_Files(j+1,1);
                            Site4_Files(j,2)=Site4_Files(j+1,2);
                            Site4_Files(j,3)=Site4_Files(j+1,3);
                        end; 
                        Site4_Files_Index=Site4_Files_Index-1;
                        
                        % Calculate fitness
                        SumFileSize=SumFileSize-FileList(Index,2);
                        RemainderFileSize=Site_AllFilesSize-SumFileSize;
                        if FileSize<=RemainderFileSize
                            FitFlag=1;
                        end;
                    end;
                    
                    if FitFlag==1
                        Site4_Files_Index=Site4_Files_Index+1;

                        Site4_Files(Site4_Files_Index,1)=File_Index;
                        Site4_Files(Site4_Files_Index,2)=0;
                        Site4_Files(Site4_Files_Index,3)=RoundNumber; 
                        Site4_Files(Site4_Files_Index,4)=RoundNumber; 
                        %
                        BuyPrice_Site4_Round=FilePrice;
                    end;
                end;
            end;
            
        end;
         
        % Update overall information of Site4
        NumberOfRequests_Round=NumberOfRequests_Round+1;
        if FileFindFlag==1
            NumberOfSuccessJobs_Round=NumberOfSuccessJobs_Round+1;

            Site4_Users(User_Index,2)=Site4_Users(User_Index,2)+1;
            Site4_Users(User_Index,3)=Site4_Users(User_Index,3)+1;
            
            for i=1:Site4_Files_Index
                if Site4_Files(i,1)==File_Index
                    Site4_Files(i,2)=Site4_Files(i,2)+1;
                    Site4_Files(i,4)=RoundNumber;
                end;
            end;
        else
            NumberOfNonSuccessJobs_Round=NumberOfNonSuccessJobs_Round+1;

            Site4_Users(User_Index,2)=Site4_Users(User_Index,2)+1;
            Site4_Users(User_Index,4)=Site4_Users(User_Index,4)+1;            
        end; 
        
        
        
        
        
    end;         
    
    %%% BuyPrice_AllSites
    BuyPrice_AllSites=BuyPrice_Site1_Round+BuyPrice_Site2_Round+BuyPrice_Site3_Round+BuyPrice_Site4_Round;
    
    %%% TotalRoundList
    TotalRoundList(RoundNumber,1)=RoundNumber;    
    % 
    TotalRoundList(RoundNumber,2)=NumberOfRequests_Round; 
    % 
    TotalRoundList(RoundNumber,3)=NumberOfSuccessJobs_Round; 
    % 
    TotalRoundList(RoundNumber,4)=NumberOfNonSuccessJobs_Round;     
    % 
    TotalRoundList(RoundNumber,5)=BuyPrice_Site1_Round; 
    %
    TotalRoundList(RoundNumber,6)=BuyPrice_Site2_Round; 
    %
    TotalRoundList(RoundNumber,7)=BuyPrice_Site3_Round;
    %
    TotalRoundList(RoundNumber,8)=BuyPrice_Site4_Round; 
    %
    TotalRoundList(RoundNumber,9)=BuyPrice_AllSites;                
    
    %%% Display and increase RoundNumber
    RoundNumber
    RoundNumber=RoundNumber+1;       
end; 
    




%%%%% Display the outputs
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  

TotalRoundList

FileNumber
FileList

Site1_Users_Index
Site1_Users=Site1_Users(1:Site1_Users_Index,:)
Site2_Users_Index
Site2_Users=Site2_Users(1:Site2_Users_Index,:)
Site3_Users_Index
Site3_Users=Site3_Users(1:Site3_Users_Index,:)
Site4_Users_Index
Site4_Users=Site4_Users(1:Site4_Users_Index,:)

Site1_Files_Index
Site1_Files=Site1_Files(1:Site1_Files_Index,:);
Site1_Files=sortrows(Site1_Files)
Site2_Files_Index
Site2_Files=Site2_Files(1:Site2_Files_Index,:);
Site2_Files=sortrows(Site2_Files)
Site3_Files_Index
Site3_Files=Site3_Files(1:Site3_Files_Index,:);
Site3_Files=sortrows(Site3_Files)
Site4_Files_Index
Site4_Files=Site4_Files(1:Site4_Files_Index,:);
Site4_Files=sortrows(Site4_Files)





%%%%% Display single outputs
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    

% NumberOfRequests
NumberOfRequests=sum(TotalRoundList(:,2))

% NumberOfSuccessJobs
NumberOfSuccessJobs=sum(TotalRoundList(:,3))

% NumberOfNonSuccessJobs
NumberOfNonSuccessJobs=sum(TotalRoundList(:,4))  

% BuyPrice_Site1
BuyPrice_Site1=sum(TotalRoundList(:,5))  

% BuyPrice_Site2
BuyPrice_Site2=sum(TotalRoundList(:,6))   

% BuyPrice_Site3
BuyPrice_Site3=sum(TotalRoundList(:,7))  

% BuyPrice_Site4
BuyPrice_Site4=sum(TotalRoundList(:,8))

% BuyPrice
BuyPrice=sum(TotalRoundList(:,9)) 
    