/*
    This script is part of the Lliurex Project 
    SPDX-FileCopyrightText: 2024 juanma1980 <juanma1980@gmail.com>
    SPDX-License-Identifier: GPL-3.0
*/
import QtQuick 2.0;
import QtQuick.Window 2.0;

Window {
    id: borderBottom
	flags:Qt.FrameLessHint|Qt.WindowStaysOnTopHint|Qt.WindowSystemMenuHint| Qt.X11BypassWindowManagerHint | Qt.FramelessWindowHint| Qt.WindowTransparentForInput| Qt.TransparentForMouseEvents|Qt.OnScreenDisplay
	color:Qt.rgba(0,0,0,0)
	property bool outputOnly:true
    visible: false
    y:0
	Rectangle {
		id:rect
		anchors.fill:parent
		color:borderBottom.color
		visible:true
	}
    Component.onCompleted: {
        borderBottom.show();
    }

}
