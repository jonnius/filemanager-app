/*
 * Copyright (C) 2013 Canonical Ltd
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 3 as
 * published by the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 * Authored by: Michael Spencer <sonrisesoftware@gmail.com>
 */
import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.Popups 1.3

Item {
    id: root

    property var folderListModel
    property string folderPath: folderListModel.path
    property int count: repeater.count
    property Flickable flickable: flickable
    property bool smallMode: !wideAspect

    ScrollView {
        id: flickable
        clip: true
        anchors.fill: parent

        Column {
            id: column
            width: scrollView.width

            // This must be visible so Autopilot can see it
            SectionDivider {
                anchors {
                    left: parent.left
                    right: parent.right
                }

                objectName: "iconViewHeader"
                text: i18n.tr("%1 (%2 file)", "%1 (%2 files)", root.count).arg(root.folderPath).arg(root.count)
                height: smallMode ? units.gu(4) : 0
            }

            AutoSpacedGrid {
                id: grid
                width: root.width

                cellCount: repeater.count
                cellWidth: units.gu(11)
                cellHeight: units.gu(11)
                minSpacing: units.gu(2)
                ySpacing: 1/2 * spacing

                Repeater {
                    id: repeater
                    model: folderListModel
                    delegate: FolderIconDelegate {

                    }
                }
            }
        }
    }
}
