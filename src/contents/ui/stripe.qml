/*
    This script is part of the Lliurex Project 
    SPDX-FileCopyrightText: 2024 juanma1980 <juanma1980@gmail.com>
    SPDX-License-Identifier: GPL-3.0
*/
import QtQuick 2.0;
import QtQuick.Window 2.0;

Window {
		id: strip
		color:Qt.rgba(0,0,0,0)
		flags:Qt.FrameLessHint|Qt.WindowStaysOnTopHint|Qt.WindowSystemMenuHint| Qt.X11BypassWindowManagerHint | Qt.FramelessWindowHint| Qt.WindowTransparentForInput| Qt.TransparentForMouseEvents|Qt.OnScreenDisplay
		property bool outputOnly:true
		visible: false
		Rectangle {
			id:rect
			anchors.fill:parent
			color:strip.color
			visible:true
		}
    Component.onCompleted: {
        strip.show();
    }
}
