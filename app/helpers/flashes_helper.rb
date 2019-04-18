module FlashesHelper
  FLASH_CLASSES = { notice: "success", warning: "warning", alert: "danger" }.freeze

  def user_facing_flashes
    flash.to_hash.slice "alert", "warning", "notice"
  end

  def flash_class(key)
    FLASH_CLASSES.fetch key.to_sym
  end
end
