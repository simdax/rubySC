=begin
** Form generated from reading ui file 'form.ui'
**
** Created: lun. déc. 8 16:50:13 2014
**      by: Qt User Interface Compiler version 4.8.2
**
** WARNING! All changes made in this file will be lost when recompiling ui file!
=end

class Ui_Form
    attr_reader :pushButton_3
    attr_reader :pushButton
    attr_reader :pushButton_2
    attr_reader :textEdit
    attr_reader :textBrowser
    attr_reader :verticalSlider
    attr_reader :lcdNumber
    attr_reader :textBrowser_2
    attr_reader :pushButton_4
    attr_reader :textBrowser_3
    attr_reader :textBrowser_4
    attr_reader :textBrowser_5
    attr_reader :verticalSlider_3
    attr_reader :verticalSlider_4
    attr_reader :textBrowser_6
    attr_reader :horizontalSlider
    attr_reader :textBrowser_7
    attr_reader :pushButton_5
    attr_reader :verticalSlider_2
    attr_reader :lineEdit

    def setupUi(form)
    if form.objectName.nil?
        form.objectName = "form"
    end
    form.resize(577, 490)
    @pushButton_3 = Qt::PushButton.new(form)
    @pushButton_3.objectName = "pushButton_3"
    @pushButton_3.geometry = Qt::Rect.new(450, 260, 95, 24)
    @pushButton_3.cursor = Qt::Cursor.new(Qt::PointingHandCursor)
    @pushButton_3.autoDefault = false
    @pushButton_3.default = false
    @pushButton = Qt::PushButton.new(form)
    @pushButton.objectName = "pushButton"
    @pushButton.geometry = Qt::Rect.new(450, 130, 95, 24)
    @pushButton_2 = Qt::PushButton.new(form)
    @pushButton_2.objectName = "pushButton_2"
    @pushButton_2.geometry = Qt::Rect.new(450, 160, 95, 24)
    @textEdit = Qt::TextEdit.new(form)
    @textEdit.objectName = "textEdit"
    @textEdit.geometry = Qt::Rect.new(300, 10, 121, 51)
    @textBrowser = Qt::TextBrowser.new(form)
    @textBrowser.objectName = "textBrowser"
    @textBrowser.geometry = Qt::Rect.new(30, 310, 471, 161)
    @verticalSlider = Qt::Slider.new(form)
    @verticalSlider.objectName = "verticalSlider"
    @verticalSlider.geometry = Qt::Rect.new(50, 110, 23, 160)
    @verticalSlider.minimum = 1
    @verticalSlider.maximum = 5
    @verticalSlider.singleStep = 1
    @verticalSlider.pageStep = 1
    @verticalSlider.value = 1
    @verticalSlider.orientation = Qt::Vertical
    @lcdNumber = Qt::LCDNumber.new(form)
    @lcdNumber.objectName = "lcdNumber"
    @lcdNumber.geometry = Qt::Rect.new(430, 20, 131, 71)
    @textBrowser_2 = Qt::TextBrowser.new(form)
    @textBrowser_2.objectName = "textBrowser_2"
    @textBrowser_2.geometry = Qt::Rect.new(20, 0, 271, 51)
    @pushButton_4 = Qt::PushButton.new(form)
    @pushButton_4.objectName = "pushButton_4"
    @pushButton_4.geometry = Qt::Rect.new(404, 190, 141, 24)
    @textBrowser_3 = Qt::TextBrowser.new(form)
    @textBrowser_3.objectName = "textBrowser_3"
    @textBrowser_3.geometry = Qt::Rect.new(20, 270, 81, 31)
    @textBrowser_4 = Qt::TextBrowser.new(form)
    @textBrowser_4.objectName = "textBrowser_4"
    @textBrowser_4.geometry = Qt::Rect.new(110, 270, 81, 31)
    @textBrowser_5 = Qt::TextBrowser.new(form)
    @textBrowser_5.objectName = "textBrowser_5"
    @textBrowser_5.geometry = Qt::Rect.new(290, 270, 81, 31)
    @verticalSlider_3 = Qt::Slider.new(form)
    @verticalSlider_3.objectName = "verticalSlider_3"
    @verticalSlider_3.geometry = Qt::Rect.new(230, 110, 23, 160)
    @verticalSlider_3.minimum = 1
    @verticalSlider_3.maximum = 100
    @verticalSlider_3.singleStep = 1
    @verticalSlider_3.pageStep = 1
    @verticalSlider_3.value = 20
    @verticalSlider_3.orientation = Qt::Vertical
    @verticalSlider_4 = Qt::Slider.new(form)
    @verticalSlider_4.objectName = "verticalSlider_4"
    @verticalSlider_4.geometry = Qt::Rect.new(320, 110, 23, 160)
    @verticalSlider_4.minimum = 1
    @verticalSlider_4.maximum = 100
    @verticalSlider_4.singleStep = 1
    @verticalSlider_4.pageStep = 1
    @verticalSlider_4.value = 20
    @verticalSlider_4.orientation = Qt::Vertical
    @textBrowser_6 = Qt::TextBrowser.new(form)
    @textBrowser_6.objectName = "textBrowser_6"
    @textBrowser_6.geometry = Qt::Rect.new(200, 270, 81, 31)
    @horizontalSlider = Qt::Slider.new(form)
    @horizontalSlider.objectName = "horizontalSlider"
    @horizontalSlider.geometry = Qt::Rect.new(130, 70, 160, 23)
    @horizontalSlider.minimum = 1
    @horizontalSlider.value = 25
    @horizontalSlider.orientation = Qt::Horizontal
    @textBrowser_7 = Qt::TextBrowser.new(form)
    @textBrowser_7.objectName = "textBrowser_7"
    @textBrowser_7.geometry = Qt::Rect.new(30, 60, 81, 31)
    @pushButton_5 = Qt::PushButton.new(form)
    @pushButton_5.objectName = "pushButton_5"
    @pushButton_5.geometry = Qt::Rect.new(410, 220, 141, 24)
    @verticalSlider_2 = Qt::Slider.new(form)
    @verticalSlider_2.objectName = "verticalSlider_2"
    @verticalSlider_2.geometry = Qt::Rect.new(140, 110, 23, 160)
    @verticalSlider_2.minimum = 1
    @verticalSlider_2.maximum = 5
    @verticalSlider_2.singleStep = 1
    @verticalSlider_2.pageStep = 1
    @verticalSlider_2.value = 1
    @verticalSlider_2.orientation = Qt::Vertical
    @lineEdit = Qt::LineEdit.new(form)
    @lineEdit.objectName = "lineEdit"
    @lineEdit.geometry = Qt::Rect.new(300, 70, 113, 23)

    retranslateUi(form)
    Qt::Object.connect(@verticalSlider, SIGNAL('valueChanged(int)'), @lcdNumber, SLOT('display(int)'))
    Qt::Object.connect(@horizontalSlider, SIGNAL('valueChanged(int)'), @lcdNumber, SLOT('display(int)'))
    Qt::Object.connect(@verticalSlider_2, SIGNAL('valueChanged(int)'), @lcdNumber, SLOT('display(int)'))

    Qt::MetaObject.connectSlotsByName(form)
    end # setupUi

    def setup_ui(form)
        setupUi(form)
    end

    def retranslateUi(form)
    form.windowTitle = Qt::Application.translate("Form", "Form", nil, Qt::Application::UnicodeUTF8)
    @pushButton_3.text = Qt::Application.translate("Form", "Quit", nil, Qt::Application::UnicodeUTF8)
    @pushButton.text = Qt::Application.translate("Form", "play", nil, Qt::Application::UnicodeUTF8)
    @pushButton_2.text = Qt::Application.translate("Form", "stop", nil, Qt::Application::UnicodeUTF8)
    @textEdit.html = Qt::Application.translate("Form", "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n" \
"<html><head><meta name=\"qrichtext\" content=\"1\" /><style type=\"text/css\">\n" \
"p, li { white-space: pre-wrap; }\n" \
"</style></head><body style=\" font-family:'Sans Serif'; font-size:9pt; font-weight:400; font-style:normal;\">\n" \
"<p align=\"center\" style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\">tapez le nom de l'instrument</p></body></html>", nil, Qt::Application::UnicodeUTF8)
    @textBrowser.html = Qt::Application.translate("Form", "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n" \
"<html><head><meta name=\"qrichtext\" content=\"1\" /><style type=\"text/css\">\n" \
"p, li { white-space: pre-wrap; }\n" \
"</style></head><body style=\" font-family:'Sans Serif'; font-size:9pt; font-weight:400; font-style:normal;\">\n" \
"<p style=\"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><br /></p></body></html>", nil, Qt::Application::UnicodeUTF8)
    @textBrowser_2.html = Qt::Application.translate("Form", "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n" \
"<html><head><meta name=\"qrichtext\" content=\"1\" /><style type=\"text/css\">\n" \
"p, li { white-space: pre-wrap; }\n" \
"</style></head><body style=\" font-family:'Sans Serif'; font-size:9pt; font-weight:400; font-style:normal;\">\n" \
"<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\">Bienvenu dans melodator !</p></body></html>", nil, Qt::Application::UnicodeUTF8)
    @pushButton_4.text = Qt::Application.translate("Form", "nvlle Melodie", nil, Qt::Application::UnicodeUTF8)
    @textBrowser_3.html = Qt::Application.translate("Form", "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n" \
"<html><head><meta name=\"qrichtext\" content=\"1\" /><style type=\"text/css\">\n" \
"p, li { white-space: pre-wrap; }\n" \
"</style></head><body style=\" font-family:'Sans Serif'; font-size:9pt; font-weight:400; font-style:normal;\">\n" \
"<p align=\"center\" style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-size:8pt; font-weight:600;\">Intervalles</span></p></body></html>", nil, Qt::Application::UnicodeUTF8)
    @textBrowser_4.html = Qt::Application.translate("Form", "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n" \
"<html><head><meta name=\"qrichtext\" content=\"1\" /><style type=\"text/css\">\n" \
"p, li { white-space: pre-wrap; }\n" \
"</style></head><body style=\" font-family:'Sans Serif'; font-size:9pt; font-weight:400; font-style:normal;\">\n" \
"<p align=\"center\" style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-weight:600;\">Motifs</span></p></body></html>", nil, Qt::Application::UnicodeUTF8)
    @textBrowser_5.html = Qt::Application.translate("Form", "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n" \
"<html><head><meta name=\"qrichtext\" content=\"1\" /><style type=\"text/css\">\n" \
"p, li { white-space: pre-wrap; }\n" \
"</style></head><body style=\" font-family:'Sans Serif'; font-size:9pt; font-weight:400; font-style:normal;\">\n" \
"<p align=\"center\" style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-weight:600;\">Tempo</span></p></body></html>", nil, Qt::Application::UnicodeUTF8)
    @textBrowser_6.html = Qt::Application.translate("Form", "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n" \
"<html><head><meta name=\"qrichtext\" content=\"1\" /><style type=\"text/css\">\n" \
"p, li { white-space: pre-wrap; }\n" \
"</style></head><body style=\" font-family:'Sans Serif'; font-size:9pt; font-weight:400; font-style:normal;\">\n" \
"<p align=\"center\" style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-weight:600;\">Tempo</span></p></body></html>", nil, Qt::Application::UnicodeUTF8)
    @textBrowser_7.html = Qt::Application.translate("Form", "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n" \
"<html><head><meta name=\"qrichtext\" content=\"1\" /><style type=\"text/css\">\n" \
"p, li { white-space: pre-wrap; }\n" \
"</style></head><body style=\" font-family:'Sans Serif'; font-size:9pt; font-weight:400; font-style:normal;\">\n" \
"<p align=\"center\" style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-weight:600;\">Tempo</span></p></body></html>", nil, Qt::Application::UnicodeUTF8)
    @pushButton_5.text = Qt::Application.translate("Form", "nveau Rythme", nil, Qt::Application::UnicodeUTF8)
    end # retranslateUi

    def retranslate_ui(form)
        retranslateUi(form)
    end

end

module Ui
    class Form < Ui_Form
    end
end  # module Ui

