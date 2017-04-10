/****************************************************************************
**
** Copyright (C) 2017 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of the test suite of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:BSD$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** BSD License Usage
** Alternatively, you may use this file under the terms of the BSD license
** as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of The Qt Company Ltd nor the names of its
**     contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 2.2
import QtTest 1.0
import QtQuick.Controls 2.3
import QtQuick.Templates 2.3 as T

TestCase {
    id: testCase
    width: 400
    height: 400
    visible: true
    when: windowShown
    name: "Action"

    Component {
        id: component
        Action { }
    }

    Component {
        id: signalSpy
        SignalSpy { }
    }

    function test_enabled() {
        var action = createTemporaryObject(component, testCase)
        verify(action)

        var spy = createTemporaryObject(signalSpy, testCase, {target: action, signalName: "triggered"})
        verify(spy.valid)

        action.enabled = false
        action.trigger()
        compare(spy.count, 0)

        action.enabled = true
        action.trigger()
        compare(spy.count, 1)
    }

    Component {
        id: buttonAndMenu
        Item {
            property alias button: button
            property alias menu: menu
            property alias menuItem: menuItem
            property alias action: sharedAction
            property var lastSource
            Action {
                id: sharedAction
                text: "Shared"
                shortcut: "Ctrl+B"
                onTriggered: lastSource = source
            }
            Button {
                id: button
                action: sharedAction
                Menu {
                    id: menu
                    MenuItem {
                        id: menuItem
                        action: sharedAction
                    }
                }
            }
        }
    }

    function test_shared() {
        var container = createTemporaryObject(buttonAndMenu, testCase)
        verify(container)

        keyClick(Qt.Key_B, Qt.ControlModifier)
        compare(container.lastSource, container.button)

        container.menu.open()
        keyClick(Qt.Key_B, Qt.ControlModifier)
        compare(container.lastSource, container.menuItem)

        tryVerify(function() { return !container.menu.visible })
        keyClick(Qt.Key_B, Qt.ControlModifier)
        compare(container.lastSource, container.button)

        container.button.visible = false
        keyClick(Qt.Key_B, Qt.ControlModifier)
        compare(container.lastSource, container.action)
    }
}