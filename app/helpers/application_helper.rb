module ApplicationHelper
  def display_base_errors(resource)
    return '' if (resource.errors.empty?) || (resource.errors[:base].empty?)
    messages = resource.errors[:base].map { |msg| content_tag(:p, msg) }.join
    html = <<-HTML
    <div class="alert alert-error alert-block">
      <button type="button" class="close" data-dismiss="alert">&#215;</button>
      #{messages}
    </div>
    HTML
    html.html_safe
  end
# #### flatten for saving hash in form
#   def flatten_hash(hash = params, ancestor_names = [])
#     flat_hash = {}
#     hash.each do |k, v|
#       names = Array.new(ancestor_names)
#       names << k
#       if v.is_a?(Hash)
#         flat_hash.merge!(flatten_hash(v, names))
#       else
#         key = flat_hash_key(names)
#         key += "[]" if v.is_a?(Array)
#         flat_hash[key] = v
#       end
#     end

#     flat_hash
#   end

#   def flat_hash_key(names)
#     names = Array.new(names)
#     name = names.shift.to_s.dup 
#     names.each do |n|
#       name << "[#{n}]"
#     end
#     name
#   end

#   def hash_as_hidden_fields(hash = params)
#     hidden_fields = []
#     flatten_hash(hash).each do |name, value|
#       value = [value] if !value.is_a?(Array)
#       value.each do |v|
#         hidden_fields << hidden_field_tag(name, v.to_s, :id => nil) 
#       end
#     end
#     hidden_fields.join("\n").html_safe
#   end
end
