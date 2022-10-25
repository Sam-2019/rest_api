require 'caxlsx'

module Reports
    class ReportBase
        SPREADSHEET_DOWNLOAD_FOLDER = "#{RAILS_ROOT_PATH}/spreadsheet_downloads/"

        def initialize(file_name)
            @file_name = file_name
            @filepath = "#{SPREADSHEET_DOWNLOAD_FOLDER}/#{@file_name}.xlsx"
        end

        def sample_data
            @document = Axlsx::Package.new
            users_list
            institutions_list

            @document.workbook.add_view tab_ratio: 800, active_tab: 1
            @document.serialize @filepath
        end

        def users_list
            @document.workbook.add_worksheet(name: 'Users') do |sheet|
                header =  ['ID', 'First Name', 'Last Name', 'Email', 'State']
                sheet.add_row header, style: Axlsx::STYLE_THIN_BORDER
                User.all.each do |user|
                    values = [user.id, user.first_name, user.last_name, user.email, user.state].to_a
                    sheet.add_row values
                end
                sheet.auto_filter = 'A1:D5'

                sheet.sheet_view.pane do |pane|
                    pane.top_left_cell = 'B2'
                    pane.state = :frozen_split
                    pane.y_split = 1
                    pane.x_split = 1
                    pane.active_pane = :bottom_right
                end
            end
        end

        def institutions_list
            @document.workbook.add_worksheet(name: 'Institutions') do |sheet|
                header = ['ID', 'Name', 'Location', 'State']
                sheet.add_row header, style: Axlsx::STYLE_THIN_BORDER
                Institution.all.each do |institution|
                    custom_field_values = begin
                        parse_custom_fields(institution.properties.values)
                    rescue
                        []
                    end
                    values = [institution.id, institution.name, institution.location, institution.state] + custom_field_values
                    sheet.add_row values, types: [:string, :string, :string]
                end
                sheet.auto_filter = 'A1:D4'

                sheet.sheet_view.pane do |pane|
                    pane.top_left_cell = 'B2'
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