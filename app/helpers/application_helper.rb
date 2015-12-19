module ApplicationHelper
  def display_head_title
    t("layouts.#{ controller.controller_name }.page_title")
  end
end
