/*
    This script is part of the Lliurex Project 
    SPDX-FileCopyrightText: 2024 Juanma1980 <juanma1980@gmail.com>
    SPDX-License-Identifier: GPL-3.0
*/

import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import org.kde.kirigami 2.12 as Kirigami
import org.kde.kwin 2.0 as KWinComponents

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

    property color bkgColor: "black"
    property int stripOpacity: 15
    property color rColor: "black"
    property int stripHeight: 2
    property color borderColor: "yellow" 
    property int borderOpacity: 30
    property color rBorderColor: "yellow"
    property int borderHeight: 14
    property bool fillBorder: false
    property bool show: true

    function reloadStrip(show=true){
        mainItemLoader.sourceComponent=undefined;
        mainItemLoaderTop.sourceComponent=undefined;
        mainItemLoaderBottom.sourceComponent=undefined;
        mainItemLoader.source="";
        mainItemLoaderTop.source="";
        mainItemLoaderBottom.source="";
        moveStrip();
        root.show=show
    }
    
    function readConfig(){
        bkgColor= KWin.readConfig("BackgroundColor",Qt.rgba(0,0,1,0.1));
        stripOpacity= KWin.readConfig("StripOpacity",20);
        rColor=Qt.rgba(bkgColor.r,bkgColor.g,bkgColor.b,stripOpacity/100);
        stripHeight= KWin.readConfig("StripHeight",3);
        borderColor= KWin.readConfig("BorderColor",Qt.rgba(0,0,1,0.1));
        borderOpacity= KWin.readConfig("BorderOpacity",20);
        rBorderColor=Qt.rgba(borderColor.r,borderColor.g,borderColor.b,borderOpacity/100);
        borderHeight= KWin.readConfig("BorderHeight",2);
        fillBorder= KWin.readConfig("FillBorder",false);
    }

    function updateConfig(){
        print("");
    }

    function applyConfig(){
       var ReadStrip;
       var BorderStripTop;
       var BorderStripBottom;
       readConfig();
       mainItemLoaderTop.source = "border.qml";
       BorderStripTop=mainItemLoaderTop.item;
       BorderStripTop.height=borderHeight;
       BorderStripTop.color=rBorderColor;
       BorderStripTop.opacity=borderOpacity/100;
       BorderStripTop.y=0;
       BorderStripTop.width= workspace.workspaceWidth;
       mainItemLoaderBottom.source = "borderB.qml";
       BorderStripBottom=mainItemLoaderBottom.item;
       BorderStripBottom.height=borderHeight;
       BorderStripBottom.color=rBorderColor;
       BorderStripBottom.opacity=borderOpacity/100;
       BorderStripBottom.width= workspace.workspaceWidth;
       mainItemLoader.source = "stripe.qml";
       ReadStrip=mainItemLoader.item;
       ReadStrip.color=root.rColor;
       ReadStrip.height=Kirigami.Units.gridUnit*2*root.stripHeight;
       ReadStrip.width= workspace.workspaceWidth;
    }

    function moveStrip(){
       var ReadStrip;
       var BorderStripTop;
       var BorderStripBottom;
       if (!mainItemLoader.item) {
           applyConfig();
       }
       ReadStrip=mainItemLoader.item;
       BorderStripTop=mainItemLoaderTop.item;
       BorderStripBottom=mainItemLoaderBottom.item;
       ReadStrip.y=workspace.cursorPos.y-(ReadStrip.height*0.5);
       BorderStripBottom.y=ReadStrip.height+ReadStrip.y;
       if (fillBorder==true)
       {
           BorderStripTop.height=ReadStrip.y;
           BorderStripBottom.height=workspace.workspaceHeight-BorderStripBottom.y;
       } else {
           BorderStripTop.y=ReadStrip.y-borderHeight;
           BorderStripBottom.y=ReadStrip.height+ReadStrip.y;
       }
    }


    Connections {
        target: options
        function onConfigChanged() { updateConfig(); }
    }

    Connections {
        target: workspace
        function onCursorPosChanged() {
            if (show==true){
                moveStrip();
            }
        }
    }

    KWinComponents.DBusCall {
        id: kwinReconfigure
        service: "org.kde.KWin"; path: "/KWin"; method: "reconfigure";
    }

    Component.onCompleted: {
        KWin.registerShortcut("Toggle Mouse Strip", "Toggle Mouse Strip", "Ctrl+Meta+M", function() {  reloadStrip(!show); }); 
        reloadStrip(true);
    }
}
