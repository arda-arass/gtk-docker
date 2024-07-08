#ifndef WINDOW_H
#define WINDOW_H

#include <gtkmm/button.h>
#include <gtkmm/window.h>

class Window : public Gtk::Window {
public:
    Window();
    virtual ~Window();

protected:
    void on_button_clicked();

    Gtk::Button m_button;
};

#endif /* WINDOW_H */