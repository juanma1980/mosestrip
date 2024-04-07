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
    id: borderBottom
    location: PlasmaCore.Types.Floating
    visible: true
    flags: Qt.X11BypassWindowManagerHint | Qt.FramelessWindowHint
    color:"black"
    y:0
    //width: Screen.width
    width: workspace.workspaceWidth
    height: 16
    outputOnly: true
    Component.onCompleted: {
        borderBottom.show();
        KWin.registerWindow(borderBottom);
    }

}
