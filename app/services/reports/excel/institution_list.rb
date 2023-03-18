# frozen_string_literal: true

module Reports
  module Excel
    class InstitutionList < Reports::Excel::Base
      def generate
        institutions_list

        @filepath = "#{SPREADSHEET_DOWNLOAD_FOLDER}/institutions_list.xlsx"
        @document.serialize @filepath
      end

      def institutions_list
        @document.workbook.add_worksheet(name: "Institutions") do |sheet|
          header = ["ID", "Name", "Location", "State"]
          sheet.add_row header, style: Axlsx::STYLE_THIN_BORDER
          Institution.all.each do |institution|
            custom_field_values = begin
              parse_custom_fields(institution.properties.values)
            rescue
              []
            end
            values = [institution.id, institution.name, institution.location,
              institution.state] + custom_field_values
            sheet.add_row values, types: [:string, :string, :string]
          end
          column_count = Institution.count + 1
          sheet.auto_filter = "A1:D#{column_count}"

          sheet.sheet_view.pane do |pane|
            pane.top_left_cell = "B2"
            pane.state = :frozen_split
            pane.y_split = 1
            pane.x_split = 1
            pane.active_pane = :bottom_right
          end
        end
      end

      def parse_custom_fields(fields)
        fields.map { |v| v.is_a?(Array) ? v.join(", ") : v }
      rescue
        []
      end
    end
  end
end
