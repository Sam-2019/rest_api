require 'caxlsx'

module Reports
    class UserReportBase
        SPREADSHEET_DOWNLOAD_FOLDER = "#{RAILS_ROOT_PATH}/spreadsheet_downloads/"

        def initialize
            @filepath = "#{SPREADSHEET_DOWNLOAD_FOLDER}/users_list.xlsx"
        end

        def sample_data
            @document = Axlsx::Package.new
            users_list

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
                column_count = User.count + 1
                sheet.auto_filter = "A1:E#{column_count}"

                sheet.sheet_view.pane do |pane|
                    pane.top_left_cell = 'B2'
                    pane.state = :frozen_split
                    pane.y_split = 1
                    pane.x_split = 1
                    pane.active_pane = :bottom_right
                end
            end
        end
    end
end