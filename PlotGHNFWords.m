% Plot a GHNF where each prototype can be displayed as a word of a
% dictionary
function [Handle]=PlotGHNFWords(Model,Dictionary)
% Inputs:
%   Model = the trained GHNF model
%   Dictionary = dictionary of words present the documents


Handle=figure;
hold on
PlotGHNFWordsRec(Model,Dictionary,1);

function PlotGHNFWordsRec(Model,Dictionary,Level)

if ~isempty(Model) && (Level <= 4),
    
    Colors = distinguishable_colors(4);
    MyColor = Colors(Level,:);
    
    SpanningTree=biograph(Model.SpanningTree);
    dolayout(SpanningTree);

    for NdxUnit=1:Model.MaxUnits
        if isfinite(Model.Means(1,NdxUnit))      
            
            MyPos=SpanningTree.Nodes(NdxUnit).Position;
            
            % Draw edges
            NdxNeighbors=find(Model.SpanningTree(NdxUnit,:));                        
            for NdxMyNeigh=1:numel(NdxNeighbors)
                line([MyPos(1) SpanningTree.Nodes(NdxNeighbors(NdxMyNeigh)).Position(1)],...
                    [MyPos(2) SpanningTree.Nodes(NdxNeighbors(NdxMyNeigh)).Position(2)],'Color',MyColor,'LineWidth',0.5*1/Level);
            end
            
            % Draw nodes            
            [MyWordFreq,MyWordNdx] = max(Model.Means(:,NdxUnit));  
            MyWord = Dictionary{MyWordNdx};            
            text(MyPos(1)-(length(MyWord)/2)*5*MyWordFreq*1/Level,MyPos(2),MyWord,'Color',MyColor,'FontSize',12*MyWordFreq*1/Level);
        end
    end

%     for NdxUnit=1:Model.MaxUnits
%         if isfinite(Model.Means(1,NdxUnit))
%             MyPos=SpanningTree.Nodes(NdxUnit).Position;
%             [MyWordFreq,MyWordNdx] = max(Model.Means(:,NdxUnit));            
% %             SpanningTree.Nodes(NdxUnit).ID = Dictionary{MyWordNdx};
%             text(MyPos(1),MyPos(2),Dictionary{MyWordNdx});
% %             MyImage=flipud(reshape(Model.Means(:,NdxUnit),[NumRowsImages NumColsImages]));
% %             imagesc(MyPos(1),MyPos(2),MyImage,[-0.2 1.25]);        
%         end
%     end
%     view(SpanningTree);
    for NdxUnit=1:length(Model.Child),
        PlotGHNFWordsRec(Model.Child{NdxUnit},Dictionary,Level+1);          
    end
    hold off
end

