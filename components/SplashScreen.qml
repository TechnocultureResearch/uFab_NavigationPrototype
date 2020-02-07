import QtQuick 2.0
import "./Drawers"

Item {
    id: _root
    signal loadMainApp
    property int animateIndex: 0
    property bool waitForCalliberation: false
    state: "a"

    Timer {
        id: timer
        interval: 200; running: !waitForCalliberation; repeat: true
        onTriggered: {
            animateIndex++;
            if(animateIndex === 1) { loadMainApp(); timer.interval = 150 }
            else if(animateIndex === 2) { big.destroy() }
            else if(animateIndex === 3) {  } }
    }

    Image { id: big; source: "../Assets/logo.png" }
    Image { id: small; source: "../Assets/logo-small.png"; x: 50; y: 35; }

    states: [
        State { name: "a"; when: animateIndex === 0;
            PropertyChanges { target: big; x: 321; y: 180 }
            PropertyChanges { target: small; x: 321; y: 180; opacity: 0 } },
        State { name: "b"; when: animateIndex === 1;
            PropertyChanges { target: big; x: 50; y: 180; width: 10; opacity: 0 }
            PropertyChanges { target: small; x: 50; y: 180; opacity: 1 } },
        State { name: "c"; when: animateIndex === 2; },
        State { name: "d"; when: animateIndex === 3; PropertyChanges { target: timer; running: false } }
    ]

    transitions: [
        Transition { from: "*"; to: "*"; NumberAnimation { properties: "x,y,width,opacity"; easing.type: Easing.OutExpo; duration: 300 } }
    ]
}
