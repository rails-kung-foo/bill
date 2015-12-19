module ApplicationHelper
  def display_head_title
    t("layouts.#{ controller.controller_name }.page_title")
  end

  def link_to_root_logo
    link_to(content_tag(:span, '', { class: 'navbarLogo', alt: 'Sky Logo' }), root_path, class: 'navbar-brand')
  end
end
