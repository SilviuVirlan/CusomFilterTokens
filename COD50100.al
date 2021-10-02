codeunit 50100 MyCodeunit
{
    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Page, Page::"Customer List", 'OnAfterValidateEvent', 'Name', false, false)]
    local procedure OnAfterValidateNameEvent(var Rec: Record Customer; var xRec: Record Customer)
    var
        filterTokensCU: Codeunit "Filter Tokens";
        _text: Text;
    begin
        Message('BBB');
        _text := Rec.GetFilter(Name);
        filterTokensCU.MakeTextFilter(_text);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Filter Tokens", 'OnResolveTextFilterToken', '', true, true)]
    local procedure CustomTextFilter(TextToken: Text; var TextFilter: Text; var Handled: Boolean)
    var
        _mc: Record "My Customer";
        _maxloops: integer;
    begin
        _maxloops := 10;
        TextToken := UpperCase(TextToken);
        Handled := true;
        case TextToken of
            'SV':
                begin
                    _mc.SetRange("User ID", UserId());
                    if _mc.FindSet() then begin
                        _maxloops -= 1;
                        _maxloops -= 1;
                        TextFilter := _mc."Customer No.";
                        if _mc.Next() <> 0 then
                            repeat
                                _maxloops -= 1;
                                TextFilter += '|' + _mc."Customer No.";
                            until (_mc.Next() = 0) or (_maxloops <= 0);
                    end
                end;
        end;
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Filter Tokens", 'OnResolveDateFilterToken', '', false, false)]
    local procedure CustomDateFilter(DateToken: Text; var FromDate: Date; var Handled: Boolean; var ToDate: Date)
    begin
        DateToken := UpperCase(DateToken);
        case DateToken of
            'SV1':
                begin
                    FromDate := GetFromDate(Today(), 1);
                    ToDate := GetToDate(Today(), 1);
                    Handled := true;
                end;
            'SV2':
                begin
                    FromDate := GetFromDate(Today(), 2);
                    ToDate := GetToDate(Today(), 2);
                    Handled := true;
                end;
            'SV3':
                begin
                    FromDate := GetFromDate(Today(), 3);
                    ToDate := GetToDate(Today(), 3);
                    Handled := true;
                end;
            'SV4':
                begin
                    FromDate := GetFromDate(Today(), 4);
                    ToDate := GetToDate(Today(), 4);
                    Handled := true;
                end;
            'SV5':
                begin
                    FromDate := GetFromDate(Today(), 5);
                    ToDate := GetToDate(Today(), 5);
                    Handled := true;
                end;
            'SV6':
                begin
                    FromDate := GetFromDate(Today(), 6);
                    ToDate := GetToDate(Today(), 6);
                    Handled := true;
                end;
            'SV7':
                begin
                    FromDate := GetFromDate(Today(), 7);
                    ToDate := GetToDate(Today(), 7);
                    Handled := true;
                end;
            'SV8':
                begin
                    FromDate := GetFromDate(Today(), 8);
                    ToDate := GetToDate(Today(), 8);
                    Handled := true;
                end;

            'SV9':
                begin
                    FromDate := GetFromDate(Today(), 9);
                    ToDate := GetToDate(Today(), 9);
                    Handled := true;
                end;
            'SV10':
                begin
                    FromDate := GetFromDate(Today(), 10);
                    ToDate := GetToDate(Today(), 10);
                    Handled := true;
                end;
            'SV11':
                begin
                    FromDate := GetFromDate(Today(), 11);
                    ToDate := GetToDate(Today(), 11);
                    Handled := true;
                end;
            'SV12':
                begin
                    FromDate := GetFromDate(Today(), 12);
                    ToDate := GetToDate(Today(), 12);
                    Handled := true;
                end;
        end;
    end;

    local procedure GetFromDate(Dt: Date; mo: integer): Date
    begin
        Exit(DMY2Date(1, mo, Date2DMY(Dt, 3)));
    end;

    local procedure GetToDate(Dt: Date; mo: integer): Date
    begin
        case mo of
            1, 3, 5, 7, 8, 10, 12:
                Exit(DMY2Date(31, mo, Date2DMY(Dt, 3)));
            4, 6, 9, 11:
                Exit(DMY2Date(30, mo, Date2DMY(Dt, 3)));
            2:
                begin
                    if Date2DMY(Dt, 3) div 4 = 0 then
                        Exit(DMY2Date(29, mo, Date2DMY(Dt, 3)))
                    else
                        Exit(DMY2Date(28, mo, Date2DMY(Dt, 3)))
                end;
        end

    end;

    var
        myInt: Integer;
}