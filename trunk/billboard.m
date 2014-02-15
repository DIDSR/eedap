%%-------- billboard --------
function billboard(handles, desc)
try
   % This function creates an image with text to be displayed to the user
   
     set(handles.ImageAxes,...
         'Units', 'normalized',...
         'Position', [0, 0.2, 1.0, 0.8],...
         'Units', 'pixels',...
         'Visible', 'off');
    
    position = int64(get(handles.ImageAxes, 'Position'));
    temp_image = ones([position(4), position(3), 3])-.5;
    i=(1:double(position(3)))/double(position(3));
    for j=1:position(4)
        temp_image(j,:,1) = i;
    end
    img_object = image(temp_image, 'Parent', handles.ImageAxes); %#ok<NASGU>
    axis image
    set(handles.ImageAxes, 'Visible', 'off');
    
    text('Parent', handles.ImageAxes,...
        'FontName', 'Times',...
        'FontUnits', 'normalized',...
        'FontSize', .25,...
        'HorizontalAlignment', 'center',...
        'VerticalAlignment', 'middle',...
        'Position', [position(3)/2, position(4)/2],...
        'String', desc);
   
catch ME
    error_show(ME)
end
end

