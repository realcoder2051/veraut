module FamiliesHelper

  def find_related_to(id)
    begin
      family = Principal.find(id)
    rescue
      return nil
    else
      return family.name
    end
  end

  def check_related_to_exist
    @family[:related_to] if @family.present?
  end

end
