import moment from 'moment';
import ms from 'ms';

export const fixedOldDate = moment('1970-01-01', 'YYYY-MM-DD');
export const today = moment();

export function getTimeFromNow(time: string): moment.Moment {
  return moment().add(ms(time), 'milliseconds');
}

export function getFormatedDate(date: string | Date): moment.Moment {
  return moment(date, 'YYYY-MM-DD');
}
