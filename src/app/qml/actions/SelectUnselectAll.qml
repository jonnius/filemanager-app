import QtQuick 2.4
import Ubuntu.Components 1.3

Action {
    property bool selectedAll
    iconName: selectedAll ? "select-none" :  "select"
    text: selectedAll ? i18n.tr("Select None") : i18n.tr("Select All")
}

