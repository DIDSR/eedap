
% stage_set_origin_thorlabs_script opens a connection to a thorlabs stage.
%   This script is meant to be run in the base environment.
% Wait for device to be ready
elapsed = 0;
while savedStage.device.IsDeviceBusy
    pause(0.25)
    elapsed = elapsed + .25;

    if elapsed > savedStage.timeout
        error('Stage is busy longer than timeout.');
    end
end

% If stage is not homed, home it!
if(~savedStage.xChannel.Status.IsHomed)
    fprintf("Homing xChannel ...\n")
    savedStage.xChannel.Home(savedStage.timeout);
end
fprintf("xChannel is homed.\n")

if(~savedStage.yChannel.Status.IsHomed)
    fprintf("Homing yChannel ...\n")
    savedStage.yChannel.Home(savedStage.timeout);
end
fprintf("yChannel is homed.\n")
