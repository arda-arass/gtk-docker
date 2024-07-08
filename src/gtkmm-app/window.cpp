#include "window.h"
#include <iostream>

Window::Window()
: m_button("CLICK")
{
    set_title("GTKMM-APP");
    set_default_size(200,200);

    m_button.signal_clicked().connect(sigc::mem_fun(*this,
              &Window::on_button_clicked));

    set_child(m_button);
}

Window::~Window()
{

}

void Window::on_button_clicked()
{
    static int x = 0;
    std::cout << x++ << std::endl;
}