module ApplicationHelper
  # Display page title in tab, depending on controller name.
  # TODO: If this apps grows, we should add an additional nested level, depending on action name
  def display_page_title
    t("layouts.#{ controller.controller_name }.page_title")
  end

  # Build the main logo
  def link_to_root_logo
    link_to(content_tag(:span, '', { class: 'navbarLogo', alt: 'Sky Logo' }), root_path, class: 'navbar-brand')
  end

  # Localises a date/time with guard protection
  def ltime(dt, hash={})
    return nil if dt.blank?

    dt = Time.parse(dt) unless dt.class == Time

    l(dt, hash)
  end
end
