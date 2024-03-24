/*
    This script is part of the Lliurex Project 
    SPDX-FileCopyrightText: 2024 Juanma1980 <juanma1980@gmail.com>
    SPDX-License-Identifier: GPL-3.0
*/
import QtQuick 2.0;
import QtQuick.Window 2.0;

Item {
    id: root

    Loader {
        id: mainItemLoader
    }
    Loader {
        id: mainItemLoaderTop
    }
    Loader {
        id: mainItemLoaderBottom
    }

    property color bkgColor: KWin.readConfig("BackgroundColor",Qt.rgba(0,0,1,0.1))
    property int stripOpacity: KWin.readConfig("StripOpacity",20)
    property color rColor:Qt.rgba(bkgColor.r,bkgColor.g,bkgColor.b,stripOpacity/100)
    property int stripHeight: KWin.readConfig("StripHeight",2)
    property color borderColor: KWin.readConfig("BorderColor",Qt.rgba(0,0,1,0.1))
    property int borderOpacity: KWin.readConfig("BorderOpacity",20)
    property color rBorderColor:Qt.rgba(borderColor.r,borderColor.g,borderColor.b,borderOpacity/100)
    property int borderHeight: KWin.readConfig("BorderHeight",2)
    property bool fillBorder: KWin.readConfig("FillBorder",false)

    Connections {
        target: workspace
        function onCursorPosChanged() {
            var ReadStrip;
            var BorderStripTop;
            var BorderStripBottom;
            if (!mainItemLoader.item) {
                mainItemLoaderTop.source = "border.qml";
                BorderStripTop=mainItemLoaderTop.item;
                BorderStripTop.height=borderHeight
                BorderStripTop.color=rBorderColor
                BorderStripTop.opacity=borderOpacity/100;
                BorderStripTop.y=0
                mainItemLoaderBottom.source = "borderB.qml";
                BorderStripBottom=mainItemLoaderBottom.item;
                BorderStripBottom.height=borderHeight;
                BorderStripBottom.color=rBorderColor;
                BorderStripBottom.opacity=borderOpacity/100;
                mainItemLoader.source = "stripe.qml";
                ReadStrip=mainItemLoader.item;
                ReadStrip.color=root.rColor;
                ReadStrip.height=48*root.stripHeight;
            }
            ReadStrip=mainItemLoader.item
            BorderStripTop=mainItemLoaderTop.item
            BorderStripBottom=mainItemLoaderBottom.item
            ReadStrip.y=workspace.cursorPos.y-(ReadStrip.height/2)
            BorderStripBottom.y=ReadStrip.height+ReadStrip.y
            if (fillBorder==true)
            {
                BorderStripTop.height=ReadStrip.y
                BorderStripBottom.height=Screen.height-BorderStripBottom.y
            } else {
                BorderStripTop.y=ReadStrip.y-borderHeight
                BorderStripBottom.y=ReadStrip.height+ReadStrip.y
            }
        }
    }
}
