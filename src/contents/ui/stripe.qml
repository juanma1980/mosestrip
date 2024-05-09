/*
    This script is part of the Lliurex Project 
    SPDX-FileCopyrightText: 2024 juanma1980 <juanma1980@gmail.com>
    SPDX-License-Identifier: GPL-3.0
*/
import QtQuick 2.0;
import QtQuick.Window 2.0;
import org.kde.plasma.core 2.0 as PlasmaCore;
import org.kde.kwin 2.0;

PlasmaCore.Dialog {
    id: strip
    location: PlasmaCore.Types.Floating
    visible: true
    flags: Qt.X11BypassWindowManagerHint | Qt.FramelessWindowHint | Qt.WindowTransparentForInput
    width: 0 //workspace.workspaceWidth
    height: 0 //workspace.workspaceHeight //workspace.activeClient.geometry.height //Screen.height
    outputOnly: true

    Component.onCompleted: {
        strip.show();
        KWin.registerWindow(strip);
    }

}
